package com.link.service.clubPost.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.service.clubPost.ClubPostDAO;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.ClubPost;

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
	public Map<String, Object> getClubPostListRecent(int clubNo) throws Exception {
		System.out.println(getClass() + ".getClubPostListRecent(int clubNo) 도착");
		return clubPostDAOImpl.getClubPostListRecent(clubNo);
	}// end of getClubPostListRecent(int clubNo)

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
	public Map<String, Object> getClubPost(int clubPostNo) throws Exception {
		System.out.println(getClass() + ".getClubPost(int clubPostNo) 도착");
		return clubPostDAOImpl.getClubPost(clubPostNo);
	}// end of getClubPost(int clubPostNo)

	@Override
	public Map<String, Object> getClubPostFull(int clubPostNo) throws Exception {
		System.out.println(getClass() + ".getClubPostFull(int clubPostNo) 도착");
		return clubPostDAOImpl.getClubPostFull(clubPostNo);
	}// end of getClubPostFull(int clubPostNo)

	@Override
	public ClubPost updateClubPost(int clubPostNo) throws Exception {
		System.out.println(getClass() + ".updateClubPost(int clubPostNo) 도착");
		return clubPostDAOImpl.updateClubPost(clubPostNo);
	}// end of updateClubPost(int clubPostNo)

	@Override
	public Map<String, Object> deleteClubPost(int clubPostNo) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(int clubPostNo) 도착");
		return clubPostDAOImpl.deleteClubPost(clubPostNo);
	}// end of deleteClubPost(int clubPostNo)

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 도착");
		return clubPostDAOImpl.getClubPostListMyHome(userId);
	}// end of getClubPostListMyHome(String userId)

}
