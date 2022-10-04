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
import com.link.service.domain.Report;
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
	public void addFeed(Feed feed) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("FeedMapper.addFeed", feed);
	}
	
	@Override
	public Feed getFeed(int feedNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FeedMapper.getFeed", feedNo);
	}
	
	@Override
	public void updateFeed(Feed feed) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("FeedMapper.updateFeed", feed);
	}
	
	@Override
	public void deleteFeed(int feedNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("FeedMapper.deleteFeed", feedNo);
	}
	
	
	
	//////////////////////////////////////// Feed Comment
	
	
	
	@Override
	public void addFeedComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("FeedMapper.addFeedComment", comment);
	}

	@Override
	public void updateFeedComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("FeedMapper.updateFeedComment", comment);
	}

	@Override
	public void deleteFeedComment(int commentNo) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.delete("FeedMapper.deleteFeedComment", commentNo);
	}

	
	
	//////////////////////////////////////// List
	
	
	
	@Override
	public List<Feed> getFeedList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FeedMapper.getFeedList", map);
	}
	
	@Override
	public List<Comment> getFeedCommentList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("FeedMapper.getFeedCommentList", map);
	}
	
	
	
	//////////////////////////////////////// Count
	
		
		
	@Override
	public int getTotalFeedCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FeedMapper.getTotalFeedCount", search);
	}
	
	@Override
	public int getTotalFeedCommentCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("FeedMapper.getTotalFeedCommentCount", search);
	}
		
	
	
	//////////////////////////////////////// Report

	
	
	@Override
	public void addFeedReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ReportMapper.addReport", report);
	}

	@Override
	public void addFeedCommentReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("ReportMapper.addReport", report);
	}

	
	
	//////////////////////////////////////// Like
	
	
	
	@Override
	public void addFeedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("HeartMapper.addFeedLike", map);
	}
	
	@Override
	public void deleteFeedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("HeartMapper.deleteFeedLike", map);
	}

	@Override
	public void addFeedCommentLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("HeartMapper.addFeedCommentLike", map);
	}
	
	@Override
	public void deleteFeedCommentLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("HeartMapper.deleteFeedCommentLike", map);
	}

	@Override
	public int getTotalFeedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HeartMapper.getTotalFeedLike", map);
	}

	@Override
	public int getTotalFeedCommentLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("HeartMapper.getTotalFeedCommentLike", map);
	}
	
	
	
	//////////////////////////////////////// Push
	
	
	
	@Override
	public void addFeedPush() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addFeedCommentPush() throws Exception {
		// TODO Auto-generated method stub
		
	}

	

}
