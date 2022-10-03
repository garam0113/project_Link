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
	public void addFeed(Feed feed) {
		// TODO Auto-generated method stub
		feedDAO.addFeed(feed);
		feedDAO.addFeedPush();
	}
	
	@Override
	public Feed getFeed(int feedNo) {
		// TODO Auto-generated method stub
		return feedDAO.getFeed(feedNo);
	}
	
	@Override
	public void updateFeed(Feed feed) {
		// TODO Auto-generated method stub
		feedDAO.updateFeed(feed);
	}
	
	@Override
	public void deleteFeed(int feedNo) {
		// TODO Auto-generated method stub
		feedDAO.deleteFeed(feedNo);
	}
	
	//////////////////////////////////////// Feed Comment

	@Override
	public void addFeedComment(Comment comment) {
		// TODO Auto-generated method stub
		feedDAO.addFeedComment(comment);
	}

	@Override
	public void updateFeedComment(Comment comment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteFeedComment(int commentNo) {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedComment(commentNo);
	}

	//////////////////////////////////////// Feed List

	@Override
	public Map<String, Object> getFeedList(Search search) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Feed> list = feedDAO.getFeedList(search);
		int totalFeedCount = feedDAO.getTotalFeedCount(search);
		
		map.put("list", list);
		map.put("totalFeedCount", totalFeedCount);
		
		return map;
	}
	
}
