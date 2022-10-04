package serviceCenter;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.domain.Notice;
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
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;
	//@Test
	public void testAddNotice() throws Exception {
													// 공지 등록

		Notice notice = new Notice();
		User user = new User();

		
		user.setUserId("admin1");
		notice.setNoticeNo(200);
		notice.setNoticeTitle("공지사항");
		notice.setNoticeContent("내용");
		notice.setNoticeImage1("abc.jpg");
		notice.setNoticeImage2("cdf.jpg");
		notice.setUserId(user);
		
		Assert.assertEquals(200, notice.getNoticeNo());
		
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
		
		

		
	}
	
	
	
	
	
	
	
	

}
