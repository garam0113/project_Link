package com.link.web.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	
	// 사용
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/json/addFeedComment", method = RequestMethod.POST)
	public List<Comment> addFeedComment(@RequestBody Comment comment, Search search,
											User user, HttpSession httpSession) throws Exception {
		
		// 댓글 작성
		
		user = (User) httpSession.getAttribute("user");
			
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
	public List<Comment> getFeedCommentList(@RequestBody Comment comment, Search search, User user,	
												HttpSession httpSession) throws Exception{
	
		user = (User) httpSession.getAttribute("user");

		// 피드 댓글 리스트
		
		if(comment.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(comment.getCurrentPage());
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
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
	public int addFeedHeart(@RequestBody Feed feed, User user, Heart heart, HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		// 피드 좋아요 추가
		heart.setSource("0");
		heart.setSourceNo(feed.getFeedNo());
		heart.setUserId(user.getUserId());
		
		System.out.println("유저 : " + user + "\n하트 : " + heart);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("feed", feed);
		map.put("user", user);
		map.put("feedNo", feed.getFeedNo());
				
		return feedService.addFeedHeart(map).getCheckHeart();
		
	}
	
	// 사용
	@RequestMapping(value = "/json/deleteFeedHeart", method = RequestMethod.POST)
	public int deleteFeedHeart(@RequestBody Feed feed, User user, Heart heart, HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		// 피드 좋아요 취소
		
		heart.setSource("0");
		heart.setSourceNo(feed.getFeedNo());
		heart.setUserId(user.getUserId());
				
		System.out.println("하트요" + heart);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("feed", feed);
		map.put("user", user);
		map.put("feedNo", feed.getFeedNo());
				
		return feedService.deleteFeedHeart(map).getCheckHeart();

	}
	
	// 사용
	@RequestMapping(value = "/json/addFeedCommentHeart", method = RequestMethod.POST)
	public Comment addFeedCommentHeart(@RequestBody Comment comment, User user, Heart heart, HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		// 피드 댓글 좋아요
		
		heart.setSource("1");
		heart.setSourceNo(comment.getFeedCommentNo());
		heart.setUserId(user.getUserId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		
		return feedService.addFeedCommentHeart(map);
		
	}
	
	// 사용
	@RequestMapping(value = "/json/deleteCommentHeart", method = RequestMethod.POST)
	public Comment deleteFeedCommentHeart(@RequestBody Comment comment, User user, Heart heart, HttpSession httpSession) throws Exception {
		
		user = (User) httpSession.getAttribute("user");
		
		// 피드 댓글 좋아요
		heart.setSource("1");
		heart.setSourceNo(comment.getFeedCommentNo());
		heart.setUserId(user.getUserId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("heart", heart);
		map.put("comment", comment);
		
		return feedService.deleteFeedCommentHeart(map);
		
	}
	
	
	
	///////////////////////////////////////////////////// Report /////////////////////////////////////////////////////
		
		
		
	@RequestMapping(value = "/json/addFeedReport", method = RequestMethod.POST)
	public Report addReport(@ModelAttribute Report report) throws Exception {
		
		feedService.addReport(report);
		
		return report;
	
	}
	
	
	
}
