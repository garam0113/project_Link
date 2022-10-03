package com.link.service.clubPost;

import java.util.List;
import java.util.Map;

import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;

public interface ClubPostService {

	// 모임게시물 등록
	public ClubPost addClubPost(ClubPost clubPost) throws Exception;
	
	// 모임게시물 탭 클릭시 => 최근 가입한 모임의 모임게시물리스트 가져온다
	public Map<String, Object> getCurrentClubPostList(String userId) throws Exception;
	
	// 모임게시물에서 최신순 클릭시 => 최신순 모임게시물 리스트
	public Map<String, Object> getClubPostList(int clubNo) throws Exception;
	
	// 모임리스트에서 좋아요많은순 클릭시 => 좋아요 많은순 모임게시물 리스트
	public Map<String, Object> getClubPostListLike(int clubNo) throws Exception;
	
	// 내가 작성한 모임게시물 리스트
	public Map<String, Object> getClubPostListMySelf(String userId, int clubNo) throws Exception;
	
	// 모임게시물 상세보기 + 모임게시물 댓글리스트
	public Map<String, Object> getClubPost(Comment comment) throws Exception;
	
	// 모임게시물 수정 후 모임게시물 상세보기
	public ClubPost updateClubPost(int clubPostNo) throws Exception;
	
	// 모임게시물 삭제 후 모임게시물 리스트
	public Map<String, Object> deleteClubPost(int clubPostNo) throws Exception;
	
	// 모임게시물 좋아요
	
	// 신고
	
	// 모임게시물 댓글 등록
	
	// 모임게시물 댓글 리스트
	public List<Comment> getClubPostCommentList(Comment comment) throws Exception;
	
	// 모임게시물 댓글 상세보기
	
	// 모임게시물 댓글 수정
	
	// 모잉게시물 댓글 삭제
	
	// 모임게시물 댓글 좋아요
	
	// 모임공지사항 등록
	
	// 모임공지사항 리스트
	
	// 모임공지사항 상세보기
	
	// 모임공지사항 수정
	
	// 모임공지사항 삭제
	
	// 마이홈피 - 내가 작성한 모임게시물 리스트
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception;

}
