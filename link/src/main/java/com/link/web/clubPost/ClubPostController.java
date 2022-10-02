package com.link.web.clubPost;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;

@Controller
@RequestMapping("/clubPost/*")
public class ClubPostController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;
	
	public ClubPostController() {
		System.out.println(getClass() + " default 생성자 호출");
	}

	@RequestMapping(value = "getCurrentClubPostList", method = RequestMethod.GET)
	public String getCurrentClubPostList(Model model, HttpSession session) throws Exception {
		System.out.println("/getCurrentClubPostList : GET : 최근 가입한 모임게시물 리스트, 모임게시물 리스트 개수 가져온 후 모임게시물 리스트 화면으로 이동");
		//String userId = ((User)session.getAttribute("user")).getUserid();
		String userId = "user02";
		model.addAttribute("map", clubPostServiceImpl.getCurrentClubPostList(userId));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return "forward:/clubPost/getClubPostList.jsp";
	}

	@RequestMapping(value = "addClubPostView", method = RequestMethod.GET)
	public String addClubPostView() throws Exception {
		System.out.println("/addClubPostView : GET : 모임게시물 등록 화면으로 이동");
		return "redirect:/clubPost/addClubPostView.jsp";
	}

	@RequestMapping(value = "addClubPost", method = RequestMethod.POST)
	public String addClubPost(@ModelAttribute ClubPost clubPost) throws Exception {
		System.out.println("/addClubPost : POST : 모임게시물 등록, 모임원에게 알림, 모임게시물상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		clubPostServiceImpl.addClubPost(clubPost);
		//clubPostServiceImpl.getClubPost();
		return "forward:/clubPost/getClubPost.jsp";
	}

	/*
	@RequestMapping(value = "updateClubPostView", method = RequestMethod.GET)
	public String updateClubPostView() throws Exception {
		System.out.println("/updateClubPostView : GET : 모임게시물 상세보기 가져온 후 모임게시물 수정 화면으로 이동");
		clubPostServiceImpl.getClubPost(clubNo);
		return "forward:/clubPost/updateClubPostView.jsp";
	}
	
	@RequestMapping(value = "updateClubPost", method = RequestMethod.POST)
	public String updateClubPost(@ModelAttribute ClubPost clubPost) throws Exception {
		System.out.println("/updateClubPost : POST : 모임게시물 수정, 수정된 모임게시물 상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		clubPostServiceImpl.updateClubPost(clubPost);
		clubPostServiceImpl.getClubPost(clubPost);
		return "forward:/getClubPost.jsp";
	}
	
	@RequestMapping(value = "deleteClubPost", method = RequestMethod.POST)
	public String deleteClubPost(@RequestParam String clubPostNo) throws Exception {
		System.out.println("/deleteClubPost : POST : 모임게시물 삭제 flag 처리, 모임게시물 리스트 가져온 후 모임게시물 리스트 화면으로 이동");
		clubPostServiceImpl.updateClubPost(clubPost);
		clubPostServiceImpl.getClubPost(clubPost);
		return "forward:/getClubPostList.jsp";
	}
	*/

}
