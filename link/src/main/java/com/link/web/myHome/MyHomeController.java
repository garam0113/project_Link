package com.link.web.myHome;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Feed;
import com.link.service.domain.User;
import com.link.service.feed.FeedService;
import com.link.service.myHome.MyHomeService;
import com.link.service.user.UserService;

@Controller
@SessionAttributes("user")
@RequestMapping("/myHome/*")
public class MyHomeController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	private MyHomeService myHomeService;
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	@Autowired
	@Qualifier("feedServiceImpl")
	private FeedService feedService;
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	@Autowired
	@Qualifier("clubPostServiceImpl")
	private ClubPostService clubPostService;
	
	public MyHomeController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	
	public String getMyHome(User user, Feed feed, Club club, ClubPost clubPost,
			@RequestParam("userId")String userId,@RequestParam("clubNo")int clubNo,
			@RequestParam("clubPostNo")int clubPostNo, Model model) throws Exception{
		
		System.out.println("/myHome/getMyHome : GET");
		
		user = userService.getUser(user.getUserId());
		club = clubService.getClub(club.getClubNo());
		
		
		model.addAttribute("user",user);
		
		return null;
	}

	

}
