package com.link.service.feed;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;

public interface FeedService {
	
	//////////////////////////////////////// Feed
	
	public void addFeed(Feed feed);
	
	public void getFeed(int feedNo);
	
	public void updateFeed(Feed feed);
	
	public void deleteFeed(int feedNo);
	
	//////////////////////////////////////// Feed Comment
	
	public void addFeedComment(Comment comment);
	
	public void updateFeedComment(Comment comment);
	
	public void deleteFeedComment(int commentNo);
	
	//////////////////////////////////////// Feed List
	
	public void getFeedList(Search search);

}
