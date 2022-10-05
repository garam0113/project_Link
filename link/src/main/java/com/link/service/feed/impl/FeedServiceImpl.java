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
import com.link.service.domain.Heart;
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
	
	
	
	///////////////////////////////////////////////////// Feed /////////////////////////////////////////////////////

	
	
	@Override
	public void addFeed(Feed feed) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeed(feed);
		feedDAO.addFeedPush(null);
	}
	
	@Override
	public Map<String, Object> getFeed(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		Feed feed = feedDAO.getFeed((Integer)map.get("feedNo"));
		List<Comment> commentList = feedDAO.getFeedCommentList(map);
		
		map.put("feed", feed);
		map.put("commentList", commentList);
		
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
	
	
	
	///////////////////////////////////////////////////// Feed Comment /////////////////////////////////////////////////////
	
	
	
	@Override
	public void addFeedComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedComment(comment);
		feedDAO.addFeedCommentPush(null);
	}
	
	@Override
	public Comment getFeedComment(int feedCommentNo) throws Exception {
		// TODO Auto-generated method stub
		return feedDAO.getFeedComment(feedCommentNo);
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
	
	

	///////////////////////////////////////////////////// List /////////////////////////////////////////////////////

	
	
	@Override
	public Map<String, Object> getFeedList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		List<Feed> feedList = feedDAO.getFeedList(map);
		int totalFeedCount = feedDAO.getTotalFeedCount((Search) map.get("search"));
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("feedList", feedList);
		returnMap.put("totalFeedCount", totalFeedCount);
		
		return returnMap;
	}
	
	@Override
	public Map<String, Object> getFeedCommentList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		List<Comment> commentList = feedDAO.getFeedCommentList(map);
		int totalFeedCommentCount = feedDAO.getTotalFeedCommentCount(map);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("commentList", commentList);
		returnMap.put("totalFeedCommentCount", totalFeedCommentCount);
		
		return returnMap;
	}

	
	
	///////////////////////////////////////////////////// Report /////////////////////////////////////////////////////
	
	
	
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
	
	
	
	///////////////////////////////////////////////////// Like /////////////////////////////////////////////////////
	
	
	
//	private int heartNo;		// 좋아요 테이블 고유번호
//	private String userId;		// 좋아요하는 회원 아이디
//	private String source;		// 출처 0:피드, 1:피드 댓글, 2:모임게시물 3:모임게시물 댓글
//	private int sourceNo;		// 출처 고유번호
	
	

	@Override
	public void addFeedHeart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedHeart((Heart) map.get("heart"));
		
		// 피드 테이블 좋아요 개수 증가
		
		Feed feed = (Feed) map.get("feed");
		feed.setHeartCount(feed.getHeartCount() + 1);
		feedDAO.updateFeed(feed);
	}

	@Override
	public void deleteFeedHeart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedHeart((Heart)map.get("heart"));
	}

	@Override
	public void addFeedCommentHeart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.addFeedCommentHeart((Heart)map.get("heart"));
	}

	@Override
	public void deleteFeedCommentHeart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		feedDAO.deleteFeedCommentHeart((Heart)map.get("heart"));
	}


	
}
