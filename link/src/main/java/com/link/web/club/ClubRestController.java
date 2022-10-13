package com.link.web.club;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;
import com.link.service.domain.Participant;
import com.link.service.domain.User;
import com.link.service.user.UserService;

@RestController
@RequestMapping("/clubRest/*")
public class ClubRestController {

	
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	UserService userServiceImpl;
	
	public ClubRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + "default constructor") ;
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;


	@RequestMapping(value="json/getClubList")
	public Map<String, Object> getClubList(@RequestBody Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/club/json/getClubList : GET / POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getClubList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);
		
		return map;
	}
	
	@RequestMapping(value="json/getClubMemberList")
//	public Map<String, Object> getClubMemberList(@RequestBody Search search, Model model, HttpServletRequest request) throws Exception {
		public Map<String, Object> getClubMemberList(@RequestBody Search search, ClubUser clubUser, Club club, Map<String, Object> map, HttpSession session, User user, String clubNo) throws Exception {
		
		System.out.println("/club/json/getClubMemberList : GET / POST");
		
		System.out.println("search : "+ search);
		
		user = (User) session.getAttribute("user");
		clubNo = (String) session.getAttribute("clubNo");
		
		System.out.println("유저 세션에 뭐 있나(REST) : "+user);
		System.out.println("클럽 넘버세션은 ? REST : "+clubNo);
		
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalClubMemberCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage = " +resultPage);
		
		
		
		return clubService.getClubMemberList(search);
	}
	
	@RequestMapping(value="json/updateMemberRole", method=RequestMethod.POST)
	public Club updateMemberRole(@RequestBody ClubUser clubUser, Model model) throws Exception {
		
		System.out.println("club/json/updateMemberRole : POST");
		
		clubService.updateMemberRole(clubUser);
		model.addAttribute("clubUser",clubUser);
		
		return clubService.getClub(clubUser.getClubNo());
	}
	
	@RequestMapping(value="json/deleteMeeting", method=RequestMethod.POST)
	public void deleteMeeting(@RequestParam(value="meetingNo") int meetingNo, Model model) throws Exception {
		
		System.out.println("deleteMeeting 시작");
		System.out.println("meetingNo = " +meetingNo);
		
		clubService.deleteMeeting(meetingNo);
	}
	
	@RequestMapping(value="json/deleteClubMember", method=RequestMethod.POST)
	public void deleteClubMember(@RequestParam(value="clubUserNo") int clubUserNo, Model model) throws Exception {
		
		System.out.println("deleteClubMemer 시작");
		System.out.println("clubUserNo = : "+clubUserNo);
		
		clubService.deleteClubMember(clubUserNo);
		
	}
	
	@RequestMapping(value="json/addMeetingMember", method=RequestMethod.POST)
	public void addMeetingMember(@RequestBody Participant participant, Model model) throws Exception {
		
		System.out.println("addMeetingMember 시작~");
		
		clubService.addMeetingMember(participant);
		
	}
	
	@RequestMapping(value="json/deleteMeetingMember", method=RequestMethod.POST)
	public void deleteMeetingMember(@RequestParam(value="participantNo") int participantNo, Model model) throws Exception {
		
		System.out.println("deleteMeetingMember 시작~");
		System.out.println("participantNo = : "+participantNo);
		
		clubService.deleteMeetingMember(participantNo);
		
	}
	
	//가입신청현황 리스트 --> GetMyClubList와 병합
//	@RequestMapping(value="json/getApprovalConditionList")
//	public Map<String, Object> getApprovalConditionList(@RequestBody Search search, Model model, HttpServletRequest request) throws Exception {
//		
//		System.out.println("getApprovalConditionList 시작!");
//		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map = clubService.getApprovalConditionList(search);
//		
//		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")). intValue(), pageUnit, pageSize);
//		System.out.println(resultPage);
//		
//		model.addAttribute("ApprovalConditionList", map.get("ApprovalConditionList"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search", search);
//		
//		return map;
//	}
	
	@RequestMapping(value="json/updateApprovalCondition", method=RequestMethod.POST)
	public ClubUser updateApprovalCondition(@RequestBody ClubUser clubUser, Model model) throws Exception {
		
		System.out.println("updateApprovalCondition 시작!");
		
		clubService.updateApprovalCondition(clubUser);
		model.addAttribute("clubUser",clubUser);

		
		return null;
	}
	
	@RequestMapping(value="json/deleteApprovalCondition", method=RequestMethod.POST)
	public ClubUser deleteApprovalCondition(@RequestBody ClubUser clubUser, Model model) throws Exception {
		
		System.out.println("deleteApprovalCondition 시작 ! ");
		
		clubService.deleteApprovalCondition(clubUser);
		model.addAttribute("clubUser", clubUser);
		
		return null;
		
	}
}
