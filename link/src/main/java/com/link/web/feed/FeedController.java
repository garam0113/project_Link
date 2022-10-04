package com.link.web.feed;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.domain.Comment;
import com.link.service.domain.Feed;
import com.link.service.feed.FeedService;

@Controller
@RequestMapping("/feed/*")
public class FeedController {

	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;
	
	public FeedController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Value("#{commonProperties['pageUnit'] ? : 3}")
	// 없다면 ? 3으로 초기화
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	//////////////////////////////////////// Feed
	
	@RequestMapping(value = "addFeed", method = RequestMethod.POST)
	public String addFeed(@ModelAttribute Feed feed, Model model, @RequestParam("image") MultipartFile[] file,
						HttpSession httpSession) throws Exception {
		
		// 회원 피드 등록
		
		// User user = (User) httpSession.getAttribute("user");
		// feed.setUserId(user.getUserId());
		feed.setUserId("user01");
		
		System.out.println("feed : " + feed);
		
		for(MultipartFile files : file) {
			String path = "C:\\Users\\";
			
			File saveFile = new File(path + files.getOriginalFilename());
			
			boolean isExists = saveFile.exists();
			
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}
		
		feedService.addFeed(feed);
		
		return "forward:/feed/getFeedList.jsp";
	}
	
	@RequestMapping(value = "getFeed", method = RequestMethod.GET)
	public String getFeed(@ModelAttribute Feed feed, Model model, Search search) {
		
		System.out.println("getFeed << feedNo : " + feed.getFeedNo());
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("feedNo", feed.getFeedNo());
		map.put("search", search);
		
		map = feedService.getFeed(map);
		
		model.addAttribute("feed", map.get("feed"));
		model.addAttribute("comment", map.get("comment"));
		// FeedComment List
		
		return "forward:/feed/getFeed.jsp";
	}
	
	@RequestMapping(value = "updateFeed", method = RequestMethod.POST)
	public String updateFeed(@ModelAttribute Feed feed, Model model) {
		
		feedService.updateFeed(feed);
		
		// feed = feedService.getFeed(feed.getFeedNo());
		
		model.addAttribute("feed", feed);
		
		return "forward:/feed/getFeed.jsp";
	}
	
	@RequestMapping(value = "deleteFeed", method = RequestMethod.GET)
	public String deleteFeed(@RequestParam(value = "feedNo") int feedNo, Model model) {
		
		System.out.println("deleteFeed Start");
		System.out.println("feed is -> " + feedNo);
		
		feedService.deleteFeed(feedNo);
		
		return "forward:/feed/getFeedList";
	}
	
	//////////////////////////////////////// Feed Comment
	
	//////////////////////////////////////// Feed List
	
	@RequestMapping(value = "getFeedList", method = RequestMethod.GET)
	public String getFeedList(@ModelAttribute Search search, Model model) {
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = feedService.getFeedList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalFeedCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("list", map.get("list"));
		
		return "forward:/feed/getFeedList.jsp";
	}

}
