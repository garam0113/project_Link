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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.link.service.domain.Participant;
import com.link.service.domain.User;
import com.link.service.myHome.MyHomeService;
import com.link.web.clubPost.ClubPostCommon;

@RestController
@RequestMapping("/myHomeRest/*")
public class MyHomeRestController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	private MyHomeService myHomeService;
	
	@Autowired
	@Qualifier("clubPostServiceImpl")
	private ClubPostService clubPostService;
	
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;

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
			
			
			String userId = ((User) session.getAttribute("user")).getUserId();
			search.setSearchKeyword(userId);
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("search",search);
		 map.put("user", user);	
		 map.put("list",myHomeService.getFollowList(search).get("list"));
		 
		 
		 
		 
		 return map;
		 
	 }
	@RequestMapping(value = "json/getFollowerList", method = RequestMethod.POST)
	 public Map<String, Object> getFollowerList(@RequestBody Search search,User user, HttpSession session) throws Exception{
				 System.out.println("/myHomeRest/json/getMyHome : POST");
				 
				 search.setSearchCondition("1");
				 if(search.getCurrentPage() == 0) {
						search.setCurrentPage(1);
					}
					
					search.setPageSize(pageSize);
					search.setPageUnit(pageUnit);
					
					
					String userId = ((User) session.getAttribute("user")).getUserId();
					search.setSearchKeyword(userId);
				 
				 Map<String,Object>map = myHomeService.getFollowerList(search);
				 
				 map.put("search",search);
				 map.put("user", user);	
				 map.put("followerList",myHomeService.getFollowerList(search).get("followerList"));
				 
				 return map;
				 
    }
	 
    @RequestMapping(value="/json/addFollow", method=RequestMethod.POST)
    public User addFollow(@RequestBody User receiveId,String fbState,String fbType, HttpSession session, Model model) throws Exception{
      

         
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
          user.setFbState(fbState);
          user.setFbType(fbType);
          
          // 받는사람 정보 객체생성
     
          
          // 받는사람 정보 set


      
  		// 받는사람 정보 set

            System.out.println("recv_user_id : " +  receiveId);

            // 서비스 실행
            myHomeService.addFollow(user);
            
       
            
            System.out.println("recv_user_id : " +  receiveId);    

            
        return null;
       
 
    }
    @RequestMapping(value="/json/updateFollow", method=RequestMethod.POST)
    public User updateFollow(@RequestBody User receiveId, HttpSession session, Model model) throws Exception{
      

         
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
          myHomeService.updateFollow(user);
       
          System.out.println("recv_user_id : " +  receiveId);
          
          return null;
         
		 }
    
    
	@RequestMapping(value = "/json/getClubPostListMyHome", method = RequestMethod.POST)
	public Map<String, Object> getClubPostListMyHome(@RequestBody ClubPost clubPost ,HttpSession session) throws Exception {
		System.out.println("/getClubPostListMyHome : GET : 마이홈피로 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId =  ((User)session.getAttribute("user")).getUserId();
		System.out.println((User)session.getAttribute("user"));
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 System.out.println(clubPostService);
		 System.out.println("ddd"+ (clubPostService.getClubPostListMyHome(userId)));
	
		 map.put("ClubPostList",clubPostService.getClubPostListMyHome(userId).get("clubPostList"));
		 
		 return map;

		
	}
	
	
	
			 
	@RequestMapping(value="/json/getMeetingList",method = RequestMethod.POST)
	public Map<String, Object> getMeetingList(@RequestBody Search search, Model model, HttpSession session, Club club, User user) throws Exception {
		
		System.out.println("/club/getMeetingList : GET/POST");
		
		user = (User) session.getAttribute("user");
		
		session.getAttribute("clubNo");
		System.out.println("세션에 뭐가 있나요 ?? : "+ session.getAttribute("clubNo"));
		
		search.setSearchCondition("1");
		
		search.setSearchKeyword((String) session.getAttribute("clubNo"));
		search.setSearchKeyword(user.getUserId());
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getMeetingList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMeetingCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("resultPage : "+resultPage);
		
		
		search.setSearchKeyword((String) session.getAttribute("clubNo"));
		model.addAttribute("meetingList",map.get("meetingList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		return map;
	}
	@RequestMapping(value="/json/getMeetingMemberList",method = RequestMethod.POST)
	public Map<String, Object>  getMeetingMemberList(@RequestBody Search search, Meeting meeting,Model model, HttpSession session, User user, Participant participant) throws Exception {
		
		System.out.println("/club/getMeetingMemberList : GET/POST");
		
		user = (User) session.getAttribute("user");
		System.out.println("(일정참여자)미팅넘버 세션에 뭐 있지? : "+ session.getAttribute("meetingNo"));
				
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		

		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		search.setOrder(1);
		
		Map<String, Object>  map = clubService.getMeetingMemberList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMeetingMemberCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		
		model.addAttribute("meetingMemberList", map.get("meetingMemberList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("meeting", meeting);
		
		return map;
	}
	

		@RequestMapping(value = "json/getFollw", method = RequestMethod.POST)
		public User getFollow(@RequestBody User user, HttpSession session) throws Exception{
			
			System.out.println("/club/json/getFollew :  POST");
			
			String sessionId = ((User)session.getAttribute("user")).getUserId();
			
			user.setUserId(sessionId);
			
			User follwUser = myHomeService.getFollow(user);
			
			return follwUser;
			
		}
	
}