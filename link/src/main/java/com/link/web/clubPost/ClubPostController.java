package com.link.web.clubPost;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@RequestMapping(value = "addClubPostView", method = RequestMethod.GET)
	public String addClubPostView() throws Exception {
		System.out.println("/addClubPostView : POST");
		return "redirect:/clubPost/addClubPostView.jsp";
	}

	@RequestMapping(value = "addClubPost", method = RequestMethod.POST)
	public String addClubPost(@ModelAttribute ClubPost clubPost) throws Exception {
		System.out.println("/addClubPost : POST");
		clubPostServiceImpl.addClubPost(clubPost);
		return "redirect:/clubPost/getClubPost.jsp";
	}

}
