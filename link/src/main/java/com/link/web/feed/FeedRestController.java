package com.link.web.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
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
import com.link.service.user.UserService;

@RestController
@RequestMapping("/feedRest/*")
public class FeedRestController {

	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
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
	
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/addFeedComment", method = RequestMethod.POST)
	public List<Comment> addFeedComment(@RequestBody Comment comment, Search search, User user) throws Exception {
		
		// 댓글 작성
			
		user.setUserId(comment.getUserId());
		user = userService.getUser(user);
		
		comment.setUser(user);
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("comment", comment);
		map.put("user", user);
		map.put("feedNo", comment.getFeedNo());
		map.put("search", search);
		
		feedService.addFeedComment(map);
		
		return (List <Comment>)(feedService.getFeedCommentList(map).get("commentList"));
		
	}
	
	
	@RequestMapping(value = "/json/getFeedComment", method = RequestMethod.POST)
	public Comment getFeedComment(@RequestBody Comment comment) throws Exception {

		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		return comment;
		
	}
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/updateFeedComment", method = RequestMethod.POST)
	public List<Comment> updateFeedComment(@RequestBody Comment comment, Search search, User user) throws Exception {
		
		feedService.updateFeedComment(comment);
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		user.setUserId(comment.getUser().getUserId());
		user = userService.getUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("comment", comment);
		map.put("feedNo", comment.getFeedNo());
		map.put("user", user);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
				
	}
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/deleteFeedComment", method = RequestMethod.POST)
	public List<Comment> deleteFeedComment(@RequestBody Comment comment, Search search, User user) throws Exception {
		
		user.setUserId(comment.getUserId());
		user = userService.getUser(user);

		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("comment", comment);
		map.put("feedNo", comment.getFeedNo());
		map.put("user", user);
		
		feedService.deleteFeedComment(map);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
		
	}

	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/getFeedList", method = RequestMethod.POST)
	public List<Feed> getFeedList(@RequestBody Feed feed, Search search, User user,
										HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		// 피드 리스트
		
		if(feed.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(feed.getCurrentPage());
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("feed", feed);
		map.put("feedNo", feed.getFeedNo());
		map.put("user", user);
		
		return (List<Feed>) feedService.getFeedList(map).get("feedList");
		
	}
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/getFeedCommentList", method = RequestMethod.POST)
	public List<Comment> getFeedCommentList(@RequestBody Comment comment, Search search, User user) throws Exception{
	

		// 피드 댓글 리스트
		
		if(comment.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(comment.getCurrentPage());
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		user.setUserId(comment.getUser().getUserId());
		user = userService.getUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("comment", comment);
		map.put("feedNo", comment.getFeedNo());
		map.put("user", user);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
		
	}
	
	
	
	///////////////////////////////////////////////////// Heart /////////////////////////////////////////////////////
	
	
	
	// 사용
	@RequestMapping(value = "/json/addFeedHeart", method = RequestMethod.POST)
	public int addFeedHeart(@RequestBody Heart heart, User user, Feed feed) throws Exception {
		
		// 피드 좋아요 추가
		
		user.setUserId(heart.getUserId());
		user = userService.getUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("user", user);
		map.put("feedNo", heart.getSourceNo());
		
		feed = ((Feed) feedService.getFeed(map).get("feed"));
		
		map.put("feed", feed);
		
		feed = feedService.addFeedHeart(map);
				
		return feed.getHeartCount();
		
	}
	
	// 사용
	@RequestMapping(value = "/json/deleteFeedHeart", method = RequestMethod.POST)
	public int deleteFeedHeart(@RequestBody Heart heart, User user, Feed feed) throws Exception {
		
		// 피드 좋아요 취소
		
		user.setUserId(heart.getUserId());
		user = userService.getUser(user);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("user", user);
		map.put("feedNo", heart.getSourceNo());
		
		feed = ((Feed) feedService.getFeed(map).get("feed"));
		
		map.put("feed", feed);
		
		feed = feedService.deleteFeedHeart(map);
				
		return feed.getHeartCount();

	}
	
	
	
	///////////////////////////////////////////////////// HEART COMMENT  /////////////////////////////////////////////////////
	
	
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/addFeedCommentHeart", method = RequestMethod.POST)
	public List<Comment> addFeedCommentHeart(@RequestBody Comment comment, Search search, User user, Heart heart) throws Exception {
		
		// 피드 댓글 좋아요
		
		user.setUserId(comment.getUserId());
		user = userService.getUser(user);
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		heart.setSource("1");
		heart.setSourceNo(comment.getFeedCommentNo());
		heart.setUserId(user.getUserId());
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		map.put("search", search);
		map.put("user", user);
		map.put("feedNo", comment.getFeedNo());
		
		feedService.addFeedCommentHeart(map);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
		
	}
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/deleteCommentHeart", method = RequestMethod.POST)
	public List<Comment> deleteFeedCommentHeart(@RequestBody Comment comment, Search search, User user, Heart heart) throws Exception {
		
		// 피드 댓글 싫어요
		
		user.setUserId(comment.getUserId());
		user = userService.getUser(user);
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		heart.setSource("1");
		heart.setSourceNo(comment.getFeedCommentNo());
		heart.setUserId(user.getUserId());
		
		comment = feedService.getFeedComment(comment.getFeedCommentNo());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		map.put("search", search);
		map.put("user", user);
		map.put("feedNo", comment.getFeedNo());
		
		feedService.deleteFeedCommentHeart(map);
		
		return (List<Comment>) feedService.getFeedCommentList(map).get("commentList");
		
	}
	
	
	
	///////////////////////////////////////////////////// REPORT /////////////////////////////////////////////////////
		
		
		
	@RequestMapping(value = "/json/addFeedReport", method = RequestMethod.POST)
	public Report addReport(@RequestBody Report report) throws Exception {
		
		feedService.addReport(report);
		
		return report;
	
	}
	
	
	
}
