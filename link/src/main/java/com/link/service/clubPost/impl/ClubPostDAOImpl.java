package com.link.service.clubPost.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostDAO;
import com.link.service.domain.ClubPost;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Comment;
import com.link.service.domain.Heart;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;
import com.link.service.domain.Report;
import com.link.service.domain.User;

@Repository("clubPostDAOImpl")
public class ClubPostDAOImpl implements ClubPostDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;

	public ClubPostDAOImpl() {
		System.out.println(getClass() + " default 생성자 호출");
	}

	@Override
	public Map<String, Object> addClubPost(ClubPost clubPost) throws Exception {
		System.out.println(getClass() + ".addClubPost(ClubPost clubPost) 왔다");
		
		// 모임게시물 등록
		sqlSession.insert("ClubPostMapper.addClubPost", clubPost);
		// 모임게시물 현재 sequence 가져오기
		ClubPost returnClubPost = sqlSession.selectOne("ClubPostMapper.getCurrval", clubPost);
		System.out.println("가장 최근 등록한 시퀀스 : " + returnClubPost);
		// 모임게시물 등록한 모임에 있는 모임원 리스트 가져온다
		List<ClubUser> clubUserList = sqlSession.selectList("ClubMapper.getClubMemberListToClubPost", clubPost);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPost", returnClubPost);
		map.put("clubUserList", clubUserList);
		for (int i = 0; i < clubUserList.size(); i++) {
			System.out.println("모임원들 : " + clubUserList.get(i));
			// 해당 모임의 모임원들에게 모임게시물 등록되었다고 알림
			Report report = new Report(clubPost.getUser().getUserId() + "님이 게시물을 작성했습니다", 1, new User(clubPost.getUser().getUserId()), new User(clubUserList.get(i).getUserId()), 2, returnClubPost);
			sqlSession.insert("Report_PushMapper.addReport", report);
			System.out.println("알림 : " + (i+1));
		}
		
		// 모임게시물 상세보기 가져온 후 화면 이동
		return getClubPost(map);
	}// end of addClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostList(Map<String, Object> map) 왔다");
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostList", map));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListCount", map));
		return map;
	}// end of getClubPostList(Map<String, Object> map)

	@Override
	public Map<String, Object> getClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPost(ClubPost clubPost) 왔다");
		map.put("getClubPost", sqlSession.selectOne("ClubPostMapper.getClubPost", map.get("clubPost")));
		if( map.get("search") != null ) {
			map.put("getClubPostCommentList", sqlSession.selectList("ClubPostCommentMapper.getClubPostCommentList", map));
		}		
		return map;
	}// end of getClubPost(ClubPost clubPost)
	
	@Override
	public Map<String, Object> updateClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubPost(Map<String, Object> map) 왔다");
		
		// 좋아요 or 좋아요취소 or 신고승인 or 내용수정
		sqlSession.update("ClubPostMapper.updateClubPost", map);
		
		if( ((ClubPost)map.get("clubPost")).getHeartCondition() == 1 ) {
			// 좋아요 등록
			sqlSession.insert("HeartMapper.insertHeart", map.get("heart"));
			System.out.println("좋아요 등록");
		}else if( ((ClubPost)map.get("clubPost")).getHeartCondition() == -1 ) {
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", map.get("heart"));
			System.out.println("좋아요 삭제");
		}

		// 모임게시물 상세보기
		return getClubPost(map);
	}// end of updateClubPostLike(Map<String, Object> map)
	
	@Override
	public Map<String, Object> deleteClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(Map<String, Object> map) 왔다");
		sqlSession.update("ClubPostMapper.deleteClubPost", map.get("clubPost"));
		return getClubPostList(map);
	}// end of deleteClubPost(Map<String, Object> map)
	
	
///////////////////////////////////////////////////////////////////////////////////// ClubPostComment /////////////////////////////////////////////////////////////////////////////////////		
	
	
	@Override
	public Comment addClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".addClubPostComment(Comment comment) 왔다");

		// 모임게시물 수정은 파라미터가 map이다. 모임 게시물 댓글 번호가 있다면 모임 게시물 번호의 테이블에 댓글 개수를 +1 한다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPost", new ClubPost(comment.getClubPostNo(), comment.getClubPostCommentNo()));
		System.out.println("모임 게시물 //////////////////////////" + map.get("clubPost"));
		
		
		
		// 모임게시물 작성자 아이디
		ClubPost clubPost = sqlSession.selectOne("ClubPostMapper.getClubPost", map.get("clubPost"));
		System.out.println("게시물 작성자 아이디 : " + clubPost.getUser().getUserId());
		

		//User user1 = new User(); // 댓글 작성자		
		//User user2 = new User(); // 게시물 작성자
		//user1.setUserId(comment.getUser().getUserId()); // 댓글 작성자
		//user2.setUserId(clubPost.getUser().getUserId()); // 게시물 작성자
		Report report = new Report(comment.getUser().getUserId() + "님이 회원님의 게시물에 댓글을 남겼습니다", 2, new User(comment.getUser().getUserId()), new User(clubPost.getUser().getUserId()), 2, comment);
				
				
		
		// 모임게시물 댓글 등록
		sqlSession.insert("ClubPostCommentMapper.addClubPostComment", comment);
		System.out.println("모임게시물 댓글 등록");
		// 모임게시물 댓글 개수 증가
		sqlSession.insert("ClubPostMapper.updateClubPost", map);
		System.out.println("모임게시물 댓글 개수 증가");
		// 모임게시물 작성자에게 댓글 추가되었다고 알림
		sqlSession.insert("Report_PushMapper.addReport", report);
		System.out.println("모임게시물 작성자에게 댓글 추가되었다고 알림");
		// 가장 최근 모임게시물 댓글 번호 가져온다
		comment.setClubPostCommentNo(sqlSession.selectOne("ClubPostCommentMapper.getClubPostCommentNo"));
		System.out.println("가장 최근 모임게시물 댓글 번호 가져온다 : " + comment.getClubPostCommentNo());
		// 가장 최근 모임게시물 댓글 가져온다
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of addClubPostComment(Comment comment)

	@Override
	public List<Comment> getClubPostCommentList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostCommentList(Map<String, Object> map) 왔다");
		System.out.println(((Search)map.get("search")).getOrder());
		return sqlSession.selectList("ClubPostMapper.getClubPostCommentList", map);
	}// end of getClubPostCommentList(Map<String, Object> map)

	@Override
	public Comment getClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostComment(Comment comment) 왔다");
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of getClubPostComment(Comment comment)

	@Override
	public Comment updateClubPostComment(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubPostComment(Map<String, Object> map) 왔다");
		sqlSession.update("ClubPostCommentMapper.updateClubPostComment", map.get("comment"));
		
		if(((Comment)map.get("comment")).getHeartCondition() == 1) {
			// 좋아요 등록
			sqlSession.insert("HeartMapper.insertHeart", map.get("heart"));
		}else if(((Comment)map.get("comment")).getHeartCondition() == -1) {
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", map.get("heart"));
		}
		
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", map.get("comment"));
	}// end of updateClubPostComment(Map<String, Object> map)

	@Override
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".deleteClubPostComment(Comment comment) 왔다");
		sqlSession.update("ClubPostCommentMapper.deleteClubPostComment", comment);
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}

	/*
	@Override
	public int updateClubPostCommentHeart(Comment comment, Heart heart) throws Exception {
		System.out.println(getClass() + ".updateClubPostCommentHeart(Comment comment, Heart heart) 왔다");
		// 모임게시물 댓글 좋아요하다 또는 좋아요 취소하다
		sqlSession.update("ClubPostCommentMapper.updateClubPostComment", comment);
		
		if(comment.getHeartCondition() == 1) {
			// 좋아요 등록
			sqlSession.insert("HeartMapper.insertHeart", heart);
		}else if(comment.getHeartCondition() == -1) {
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", heart);
		}
		return ((Comment)sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment)).getCommentHeartCount();
	}
	*/

///////////////////////////////////////////////////////////////////////////////////// Heart /////////////////////////////////////////////////////////////////////////////////////	

	@Override
	public int getHeart(Heart heart) throws Exception {
		System.out.println(getClass() + ".getHeart(Heart heart) 왔다");
		return sqlSession.selectOne("HeartMapper.checkFeedHeart", heart);
	}
	
///////////////////////////////////////////////////////////////////////////////////// MyHome /////////////////////////////////////////////////////////////////////////////////////	
	
	

	@Override
	public Map<String, Object> getClubPostListMyHome(String userId) throws Exception {
		System.out.println(getClass() + ".getClubPostListMyHome(String userId) 왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostListMyHome", userId));
		map.put("clubPostListCount", sqlSession.selectOne("ClubPostMapper.getClubPostListMyHomeCount", userId));
		return map;
	}// end of getClubPostListMyHome(String userId)
	
	
	
///////////////////////////////////////////////////////////////////////////////////// Pay /////////////////////////////////////////////////////////////////////////////////////		
	
	
	
	@Override
	public void addPay(Pay pay) throws Exception {
		System.out.println(getClass() + ".addPay(Pay pay) 왔다");
		sqlSession.insert("ClubPostMapper.addPay", pay);
	}// end of addPay(Pay pay)

	@Override
	public List<Pay> getPayList(User user) throws Exception {
		System.out.println(getClass() + ".getPayList(User user) 왔다");
		return sqlSession.selectList("ClubPostMapper.getPayList", user);
	}// end of getPayList(User user)

	@Override
	public Pay getPay(Pay pay) throws Exception {
		System.out.println(getClass() + ".getPay(Pay pay) 왔다");
		return sqlSession.selectOne("ClubPostMapper.getPay", pay);
	}// end of getPay(Pay pay)
	
	
	
///////////////////////////////////////////////////////////////////////////////////// Notice /////////////////////////////////////////////////////////////////////////////////////	
	
	
	@Override
	public Map<String, Object> addClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".addClubNotice(Map<String, Object> map) 왔다");
		sqlSession.insert("NoticeMapper.addClubNotice", map);
		int no = sqlSession.selectOne("NoticeMapper.getClubNoticetNo", map);
		Notice notice = ((Notice)map.get("notice"));
		notice.setNoticeNo(no);
		map.put("notice", notice);
		map.put("getClubNotice", sqlSession.selectOne("NoticeMapper.getClubNotice", notice));
		return getClubNoticeList(map);
	}// end of addClubNotice(Map<String, Object> map)

	@Override
	public Map<String, Object> getClubNoticeList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubNoticeList(Map<String, Object> map) 왔다");
		map.put("getClubNoticeList", sqlSession.selectList("NoticeMapper.getClubNoticeList", map) );
		map.put("getClubNoticeListCount", sqlSession.selectOne("NoticeMapper.getClubNoticeListCount", map) );
		return map;
	}// end of getClubNoticeList(Map<String, Object> map)

	@Override
	public Notice getClubNotice(Notice notice) throws Exception {
		System.out.println(getClass() + ".getClubNotice(Notice notice) 왔다");
		return sqlSession.selectOne("NoticeMapper.getClubNotice", notice);
	}// end of getClubNotice(Notice notice)

	@Override
	public Map<String, Object> updateClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubNotice(Map<String, Object> map) 왔다");
		sqlSession.update("NoticeMapper.updateClubNotice", map);
		return getClubNoticeList(map);
	}// end of updateClubNotice(Map<String, Object> map)

	@Override
	public Map<String, Object> deleteClubNotice(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".deleteClubNotice(Map<String, Object> map) 왔다");
		sqlSession.delete("NoticeMapper.deleteClubNotice", map);
		return getClubNoticeList(map);
	}// end of deleteClubNotice(Search search, Notice notice)
	
	
	
}



