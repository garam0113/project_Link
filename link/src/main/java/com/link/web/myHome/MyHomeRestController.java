package com.link.web.myHome;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Feed;
import com.link.service.domain.Heart;
import com.link.service.domain.Meeting;
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
	 public Map<String, Object> getFollowList(@RequestBody Search search, User user, HttpSession session) throws Exception{
		 System.out.println("/myHomeRest/json/getFollowList : POST");
		 
		 if(search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}
			
			search.setPageSize(pageSize);
			search.setPageUnit(pageUnit);
		 
		 user = (User) session.getAttribute("user");
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("search",search);
		 map.put("user", user);	
		 map.put("list",myHomeService.getFollowList(search).get("list"));
		 
		 
		 
		 
		 return map;
		 
	 }
	@RequestMapping(value = "json/getFollowerList", method = RequestMethod.POST)
	 public Map<String, Object> getFollowerList(@RequestBody Search search,User user, HttpSession session) throws Exception{
				 System.out.println("/myHomeRest/json/getMyHome : POST");
				 
				 if(search.getCurrentPage() == 0) {
						search.setCurrentPage(1);
					}
					
					search.setPageSize(pageSize);
					search.setPageUnit(pageUnit);
				 user = (User) session.getAttribute("user");
				 Map<String,Object>map = myHomeService.getFollowerList(search);
				 map.put("search",search);
				 map.put("user", user);	
				 map.put("list",myHomeService.getFollowList(search).get("list"));
				 
				 return map;
				 
    }
	 
    @RequestMapping(value="/json/addFollow", method=RequestMethod.POST)
    public void addFollow(@RequestBody User receiveId, HttpSession session, Model model) throws Exception{
      

         
         System.out.println("/myHomeRest/json/addFollow : POST");
         System.out.println("화면에서 입력 받은 값 "+ receiveId );
         // 팔로우 받는 유저 id ( 패스파라미터로 받음 )
         // @PathVariable String userId
          
          // 팔로우 보내는 유저 id ( 로그인 세션에 저장되어있음 )
          String sendId =((User)session.getAttribute("user")).getUserId();
          System.out.println("send_user_id : " + sendId);
          // User 객체 생성
          User user = new User();
       
          // 보내는사람 id set
          user.setUserId(sendId);
          user.setReceiveId(receiveId);
     

          // 받는사람 정보 객체생성
     
          
          // 받는사람 정보 set


          System.out.println("recv_user_id : " +  receiveId);

          // 서비스 실행
          myHomeService.addFollow(user);
          
     
       
 
    }
    @RequestMapping(value="/json/deleteFollow", method=RequestMethod.POST)
    public void deleteFollow(@RequestBody User receiveId, HttpSession session, Model model) throws Exception{
      

         
         System.out.println("/myHomeRest/json/addFollow : POST");
         System.out.println("화면에서 입력 받은 값 "+ receiveId );
         // 팔로우 받는 유저 id ( 패스파라미터로 받음 )
         // @PathVariable String userId
          
          // 팔로우 보내는 유저 id ( 로그인 세션에 저장되어있음 )
          String sendId =((User)session.getAttribute("user")).getUserId();
          System.out.println("send_user_id : " + sendId);
          // User 객체 생성
          User user = new User();
       
          // 보내는사람 id set
          user.setUserId(sendId);
          user.setReceiveId(receiveId);
     

          // 받는사람 정보 객체생성
     
          
          // 받는사람 정보 set


          System.out.println("recv_user_id : " +  receiveId);

          // 서비스 실행
          myHomeService.deleteFollow(user);
			 
		 }
		@RequestMapping(value = "json/getClubList", method = RequestMethod.POST)
		 public Map<String,Object> getClubList(@RequestBody Search search) throws Exception{
			 System.out.println("/myHomeRest/json/json/getClubList : POST");
			
			 if(search.getCurrentPage() == 0) {
					search.setCurrentPage(1);
				}
				
				search.setPageSize(pageSize);
				search.setPageUnit(pageUnit);
			 
			 Map<String,Object>map = clubService.getClubList(search);
				
			 return map;
	 
 }
		@RequestMapping(value = "json/getClubPostList", method = RequestMethod.POST)
		 public Map<String,Object> getClubPostList(@RequestBody Search search, ClubPost clubPost)  throws Exception{
			 System.out.println("/myHomeRest/json/json/getClubList : POST");
			 
			 if(search.getCurrentPage() == 0) {
					search.setCurrentPage(1);
				}
				
				search.setPageSize(pageSize);
				search.setPageUnit(pageUnit);
			 
			 Map<String,Object>map = clubPostService.getClubPostList(search, clubPost);
				
		
			 return map;
			 
			 
		}
//		@RequestMapping(value="json/getMeetingList")
//		public Map<String, Object> getMeetingList(@RequestBody Search search,User user, Club clubNo,Meeting meeting,HttpSession session, Model model, HttpServletRequest request) throws Exception {
//			
//			System.out.println("/club/json/getClubList : GET / POST");
//	
//			user = (User) session.getAttribute("user");
//            session.getAttribute("clubNo");
//            session.getAttribute("meeting");
//			
//			if(search.getCurrentPage()==0) {
//				search.setCurrentPage(1);
//			}
//			search.setPageSize(pageSize);
//			
//			Map<String, Object> map = clubService.getMeetingList(search);
//			
//			Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMeetingCount")).intValue(), pageUnit, pageSize);
//			System.out.println(resultPage);
//			search.setSearchKeyword((String) session.getAttribute("clubNo"));
//			model.addAttribute("meetingList", map.get("meetingList"));
//			model.addAttribute("resultPage",resultPage);
//			model.addAttribute("search",search);
//			model.addAttribute("get",clubNo);
//			model.addAttribute("meeting",meeting);
//			
//			
//			return  clubService.getMeetingList(search);
//		}
		
		
		
}