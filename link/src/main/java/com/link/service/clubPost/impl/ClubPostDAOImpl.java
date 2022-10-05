package com.link.service.clubPost.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostDAO;
import com.link.service.domain.ClubPost;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;

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
		
		// 모임게시물 좋아요하다 또는 좋아요 취소하다
		sqlSession.update("ClubPostMapper.updateClubPost", clubPost);
		
		if(clubPost.getLikeCondition() == 1) {
			System.out.println("여기오나?");
			// 좋아요 등록
			sqlSession.insert("HeartMapper.insertHeart", heart);
		}else if(clubPost.getLikeCondition() == -1) {
			System.out.println("여기는?");
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", heart);
		}

		// 모임게시물 상세보기
		clubPost = sqlSession.selectOne("ClubPostMapper.getClubPost", clubPost);
		
		return clubPost.getClubPostLikeCount();
	}// end of updateClubPostLike(Heart heart)

	@Override
	public Comment addClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".addClubPostComment(Comment comment) 왔다");
		// 모임게시물 댓글 등록
		sqlSession.insert("ClubPostCommentMapper.addClubPostComment", comment);
		
		// 모임게시물 댓글 개수 증가
		sqlSession.insert("ClubPostMapper.updateClubPost", new ClubPost(comment.getClubPostNo(), comment.getClubPostCommentNo()));
		// 모임게시물 글 작성자에게 알림
		//sqlSession.insert("Report_PushMapper.addPush", comment);
		// 가장 최근 모임게시물 댓글 번호 가져온다
		comment.setClubPostCommentNo(sqlSession.selectOne("ClubPostCommentMapper.getClubPostCommentNo"));
		// 가장 최근 모임게시물 댓글 가져온다
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of addClubPostComment(Comment comment)

	@Override
	public Comment getClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostComment(Comment comment) 왔다");
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of getClubPostComment(Comment comment)

	@Override
	public Comment updateClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".updateClubPostComment(Comment comment) 왔다");
		sqlSession.update("ClubPostCommentMapper.updateClubPostComment", comment);
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}

	@Override
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".deleteClubPostComment(Comment comment) 왔다");
		sqlSession.update("ClubPostCommentMapper.deleteClubPostComment", comment);
		Map<String, Object> map = new HashMap<String, Object>();
		// 부모번호를 가져온다
		if(comment.getParent() != 0) {
			return null;
		}else {
			sqlSession.selectList("ClubPostMapper.getClubPostCommentList", comment);
			return null;
		}
	}

	@Override
	public int updateClubPostCommentLike(Comment comment, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostCommentLike(Comment comment, Heart heart) 왔다");
		// 모임게시물 댓글 좋아요하다 또는 좋아요 취소하다
		sqlSession.update("ClubPostCommentMapper.updateClubPostCommentLike", comment);
		// 좋아요 등록
		sqlSession.update("HeartMapper.insertHeart", heart);
		return 0;
	}
	
	
	
	
	
	

	@Override
	public Map<String, Object> addClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".addClubNotice(Map<String, Object> map) 왔다");
		sqlSession.insert("NoticeMapper.addClubNotice", map);
		int no = sqlSession.selectOne("NoticeMapper.getClubNoticetNo", map);
		Notice notice = ((Notice)map.get("notice"));
		notice.setNoticeNo(no);
		map.put("notice", notice);
		map.put("getClubNotice", sqlSession.selectOne("NoticeMapper.getClubNotice", notice));
		return getClubNoticeList(map);
	}// end of addClubNotice(Map<String, Object> map)

	@Override
	public Map<String, Object> getClubNoticeList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubNoticeList(Map<String, Object> map) 왔다");
		map.put("getClubNoticeList", sqlSession.selectList("NoticeMapper.getClubNoticeList", map) );
		map.put("getClubNoticeListCount", sqlSession.selectOne("NoticeMapper.getClubNoticeListCount", map) );
		return map;
	}// end of getClubNoticeList(Map<String, Object> map)

	@Override
	public Notice getClubNotice(Notice notice) throws Exception {
		System.out.println(getClass() + ".getClubNotice(Notice notice) 왔다");
		return sqlSession.selectOne("NoticeMapper.getClubNotice", notice);
	}// end of getClubNotice(Notice notice)

	@Override
	public Map<String, Object> updateClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubNotice(Map<String, Object> map) 왔다");
		sqlSession.update("NoticeMapper.updateClubNotice", map);
		return getClubNoticeList(map);
	}// end of updateClubNotice(Map<String, Object> map)

	@Override
	public Map<String, Object> deleteClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".deleteClubNotice(Map<String, Object> map) 왔다");
		sqlSession.delete("NoticeMapper.deleteClubNotice", map);
		return getClubNoticeList(map);
	}// end of deleteClubNotice(Search search, Notice notice)
	
	
	
	
	
	
	
	@Override
	public void addPay(Pay pay) throws Exception {
		System.out.println(getClass() + ".addPay(Pay pay) 왔다");
		sqlSession.insert("ClubPostMapper.addPay", pay);
	}// end of addPay(Pay pay)

	/*
	@Override
	public List<ClubUser> updateClubMember(Pay pay, Search search) throws Exception {
		System.out.println(getClass() + ".updateClubMember(Pay pay, Search search) 왔다");
		sqlSession.update("ClubPostMapper.updateClubMember", pay);
		// pay.getClubNo()가 모임번호입니다
		return null;
	}// end of updateClubMember(Pay pay, Search search)
	*/

	/*
	@Override
	public void updateClub(Pay pay) throws Exception {
		System.out.println(getClass() + ".updateClub(Pay pay) 왔다");
		sqlSession.update("ClubPostMapper.updateClub", pay);
	}// end of addPay(Pay pay)
	*/
	
	
}

















