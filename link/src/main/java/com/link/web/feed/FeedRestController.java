package com.link.web.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.domain.Heart;
import com.link.service.domain.Report;
import com.link.service.domain.User;
import com.link.service.feed.FeedService;

@RestController
@RequestMapping("/feedRest/*")
public class FeedRestController {

	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService; 
	
	public FeedRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Value("#{commonProperties['pageUnit'] ? : 3}")
	// 없다면 ? 3으로 초기화
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	
	
	///////////////////////////////////////////////////// Feed /////////////////////////////////////////////////////
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/addFeedComment", method = RequestMethod.POST)
	public List<Comment> addFeedComment(@RequestBody Comment comment, Search search) throws Exception {
		
		// 댓글 작성
		
		User user = new User();
		
		user.setUserId("user01");
		
		comment.setUser(user);
		
		feedService.addFeedComment(comment);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("feedNo", comment.getFeedNo());
		map.put("search", search);
		
		return (List <Comment>)(feedService.getFeedCommentList(map).get("commentList"));
		
	}
	
	@RequestMapping(value = "/json/getFeedComment", method = RequestMethod.POST)
	public Comment getFeedComment(@RequestBody Comment comment) throws Exception {

		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		return comment;
		
	}
	
	
	@RequestMapping(value = "/json/updateFeedComment", method = RequestMethod.POST)
	public Comment updateFeedComment(@RequestBody Comment comment) throws Exception {
		
		feedService.updateFeedComment(comment);
		
		return feedService.getFeedComment(comment.getFeedCommentNo());
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/deleteFeedComment", method = RequestMethod.POST)
	public List<Comment> deleteFeedComment(@RequestBody Comment comment) throws Exception {
		
		feedService.deleteFeedComment(comment.getFeedCommentNo());	// 수정
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("feedNo", comment.getFeedNo());
		
		return (List <Comment>)(feedService.getFeedCommentList(map).get("commentList"));
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/getFeedList", method = RequestMethod.POST)
	public List<Feed> getFeedList(@RequestBody Search search) throws Exception {
		
		// 피드 리스트
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return (List<Feed>) feedService.getFeedList(map).get("feedList");
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/getFeedCommentList", method = RequestMethod.GET)
	public List<Comment> getFeedCommentList(@RequestBody Search search) throws Exception{
	
		// 피드 댓글 리스트
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
		
	}
	
	
	
	@RequestMapping(value = "/json/addFeedHeart", method = RequestMethod.POST)
	public Feed addFeedHeart(@RequestBody Feed feed, Heart heart) throws Exception {
		
		// 피드 좋아요 추가
		heart.setSourceNo(feed.getFeedNo());
		heart.setSource("0");
		heart.setUserId("user01");
				
		System.out.println("하트요" + heart);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("feed", feed);
				
		return feedService.addFeedHeart(map);
		
	}

	@RequestMapping(value = "/json/deleteFeedHeart", method = RequestMethod.POST)
	public Feed deleteFeedHeart(@RequestBody Feed feed, Heart heart) throws Exception {
		
		// 피드 좋아요 취소
		heart.setSourceNo(feed.getFeedNo());
		heart.setSource("0");
		heart.setUserId("user01");
				
		System.out.println("하트요" + heart);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("feed", feed);
				
		return feedService.deleteFeedHeart(map);

	}
	
	@RequestMapping(value = "/json/addFeedCommentHeart", method = RequestMethod.POST)
	public Comment addFeedCommentHeart(@RequestBody Comment comment, Heart heart) throws Exception {
		
		// 피드 댓글 좋아요
		heart.setSourceNo(comment.getFeedNo());
		heart.setSource("1");
		heart.setUserId("user07");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		
		return feedService.addFeedCommentHeart(map);
		
	}
	
	@RequestMapping(value = "/json/deleteFeedCommentHeart", method = RequestMethod.POST)
	public Comment deleteFeedCommentHeart(@RequestBody Comment comment, Heart heart) throws Exception {
		
		// 피드 댓글 좋아요
		heart.setSourceNo(comment.getFeedNo());
		heart.setSource("1");
		heart.setUserId("user07");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		
		return feedService.addFeedCommentHeart(map);
		
	}
	
	
	
	///////////////////////////////////////////////////// Report /////////////////////////////////////////////////////
		
		
		
	@RequestMapping(value = "/json/addFeedReport", method = RequestMethod.POST)
	public Report addReport(@ModelAttribute Report report) throws Exception {
		
		feedService.addReport(report);
		
		return report;
	
	}
	
	
	
}
