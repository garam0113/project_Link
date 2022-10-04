package com.link.web.clubPost;

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

import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.User;

@Controller
@RequestMapping("/clubPost/*")
public class ClubPostController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;
	
	public ClubPostController() {
		System.out.println(getClass() + " default 생성자 호출");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "getCurrentClubPostList", method = RequestMethod.GET)
	public String getCurrentClubPostList(Model model, HttpSession session) throws Exception {
		System.out.println("/getCurrentClubPostList : GET : 최근 가입한 모임게시물 리스트, 모임게시물 리스트 개수 가져온 후 모임게시물 리스트 화면으로 이동");
		//String userId = ((User)session.getAttribute("user")).getUserid();
		String userId = "user03";
		model.addAttribute("map", clubPostServiceImpl.getCurrentClubPostList(userId));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
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
	public String addClubPost(@ModelAttribute ClubPost clubPost, Model model, HttpSession session) throws Exception {
		System.out.println("/addClubPost : POST : 모임게시물 등록, 모임원에게 알림, 모임게시물상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		//clubPost.setUser((User)session.getAttribute("user"));
		User user = new User();
		user.setUserId("user02");
		user.setNickName("user02nickName");
		clubPost.setUser(user);
		model.addAttribute("map", clubPostServiceImpl.addClubPost(clubPost));
		return "forward:/clubPost/getClubPost.jsp";
	}
	*/

	@RequestMapping(value = "getClubPost", method = RequestMethod.GET)
	public String getClubPost(@ModelAttribute Comment comment, Model model) throws Exception {
		System.out.println("/getClubPost : GET : 모임게시물 상세보기, 모임게시물 댓글 리스트 가져온 후 모임게시물 상세보기 화면 또는 수정 화면으로 이동");
		model.addAttribute("map", clubPostServiceImpl.getClubPost(comment));
		// 모임게시물 상세보기 : getClubPost, 모임게시물 댓글 리스트 : getClubPostCommentList
		return "forward:/clubPost/getClubPost.jsp";
	}

	/*
	@RequestMapping(value = "updateClubPostView", method = RequestMethod.POST)
	public String updateClubPostView() throws Exception {
		System.out.println("/updateClubPostView : GET : 모임게시물 상세보기 가져온 후 모임게시물 수정 화면으로 이동");
		clubPostServiceImpl.getClubPost(clubNo);
		return "forward:/clubPost/updateClubPostView.jsp";
	}

	@RequestMapping(value = "updateClubPost", method = RequestMethod.POST)
	public String updateClubPost(@ModelAttribute ClubPost clubPost) throws Exception {
		System.out.println("/updateClubPost : POST : 모임게시물 수정, 수정된 모임게시물 상세보기 가져온 후 모임게시물 상세보기 화면으로 이동");
		Map<String, Object> map = clubPostServiceImpl.updateClubPost(clubPost);
		return "forward:/getClubPost.jsp";
	}
	*/

	@RequestMapping(value = "deleteClubPost", method = RequestMethod.POST)
	public String deleteClubPost(@ModelAttribute ClubPost clubPost, Model model) throws Exception {
		System.out.println("/deleteClubPost : POST : 모임게시물 삭제 flag 처리, 모임게시물 리스트 가져온 후 모임게시물 리스트 화면으로 이동");
		clubPostServiceImpl.deleteClubPost(clubPost);
		model.addAttribute("map", clubPostServiceImpl.getClubPostList(clubPost));
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return "forward:/getClubPostList.jsp";
	}

}
