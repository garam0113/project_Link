package com.link.web.clubPost;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.clubPost.ClubPostService;

@RestController
@RequestMapping("/clubPostRest/*")
public class ClubPostRestController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;

	public ClubPostRestController() {
		System.out.println(getClass() + " default 생성자 호출");
	}

	@RequestMapping(value = "getClubPostListRecent", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListRecent(@RequestParam int clubNo) throws Exception {
		System.out.println("/getClubPostListRecent : GET : 특정 모임에서 최근순 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return clubPostServiceImpl.getClubPostListRecent(clubNo);
	}

	@RequestMapping(value = "getClubPostListMySelf", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListMySelf(@RequestParam int clubNo) throws Exception {
		System.out.println("/getClubPostListMySelf : GET : 특정 모임에서 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = "user02";
		return clubPostServiceImpl.getClubPostListMySelf(userId, clubNo);
	}

	@RequestMapping(value = "getClubPostListMyHome", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListMyHome() throws Exception {
		System.out.println("/getClubPostListMyHome : GET : 마이홈피로 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = "user02";
		return clubPostServiceImpl.getClubPostListMyHome(userId);
	}

}
