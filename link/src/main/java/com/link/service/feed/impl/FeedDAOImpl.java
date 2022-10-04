package com.link.service.feed.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.domain.Comment;
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
		System.out.println(this.getClass() + " default constructor");
	}

	//////////////////////////////////////// Feed
	
	@Override
	public void addFeed(Feed feed) {
		// TODO Auto-generated method stub
		sqlSession.insert("FeedMapper.addFeed", feed);
	}
	
	@Override
	public Feed getFeed(int feedNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FeedMapper.getFeed", feedNo);
	}
	
	@Override
	public void updateFeed(Feed feed) {
		// TODO Auto-generated method stub
		sqlSession.update("FeedMapper.updateFeed", feed);
	}
	
	@Override
	public void deleteFeed(int feedNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("FeedMapper.deleteFeed", feedNo);
	}
	
	//////////////////////////////////////// Feed Comment
	
	@Override
	public void addFeedComment(Comment comment) {
		// TODO Auto-generated method stub
		sqlSession.insert("FeedMapper.addFeedComment", comment);
	}

	@Override
	public void updateFeedComment(Comment comment) {
		// TODO Auto-generated method stub
		sqlSession.update("FeedMapper.updateFeedComment", comment);
	}

	@Override
	public void deleteFeedComment(int commentNo) {
		// TODO Auto-generated method stub
		sqlSession.delete("FeedMapper.deleteFeedComment", commentNo);
	}

	//////////////////////////////////////// List
	
	@Override
	public List<Feed> getFeedList(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FeedMapper.getFeedList", search);
	}
	
	@Override
	public List<Comment> getFeedCommentList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FeedMapper.getFeedCommentList", map);
	}
	
	//////////////////////////////////////// Feed Report

	@Override
	public void addFeedReport() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addFeedCommentReport() {
		// TODO Auto-generated method stub
		
	}

	//////////////////////////////////////// Feed Like
	
	@Override
	public void updateFeedLike() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateFeedCommentLike() {
		// TODO Auto-generated method stub
		
	}

	//////////////////////////////////////// Feed Push
	
	@Override
	public void addFeedPush() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addFeedCommentPush() {
		// TODO Auto-generated method stub
		
	}
	
	//////////////////////////////////////// Count

	@Override
	public int getTotalFeedCount(Search search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FeedMapper.getTotalFeedCount", search);
	}

	@Override
	public int getTotalFeedCommentCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
