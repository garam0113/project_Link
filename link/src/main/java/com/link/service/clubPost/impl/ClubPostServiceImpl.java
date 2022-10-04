package com.link.service.clubPost.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.service.clubPost.ClubPostDAO;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
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
	public ClubPost addClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".addClubPost(ClubPost clubPost) 도착");
		return clubPostDAOImpl.addClubPost(clubPost);
	}// end of addClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getCurrentClubPostList(String userId) throws Exception {
		System.out.println(getClass() + ".getCurrentClubPostList(String userId) 도착");
		return clubPostDAOImpl.getCurrentClubPostList(userId);
	}// end of getClubPostList(String userId)

	@Override
	public Map<String, Object> getClubPostList(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".getClubPostList(ClubPost clubPost) 도착");
		return clubPostDAOImpl.getClubPostList(clubPost);
	}// end of getClubPostList(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostListLike(int clubNo) throws Exception {
		System.out.println(getClass() + ".getClubPostListLike(int clubNo) 도착");
		return clubPostDAOImpl.getClubPostListLike(clubNo);
	}// end of getClubPostListLike(int clubNo)

	@Override
	public Map<String, Object> getClubPostListMySelf(String userId, int clubNo) throws Exception {
		System.out.println(getClass() + ".getClubPostListMySelf(String userId, int clubNo) 도착");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("clubNo", clubNo);
		return clubPostDAOImpl.getClubPostListMySelf(map);
	}// end of getClubPostListMySelf(String userId, int clubNo)

	@Override
	public Map<String, Object> getClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".getClubPost(ClubPost clubPost) 도착");
		return clubPostDAOImpl.getClubPost(clubPost);
	}// end of getClubPost(ClubPost clubPost)

	@Override
	public List<Comment> getClubPostCommentList(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostCommentList(Comment comment) 도착");
		return clubPostDAOImpl.getClubPostCommentList(comment);
	}// end of getClubPostCommentList(Comment comment)

	@Override
	public Map<String, Object> updateClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".updateClubPost(ClubPost clubPost) 도착");
		return clubPostDAOImpl.updateClubPost(clubPost);
	}// end of updateClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> deleteClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(ClubPost clubPost) 도착");
		return clubPostDAOImpl.deleteClubPost(clubPost);
	}// end of deleteClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 도착");
		return clubPostDAOImpl.getClubPostListMyHome(userId);
	}// end of getClubPostListMyHome(String userId)

	@Override
	public int updateClubPostLike(ClubPost clubPost, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostLike(Heart heart) 도착");
		heart.setUserId(clubPost.getUser().getUserId());
		return clubPostDAOImpl.updateClubPostLike(clubPost, heart);
	}// end of updateClubPostLike(Heart heart)

	@Override
	public Comment addClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".addClubPostComment(Comment comment) 도착");
		return clubPostDAOImpl.addClubPostComment(comment);
	}// end of addClubPostComment(Comment comment)

	@Override
	public Comment getClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostComment(Comment comment) 도착");
		return clubPostDAOImpl.getClubPostComment(comment);
	}// end of getClubPostComment(Comment comment)

	@Override
	public Comment updateClubPostComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateClubPostCommentLike(Comment comment, Heart heart) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
