package com.link.service.feed.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.service.domain.Feed;
import com.link.service.feed.FeedDAO;

@Repository("feedDAOImpl")
public class FeedDAOImpl implements FeedDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public FeedDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addFeed(Feed feed) {
		// TODO Auto-generated method stub
		sqlSession.insert("FeedMapper.addFeed", feed);
	}

}
