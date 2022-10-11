package com.link.web.club;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;
import com.link.service.domain.User;

@Controller
@RequestMapping("/club/*")
public class ClubController {

	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	
	public ClubController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@Value("#{commonProperties[pageSize]}")
	int pageSize;
	
	@Value("#{commonProperties[pageUnit]}")
	int pageUnit;

	@RequestMapping(value="addClub", method=RequestMethod.POST)
	public String addClub(@ModelAttribute Club club, Model model, HttpSession httpSession, User user) throws Exception {
		
		System.out.println("club/addClub : POST");
		
		user = (User) httpSession.getAttribute("user");
		
		System.out.println("세션에 뭐 있나? : " + user);
		//club.setUser(user);
		
		club.setUser(user);
		club.setCurrentMember(1);
		club.setClubMaxMember(10);
//		club.setClubCategory("테스트 카타");
		
		clubService.addClub(club);
		return "forward:/club/getClub.jsp";
	}
	
	@RequestMapping(value="getClub", method=RequestMethod.POST)
	public String getClub(@ModelAttribute Club club, Model model) throws Exception {
		
		System.out.println("club/getClub : POST");
		
		clubService.addClub(club);
		
		return "forward:/club/getClub.jsp";
	}
	
	
	@RequestMapping(value="getClub", method=RequestMethod.GET)
	public String getClub(@RequestParam("clubNo") String clubNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("/club/getClub : GET");
		
		//Business Logic
		Club club = clubService.getClub(Integer.parseInt(clubNo));
		
		//Model 과 View 연결
		System.out.println("MODEL VIEW 연결 전");
		
		model.addAttribute("club",club);
		session.setAttribute("clubNo", clubNo);
		
		System.out.println("모델과 뷰 연결 되었나? "+club);
		return "forward:/club/getClub.jsp";
		
	}
	
	@RequestMapping(value="updateClub", method=RequestMethod.POST)
	public String updateClub(@ModelAttribute Club club, Model model)  throws Exception {
		
		System.out.println("club/updateClub : POST");
		
		//Business Logic
		
		clubService.updateClub(club);
		
		
		return "forward:/club/getClub.jsp";
	}
	
	@RequestMapping(value="deleteClub")
	public String deleteClub(@ModelAttribute Club club, String clubNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("deleteClub 시작");
		
		clubNo = (String) session.getAttribute("clubNo");
		
		System.out.println("세션에 뭐 있지 : "+session.getAttribute("clubNo"));		
		
		club.setClubNo(Integer.parseInt(clubNo));
		
		clubService.deleteClub(Integer.parseInt(clubNo));
		
		return "forward:/club/getClubList";
	}
	
	@RequestMapping(value="getClubList")
	public String getClubList(@ModelAttribute("search") Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/club/getClubList : GET/POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getClubList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalClubCount")).intValue(), pageUnit, pageSize);
		
		
		System.out.println("resultPage : "+resultPage);
		
		model.addAttribute("clubList",map.get("clubList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		return "forward:/club/getClubList.jsp";
	}
	
	@RequestMapping(value="getApprovalConditionList")
	public String getMyClubList(@ModelAttribute Search search, Model model, User user, HttpSession httpSession) throws Exception {
		
		System.out.println("/club/getApprovalConditionList : GET/POST");
		
		user = (User) httpSession.getAttribute("user");
		
		System.out.println("세션에 뭐가 있나요 : "+user);
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = clubService.getApprovalConditionList(search);		
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalApprovalConditionCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("resultPage : "+resultPage);
		
		model.addAttribute("approvalConditionList",map.get("approvalConditionList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/club/getApprovalConditionList.jsp";
	}
	
//	@RequestMapping(value="getMyClubList")
//	public String getMyClubList(@ModelAttribute Search search, Model model, User user, HttpSession httpSession) throws Exception {
//		
//		System.out.println("/club/getMyClubList : GET/POST");
//		
//		user = (User) httpSession.getAttribute("user");
//		
//		System.out.println("세션에 뭐가 있나요 : "+user);
//		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		search.setPageUnit(pageUnit);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("search",search);
//		map.put("user", user);
//		map.put("myHome",0);
//		
//		map = clubService.getMyClubList(map);
//		
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMyClubCount")).intValue(), pageUnit, pageSize);
//		
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		model.addAttribute("myClubList", map.get("myClubList"));
//		
//		return "forward:/club/getApprovalCondition.jsp";
//	}
	
	@RequestMapping(value="addApprovalCondition", method = RequestMethod.POST)
	public String addApprovalCondition(@ModelAttribute ClubUser clubUser, User user, Club club, Model model, HttpSession httpSession, String clubNo) throws Exception {
		
		System.out.println("/addApprovalCondition : POST");
		
		user = (User) httpSession.getAttribute("user");
		clubNo = (String) httpSession.getAttribute("clubNo");
		
		clubUser.setUser(user);
		clubUser.setClubNo(Integer.parseInt(clubNo));
		clubUser.setMemberRole("0");
		clubUser.setApprovalCondition("0");
		clubService.addApprovalCondition(clubUser);
		return "forward:/club/getClubList";
	}
	
	@RequestMapping(value="getClubMemberList")
	public String getClubMemberList(@ModelAttribute("search") Search search, Model model, HttpSession session, User user, ClubUser clubUser) throws Exception {
		
		System.out.println("/club/getClubMemberList : GET/POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getClubMemberList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalClubMemberCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		
		user = (User) session.getAttribute("user");
		System.out.println("세션에 뭐 있지? : "+user);
		user.setNickName("user");
		clubUser.setLogoutDate(null);
		
		model.addAttribute("clubMemberList",map.get("clubMemberList"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);

		return "forward:/club/getClubMemberList.jsp";
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public String addMeeting(@ModelAttribute Meeting meeting, Model model, HttpSession session, String clubNo, User user, Club club) throws Exception {
		
		System.out.println("club/addMeeting : POST ");
		
		user = (User) session.getAttribute("user");
		clubNo = (String) session.getAttribute("clubNo");
		
		System.out.println("유저 세션에 뭐있나? : "+user);
		System.out.println("클럽넘버는 잘 왔나? : "+clubNo);
	
		meeting.setUser(user);
		meeting.setClubNo(Integer.parseInt(clubNo));
		meeting.setMeetingMember(1);
		clubService.addMeeting(meeting);
		return "forward:club/getMeeting.jsp";
		
	}
	
	@RequestMapping(value="getMeetingList")
	public String getMeetingList(@ModelAttribute("search") Search search, Model model, HttpSession session, Club club) throws Exception {
		
		System.out.println("/club/getMeetingList : GET/POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getMeetingList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMeetingCount")).intValue(), pageUnit, pageSize);
		
		System.out.println("resultPage : "+resultPage);
		
		session.getAttribute("clubNo");
		
		System.out.println("세션에 뭐가 있나요 ?? : "+ session.getAttribute("clubNo"));
		
		search.setSearchKeyword((String) session.getAttribute("clubNo"));
		model.addAttribute("meetingList",map.get("meetingList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		return "forward:/club/getMeetingList.jsp";
		
	}
	
	@RequestMapping(value="getMeeting", method = RequestMethod.POST)
	public String getMeeting(@ModelAttribute Meeting meeting) throws Exception {
		
		System.out.println("club/getMeeting : POST ");
		
		clubService.addMeeting(meeting);
		
		return "forward:/club/getMeeting.jsp";
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public String getMeeting(@RequestParam("meetingNo") String meetingNo, Model model, HttpSession session, String clubNo) throws Exception {
	
		System.out.println("/club/getMeeting : GET");
				
		//Business Logic
		Meeting meeting = clubService.getMeeting(Integer.parseInt(meetingNo));
		
		//Model 과 View 연결
		System.out.println("MODEL VIEW 연결 전 ");
		
		model.addAttribute("meeting",meeting);
		session.setAttribute("meetingNo", meetingNo);
		session.setAttribute("clubNo", clubNo);
		
		System.out.println("모델과 뷰 연결 되었나? " + meeting);
		return "forward:/club/getMeeting.jsp";
	}
	
	@RequestMapping(value="updateMeeting", method=RequestMethod.POST)
	public String updateMeeting(@ModelAttribute Meeting meeting, Model model) throws Exception {
		
		System.out.println("club/updateMeeting : POST");
		
		//Business Logic
		clubService.updateMeeting(meeting);
		
		return "forward:/club/getMeetingList.jsp";
	}
	
	@RequestMapping(value="deleteMeeting")
	public String deleteMeeting(@ModelAttribute Meeting meeting, String meetingNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("deleteMeeting 시작~~~~~~~~~~~~~~~~~~~");
		
		meetingNo = (String) session.getAttribute("meetingNo");
		
		System.out.println("세션에 뭐 있지 : "+session.getAttribute("meetingNo"));
		
		meeting.setMeetingNo(Integer.parseInt(meetingNo));
		
		clubService.deleteMeeting(Integer.parseInt(meetingNo));
		
		return "forward:/club/getMeetingList";
	}
}
