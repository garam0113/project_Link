package com.link.service.clubPost.impl;

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
		System.out.println(getClass() + ".addClubPost() start");
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
	}// end of addClubPost

}
