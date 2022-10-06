package com.link.service.clubPost;

import java.util.List;
import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.ClubPost;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;

public interface ClubPostService {

	// 모임게시물 등록
	public ClubPost addClubPost(ClubPost clubPost) throws Exception;
	
	// 모임게시물 리스트, 개수
	public Map<String, Object> getClubPostList(Search search, ClubPost clubPost) throws Exception;
	
	// 모임게시물 상세보기 + 모임게시물 댓글리스트
	public Map<String, Object> getClubPost(ClubPost clubPost) throws Exception;
	
	// 모임게시물 수정 후 모임게시물 상세보기
	public Map<String, Object> updateClubPost(Map<String, Object> map) throws Exception;
	
	// 모임게시물 삭제 후 모임게시물 리스트
	public Map<String, Object> deleteClubPost(ClubPost clubPost) throws Exception;
	
	// 모임게시물 좋아요한 후 좋아요 수
	//public int updateClubPostLike(ClubPost clubPost, Heart heart) throws Exception;
	
	
	
	
	
	// 신고
	
	// 결제
	public void addPay(Pay pay) throws Exception;
	
	//public List<ClubUser> updateClubMember(Pay pay, Search search) throws Exception;
	
	//public void updateClub(Pay pay) throws Exception;
	
	
	
	
	
	// 모임게시물 댓글 등록
	public Comment addClubPostComment(Comment comment) throws Exception;
	
	// 모임게시물 댓글 리스트
	public List<Comment> getClubPostCommentList(Comment comment) throws Exception;
	
	// 모임게시물 댓글 상세보기
	public Comment getClubPostComment(Comment comment) throws Exception;
	
	// 모임게시물 댓글 수정
	public Comment updateClubPostComment(Comment comment, Heart heart) throws Exception;
	
	// 모잉게시물 댓글 삭제
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception;
	
	// 모임게시물 댓글 좋아요
	//public int updateClubPostCommentHeart(Comment comment, Heart heart) throws Exception;
	
	
	
	
	
	// 모임공지사항 등록
	public Map<String, Object> addClubNotice(Search search, Notice notice) throws Exception;
	
	// 모임공지사항 리스트
	public Map<String, Object> getClubNoticeList(Search search, Notice notice) throws Exception;
	
	// 모임공지사항 상세보기
	public Notice getClubNotice(Notice notice) throws Exception;
	
	// 모임공지사항 수정
	public Map<String, Object> updateClubNotice(Search search, Notice notice) throws Exception;
	
	// 모임공지사항 삭제
	public Map<String, Object> deleteClubNotice(Search search, Notice notice) throws Exception;
	
	
	
	
	
	// 마이홈피 - 내가 작성한 모임게시물 리스트
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception;

}
