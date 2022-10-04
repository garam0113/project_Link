package com.link.service.feed;

import java.util.List;
import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;

public interface FeedService {
	
	//////////////////////////////////////// Feed
	
	public void addFeed(Feed feed);
	
	public Map<String, Object> getFeed(Map<String, Object> map);
	
	public void updateFeed(Feed feed);
	
	public void deleteFeed(int feedNo);
	
	//////////////////////////////////////// Feed Comment
	
	public void addFeedComment(Comment comment);
	
	public void updateFeedComment(Comment comment);
	
	public void deleteFeedComment(int commentNo);
	
	//////////////////////////////////////// Feed List
	
	public Map<String, Object> getFeedList(Search search);
	
	public List<Comment> getFeedCommentList(Map<String, Object> map);

}
