package com.link.service.clubPost.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostDAO;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;
import com.link.service.domain.User;

@Service("clubPostServiceImpl")
public class ClubPostServiceImpl implements ClubPostService {
	
	@Autowired
	@Qualifier("clubPostDAOImpl")
	ClubPostDAO clubPostDAOImpl;

	public ClubPostServiceImpl() {
		System.out.println(getClass() + " default 생성자 호출");
	}

	@Override
	public Map<String, Object> addClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".addClubPost(ClubPost clubPost) 도착");
		return clubPostDAOImpl.addClubPost(clubPost);
	}// end of addClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostList(Search search, ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".getClubPostList(Search search, ClubPost clubPost) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("clubPost", clubPost);
		return clubPostDAOImpl.getClubPostList(map);
	}// end of getClubPostList(Search search, ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPost(Map<String, Object> map) 도착");
		return clubPostDAOImpl.getClubPost(map);
	}// end of getClubPost(Map<String, Object> map)

	@Override
	public Map<String, Object> updateClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubPost(Map<String, Object> map) 도착");
		
		Heart heart = (Heart)map.get("heart");
		ClubPost clubPost = (ClubPost)map.get("clubPost");
		int i = 0;
		
		if(heart != null) {
			// heart가 null이 아니라며 즉, restController에서 왔다면 즉, 하트를 클릭했다면 수행
			
			heart.setSource("2");
			heart.setSourceNo(clubPost.getClubPostNo());

			// 해당 유저가 좋아요한 게시물인지 확인한다 리턴 1이면 좋아요했다 리턴 0이면 좋아요 안했다
			// i = 1이면 좋아요를 수행한다 i = -1이면 좋아요취소를 수행한다
			i = ((clubPostDAOImpl.getHeart(heart) == 0) ? 1: -1);
			// 좋아요를 수행하면 하트컨디션 = 1 좋아요취소를 수행하면 하트컨디션 = -1
			System.out.println("//////////////////" + i);
			((ClubPost)map.get("clubPost")).setHeartCondition(i);
			
			map.put("heart", heart);
			map.put("clubPost", clubPost);

			System.out.println("수정된 heart : " + map.get("heart") + "수정된 clubPost : " + map.get("clubPost"));
		}
		
		map = clubPostDAOImpl.updateClubPost(map);
		// 상세보기에서 하트컨디션이 1이면 빨간하트 -1이면 하얀하트를 보여준다
		((ClubPost)map.get("getClubPost")).setHeartCondition(i);
		
		return map;
	}// end of updateClubPost(Map<String, Object> map)

	@Override
	public Map<String, Object> deleteClubPost(ClubPost clubPost, Search search) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(ClubPost clubPost, Search search) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPost", clubPost);
		map.put("search", search);
		return clubPostDAOImpl.deleteClubPost(map);
	}// end of deleteClubPost(ClubPost clubPost, Search search)

	@Override
	public int getCheckHeart(Heart heart) throws Exception {
		System.out.println(getClass() + ".getCheckHeart(Heart heart) 도착");
		return clubPostDAOImpl.getHeart(heart);
	}

	/*
	@Override
	public int updateClubPostLike(ClubPost clubPost, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostLike(Heart heart) 도착");
		heart.setUserId(clubPost.getUser().getUserId());
		return clubPostDAOImpl.updateClubPostLike(clubPost, heart);
	}// end of updateClubPostLike(Heart heart)
	*/
	
	
	
	
	
	


	

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 도착");
		return clubPostDAOImpl.getClubPostListMyHome(userId);
	}// end of getClubPostListMyHome(String userId)

	@Override
	public void addPay(Pay pay) throws Exception {
		System.out.println(getClass() + ".addPay(Pay pay) 도착");
		clubPostDAOImpl.addPay(pay);
	}// addPay(Pay pay)

	@Override
	public List<Pay> getPayList(User user) throws Exception {
		System.out.println(getClass() + ".getPayList(User user) 도착");
		return clubPostDAOImpl.getPayList(user);
	}// getPayList(User user)

	@Override
	public Pay getPay(Pay pay) throws Exception {
		System.out.println(getClass() + ".getPay(Pay pay) 도착");
		return clubPostDAOImpl.getPay(pay);
	}// getPay(Pay pay)
	
	
	
	
	
	
	
	

	@Override
	public Comment addClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".addClubPostComment(Comment comment) 도착");
		if(comment.getClubPostCommentNo() == 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("comment", comment);
			// 댓글번호가 없을 때
			List<Comment> c = (List<Comment>) clubPostDAOImpl.getClubPostCommentList(map);
			comment.setSequence(c.size());
			comment.setDepth(0);
			comment.setParent(comment.getClubPostNo());
		}else {
			// 댓글번호가 있을 때
			Comment c = clubPostDAOImpl.getClubPostComment(comment);
			comment.setSequence(c.getCommentCount());
			comment.setDepth(1);
			comment.setParent(comment.getClubPostCommentNo());
		}
		return clubPostDAOImpl.addClubPostComment(comment);
	}// end of addClubPostComment(Comment comment)

	@Override
	public List<Comment> getClubPostCommentList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostCommentList(Map<String, Object> map) 도착");
		return clubPostDAOImpl.getClubPostCommentList(map);
	}// end of getClubPostCommentList(Map<String, Object> map)

	@Override
	public Comment getClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostComment(Comment comment) 도착");
		return clubPostDAOImpl.getClubPostComment(comment);
	}// end of getClubPostComment(Comment comment)

	@Override
	public Comment updateClubPostComment(Comment comment, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostComment(Comment comment, Heart heart) 도착");
		
		System.out.println("댓글 정보 : " + comment);
		System.out.println("heart댓글 정보 : " + heart);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(comment.getHeartCondition() == 1) {
			// heart가 null이 아니라며 즉, 하트를 클릭했다면 수행
			
			heart.setUserId(comment.getUserId());
			heart.setSource("3");
			heart.setSourceNo(comment.getClubPostCommentNo());

			comment.setHeartCondition((clubPostDAOImpl.getHeart(heart) == 0) ? 1: -1);

			System.out.println("수정된 heart : " + heart + "수정된 comment : " + comment);
		}
		
		map.put("heart", heart);
		map.put("comment", comment);
		
		return clubPostDAOImpl.updateClubPostComment(map);
	}// end of updateClubPostComment(Comment comment, Heart heart)

	@Override
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".deleteClubPostComment(Comment comment) 도착");
		return clubPostDAOImpl.deleteClubPostComment(comment);
	}// end of deleteClubPostComment(Comment comment)

	/*
	@Override
	public int updateClubPostCommentHeart(Comment comment, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostCommentHeart(Comment comment) 도착");
		return clubPostDAOImpl.updateClubPostCommentHeart(comment, heart);
	}// end of updateClubPostCommentHeart(Comment comment)
	*/
	
	
	
	
	
	
	

	@Override
	public Map<String, Object> addClubNotice(Search search, Notice notice) throws Exception {
		System.out.println(getClass() + ".addClubNotice(Search search, Notice notice) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("notice", notice);
		return clubPostDAOImpl.addClubNotice(map);
	}// end of addClubNotice(Notice notice)

	@Override
	public Map<String, Object> getClubNoticeList(Search search, Notice notice, String userId) throws Exception {
		System.out.println(getClass() + ".getClubNoticeList(Search search, Notice notice, String userId) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("notice", notice);
		map.put("userId", userId);
		return clubPostDAOImpl.getClubNoticeList(map);
	}// getClubNoticeList(Search search, Notice notice)

	@Override
	public Notice getClubNotice(Notice notice) throws Exception {
		System.out.println(getClass() + ".getClubNotice(Notice notice) 도착");
		return clubPostDAOImpl.getClubNotice(notice);
	}// end of getClubNotice(Notice notice)

	@Override
	public Map<String, Object> updateClubNotice(Search search, Notice notice) throws Exception {
		System.out.println(getClass() + ".updateClubNotice(Search search, Notice notice) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("notice", notice);
		return clubPostDAOImpl.updateClubNotice(map);
	}// updateClubNotice(Search search, Notice notice)

	@Override
	public Map<String, Object> deleteClubNotice(Search search, Notice notice) throws Exception {
		System.out.println(getClass() + ".deleteClubNotice(Search search, Notice notice) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("notice", notice);
		return clubPostDAOImpl.deleteClubNotice(map);
	}// deleteClubNotice(Search search, Notice notice)
	
	

}
