package serviceCenter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.domain.QandA;
import com.link.service.domain.User;
import com.link.service.serviceCenter.ServiceCenterService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ServiceCenterServiceTest {
	
	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;
	
	public ServiceCenterServiceTest() {
		System.out.println("Default");
	}

	
	//@Test
	public void testAddNotice() throws Exception {
													// 공지 등록

		Notice notice = new Notice();
		User user = new User();

		
		user.setUserId("admin1");
		
		
		notice.setNoticeNo(2);
		notice.setNoticeTitle("공지사항ss");
		notice.setNoticeContent("내용ss");
		notice.setNoticeImage1("abc.jpg");
		notice.setNoticeImage2("cdf.jpg");
		notice.setNoticeRegDate("22-10-05");
		notice.setNoticeCount(1);
		notice.setUserId(user);
		notice.setClubNo(0);
		System.out.println(notice);
		serviceCenterService.addNotice(notice);
		Assert.assertEquals(2, notice.getNoticeNo());
		
	}
	
	
	//@Test
	public void testUpdateNotice() throws Exception {
													// 공지사항 수정
		Notice notice = new Notice();
		User user = new User();
		

		user.setUserId("admin1");
		notice.setNoticeNo(2);
		notice.setNoticeContent("바꾼 공지사항");
		notice.setNoticeTitle("바뀐내용ss");
		notice.setNoticeImage1("abc.jpg");
		notice.setNoticeImage2("cdf.jpg");
		notice.setNoticeRegDate("22-10-05");
		notice.setNoticeCount(1);
		notice.setUserId(user);
		notice.setClubNo(0);
		

		serviceCenterService.updateNotice(notice);
		Assert.assertEquals(2, notice.getNoticeNo());
		
	}
	
	
	//@Test
	public void testGetNotice() throws Exception {
													// 공지 가져오기
		Notice notice = new Notice();
		User user = new User();
		
		
		user.setUserId("admin1");
		notice.setNoticeNo(1);
		
		Assert.assertEquals(1, notice.getNoticeNo());
	}
	
	//@Test
	public void testGetNoticeList()	throws Exception{
													// 공지 List
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(1);
		search.setPageUnit(1);
		search.setSearchKeyword("내용");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		
		map = serviceCenterService.getNoticeList(search);
		List<Notice> notice = (List<Notice>)map.get("list");
		
		Assert.assertEquals("내용", notice.get(1).getNoticeContent());
		

		
	}
	
	
	//@Test
	public void testDeleteNotice()	throws Exception{
													// delete List
		Notice notice = new Notice();
		notice.setNoticeNo(1);
		System.out.println(notice.getNoticeNo());
		serviceCenterService.deleteNotice(1);
		
		Assert.assertEquals(1, notice.getNoticeNo());
	}
	
	
//=========================================================여기까지가 Notice
	
	//@Test
	public void testAddQandA() throws Exception {
													// QandA 등록

		QandA qandA = new QandA();
		User user = new User();

		
		user.setUserId("admin1");
		
		
		qandA.setQandANo(20);
		qandA.setQandATitle("Qna 제목");
		qandA.setQandAContent("내용ss");
		qandA.setQandAImage1("abc.jpg");
		qandA.setQandAImage2("cdf.jpg");
		qandA.setQandARegDate("22-10-05");
		qandA.setQandACount(0);
		qandA.setQandACondition(0);
		qandA.setQandAOpenCondition(0);
		qandA.setUser(user);
		
		System.out.println(qandA);
		serviceCenterService.addQandA(qandA);
		Assert.assertEquals(20, qandA.getQandANo());

		
	}
	
	//@Test
	public void testUpdateQandA() throws Exception {
													// QandA 수정

		QandA qandA = new QandA();
		User user = new User();

		
		user.setUserId("admin1");
		
		
		qandA.setQandANo(2);
		qandA.setQandATitle("바뀐Qna 제목");
		qandA.setQandAContent("바뀐내용ss");
		qandA.setQandAImage1("abc.jpg");
		qandA.setQandAImage2("cdf.jpg");
		qandA.setQandARegDate("22-10-05");
		qandA.setQandAAnswerContent("답변입니다");
		qandA.setQandAAnswerRegDate("22-11-05");
		qandA.setQandACondition(1);
		
		
		System.out.println(qandA);
		 serviceCenterService.updateQandA(qandA);
		Assert.assertEquals(2, qandA.getQandANo());

	}
	
	//@Test
	public void testGetQandA() throws Exception {
													// QandA 가져오기

		QandA qandA = new QandA();
		
		qandA.setQandANo(2);
		
		System.out.println(qandA);
		 serviceCenterService.getQandA(qandA.getQandANo());
		Assert.assertEquals(2, qandA.getQandANo());

	}
	
	//@Test
	public void testDelteQandA() throws Exception {
													// QandA 가져오기

		QandA qandA = new QandA();
		
		qandA.setQandANo(2);
		
		System.out.println(qandA);
		 serviceCenterService.deleteQandA(qandA.getQandANo());
		Assert.assertEquals(2, qandA.getQandANo());

	}
	//======================================================여기까지가 QandA
	
	
	
	
}
