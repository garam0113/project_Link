package com.link.service.feed;

import java.util.List;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;

public interface FeedDAO {

	//////////////////////////////////////// Feed
	
	public void addFeed(Feed feed);
		
	public Feed getFeed(int feedNo);
	
	public void updateFeed(Feed feed);
	
	public void deleteFeed(int feedNo);
	
	//////////////////////////////////////// Feed Comment
	
	public void addFeedComment(Comment comment);
	
	public void updateFeedComment(Comment comment);
	
	public void deleteFeedComment(int commentNo);
	
	//////////////////////////////////////// Feed List
	
	public List<Feed> getFeedList(Search search);
	
	//////////////////////////////////////// Feed Report
	
	public void addFeedReport();
	
	public void addFeedCommentReport();
	
	//////////////////////////////////////// Feed Like
	
	public void updateFeedLike();
	
	public void updateFeedCommentLike();
	
	//////////////////////////////////////// Feed Push
	
	public void addFeedPush();
	
	public void addFeedCommentPush();
	
	//////////////////////////////////////// Count

	public int getTotalFeedCount(Search search);
	
}
