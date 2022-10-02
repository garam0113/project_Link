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
		System.out.println(getClass() + ".addClubPost() 왔다");
		System.out.println("오나?");
		sqlSession.insert("ClubPostMapper.addClubPost", clubPost);
		System.out.println("오나???");
		ClubPost clubPost2 = new ClubPost();
		return clubPost2;
		/*
		if(i == 1) {
			System.out.println("모임게시물 등록 성공");
			return sqlSession.selectOne("ClubPostMapper.getClubPost");
		}else {
			System.out.println("모임게시물 등록 실패");
			return null;
		}
		*/
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
	public Map<String, Object> getClubPostListRecent(int clubNo) throws Exception {
		System.out.println(getClass() + ".getClubPostListRecent(int clubNo) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListRecent", clubNo));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListCount", clubNo));
		return map;
	}// end of getClubPostListRecent(int clubNo)

	@Override
	public Map<String, Object> getClubPostListMySelf(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostListMySelf(Map<String, Object> map) 왔다");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListMySelf", map));
		returnMap.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListMySelfCount", map));
		return returnMap;
	}// end of getClubPostListMySelf(Map<String, Object> map)

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListMyHome", userId));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListMyHomeCount", userId));
		return map;
	}// end of getClubPostListMyHome(String userId)

}
