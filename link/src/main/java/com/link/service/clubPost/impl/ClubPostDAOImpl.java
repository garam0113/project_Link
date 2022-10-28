package com.link.service.clubPost.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

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
		System.out.println("등록할 모임 게시물 : " + clubPost);
		
		// 모임게시물 등록한다
		sqlSession.insert("ClubPostMapper.addClubPost", clubPost);
		
		// 모임게시물 현재 sequence 가져온다
		ClubPost returnClubPost = sqlSession.selectOne("ClubPostMapper.getCurrval", clubPost);
		System.out.println("///////////////////////////" + returnClubPost);
		//System.out.println("로그인한 유저의 아이디 : " + returnClubPost.getUser().getUserId() + ", 가장 최근 등록한 게시물의 모임번호 : " + returnClubPost.getClubNo() + ", 모임게시물번호 : " + returnClubPost.getClubPostNo());
		
		// 모임게시물 등록한 모임에 있는 모임원 리스트 가져온다
		List<ClubUser> clubUserList = sqlSession.selectList("ClubMapper.getClubMemberListToClubPost", clubPost);
		
		// 방근 등록한 모임 게시물을 map에 넣어 상세보기로 가 출력한다
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("clubPost", returnClubPost);
		
		for (int i = 0; i < clubUserList.size(); i++) {
			System.out.println("모임원들 : " + clubUserList.get(i));
			
			// 해당 모임의 모임원에게 보낼 알림 만들기
			Report report = new Report(clubPost.getUser().getNickName() + "님이 게시물을 작성했습니다", 1, new User(clubPost.getUser().getUserId()), new User(clubUserList.get(i).getUser().getUserId()), 2, returnClubPost);
			
			// 해당 모임의 모임원들에게 게시물 등록되었다고 알림
			sqlSession.insert("Report_PushMapper.addReport", report);
		}
		
		// 모임게시물 상세보기 가져온 후 상세보기로 화면 이동
		return getClubPost(map);
	}// end of addClubPost(ClubPost clubPost)

	@Override
	public Map<String, Object> getClubPostList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostList(Map<String, Object> map) 왔다");
		
		// 모임 게시물 리스트, 작성자의 닉네임 프로필사진, 로그인한 회원의 좋아요 여부 가져온다
		map.put("clubPostList", sqlSession.selectList("ClubPostMapper.getClubPostList", map));

		// 모임 게시물 리스트의 개수 가져온다
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
			System.out.println("좋아요 등록 : " + map.get("heart"));
		}else if( ((ClubPost)map.get("clubPost")).getHeartCondition() == -1 ) {
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", map.get("heart"));
			System.out.println("좋아요 삭제 : " + map.get("heart"));
		}

		// 모임게시물 상세보기
		return getClubPost(map);
	}// end of updateClubPostLike(Map<String, Object> map)
	
	@Override
	public Map<String, Object> deleteClubPost(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".deleteClubPost(Map<String, Object> map) 왔다");
		System.out.println(map.get("clubPost"));
		sqlSession.update("ClubPostMapper.deleteClubPost", map.get("clubPost"));
		//return map;
		return getClubPostList(map);
	}// end of deleteClubPost(Map<String, Object> map)
	
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////// ClubPostComment /////////////////////////////////////////////////////////////////////////////////////		
	
	
	
	
	
	@Override
	public Comment addClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".addClubPostComment(Comment comment) 왔다");

		// 모임게시물 댓글개수를 증가하는 updateClubPost는 파라미터가 map이다. 모임 게시물 댓글 번호가 있다면 모임 게시물 번호의 테이블에 댓글 개수를 +1 한다
		Map<String, Object> map = new HashMap<String, Object>();

		
		
		// 모임게시물 댓글 등록
		sqlSession.insert("ClubPostCommentMapper.addClubPostComment", comment);
		
		// 가장 최근 모임게시물 댓글번호 가져온다
		comment.setClubPostCommentNo(sqlSession.selectOne("ClubPostCommentMapper.getClubPostCommentNo", comment));
		System.out.println("로그인한 회원이 가장 최근 등록한 댓글 번호 가져온다 : " + comment.getClubPostCommentNo());
		System.out.println("댓글 등록 : 로그인한 회원 아이디 : " + comment.getUser().getUserId() + ", 게시물번호 : " + comment.getClubPostNo()
		+ ", 댓글번호 : " + comment.getClubPostCommentNo() + ", 댓글내용 : " + comment.getCommentContent() + ", 댓글 순서 : " + comment.getSequence()
		+ "댓글 깊이 : " + comment.getDepth() + ", 댓글 부모번호 : " + comment.getParent());
		
		
		
		
		
		ClubPost returnClubPost = new ClubPost(comment.getClubPostNo(), comment.getClubPostCommentNo(), comment.getUser());		
		
		// 모임게시물 작성자 아이디
		returnClubPost = sqlSession.selectOne("ClubPostMapper.getClubPost", returnClubPost);
		System.out.println("게시물 작성자 아이디 : " + returnClubPost.getUser().getUserId());
		
		// 첫번째 2는 게시물 댓글, 두번째 2는 알림
		Report report = new Report(comment.getUser().getNickName() + "님이 회원님의 게시물에 댓글을 남겼습니다", 2, new User(comment.getUser().getUserId()),
				new User(returnClubPost.getUser().getUserId()), 2, comment);
		
		// 모임게시물 작성자에게 댓글 추가되었다고 알림
		sqlSession.insert("Report_PushMapper.addReport", report);
		System.out.println("모임게시물 작성자에게 댓글 추가되었다고 알림");
		
		
		

		// 게시물의 댓글개수 증가
		returnClubPost.setClubPostCommentNo(comment.getClubPostCommentNo());
		map.put("clubPost", returnClubPost);
		sqlSession.update("ClubPostMapper.updateClubPost", map);
		System.out.println("모임게시물 댓글 개수 증가");
		
		map.put("comment", comment);
		if( comment.getDepth() != 0 ) {
			// 부모번호의 댓글개수를 증가시킨다
			System.out.println("댓글개수 증가할 부모번호 : " + comment.getParent());
			((Comment)map.get("comment")).setDeleteCondition("-1");
			
			System.out.println("댓글 등록시 부모댓글의 댓글개수 증가 sql 직전 : 하트 여부 : " + ((Comment)map.get("comment")).getHeartCondition()
					+ ", 삭제여부 : " + ((Comment)map.get("comment")).getDeleteCondition() + ", 댓글의 부모번호 : " + ((Comment)map.get("comment")).getParent() );
			sqlSession.update("ClubPostCommentMapper.updateClubPostComment", map);
		}
		
		
		
		// 가장 최근 모임게시물 댓글 가져온다
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of addClubPostComment(Comment comment)

	@Override
	public List<Comment> getClubPostCommentList(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".getClubPostCommentList(Map<String, Object> map) 왔다");
		return sqlSession.selectList("ClubPostCommentMapper.getClubPostCommentList", map);
	}// end of getClubPostCommentList(Map<String, Object> map)

	@Override
	public Comment getClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".getClubPostComment(Comment comment) 왔다");
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
	}// end of getClubPostComment(Comment comment)

	@Override
	public Comment updateClubPostComment(Map<String, Object> map) throws Exception {
		System.out.println(getClass() + ".updateClubPostComment(Map<String, Object> map) 왔다");

		// 좋아요 or 좋아요취소 or 신고승인 or 내용수정
		System.out.println("댓글 수정 또는 좋아요 수정시 : 삭제여부 : " + ((Comment)map.get("comment")).getDeleteCondition()
				+ ", 하트여부 : " + ((Comment)map.get("comment")).getHeartCondition() + ", 댓글의 부모번호 : " + ((Comment)map.get("comment")).getParent());
		sqlSession.update("ClubPostCommentMapper.updateClubPostComment", map);
		
		if(((Comment)map.get("comment")).getHeartCondition() == 1) {
			// 좋아요 등록
			sqlSession.insert("HeartMapper.insertHeart", map.get("heart"));
			System.out.println("댓글 좋아요 등록 : " + map.get("heart"));
		}else if(((Comment)map.get("comment")).getHeartCondition() == -1) {
			// 좋아요 삭제
			sqlSession.delete("HeartMapper.deleteHeart", map.get("heart"));
			System.out.println("댓글 좋아요 삭제 : " + map.get("heart"));
		}
		
		return sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", map.get("comment"));
	}// end of updateClubPostComment(Map<String, Object> map)

	@Override
	public Map<String, Object> deleteClubPostComment(Comment comment) throws Exception {
		System.out.println(getClass() + ".deleteClubPostComment(Comment comment) 왔다");
		
		String Id = comment.getUser().getUserId();
		System.out.println("삭제하는 회원 아이디 : " + Id);
		
		// 댓글 정보 가져온다
		comment = sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
		
		// 부모번호의 댓글개수 -1
		Map<String, Object> map = new HashMap<String, Object>();
		comment.setDeleteCondition("1");
		// delete_condition이 1이면 댓글을 지운다 즉, 댓글개수 -1한다
		map.put("clubPost", new ClubPost(comment.getClubPostNo(), -1));
		map.put("comment", comment);
		
		// 게시물의 전체 댓글개수 - 1 한다
		sqlSession.update("ClubPostMapper.updateClubPost", map);

		// 댓글개수 - 1 한다
		if(comment.getDepth() != 0) {
			System.out.println("댓글 삭제시 : 삭제여부 : " + ((Comment)map.get("comment")).getDeleteCondition()
					+ ", 하트여부 : " + ((Comment)map.get("comment")).getHeartCondition() + ", 댓글의 부모번호 : " + ((Comment)map.get("comment")).getParent());
			sqlSession.update("ClubPostCommentMapper.updateClubPostComment", map);
		}

		// 댓글 삭제
		sqlSession.update("ClubPostCommentMapper.deleteClubPostComment", comment);
		
		// 게시물 댓글개수 가져온다
		ClubPost clubPost = sqlSession.selectOne("ClubPostMapper.getClubPost", new ClubPost(comment.getClubPostNo(), comment.getClubPostCommentNo(), comment.getUser()));
		
		// 댓글개수 가져온다
		if(comment.getDepth() != 0) {
			comment.setDeleteCondition(10+"");
			System.out.println(comment);
			System.out.println("여기로");
			comment = sqlSession.selectOne("ClubPostCommentMapper.getClubPostComment", comment);
			System.out.println(comment);
			map.put("commentCount", comment.getCommentCount());
			map.put("parent", ((Comment)map.get("comment")).getParent());
		}
		
		map.put("clubPostCommentCount", clubPost.getClubPostCommentCount());

		return map;
	}

	
	
	
	
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
		System.out.println("결제할 정보 : " + pay);
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



