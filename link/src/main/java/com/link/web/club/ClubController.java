package com.link.web.club;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.commons.collections.map.HashedMap;
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
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;
import com.link.service.domain.Participant;
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
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['clubUploadTempDir']}")
	String clubUploadTempDir;

	@RequestMapping(value="addClub", method=RequestMethod.POST)
	//public String addClub(@ModelAttribute Club club, HttpSession httpSession, User user, ClubUser clubUser, @RequestParam("clubImage") List<MultipartFile> file) throws Exception {
	public String addClub(@ModelAttribute Club club, HttpSession httpSession, User user, ClubUser clubUser, @RequestParam("file") MultipartFile file) throws Exception {
		
		System.out.println("club/addClub : POST");
		
		user = (User) httpSession.getAttribute("user");
		
		String sysName = "_User_";
		
		Date dateNow = new Date(System.currentTimeMillis());
		
		System.out.println("세션에 뭐 있나? : " + user);
		
		club.setUser(user);
		club.setCurrentMember(1);
		club.setClubMaxMember(10);
		clubUser.setUser(user);
		clubUser.setMemberRole("2");
		clubUser.setApprovalCondition("2");
		clubUser.setJoinGreeting("모임대표의 가입인사");
		
		if (file != null && file.getSize() > 0) {
			
			file.transferTo( new File("C:\\Users\\903-19\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles\\", user.getUserId()+ sysName + dateNow + ("_") + file.getOriginalFilename() ) );
					club.setClubImage(user.getUserId() + sysName + dateNow + ("_") + file.getOriginalFilename());
		}
		
		clubService.addClub(club);
		clubService.addApprovalCondition(clubUser);
		return "forward:/club/getClub.jsp";
	}
	
	@RequestMapping(value="getClub", method=RequestMethod.POST)
	public String getClub(@ModelAttribute Club club, Model model) throws Exception {
		
		System.out.println("club/getClub : POST");
		
		clubService.addClub(club);
		
		return "forward:/club/getClub.jsp";
	}
	
	//getClub bak!
//	@RequestMapping(value="getClub", method=RequestMethod.GET)
//	public String getClub(@RequestParam("clubNo") String clubNo, Model model, HttpSession session) throws Exception {
//		
//		System.out.println("/club/getClub : GET");
//		
//		//Business Logic
//		Club club = clubService.getClub(Integer.parseInt(clubNo));
//		
//		//Model 과 View 연결
//		System.out.println("MODEL VIEW 연결 전");
//		
//		session.setAttribute("club", club);
//		session.setAttribute("clubNo", clubNo);
//		
//		System.out.println("클럽 세션에 뭐 들어갔지? : "+club);
//		System.out.println("클럽 넘버 세션은? : "+clubNo);
//		
//		return "forward:/club/getClub.jsp";
//		
//	}
	
	@RequestMapping(value="getClub", method=RequestMethod.GET)
	public String getClub(@RequestParam("clubNo") String clubNo, Model model, HttpSession session, Club clubS) throws Exception {
		
		System.out.println("/club/getClub : GET");
		
		//Business Logic
		Map<String, Object> map = clubService.getClub(Integer.parseInt(clubNo));
		
		//Model 과 View 연결
		System.out.println("MODEL VIEW 연결 전");
		
		model.addAttribute("club", map.get("club"));
		model.addAttribute("clubMemberCount", map.get("totalClubMemberCount"));
		session.setAttribute("clubNo", clubNo);
		
		System.out.println("클럽 맵에 뭐 들어갔지? : "+map.get("club"));

		System.out.println("클럽 넘버 세션은? : "+clubNo);
		
		return "forward:/club/getClub.jsp";
		
	}
	
	
	@RequestMapping(value="updateClub", method=RequestMethod.POST)
	public String updateClub(@ModelAttribute Club club, Model model, HttpSession session, User user,  @RequestParam("file") MultipartFile file, String clubNo)  throws Exception {
		
		System.out.println("club/updateClub : POST");
		
		user = (User) session.getAttribute("user");
		//Business Logic
		clubNo = (String) session.getAttribute("clubNo");
		
		Map<String, Object> map = clubService.getClub(Integer.parseInt(clubNo));
		
		System.out.println("유저 세션에 뭐? : "+user);
		System.out.println("클럽 넘버는? : "+club);
		
//		club.setUser(user);
		club.setClubNo(Integer.parseInt(clubNo));
		
		model.addAttribute("club", map.get("club"));
		System.out.println("클럽 맵에 뭐 있지? : "+ map.get("club"));
		
		String sysName = "_User_";
		
		Date dateNow = new Date(System.currentTimeMillis());		

		
		if (file != null && file.getSize() > 0) {
			
			file.transferTo( new File(clubUploadTempDir, user.getUserId()+ sysName + dateNow + ("_") + file.getOriginalFilename() ) );
			club.setClubImage(user.getUserId() + sysName + dateNow + ("_") + file.getOriginalFilename());
		}
		
		clubService.updateClub(club);
		
		return "forward:/club/getClubList";
	}
	
	@RequestMapping(value="deleteClub")
	public String deleteClub(@ModelAttribute Club club, Model model, HttpSession session, String clubNo) throws Exception {
		
		System.out.println("deleteClub 시작");
		
		club = (Club) session.getAttribute("club");
		
		clubNo = (String) session.getAttribute("clubNo");
		
		System.out.println("세션에 뭐 있지 : "+session.getAttribute("clubNo"));		
		
//		club.setClubNo(Integer.parseInt(clubNo));
		
		clubService.deleteClub(Integer.parseInt(clubNo));
		
		return "forward:/club/getClubList";
	}
	
	//clubList bak!
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
	
//	@RequestMapping(value="getClubList")
//	public String getClubList(@ModelAttribute("search") Search search, Model model) throws Exception {
//		
//		System.out.println("/club/getClubList : GET/POST");
//		
//		if(search.getCurrentPage()==0) {
//			search.setCurrentPage(1);
//		}
//		search.setPageSize(pageSize);
//		
//		Map<String, Object> map = clubService.getClubList(search);
//		
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalClubCount")).intValue(), pageUnit, pageSize);
//		
//		
//		System.out.println("resultPage : "+resultPage);
//		
//		model.addAttribute("clubList",map.get("clubList"));
//		model.addAttribute("resultPage", resultPage);
//		model.addAttribute("search",search);
//		
//		model.addAttribute("totalClubMemberCount",map.get("totalClubMemberCount"));
//		
//		return "forward:/club/getClubList.jsp";
//	}
	
	@RequestMapping(value="getApprovalConditionList")
	public String getMyClubList(@ModelAttribute("search") Search search, Model model, User user, HttpSession session, Club club, ClubUser clubUser) throws Exception {
		
		System.out.println("/club/getApprovalConditionList : GET/POST");
		
		user = (User) session.getAttribute("user");
//		club = (Club) session.getAttribute("club");
		
		session.getAttribute("clubNo");
//		clubUser.setClubNo(club.getClubNo());
		
		System.out.println("유저 세션에 뭐가 있나요 : "+user);
		System.out.println("클럽넘버는 왔나요 : "+session.getAttribute("clubNo"));
		
		search.setSearchKeyword(user.getUserId());
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
//		search.setPageUnit(pageUnit);
		
		Map<String, Object> map = clubService.getApprovalConditionList(search);
		
		System.out.println("서치에 뭐 들어있나요 ? ? : "+search);
		
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
	public String getClubMemberList(@ModelAttribute("search") Search search, Model model, HttpSession session, User user, ClubUser clubUser, Club club, String clubNo) throws Exception {
		
		System.out.println("/club/getClubMemberList : GET/POST");
		System.out.println("서치는? :"+search);
		
		clubNo = (String) session.getAttribute("clubNo");
		user = (User) session.getAttribute("user");
		
		search.setSearchKeyword(clubNo);
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		
		System.out.println(search);
		
		Map<String, Object> map = clubService.getClubMemberList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalClubMemberCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		
		System.out.println("유저 세션에 뭐 있지? : "+user);
		System.out.println("클럽 번호 왔나? : "+session.getAttribute("clubNo"));
		System.out.println("총 클럽원은? : "+map.get("totalClubMemberCount"));
		System.out.println("유저 닉네임 어케 가져오지 : "+user.getNickName());
		System.out.println("클럽 맵에 뭐 들어있지? :"+map.get("club"));
		System.out.println("클럽세션? : "+session.getAttribute("club"));

		model.addAttribute("club",map.get("club"));
		model.addAttribute("clubMemberList",map.get("clubMemberList"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("totalClubMemberCount",map.get("totalClubMemberCount"));
		//클럽최대인원 수 가져오는거 가능?
//		model.addAttribute("club",map.get("club"));
		model.addAttribute("search",search);
		

		return "forward:/club/getClubMemberList.jsp";
	}
	
	@RequestMapping(value="getMeetingMemberList")
	public String getMeetingMemberList(@ModelAttribute("search") Search search, Model model, HttpSession session, User user, Participant participant) throws Exception {
		
		System.out.println("/club/getMeetingMemberList : GET/POST");
		
		user = (User) session.getAttribute("user");
		System.out.println("(일정참여자)미팅넘버 세션에 뭐 있지? : "+ session.getAttribute("meetingNo"));
				
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		search.setPageUnit(pageUnit);
		search.setSearchKeyword((String) session.getAttribute("meetingNo"));
		
		Map<String, Object>  map = clubService.getMeetingMemberList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalMeetingMemberCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		
		
		model.addAttribute("meetingMemberList", map.get("meetingMemberList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/club/getMeetingMemberList.jsp";
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public String addMeeting(@ModelAttribute Meeting meeting, Model model, HttpSession session, String clubNo, User user, Club club, Participant participant, String meetingNo) throws Exception {
		
		System.out.println("club/addMeeting : POST ");
		
		user = (User) session.getAttribute("user");
		club = (Club) session.getAttribute("club");
		clubNo = (String) session.getAttribute("clubNo");
		meetingNo = (String) session.getAttribute("meetingNo");
		
		System.out.println("유저 세션에 뭐있나? : "+user);
		System.out.println("클럽넘버는 잘 왔나? : "+clubNo);
		System.out.println("미팅세션은 ? : "+meetingNo);

		meeting.setUser(user);
		meeting.setClubNo(Integer.parseInt(clubNo));
		meeting.setMeetingMember(1);
		meeting.setMeetingWeather("테스트 날씨");
		
//		participant.setUser(user);
//		participant.setMeetingNo((int) session.getAttribute("meetingNo"));
		clubService.addMeeting(meeting);
//		clubService.addMeetingMember(participant);
		return "forward:/club/getMeetingList";
		
	}
	
	@RequestMapping(value="addMeetingMember", method=RequestMethod.POST)
	public String addMeetingMember(@ModelAttribute Participant participant, HttpSession session, User user, String meetingNo) throws Exception {
		
		System.out.println("/club/addMeetingMember : POST ");
		
		user = (User) session.getAttribute("user");
		meetingNo = (String) session.getAttribute("meetingNo");
		
		System.out.println("유저 세션에 뭐있지 : "+user);
		System.out.println("미팅넘버 왔나? : "+session.getAttribute("meetingNo"));
		


		participant.setUser(user);
		participant.setMeetingNo(Integer.parseInt(meetingNo));
		
		clubService.addMeetingMember(participant);
		
		return "forward:/club/getMeetingMemberList";
	}
	
	
	@RequestMapping(value="getMeetingList")
	public String getMeetingList(@ModelAttribute("search") Search search, Model model, HttpSession session, Club club, User user) throws Exception {
		
		System.out.println("/club/getMeetingList : GET/POST");
		
		user = (User) session.getAttribute("user");
		
		session.getAttribute("clubNo");
		System.out.println("세션에 뭐가 있나요 ?? : "+ session.getAttribute("clubNo"));
		
		
		
		search.setSearchKeyword((String) session.getAttribute("clubNo"));
//		search.setSearchKeyword(user.getUserId());
		search.setSearchCondition("0");
		
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
		
		return "forward:/club/getMeetingList.jsp";
		
	}
	
	@RequestMapping(value="getMeeting", method = RequestMethod.POST)
	public String getMeeting(@ModelAttribute Meeting meeting) throws Exception {
		
		System.out.println("club/getMeeting : POST ");
		
		clubService.addMeeting(meeting);
		
		return "forward:/club/getMeeting.jsp";
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public String getMeeting(@RequestParam("meetingNo") String meetingNo, Model model, HttpSession session) throws Exception {
	
		System.out.println("/club/getMeeting : GET");
		
		
		//Business Logic
		Map<String, Object> map = clubService.getMeeting(Integer.parseInt(meetingNo));
		// 미팅정보 : meeting, 미팅의 총 참여자 수 : totalMeetingMemberCount
		
		//Model 과 View 연결
		System.out.println("MODEL VIEW 연결 전 ");
		
		model.addAttribute("meeting", map.get("meeting"));
		model.addAttribute("meetingCount", map.get("totalMeetingMemberCount"));
		session.setAttribute("meetingNo", meetingNo);
		
		System.out.println("모델과 뷰 연결 되었나? " + map.get("meeting"));
		System.out.println("겟에서 세션에 들어갔나? :"+meetingNo);
		return "forward:/club/getMeeting.jsp";
	}
	
	@RequestMapping(value="updateMeeting", method=RequestMethod.POST)
	public String updateMeeting(@ModelAttribute Meeting meeting, Model model, HttpSession session, String clubNo, User user, Club club, String meetingNo) throws Exception {
		
		System.out.println("club/updateMeeting : POST");
		
		user = (User) session.getAttribute("user");
		clubNo = (String) session.getAttribute("clubNo");
		meetingNo = (String) session.getAttribute("meetingNo");
		
		System.out.println("유저 세션 잘 왔나? : "+user);
		System.out.println("클럽넘버 왔나? : "+clubNo);
		
		meeting.setMeetingNo(Integer.parseInt(meetingNo));
		meeting.setUser(user);
		meeting.setClubNo(Integer.parseInt(clubNo));
		meeting.setMeetingMember(1);
		meeting.setMeetingWeather("수정 테스트 날씨");
		
		//Business Logic
		clubService.updateMeeting(meeting);
		
		return "forward:/club/getMeeting.jsp";
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
