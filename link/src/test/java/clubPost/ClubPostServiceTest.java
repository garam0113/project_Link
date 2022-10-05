package clubPost;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.common.Search;
import com.link.service.clubPost.ClubPostService;
import com.link.service.domain.Comment;
import com.link.service.domain.Notice;
import com.link.service.domain.Pay;
import com.link.service.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ClubPostServiceTest {
	
	@Autowired
	@Qualifier("clubPostServiceImpl")
	private ClubPostService clubPostServiceImpl;

	//@Test
	public void addClubPostComment() throws Exception {
		// 모임게시물 댓글 등록

		Comment comment = new Comment();
		comment.setClubPostNo(20);
		User user = new User();
		user.setUserId("user02");
		comment.setUser(user);
		comment.setCommentContent("댓글내용 들어간다");
		comment.setParent(5);
		comment.setDepth(2);
		comment.setSequence(2);
		
		comment = clubPostServiceImpl.addClubPostComment(comment);
		
		System.out.println(comment);
	}

	//@Test
	public void getClubPostComment() throws Exception {
		// 모임게시물 댓글 상세보기

		Comment comment = new Comment();
		comment.setClubPostCommentNo(9);
		
		comment = clubPostServiceImpl.getClubPostComment(comment);
		System.out.println(comment);
	}
	
	//@Test
	public void updateClubPostComment() throws Exception {
		// 모임 게시물 댓글 수정
		
		Comment comment = new Comment();
		comment.setClubPostCommentNo(9);
		comment.setCommentContent("1");
		comment.setCommentUpdateDate("22/10/04");
		
		clubPostServiceImpl.updateClubPostComment(comment);
	}
	
	//@Test
	public void deleteClubPostComment() throws Exception {
		// 모임 게시물 댓글 삭제
		
		Comment comment = new Comment();
		comment.setClubPostCommentNo(15);
		
		clubPostServiceImpl.deleteClubPostComment(comment);
	}
	
	//@Test
	public void addClubNotice() throws Exception {
		// 모임 공지사항 등록
		Search search = new Search();
		Notice notice = new Notice();
		notice.setNoticeTitle("title");
		notice.setNoticeContent("content");
		notice.setClubNo(2);
		notice.setNoticeCount(0);
		User user = new User();
		user.setUserId("user03");
		notice.setUserId(user);
		
		clubPostServiceImpl.addClubNotice(search, notice);
	}
	
	//@Test
	public void getClubNotice() throws Exception {
		// 모임 공지사항 수정
		Notice notice = new Notice();
		notice.setNoticeNo(6);
		
		clubPostServiceImpl.getClubNotice(notice);
	}
	
	//@Test
	public void getClubNoticeList() throws Exception {
		// 모임 공지사항 수정
		Search search = new Search();
		Notice notice = new Notice();
		notice.setNoticeNo(6);
		
		clubPostServiceImpl.getClubNoticeList(search, notice);
	}
	
	//@Test
	public void updateClubNotice() throws Exception {
		// 모임 공지사항 수정
		Search search = new Search();
		Notice notice = new Notice();
		notice.setNoticeTitle("title");
		notice.setNoticeContent("content");
		
		clubPostServiceImpl.updateClubNotice(search, notice);
	}
	
	//@Test
	public void deleteClubNotice() throws Exception {
		// 모임 공지사항 삭제
		Search search = new Search();
		Notice notice = new Notice();
		notice.setClubNo(2);
		
		clubPostServiceImpl.deleteClubNotice(search, notice);
	}
	
	//@Test
	public void updateClubMember() throws Exception {
		// 모임원 추가
		Search search = new Search();
		Pay pay = new Pay();
		User user = new User();
		user.setUserId("user03");
		pay.setUser(user);
		pay.setClubNo(2);
		pay.setPayOption("0");
		pay.setPayProduct("1");
		pay.setTotalPrice(10000);
		pay.setUpdateClubMemberCount(20);
		pay.setMerchant_uid("111");
		
		clubPostServiceImpl.updateClubMember(pay, search);
		clubPostServiceImpl.addPay(pay);
	}
	
	//@Test
	public void updateClub() throws Exception {
		// 모임 추가
		Search search = new Search();
		Pay pay = new Pay();
		User user = new User();
		user.setUserId("user03");
		pay.setUser(user);
		pay.setClubNo(2);
		pay.setPayOption("0");
		pay.setPayProduct("1");
		pay.setTotalPrice(10000);
		pay.setUpdateClubMemberCount(20);
		pay.setMerchant_uid("111");
		
		//clubPostServiceImpl.updateClub(pay, search);
		clubPostServiceImpl.addPay(pay);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
