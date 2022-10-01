package com.link.service.club.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.service.club.ClubDAO;
import com.link.service.domain.Club;

@Repository("clubDAOImpl")
public class ClubDAOImpl implements ClubDAO {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public ClubDAOImpl() {
		System.out.println(this.getClass());
	}

	
	//Method
	public void addClub(Club club) throws Exception {
		sqlSession.insert("ClubMapper.addClub",club);
	}
}
