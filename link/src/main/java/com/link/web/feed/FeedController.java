package com.link.web.feed;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.link.service.domain.Feed;
import com.link.service.domain.User;
import com.link.service.feed.FeedService;

@Controller
@SessionAttributes("user")
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
	
	@RequestMapping(value = "addFeed", method = RequestMethod.GET)
	public String addFeed(@ModelAttribute User user, @ModelAttribute Feed feed, Model model, @RequestParam("image") MultipartFile[] file) throws Exception {
		
		for(MultipartFile files : file) {
			String path = "C:\\Users\\";
			
			File saveFile = new File(path + files.getOriginalFilename());
			
			boolean isExists = saveFile.exists();
			
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}
		
		feedService.addFeed(feed);
		
		return "forward:/getFeedList.jsp";
	}
	
	@RequestMapping(value = "getFeed", method = RequestMethod.GET)
	public String getFeed(@ModelAttribute Feed feed) {
		
		feedService.getFeed(feed.getFeedNo());
		
		return "forward:/getFeed.jsp";
	}
	
	@RequestMapping(value = "updateFeed", method = RequestMethod.GET)
	public String updateFeed() {
		
		feedService.updateFeed(null);
		
		return "forward:/getFeed.jsp";
	}
	
	@RequestMapping(value = "deleteFeed", method = RequestMethod.GET)
	public String deleteFeed(@ModelAttribute User user, @ModelAttribute Feed feed, Model model) {
		
		feedService.deleteFeed(feed.getFeedNo());
		
		return "forward:/getFeedList.jsp";
	}

}
