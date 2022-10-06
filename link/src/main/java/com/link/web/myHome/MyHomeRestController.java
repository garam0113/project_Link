package com.link.web.myHome;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.User;
import com.link.service.myHome.MyHomeService;

@RestController
@RequestMapping("/myHomeRest/*")
public class MyHomeRestController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	private MyHomeService myHomeService;
	private ClubService clubService;
	private ClubPostService clubPostService;

	public MyHomeRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(":: MyHomeRestController default Constructor");
	}
	
	//@Value("#{commonProperties['pageSize'] ? : 2}")
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		//@Value("#{commonProperties['pageUnit'] ? : 3}")
		// 없다면 ? 3으로 초기화
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
	
	@RequestMapping(value = "json/getFollowList", method = RequestMethod.POST)
	 public Map<String,Object> getFollowList(@RequestBody Search search)
	 throws Exception{
		 System.out.println("/myHomeRest/json/getFollowList : POST");
		 
		 Map<String,Object>map = myHomeService.getFollowList(search);
			
		 return map;
		 
	 }
	@RequestMapping(value = "json/getFollowerList", method = RequestMethod.POST)
	 public Map<String, Object> getFollowerList(@RequestBody Search search)
			 throws Exception{
				 System.out.println("/myHomeRest/json/getMyHome : POST");
				
				 Map<String,Object>map = myHomeService.getFollowerList(search);
				
				 return map;
				 
    }
	 @RequestMapping(value="/json/addFollow", method=RequestMethod.POST)
    public User addFollow(@RequestBody User user, @PathVariable String userId, HttpSession session, Model model) throws Exception{
		 
		 System.out.println("/myHomeRest/json/addFollow : POST");
		 
		 Object object = session.getAttribute("login");
		 User sendId = (User)object;
		 User receiveId = myHomeService.addFollow(userId);
		 
		 user.setUserId(sendId.getUserId());
		 user.setReceiveId(receiveId.getUserId());
		 
		 myHomeService.addFollow(user);
		 
		 
		return user;
		 
		 
	 }
	 
	 @RequestMapping(value="/json/deleteFollow", method=RequestMethod.POST)
	    public User deleteFollow(@RequestBody User user, @PathVariable String userId, HttpSession session, Model model) throws Exception{
			 
			 System.out.println("/myHomeRest/json/addFollow : POST");
			 
			 Object object = session.getAttribute("login");
			 User sendId = (User)object;
			 User receiveId = myHomeService.addFollow(userId);
			 
	
			 user.setUserId(sendId.getUserId());
			 user.setReceiveId(receiveId.getUserId());
			 
			 myHomeService.deleteFollow(user);
			 
			 
			return user;
			 
			 
		 }
		@RequestMapping(value = "json/getClubList", method = RequestMethod.POST)
		 public Map<String,Object> getClubList(@RequestBody Search search)
		 throws Exception{
			 System.out.println("/myHomeRest/json/json/getClubList : POST");
			 
			 Map<String,Object>map = clubService.getClubList(search);
				
			 return map;
	 
 }
		@RequestMapping(value = "json/getClubPostList", method = RequestMethod.POST)
		 public Map<String,Object> getClubPostList(@RequestBody Search search, ClubPost clubPost)
		 throws Exception{
			 System.out.println("/myHomeRest/json/json/getClubList : POST");
			 
			 Map<String,Object>map = clubPostService.getClubPostList(search, clubPost);
				
		
			 return map;
			 
			 
		}
		
}