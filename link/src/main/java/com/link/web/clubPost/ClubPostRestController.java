package com.link.web.clubPost;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
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
	
	@Value("#{commonProperties['clubPostUploadTemDir']}")
	String clubPostUploadTemDir;
	
	@Value("#{commonProperties['tempDir']}")
	String tempDir;

	
	
	

	
///////////////////////////////////////////////////////////////////////////////////// ClubPost /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	
	/*
	@RequestMapping(value = "json/getClubPostList", method = RequestMethod.GET)
	public Map<String, Object> getClubPostList(@RequestParam int order, @RequestParam int clubNo, ClubPost clubPost, Map<String, Object> map, HttpSession session, Search search) throws Exception {
		System.out.println("/getClubPostList : GET : 특정 모임에서 모임게시물 리스트, 개수");
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
	*/
	
	@RequestMapping(value = "json/getClubPostList", method = RequestMethod.POST)
	public Map<String, Object> getClubPostList(@RequestBody Search search, ClubPost clubPost, Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("/getClubPostList : POST : 페이징, 특정 모임에서 모임게시물 리스트, 개수");
		// search.order => 0 : 최신순, 1 : 역최신순, 2 : 좋아요 많은순, 3 : 내가 작성한 게시물

		System.out.println(search);
		System.out.println(clubPost);
		
		clubPost.setUser((User) session.getAttribute("user"));
		search.setPageSize(pageSize);
		clubPost.setClubNo(search.getPageUnit());
		map.put("search", search);
		//map.put("clubPost", clubPostServiceImpl.getClubPostList(ClubPostCommon.getSearch(search), clubPost));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		
		System.out.println("확인용 데이터 : " + map.get("clubPost"));
		
		return clubPostServiceImpl.getClubPostList(ClubPostCommon.getSearch(search), clubPost);
	}

	@RequestMapping(value = "json/updateClubPost", method = RequestMethod.POST)
	public ClubPost updateClubPost(@RequestBody ClubPost clubPost, Heart heart, Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("/updateClubPost : POST : 특정 모임게시물에 좋아요, 좋아요 수");
		
		
		
		System.out.println("모임번호 : " + clubPost.getClubNo() + ", 모임게시물번호 : " + clubPost.getClubPostNo());
		
		

		////////////////////////////////////// DATA /////////////////////////////////////////
		
		

		// 좋아요 등록/삭제 를 위해 userId가 필요하다
		heart.setUserId(((User)session.getAttribute("user")).getUserId());
		map.put("heart", heart);
		// 상세보기 가져올때 좋아요여부와 모임직책을 가져오기 위해 user.userId가 필요하다
		clubPost.setUser((User)session.getAttribute("user"));
		map.put("clubPost", clubPost);
		
		
		
		////////////////////////////////////// BUSINESS LOGIC /////////////////////////////////////////
		
		
		
		// ServiceImpl에서 좋아요인지 좋아요 취소인지 구분해 DAOImpl에 보낸준다
		return ((ClubPost)clubPostServiceImpl.updateClubPost(map).get("getClubPost"));
	}
	
	@RequestMapping(value="/json/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
		// 내부경로로 저장
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		//String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		//String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		String savedFileName = originalFileName;	//저장될 파일 명
		
		File targetFile = new File(tempDir + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/image/uploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject.toString();
	}





///////////////////////////////////////////////////////////////////////////////////// MyHome /////////////////////////////////////////////////////////////////////////////////////	
	
	
	
	

	@RequestMapping(value = "getClubPostListMyHome", method = RequestMethod.POST)
	public Map<String, Object> getClubPostListMyHome(HttpSession session) throws Exception {
		System.out.println("/getClubPostListMyHome : GET : 마이홈피로 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = ((User) session.getAttribute("user")).getUserId();
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
	public Comment addClubPostComment(@RequestBody Comment comment, HttpSession session) throws Exception {
		System.out.println("/addClubPostComment : POST : 모임게시물 댓글 등록, 모임게시물 작성자에게 알림, 해당 모임게시물 댓글 가져온다");
		
		
		
		System.out.println("모임게시물번호 : " + comment.getClubPostNo() + ", 댓글 내용 : " + comment.getCommentContent() + ", 댓글번호 : " + comment.getClubPostCommentNo() + ", 댓글깊이 : " + comment.getDepth());
		
		
		
		////////////////////////////////////// DATA /////////////////////////////////////////
		
		

		// 댓글 등록 하기위해 필요하다 user.userId
		comment.setUser((User) session.getAttribute("user"));
		
		
		
		////////////////////////////////////// BUSINESS LOGIC /////////////////////////////////////////
		
		
		
		return clubPostServiceImpl.addClubPostComment(comment);
	}
	
	@RequestMapping(value = "json/getClubPostCommentList", method = RequestMethod.POST)
	public List<Comment> getClubPostCommentList(@RequestBody Comment comment, Search search, Map<String, Object> map, HttpSession session) throws Exception {
		System.out.println("/getClubPostCommentList : POST : 특정 모임의 또는 특정 댓글의 댓글리스트");
		// search - currentPaget와 pageSize, comment - depth, clubPostCommentNo
		
		System.out.println("해당 댓글의 깊이 : " + comment.getDepth() + ", 해당 댓글의 번호 : " + comment.getClubPostCommentNo() + ", 해당 댓글의 게시물번호 : " + comment.getClubPostNo());
		

		
		////////////////////////////////////// DATA /////////////////////////////////////////
		
		
		
		// 해당 댓글에 좋아요 여부 확인위해서 필요하다
		comment.setUser((User)session.getAttribute("user"));
		map.put("comment", comment);
		map.put("search", ClubPostCommon.getSearch(search));
		
		
		
		////////////////////////////////////// BUSINESS LOGIC /////////////////////////////////////////

		
	
		System.out.println("search 처리 후 : " + map.get("search"));
		
		return clubPostServiceImpl.getClubPostCommentList(map);
	}
	
	@RequestMapping(value = "json/getClubPostComment", method = RequestMethod.POST)
	public Comment getClubPostComment(@RequestBody Comment comment) throws Exception {
		System.out.println("/getClubPostComment : POST : 모임게시물 댓글");
		return clubPostServiceImpl.getClubPostComment(comment);
	}
	
	@RequestMapping(value = "json/updateClubPostComment", method = RequestMethod.POST)
	public Comment updateClubPostComment(@RequestBody Comment comment, Heart heart, Report report, HttpSession session) throws Exception {
		System.out.println("/updateClubPostComment : POST : 모임게시물 댓글 수정, 해당 모임게시물 댓글 상세보기 가져온다");
		
		
		
		// heartCondition이 0이면 댓글 수정, 1이면 좋아요
		System.out.println("clubPostCommentNo : " + comment.getClubPostCommentNo() + ", heartCondition : " + comment.getHeartCondition());
		
		
		
		////////////////////////////////////// DATA /////////////////////////////////////////
		
		
		
		// 로그인한 회원의 좋아요 여부를 알기위해 필요하다
		comment.setUser((User)session.getAttribute("user"));
		
		
		
		////////////////////////////////////// BUSINESS LOGIC /////////////////////////////////////////
		
		// 좋아요 또는 좋아요 취소
		return clubPostServiceImpl.updateClubPostComment(comment, heart, report);
	}
	
	@RequestMapping(value = "json/deleteClubPostComment", method = RequestMethod.POST)
	public Map<String, Object> deleteClubPostComment(@RequestBody Comment comment, HttpSession session) throws Exception {
		System.out.println("/deleteClubPostComment : POST : 모임게시물 댓글 삭제, 해당 모임게시물 댓글 리스트 가져온다");
		
		
		
		// 댓글개수를 수정하기 위해 게시물번호 필요하다
		System.out.println("clubPostCommentNo : " + comment.getClubPostCommentNo() + ", clubPostNo : " + comment.getHeartCondition());
		
		
		
		////////////////////////////////////// DATA /////////////////////////////////////////
		
		
		
		// 삭제한 회원의 아이디를 delete_user_id에 입력하기위해 필요하다
		comment.setUser((User) session.getAttribute("user"));
		
		
		
		////////////////////////////////////// BUSINESS LOGIC /////////////////////////////////////////
		
		// 댓글 삭제
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




