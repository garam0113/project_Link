package com.link.web.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		map.put("comment", comment);
		
		return feedService.getFeedCommentList(map);
	}
	
	@RequestMapping(value = "/json/updateFeedComment", method = RequestMethod.POST)
	public List<Comment> updateFeedComment(@RequestBody Comment comment) throws Exception {
		
		feedService.updateFeedComment(comment);
		
		return null;
	}
	
	@RequestMapping(value = "/json/deleteFeedComment", method = RequestMethod.POST)
	public List<Comment> deleteFeedComment(@RequestBody Comment comment) throws Exception {
		
		feedService.deleteFeedComment(0);	// 수정
		
		return null;
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
		
		return (List<Feed>)feedService.getFeedList(search).get("list");
	}
	
	@RequestMapping(value = "/json/getFeedCommentList", method = RequestMethod.GET)
	public List<Comment> getFeedCommentList(@RequestBody Search search){
	
		// 피드 댓글 리스트
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		return null;
	}
	
	@RequestMapping(value = "/json/updateFeedLike")
	public List<Feed> updateFeedLike() {
		
		return null;
	}
	
	@RequestMapping(value = " /json/updateFeedCommentLike")
	public List<Comment> updateFeedCommentLike() {
		
		return null;
	}
	
}
