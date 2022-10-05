package com.link.web.feed;

import java.io.File;
import java.util.HashMap;
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
import com.link.service.domain.Feed;
import com.link.service.domain.Heart;
import com.link.service.domain.Push;
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
	
	
	
	///////////////////////////////////////////////////// Feed /////////////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "addFeed", method = RequestMethod.POST)
	public String addFeed(@ModelAttribute Feed feed, @RequestParam("image") MultipartFile[] file,
							@ModelAttribute Push push, Model model, HttpSession httpSession) throws Exception {
		
		// 회원 피드 등록
		
		// User user = (User) httpSession.getAttribute("user");
		// feed.setUserId(user.getUserId());
		feed.setUserId("user01");
		
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
	public String getFeed(@RequestParam(value = "feedNo") int feedNo, Search search, Model model) throws Exception {
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("feedNo", feedNo);
		map.put("search", search);
		
		map = feedService.getFeed(map);
		
		model.addAttribute("feed", map.get("feed"));
		model.addAttribute("commentList", map.get("commentList"));
		
		return "forward:/feed/getFeed.jsp";
	}
	
	@RequestMapping(value = "updateFeed", method = RequestMethod.POST)
	public String updateFeed(@ModelAttribute Feed feed, Search search, Model model) throws Exception {
		
		feedService.updateFeed(feed);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 피드 번호 전달
		map.put("feedNo", feed.getFeedNo());
		map.put("search", search);
		
		// 업데이트 된 피드 찾기
		map = feedService.getFeed(map);
				
		model.addAttribute("feed", map.get("feed"));
		
		return "forward:/feed/getFeed.jsp";
	}
	
	@RequestMapping(value = "deleteFeed", method = RequestMethod.GET)
	public String deleteFeed(@RequestParam(value = "feedNo") int feedNo, Model model) throws Exception {
		
		feedService.deleteFeed(feedNo);
		
		return "forward:/feed/getFeedList";
	}
	
	
	
	///////////////////////////////////////////////////// Feed Comment /////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////// Feed List /////////////////////////////////////////////////////
	
	
	
	@RequestMapping(value = "getFeedList", method = RequestMethod.GET)
	public String getFeedList(@ModelAttribute Search search, Heart heart, Model model) throws Exception {
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("search", search);
				
		map = feedService.getFeedList(map);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalFeedCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("feedList", map.get("feedList"));
		
		return "forward:/feed/getFeedList.jsp";
	}
	
	
	
	///////////////////////////////////////////////////// Report /////////////////////////////////////////////////////
	
	@RequestMapping(value = "addFeedReport", method = RequestMethod.POST)
	public String addFeedReport() {
		
		return null;
		
	}
	
	
	@RequestMapping(value = "addFeedCommentReport", method = RequestMethod.POST)
	public String addFeedCommentReport() {
		
		return null;
		
	}
	
}
