package com.link.service.clubPost.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.service.clubPost.ClubPostDAO;
import com.link.service.domain.ClubPost;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;

@Repository("clubPostDAOImpl")
public class ClubPostDAOImpl implements ClubPostDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;

	public ClubPostDAOImpl() {
		System.out.println(getClass() + " default 생성자 호출");
	}

	@Override
	public ClubPost addClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".addClubPost(ClubPost clubPost) 왔다");
		// 모임게시물 등록
		sqlSession.insert("ClubPostMapper.addClubPost", clubPost);
		// 모임게시물 현재 sequence 가져오기
		int currval = sqlSession.selectOne("ClubPostMapper.getCurrval", clubPost);
		System.out.println("currval : " + currval);
		// 모임게시물 등록한 모임에 있는 모임원 리스트 가져온다
		List<ClubUser> clubUserList = sqlSession.selectList("ClubMapper.getClubMemberList", clubPost);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPost", clubPost);
		map.put("clubUserList", clubUserList);
		for (int i = 0; i < clubUserList.size(); i++) {
			// 해당 모임의 모임원들에게 모임게시물 등록되었다고 알림
			sqlSession.insert("Report_PushMapper.addPush", map);
		}
		// 모임게시물 상세보기 가져온 후 화면 이동
		return sqlSession.selectOne("ClubPostMapper.getClubPost", currval);
		
	}// end of addClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getCurrentClubPostList(String userId) throws Exception {
		System.out.println(getClass() + ".getCurrentClubPostList(String userId) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getCurrentClubPostList", userId));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getCurrentClubPostListCount", userId));
		return map;
	}// end of getCurrentClubPostList(String userId)

	@Override
	public Map<String, Object> getClubPostList(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".getClubPostList(ClubPost clubPost) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostList", clubPost));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListCount", clubPost));
		return map;
	}// end of getClubPostList(int clubNo)

	@Override
	public Map<String, Object> getClubPostListLike(int clubNo) throws Exception {
		System.out.println(getClass() + ".getClubPostListLike(int clubNo) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListLike", clubNo));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListCount", clubNo));
		return map;
	}// end of getClubPostListLike(int clubNo)

	@Override
	public Map<String, Object> getClubPostListMySelf(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostListMySelf(Map<String, Object> map) 왔다");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListMySelf", map));
		returnMap.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListMySelfCount", map));
		return returnMap;
	}// end of getClubPostListMySelf(Map<String, Object> map)

	@Override
	public Map<String, Object> getClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".getClubPost(ClubPost clubPost) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("getClubPost", sqlSession.selectOne("ClubPostMapper.getClubPost", clubPost));
		map.put("getClubPostCommentList", sqlSession.selectList("ClubPostMapper.getClubPostCommentList", clubPost));
		return map;
	}// end of getClubPost(ClubPost clubPost)

	@Override
	public List<Comment> getClubPostCommentList(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostCommentList(Comment comment) 왔다");
		return sqlSession.selectList("ClubPostMapper.getClubPostCommentList", comment);
	}// end of getClubPostCommentList(Comment comment)

	@Override
	public Map<String, Object> updateClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".updateClubPost(ClubPost clubPost) 왔다");
		sqlSession.update("ClubPostMapper.updateClubPost", clubPost);
		return getClubPost(clubPost);
	}// end of updateClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> deleteClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(ClubPost clubPost) 왔다");
		sqlSession.update("ClubPostMapper.deleteClubPost", clubPost);
		return getClubPostList(clubPost);
	}// end of deleteClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListMyHome", userId));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListMyHomeCount", userId));
		return map;
	}// end of getClubPostListMyHome(String userId)

	@Override
	public int updateClubPostLike(ClubPost clubPost, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostLike(Heart heart) 왔다");
		sqlSession.update("ClubPostMapper.updateClubPostLike", clubPost);
		sqlSession.insert("HeartMapper.insertHeart", heart);
		clubPost = sqlSession.selectOne("ClubPostMapper.getClubPost", clubPost);
		return clubPost.getClubPostLikeCount();
	}// end of updateClubPostLike(Heart heart)

}


