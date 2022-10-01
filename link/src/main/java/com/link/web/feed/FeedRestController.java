package com.link.web.feed;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
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

	@RequestMapping(value = " /json/addFeedComment", method = RequestMethod.POST)
	public List<Comment> addFeedComment(@RequestBody Comment comment) {
		
		feedService.addFeedComment(comment);
		
		return null;
	}
	
	@RequestMapping(value = " /json/updateFeedComment", method = RequestMethod.POST)
	public List<Comment> updateFeedComment(@RequestBody Comment comment) {
		
		feedService.updateFeedComment(comment);
		
		return null;
	}
	
	@RequestMapping(value = " /json/deleteFeedComment", method = RequestMethod.POST)
	public List<Comment> deleteFeedComment(@RequestBody Comment comment) {
		
		feedService.deleteFeedComment(0);	// 수정
		
		return null;
	}
	
	@RequestMapping(value = " /json/updateFeedLike")
	public List<Feed> updateFeedLike() {
		
		return null;
	}
	
	@RequestMapping(value = " /json/updateFeedCommentLike")
	public List<Comment> updateFeedCommentLike() {
		
		return null;
	}
	
}
