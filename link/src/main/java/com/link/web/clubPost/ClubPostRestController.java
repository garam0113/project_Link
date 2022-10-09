package com.link.web.clubPost;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Report;
import com.link.service.domain.User;
import com.link.service.serviceCenter.ServiceCenterService;

@RestController
@RequestMapping("/clubPostRest/*")
public class ClubPostRestController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;

	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;

	public ClubPostRestController() {
		System.out.println(getClass() + " default 생성자 호출");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// ClubPost /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "json/getClubPostList", method = RequestMethod.GET)
	public Map<String, Object> getClubPostList(@RequestParam int order, @RequestParam int clubNo, ClubPost clubPost, Map<String, Object> map, HttpSession session, Search search) throws Exception {
		System.out.println("/getClubPostList : POST : 특정 모임에서 모임게시물 리스트, 개수");
		// search.order => 0 : 최신순, 1 : 역최신순, 2 : 좋아요 많은순, 3 : 내가 작성한 게시물

		System.out.println(search);
		System.out.println(clubPost);
		
		//clubPost.setUser((User) session.getAttribute("user"));
		clubPost.setUser(new User("user03"));	
		map.put("search", search);
		map.put("clubPost", clubPostServiceImpl.getClubPostList(ClubPostCommon.getSearch(search), clubPost));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount	
		
		return map;
	}

	@RequestMapping(value = "json/updateClubPost", method = RequestMethod.POST)
	public int updateClubPost(@RequestBody ClubPost clubPost, Heart heart, Map<String, Object> map) throws Exception {
		System.out.println("/updateClubPost : POST : 특정 모임게시물에 좋아요, 좋아요 수");
		
		System.out.println("clubPost : " + clubPost);
		System.out.println("heart : " + heart);
		
		map.put("clubPost", clubPost);
		map.put("heart", heart);
		map = clubPostServiceImpl.updateClubPost(map);
		System.out.println("확인용 데이터 : " + map.get("getClubPost"));
		return ((ClubPost)map.get("getClubPost")).getClubPostHeartCount();
	}
	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// MyHome /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	

	@RequestMapping(value = "getClubPostListMyHome", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListMyHome() throws Exception {
		System.out.println("/getClubPostListMyHome : GET : 마이홈피로 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = "user03";
		return clubPostServiceImpl.getClubPostListMyHome(userId);
	}
	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// Report /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "json/addReport", method = RequestMethod.POST)
	public void addReport(@RequestBody Report report) throws Exception {
		System.out.println("/addReport : POST : 모임게시물 또는 모임게시물 댓글을 신고, 작성자 이외에 가능, 신고되었다 아직 신고승인 전");
		serviceCenterService.addReport(report);
	}
	
	@RequestMapping(value = "json/addReportConfirm", method = RequestMethod.POST)
	public void addReportConfirm(@RequestBody Report report) throws Exception {
		System.out.println("/addReportConfirm : POST : 신고처리승인, 관리자만 가능");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("report", report);
		map.put("reportCondition", 1);
		clubPostServiceImpl.updateClubPost(map);
	}
	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// ClubPostComment /////////////////////////////////////////////////////////////////////////////////////
	
	
	
	
	@RequestMapping(value = "json/addClubPostComment", method = RequestMethod.POST)
	public Comment addClubPostComment(@RequestBody Comment comment) throws Exception {
		System.out.println("/addClubPostComment : POST : 모임게시물 댓글 등록, 모임게시물 작성자에게 알림, 해당 모임게시물 댓글 가져온다");
		return clubPostServiceImpl.addClubPostComment(comment);
	}
	
	@RequestMapping(value = "json/getClubPostCommentList", method = RequestMethod.POST)
	public List<Comment> getClubPostCommentList(@RequestBody Comment comment, Search search, Map<String, Object> map) throws Exception {
		System.out.println("/getClubPostCommentList : GET : 특정 모임의 또는 특정 댓글의 댓글리스트");
		// search - currentPaget와 pageSize, comment - depth, clubPostCommentNo
		
		System.out.println("comment : " + comment);
		System.out.println("search : " + search);

		map.put("comment", comment);
		map.put("search", ClubPostCommon.getSearch(search));
		return clubPostServiceImpl.getClubPostCommentList(map);
	}
	
	@RequestMapping(value = "json/getClubPostComment", method = RequestMethod.POST)
	public Comment getClubPostComment(@RequestBody Comment comment) throws Exception {
		System.out.println("/getClubPostComment : POST : 모임게시물 댓글");
		return clubPostServiceImpl.getClubPostComment(comment);
	}
	
	@RequestMapping(value = "json/updateClubPostComment", method = RequestMethod.POST)
	public Comment updateClubPostComment(@RequestBody Comment comment, Heart heart) throws Exception {
		System.out.println("/updateClubPostComment : POST : 모임게시물 댓글 수정, 해당 모임게시물 댓글 상세보기 가져온다");
		return (Comment)clubPostServiceImpl.updateClubPostComment(comment, heart);
	}
	
	@RequestMapping(value = "json/deleteClubPostComment", method = RequestMethod.POST)
	public Map<String, Object> deleteClubPostComment(@RequestBody Comment comment) throws Exception {
		System.out.println("/deleteClubPostComment : POST : 모임게시물 댓글 삭제, 해당 모임게시물 댓글 리스트 가져온다");
		return clubPostServiceImpl.deleteClubPostComment(comment);
	}
	
	/*
	@RequestMapping(value = "updateClubPostCommentHeart", method = RequestMethod.POST)
	public int updateClubPostCommentHeart(@ModelAttribute Comment comment, Heart heart) throws Exception {
		System.out.println("/updateClubPostCommentHeart : POST : 모임게시물 댓글 좋아요하다/좋아요 취소하다");
		return clubPostServiceImpl.updateClubPostCommentHeart(comment, heart);
	}
	*/
	

	
///////////////////////////////////////////////////////////////////////////////////// Notice /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	@RequestMapping(value = "getClubNotice", method = RequestMethod.POST)
	public Notice getClubNotice(@RequestBody Notice notice) throws Exception {
		System.out.println("/getClubNotice : POST : 모임공지사항 상세보기");
		return clubPostServiceImpl.getClubNotice(notice);
	}

	@RequestMapping(value = "deleteClubNotice", method = RequestMethod.POST)
	public Map<String, Object> deleteClubNotice(@RequestBody Search search, Notice notice) throws Exception {
		System.out.println("/deleteClubNotice : POST : 모임공지사항 삭제, 모임공지사항 리스트");
		// 모임공지사항 리스트 : getClubNoticeList, 모임공지사항 리스트 개수 : getClubNoticeListCount
		return clubPostServiceImpl.deleteClubNotice(search, notice);
	}

}




