package com.link.service.clubPost;

import java.util.Map;

import com.link.service.domain.ClubPost;

public interface ClubPostDAO {

	// 모임게시물 등록
	public ClubPost addClubPost(ClubPost clubPost) throws Exception;
	
	// 모임게시물 탭 클릭시 => 최근 가입한 모임의 모임게시물리스트 가져온다
	public Map<String, Object> getCurrentClubPostList(String userId) throws Exception;
	
	// 모임게시물에서 최신순 클릭시 => 최신순 모임게시물 리스트
	public Map<String, Object> getClubPostListRecent(int clubNo) throws Exception;
	
	// 내가 작성한 모임게시물 리스트
	public Map<String, Object> getClubPostListMySelf(Map<String, Object> map) throws Exception;
	
	// 마이홈피 - 내가 작성한 모임게시물 리스트
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception;

}
