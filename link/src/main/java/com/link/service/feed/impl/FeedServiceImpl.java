package com.link.service.feed.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.domain.Report;
import com.link.service.feed.FeedDAO;
import com.link.service.feed.FeedService;

@Service("feedServiceImpl")
public class FeedServiceImpl implements FeedService {

	@Autowired
	@Qualifier("feedDAOImpl")
	private FeedDAO feedDAO;
	
	public void setFeedDao(FeedDAO feedDAO) {
		this.feedDAO = feedDAO;
	}

	public FeedServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	
	
	//////////////////////////////////////// Feed

	
	
	@Override
	public void addFeed(Feed feed) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeed(feed);
		feedDAO.addFeedPush();
	}
	
	@Override
	public Map<String, Object> getFeed(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		Feed feed = feedDAO.getFeed((Integer)map.get("feedNo"));
		List<Comment> comment = feedDAO.getFeedCommentList(map);
		
		map.put("feed", feed);
		map.put("comment", comment);
		
		return map;
	}
	
	@Override
	public void updateFeed(Feed feed) throws Exception{
		// TODO Auto-generated method stub
		feedDAO.updateFeed(feed);
	}
	
	@Override
	public void deleteFeed(int feedNo) throws Exception{
		// TODO Auto-generated method stub
		feedDAO.deleteFeed(feedNo);
	}
	
	
	
	//////////////////////////////////////// Feed Comment

	
	
	@Override
	public void addFeedComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedComment(comment);
		feedDAO.addFeedCommentPush();
	}

	@Override
	public void updateFeedComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.updateFeedComment(comment);
	}

	@Override
	public void deleteFeedComment(int commentNo) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedComment(commentNo);
	}

	
	
	//////////////////////////////////////// List

	
	
	@Override
	public Map<String, Object> getFeedList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		List<Feed> feed = feedDAO.getFeedList(map);
		int totalFeedCount = feedDAO.getTotalFeedCount(search);
		
		map.put("feed", feed);
		map.put("totalFeedCount", totalFeedCount);
		
		return map;
	}
	
	@Override
	public List<Comment> getFeedCommentList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return feedDAO.getFeedCommentList(map);
	}

	
	
	//////////////////////////////////////// Report	
	
	
	
	@Override
	public void addFeedReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedReport(report);
	}

	@Override
	public void addFeedCommentReport(Report report) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedCommentReport(report);
	}
	
	
	
	//////////////////////////////////////// Like
	
	

	@Override
	public void addFeedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedLike(map);
	}

	@Override
	public void deleteFeedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedLike(map);
	}

	@Override
	public void addFeedCommentLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedCommentLike(map);
	}

	@Override
	public void deleteFeedCommentLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedCommentLike(map);
	}


	
}
