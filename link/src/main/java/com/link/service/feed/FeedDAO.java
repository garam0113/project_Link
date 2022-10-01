package com.link.service.feed;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;

public interface FeedDAO {

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
	
	//////////////////////////////////////// Feed Report
	
	public void addFeedReport();
	
	public void addFeedCommentReport();
	
	//////////////////////////////////////// Feed Like
	
	public void updateFeedLike();
	
	public void updateFeedCommentLike();
	
	//////////////////////////////////////// Feed Push
	
	public void addFeedPush();
	
	public void addFeedCommentPush();
	
}
