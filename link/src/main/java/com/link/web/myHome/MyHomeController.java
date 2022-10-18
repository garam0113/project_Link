package com.link.web.myHome;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.tipis.AbstractReplicatedMap.MapEntry;
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

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.Feed;
import com.link.service.domain.Heart;
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
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	//@Value("#{commonProperties['pageUnit'] ? : 3}")
	// 없다면 ? 3으로 초기화
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	
	public MyHomeController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@RequestMapping(value = "getMyHome")
	public String getMyHome(@ModelAttribute Search search, Heart heart, String userId, Club club,
		       Model model,HttpSession session) throws Exception{
		
		System.out.println("/myHome/getMyHome : GET");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
	
	    
		map.put("user", (User)session.getAttribute("user"));
		map.put("clubNo", session.getAttribute("clubNo"));
	    map.put("heart", heart);
		map.put("myHome", 1);
		map.put("search", search);
		map.put("approvalConditionList",clubService.getApprovalConditionList(search).get("approvalConditionList"));
		
		
	
		map = feedService.getFeedList(map);
		
		
		search.setSearchKeyword(userId);
		map.put("list",myHomeService.getFollowList(search).get("list"));
		
		
		model.addAttribute("approvalConditionList",map.get("approvalConditionList"));
		model.addAttribute("search", search);
		model.addAttribute("feedList", map.get("feedList"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("heart", heart);
		
		
		return "forward:/myHome/getMyHome.jsp";
	}  
	@RequestMapping(value = "getYourHome" ,method=RequestMethod.GET)
	public String getYourHome(@ModelAttribute Search search, Heart heart, String userId,
		       Model model) throws Exception{
		
		System.out.println("/myHome/getYourHome : GET");
		
		Map<String, Object> map = new HashMap<String, Object>();
		User getUser = new User();
		getUser.setUserId(userId);
		User getUserId =userService.getUser(getUser);
	    map.put("heart", heart);
		map.put("myHome", 1);
		map.put("search", search);
		map.put("list",myHomeService.getFollowList(search).get("list"));
		map.put("clubList",clubService.getClubList(search).get("clubList"));
		map.put("user", getUserId);
		
		
		map = feedService.getFeedList(map);
	
		
	
		model.addAttribute("clubList",map.get("clubList"));
		model.addAttribute("search", search);
		model.addAttribute("feedList", map.get("feedList"));
		model.addAttribute("list", map.get("list"));
		model.addAttribute("heart", heart);
		model.addAttribute("getUser", getUserId);
		
		return "forward:/myHome/getYourHome.jsp";
	}
	@RequestMapping(value = "getProfile", method = RequestMethod.GET)
	public String getProfile(@RequestParam("userId")String userId,Model model, HttpSession session) throws Exception{
		
		System.out.println("/myHome/getProfile : GET");
		User user = new User();
		user.setUserId(userId);
    	user = userService.getUser(user);
		
        session.setAttribute("user", user);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		System.out.println("sessionId : "+sessionId);
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return "forward:/myHome/getProfile.jsp";
		
	}
	@RequestMapping(value="updateProfile", method = RequestMethod.GET)
	public String updateProfile(@ModelAttribute("userId") String userId,  Model model) throws Exception {
		
		System.out.println("/user/updateProfile : GET");
		
		User user = new User();
		
		user.setUserId(userId);
		
		
		model.addAttribute("user",user);
		
		return "forward:/myHome/updateProfile.jsp";
	
	}
	@RequestMapping(value="updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("uesr") User user, Model model, HttpSession session) throws Exception {
		
		System.out.println("/user/updateProfile : POST");
		
		userService.updateUser(user);	//SNS회원 프로필 작성
		
		user = userService.getUser(user);
		
		session.setAttribute("user", user);
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return "redirect:/myHome/getProfile?userId="+user.getUserId();
  
}
	@RequestMapping(value ="/updateMyHomeOpenCondition", method = RequestMethod.POST)
	public String updateMyHomeOpenCondition(@ModelAttribute("user")User user, Model model, HttpSession session)
	          throws Exception{
		System.out.println("/user/updateMyHomeOpenCondition : POST");
		
		myHomeService.updateMyHomeOpenCondition(user);
		user = userService.getUser(user);
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		
		return "redirect:/myHome/getMyHome?userId="+user.getUserId();
		
	}
	
	@RequestMapping(value ="/updateMyHomePushCondition", method = RequestMethod.POST)
	public String updateMyHomePushCondition(@ModelAttribute("user")User user, Model model, HttpSession session)
	          throws Exception{
		System.out.println("/user/updateMyHomePushCondition : POST");
		
		myHomeService.updateMyHomePushCondition(user);
		user = userService.getUser(user);
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		
		return "redirect:/myHome/getMyHome?userId="+user.getUserId();
		
	}
	@RequestMapping(value = "getFollowList")
	public String getFollowList(@ModelAttribute Search search, Model model) throws Exception {
	
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();		
		map = myHomeService.getFollowList(search);
		map.put("search", search);
		
		model.addAttribute("map", map);
		model.addAttribute("search", search);
		model.addAttribute("list", map.get("list"));
		
		return "forward:/myHome/getFollowList.jsp";
	}
	@RequestMapping(value = "getFollowerList")
	public String getFollowerList(@ModelAttribute Search search, Model model) throws Exception {
        
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = new HashMap<String, Object>();
	
		map.put("search", search);
				
		map = myHomeService.getFollowerList(search);
		
		
	
		model.addAttribute("search", search);
		model.addAttribute("list", map.get("list"));
		
		return "forward:/myHome/getFollowerList.jsp";
	}
}



