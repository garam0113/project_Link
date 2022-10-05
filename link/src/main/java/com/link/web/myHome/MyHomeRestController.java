package com.link.web.myHome;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.domain.User;
import com.link.service.myHome.MyHomeService;

@RestController
@RequestMapping("/product/*")
public class MyHomeRestController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	MyHomeService myHomeService;

	public MyHomeRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(":: MyHomeRestController default Constructor");
	}

	 public Map<String,Object> getFollowList(@RequestBody Search search)
	 throws Exception{
		 System.out.println("/myHomeRest/json/getMyHome : POST");
		 
		 Map<String, Object> Map = myHomeService.getFollowList(search);
		
		 return Map;
	 }
	 public Map<String,Object> getFollowerList(@RequestBody Search search)
			 throws Exception{
				 System.out.println("/myHomeRest/json/getMyHome : POST");
				 
				 Map<String, Object> Map = myHomeService.getFollowerList(search);
				
				 return Map;
				 
    }
	 @RequestMapping(value="/json/addFollow{userId}", method=RequestMethod.POST)
    public User addFollow(@RequestBody User user, @PathVariable String userId, HttpSession session, Model model) throws Exception{
		 
		 System.out.println("/myHomeRest/json/addFollow : POST");
		 
		 Object object = session.getAttribute("login");
		 User sendId = (User)object;
		 User receiveId = myHomeService.addFollow(userId);
		 
		 User follow = new User();
		 follow.setUserId(sendId.getUserId());
		 follow.setReceiveId(receiveId.getUserId());
		 
		 myHomeService.addFollow(follow);
		 
		 
		return follow;
		 
		 
	 }
	 
	 @RequestMapping(value="/json/deleteFollow{userId}", method=RequestMethod.POST)
	    public User deleteFollow(@RequestBody User user, @PathVariable String userId, HttpSession session, Model model) throws Exception{
			 
			 System.out.println("/myHomeRest/json/addFollow : POST");
			 
			 Object object = session.getAttribute("login");
			 User sendId = (User)object;
			 User receiveId = myHomeService.addFollow(userId);
			 
			 User follow = new User();
			 follow.setUserId(sendId.getUserId());
			 follow.setReceiveId(receiveId.getUserId());
			 
			 myHomeService.deleteFollow(follow);
			 
			 
			return follow;
			 
			 
		 }
	 
}
