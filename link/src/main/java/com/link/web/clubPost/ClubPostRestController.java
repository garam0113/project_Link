package com.link.web.clubPost;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Comment;

@RestController
@RequestMapping("/clubPostRest/*")
public class ClubPostRestController {

	@Autowired
	@Qualifier("clubPostServiceImpl")
	ClubPostService clubPostServiceImpl;

	public ClubPostRestController() {
		System.out.println(getClass() + " default 생성자 호출");
	}
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value = "getClubPostList", method = RequestMethod.GET)
	public Map<String, Object> getClubPostList(@RequestParam int clubNo) throws Exception {
		System.out.println("/getClubPostListRecent : GET : 특정 모임에서 최근순 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return clubPostServiceImpl.getClubPostList(clubNo);
	}

	@RequestMapping(value = "getClubPostListLike", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListLike(@RequestParam int clubNo) throws Exception {
		System.out.println("/getClubPostListLike : GET : 특정 모임에서 좋아요 많은순 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		return clubPostServiceImpl.getClubPostListLike(clubNo);
	}

	@RequestMapping(value = "getClubPostListMySelf", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListMySelf(@RequestParam int clubNo) throws Exception {
		System.out.println("/getClubPostListMySelf : GET : 특정 모임에서 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = "user02";
		return clubPostServiceImpl.getClubPostListMySelf(userId, clubNo);
	}
	
	@RequestMapping(value = "getClubPostCommentList", method = RequestMethod.GET)
	public List<Comment> getClubPostCommentList(@ModelAttribute Comment comment) throws Exception {
		System.out.println("/getClubPostCommentList : GET : 특정 모임의 또는 특정 댓글의 댓글리스트");
		return clubPostServiceImpl.getClubPostCommentList(comment);
	}

	@RequestMapping(value = "getClubPostListMyHome", method = RequestMethod.GET)
	public Map<String, Object> getClubPostListMyHome() throws Exception {
		System.out.println("/getClubPostListMyHome : GET : 마이홈피로 내가 작성한 모임게시물 리스트, 모임게시물 리스트 개수");
		// 모임게시물 리스트 : clubPostList, 모임게시물 리스트 개수 : clubPostListCount
		String userId = "user03";
		return clubPostServiceImpl.getClubPostListMyHome(userId);
	}

}
