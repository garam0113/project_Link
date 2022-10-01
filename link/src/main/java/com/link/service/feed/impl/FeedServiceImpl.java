package com.link.service.feed.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.service.domain.Feed;
import com.link.service.feed.FeedDAO;
import com.link.service.feed.FeedService;

@Service("feedServiceImpl")
public class FeedServiceImpl implements FeedService {

	@Autowired
	@Qualifier("feedDAOImpl")
	private FeedDAO feedDao;
	
	public void setFeedDao(FeedDAO feedDao) {
		this.feedDao = feedDao;
	}

	public FeedServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addFeed(Feed feed) {
		// TODO Auto-generated method stub
		feedDao.addFeed(feed);
	}

}
