package com.link.web.clubPost;

import java.util.Iterator;
import java.util.Map;

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

import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;
import com.link.service.domain.User;
import com.link.service.user.UserService;

@Controller
@RequestMapping("/clubPost/*")
public class ClubPostController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;

	@Autowired
	@Qualifier("clubServiceImpl")
	ClubService clubServiceImpl;

	@Autowired
	@Qualifier("userServiceImpl")
	UserService userServiceImpl;
	
	public ClubPostController() {
		System.out.println(getClass() + " default 생성자 호출");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['clubPostUploadTemDir']}")
	String clubPostUploadTemDir;

	

	
///////////////////////////////////////////////////////////////////////////////////// ClubPost /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "getClubPostList")
	public String getClubPostList(Search search, ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/getClubPostList : GET,POST : 모임 상세보기에서 모임게시물 탭 클릭시 session에 있는 모임번호로 해당 모임의 모임게시물리스트, 모임게시물 리스트 개수 가져온 후 모임게시물 리스트 화면으로 이동");
		// question : clubNo와 order가 잘 들어온다 왜? RequestParam도 들어오고 Search, ClubPost에도 들어오나?
		// 모임 상세보기에서 모임게시물 탭 클릭시 session에 있는 모임번호로 해당 모임의 모임게시물리스트 가져온다

		// session으로 로그인한 회원 정보를 가져온다
		clubPost.setUser(new User(((User)session.getAttribute("user")).getUserId()));
		
		// Club 상세보기에서 모임번호를 session으로 가져온다
		clubPost.setClubNo(Integer.parseInt((String)session.getAttribute("clubNo")));
		search = ClubPostCommon.getSearch(search);
		
		Map<String, Object> map = clubPostServiceImpl.getClubPostList(search, clubPost);
		model.addAttribute("search", search);
		model.addAttribute("clubPostList", map.get("clubPostList"));
		model.addAttribute("heartList", map.get("heartList"));
		model.addAttribute("clubPostListCount", map.get("clubPostListCount"));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		//return "forward:/clubPost/getClubPostList_backup.jsp";
		return "forward:/clubPost/getClubPostList.jsp";
	}

	@RequestMapping(value = "addClubPostView", method = RequestMethod.GET)
	public String addClubPostView(@RequestParam int clubNo, Model model) throws Exception {
		System.out.println("/addClubPostView : GET : 모임번호 갖고 모임게시물 등록 화면으로 이동");
		model.addAttribute("clubNo", clubNo);
		return "forward:/clubPost/addClubPostView.jsp";
	}
	
	/*
	@RequestMapping(value = "addClubPost", method = RequestMethod.POST)
	public String addClubPost(@RequestParam("imageName") List<MultipartFile> imageMultiFile, @RequestParam("videoName") List<MultipartFile> videoMultiFile, @ModelAttribute ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/addClubPost : POST : 모임게시물 등록, 모임원에게 알림, 모임게시물상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		// session으로 로그인한 회원 정보를 가져온다
		clubPost.setUser(new User(((User)session.getAttribute("user")).getUserId()));
		
		System.err.println(imageMultiFile.size());
		System.err.println(videoMultiFile.size());
		
		for (int i = 0; i < imageMultiFile.size(); i++) {
			imageMultiFile.get(i).transferTo(new File(clubPostUploadTemDir, imageMultiFile.get(i).getOriginalFilename()));
		}
		for (int i = 0; i < videoMultiFile.size(); i++) {
			videoMultiFile.get(i).transferTo(new File(clubPostUploadTemDir, videoMultiFile.get(i).getOriginalFilename()));
		}
		
		int j = 0;
		int k = 0;
		clubPost = new ClubPost(clubPost.getClubNo(), clubPost.getUser(), clubPost.getClubPostTitle(), clubPost.getClubPostContent(),
				videoMultiFile.get(k++).getOriginalFilename(), videoMultiFile.get(k++).getOriginalFilename(),
				videoMultiFile.get(k).getOriginalFilename(), imageMultiFile.get(j++).getOriginalFilename(),
				imageMultiFile.get(j++).getOriginalFilename(), imageMultiFile.get(j++).getOriginalFilename(),
				imageMultiFile.get(j++).getOriginalFilename(), imageMultiFile.get(j++).getOriginalFilename(),
				imageMultiFile.get(j++).getOriginalFilename(), imageMultiFile.get(j++).getOriginalFilename(),
				imageMultiFile.get(j++).getOriginalFilename(), imageMultiFile.get(j++).getOriginalFilename(),
				imageMultiFile.get(j).getOriginalFilename());
		System.out.println("파일 확인용 : " + clubPost);
		
		model.addAttribute("clubPost", clubPostServiceImpl.addClubPost(clubPost));
		return "forward:/clubPost/getClubPost.jsp";
	}
	*/

	@RequestMapping(value = "addClubPost", method = RequestMethod.POST)
	public String addClubPost(@ModelAttribute ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/addClubPost : POST : 모임게시물 등록, 모임원에게 알림, 모임게시물상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		// session으로 로그인한 회원 정보를 가져온다
		clubPost.setUser(new User(((User)session.getAttribute("user")).getUserId()));

		System.out.println("확인용 : " + clubPost);		
		/*
		// 파일명.확장자만 DB에 넣기위해 빼내자
		String specificString = "/resources/image/temp/";
		String content = clubPost.getClubPostContent();
		int count = 1;
		//while(true) {
			int isIndex = 0;
			// 이미지가 있다면 수행해서 다음 Image 필드에 파일명을 넣어준다
			while(true) {
				isIndex = content.indexOf(specificString);
				if(isIndex == -1) {
					break;
				}
				int startIndex = content.indexOf(specificString)+specificString.length();
				int endIndexFromStartIndex = content.substring(startIndex).indexOf("\"");
				// 파일명.확장자
				String str = content.substring(startIndex).substring(0, endIndexFromStartIndex);
				switch (count) {
				case 1: clubPost.setImage1(str); break;
				case 2: clubPost.setImage2(str);break;
				case 3: clubPost.setImage3(str);break;
				case 4: clubPost.setImage4(str);break;
				case 5: clubPost.setImage5(str);break;
				case 6: clubPost.setImage6(str);break;
				case 7: clubPost.setImage7(str);break;
				case 8: clubPost.setImage8(str);break;
				case 9: clubPost.setImage9(str);break;
				case 10: clubPost.setImage10(str);break;
				}
				System.out.println(count + "번째");
				count++;
				// 기존 문자열에서 startIndex부터 찾는다는 것은 다음 이미지를 찾을 수 있다
				System.out.println(content = content.substring(startIndex));
				System.out.println(clubPost);
			}//else {
				// 이미지 경로가 없다면 더이상 이미지가 없다는 것 while 나간다
				//break;
			//}
		//}//end of while
		*/
			
		model.addAttribute("clubPost", clubPostServiceImpl.addClubPost(clubPost));
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "getClubPost", method = RequestMethod.GET)
	public String getClubPost(@ModelAttribute ClubPost clubPost, Comment comment, Search search, Map<String, Object> map, Model model, HttpSession session) throws Exception {
		System.out.println("/getClubPost : GET : 모임게시물 상세보기, 모임게시물 댓글 리스트 가져온 후 모임게시물 상세보기 화면 또는 수정 화면으로 이동");
		
		// search가 없으면 상세보기를 가져오고 있으면 상세보기 + 댓글리스트를 가져온다
		map.put("search", ClubPostCommon.getSearch(search));
		map.put("clubPost", clubPost);
		map.put("comment", comment);
		
		model.addAttribute("clubPost", clubPostServiceImpl.getClubPost(map));
		// 모임게시물 상세보기 : getClubPost, 모임게시물 댓글 리스트 : getClubPostCommentList
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "updateClubPostView", method = RequestMethod.POST)
	public String updateClubPostView(@ModelAttribute ClubPost clubPost, Model model, Map<String, Object> map) throws Exception {
		System.out.println("/updateClubPostView : POST : 모임게시물 상세보기 가져온 후 모임게시물 수정 화면으로 이동");
		map.put("clubPost", clubPost);
		model.addAttribute("clubPost", clubPostServiceImpl.getClubPost(map));
		return "forward:/clubPost/updateClubPostView.jsp";
	}

	@RequestMapping(value = "updateClubPost")
	public String updateClubPost(@ModelAttribute ClubPost clubPost, Model model, Heart heart, Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("/updateClubPost : POST : 모임게시물 수정, 수정된 모임게시물 상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		map.put("clubPost", clubPost);
		model.addAttribute("clubPost", clubPostServiceImpl.updateClubPost(map));
		return "forward:/clubPost/getClubPost.jsp";
	}

	@RequestMapping(value = "deleteClubPost", method = RequestMethod.POST)
	public String deleteClubPost(@ModelAttribute ClubPost clubPost, Search search, Model model, HttpSession session) throws Exception {
		System.out.println("/deleteClubPost : POST : 모임게시물 삭제 flag 처리, 모임게시물 리스트 가져온 후 모임게시물 리스트 화면으로 이동");
		
		clubPost.setUser(new User(clubPost.getUserId()));
		model.addAttribute("clubPost", clubPostServiceImpl.deleteClubPost(clubPost, ClubPostCommon.getSearch(search)));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return "forward:/clubPost/getClubPostList.jsp";
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////// chat /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	@RequestMapping(value = "/chatRoomList", method = RequestMethod.GET)
	public String chatClubList(HttpSession session, Model model) throws Exception {
		System.out.println("/chatRoomList : GET : 모임번호를 가지고 모임채팅리스트 화면으로 이동");
		model.addAttribute("userId", ((User)session.getAttribute("user")).getUserId());
		//return "forward:/chat/chatRoomList.jsp";
		return "forward:/chat/index3.jsp";
	}
	
	@RequestMapping(value = "/chatRoom", method = RequestMethod.GET)
	public String chatRoom(HttpSession session, Model model) throws Exception {
		System.out.println("/chatRoom : GET : 모임번호를 가지고 모임채팅리스트 화면으로 이동");
		model.addAttribute("userId", ((User)session.getAttribute("user")).getUserId());
		return "forward:/chat/chatRoom.jsp";
	}
	
	
	

///////////////////////////////////////////////////////////////////////////////////// Pay /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	@RequestMapping(value = "addPayView", method = RequestMethod.GET)
	public String addPayView(@ModelAttribute Pay pay, Model model, HttpSession sesstion) throws Exception {
		System.out.println("/addPayView : GET : 모임번호를 가지고 결제화면으로 이동");

		int maxPay = 0;
		//pay.setPayNavigation(1);
		pay.setClubNo(0);
		System.out.println("모임번호 : " + pay.getClubNo() + ", 아이디 : " + ((User)sesstion.getAttribute("user")).getUserId());
		if( pay.getClubNo() != 0 ) {
			// 모임대표가 가입승인 클릭시
			// 해당 모임의 최대 인원수까지의 최대 결제금액을 가져간다
			Club returnClub = clubServiceImpl.getClub(pay.getClubNo());
			returnClub.setClubMaxMember(returnClub.getClubMaxMember());
			model.addAttribute("returnClub", returnClub);
			
			switch (returnClub.getClubMaxMember()) {
			case 10: maxPay = 20000; break;
			case 20: maxPay = 15000; break;
			case 30: maxPay = 10000; break;
			case 40: maxPay = 5000; break;
			}
		}else {
			// 모임등록시 모임가입신청시
			// 해당 회원의 최대 가입수까지의 최대 결제금액을 가져간다
			User returnUser = userServiceImpl.getUser((User)sesstion.getAttribute("user"));
			returnUser.setJoinClubLimit(returnUser.getJoinClubLimit());
			model.addAttribute("returnUser", returnUser);
			
			switch (returnUser.getJoinClubLimit()) {
			case 2: maxPay = 20000; break;
			case 4: maxPay = 15000; break;
			case 6: maxPay = 10000; break;
			case 8: maxPay = 5000; break;
			}
		}
		pay.setMaxPay(maxPay);
		model.addAttribute("pay", pay);
		return "forward:/clubPost/addPayView.jsp";
	}
	
	@RequestMapping(value = "addPay", method = RequestMethod.POST)
	public String addPay(@ModelAttribute Pay pay, Search search, Model model, HttpSession session) throws Exception {
		System.out.println("/addPay : POST : 모임원 최대 수 수정 후 모임원 리스트 화면으로 이동 모임대표만 올 수 있다, 모임번호가 있으면 모임 상세보기, 모임번호가 없으면 모임리스트 화면으로 이동");
		System.out.println(pay);
		pay.setUser(new User(((User)session.getAttribute("user")).getUserId()));
		//결제추가
		clubPostServiceImpl.addPay(pay);

		if(pay.getUpdateClubMemberCount() != 0) {
			// 모임원 업데이트 수가 있다면 모임대표가 가입승인 클릭 후 이벤트이다 결제 후 모임원리스트 화면으로 이동
			// 모임원 최대수 CLUB_MAX_MEMBER 증가
			model.addAttribute("clubMemberList", clubServiceImpl.updateClubMember(pay, ClubPostCommon.getSearch(search)));
			return "forward:/club/getClubMemberList.jsp";
		}else {
			// 모임 업데이트 수가 있다면 모임등록 또는 모임가입신청 클릭 후 이벤트이다 결제 후 모임번호가 있다면 모임상세보기 화면으로 모임번호가 없다면 모임리스트 화면으로 이동
			// 모임 최대수 JOIN_CLUB_LIMIT 증가
			userServiceImpl.updateClub(pay);
			
			if(pay.getPayNavigation() == 1) {
				// 모임상세보기
				model.addAttribute("getClub", clubServiceImpl.getClub(pay.getClubNo()));
				return "forward:/club/getClub.jsp";
			}else {
				// 모임리스트
				// getClubList.jsp 에서 에러난다
				model.addAttribute("clubList", clubServiceImpl.getClubList(ClubPostCommon.getSearch(search)));
				return "forward:/club/getClubList.jsp";
			}
		}
	}//end of addPay
	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// Notice /////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	
	@RequestMapping(value = "addClubNotice", method = RequestMethod.POST)
	public String addClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 등록, 등록한 모임공지사항 상세보기, 모임공지사항 리스트");
		return "forward:/clubPost/updateClubNoticeView.jsp";
	}
	
	@RequestMapping(value = "getClubNoticeList", method = RequestMethod.GET)
	public String getClubNoticeList(@ModelAttribute Search search, Notice notice, HttpSession session, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 리스트");
		
		model.addAttribute("map", clubPostServiceImpl.getClubNoticeList(ClubPostCommon.getSearch(search), notice, ((User)session.getAttribute("user")).getUserId()));
		// 모임 공지사항 리슽 : getClubNoticeList, 모임 공지사항 리스트 개수 : getClubNoticeListCount
		return "forward:/clubPost/getClubNoticeList.jsp";
	}
	
	@RequestMapping(value = "updateClubNoticeView", method = RequestMethod.POST)
	public String updateClubNoticeView(@ModelAttribute Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNoticeView : POST : 해당 모임공지사항 상세보기, 모임공지사항 수정화면으로 이동");
		model.addAttribute("getClubNotice", clubPostServiceImpl.getClubNotice(notice));
		return "forward:/clubPost/updateClubNoticeView.jsp";
	}
	
	@RequestMapping(value = "updateClubNotice", method = RequestMethod.POST)
	public String updateClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/updateClubNotice : POST : 모임공지사항 수정, 수정한 모임공지사항 상세보기, 모임공지사항 리스트, 수정한 모임공지사항 리스트 화면으로 이동");
		model.addAttribute("map", clubPostServiceImpl.updateClubNotice(search, notice));
		return "forward:/clubPost/getClubNoticeList.jsp";
	}

	@RequestMapping(value = "deleteClubNotice", method = RequestMethod.POST)
	public String deleteClubNotice(@ModelAttribute Search search, Notice notice, Model model) throws Exception {
		System.out.println("/deleteClubNotice : POST : 모임공지사항 삭제, 모임공지사항 리스트");
		// 모임공지사항 리스트 : getClubNoticeList, 모임공지사항 리스트 개수 : getClubNoticeListCount
		
		// 누가 삭제하는지 아이디를 가져오지 않는다
		
		model.addAttribute("map", clubPostServiceImpl.deleteClubNotice(search, notice));
		return "forward:/clubPost/getClubNoticeList.jsp";
	}

}




