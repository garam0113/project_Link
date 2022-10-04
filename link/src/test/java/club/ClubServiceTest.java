package club;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.service.club.ClubDAO;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
public class ClubServiceTest {
	
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	

//	@Test
//	public void testAddClub() throws Exception {
//		
//		System.out.println("\n ===================================");
//		Club club = new Club(5,"user01","모임제목","모임내용","a.jpg",1,10,"모임카테고리","모임영역");
//		System.out.println("insert 결과 : "+clubService.addClub(club));
//		System.out.println("delete 결과 : "+clubDAO.deleteClub(club.getClubNo()));
//				
//	}
//	
//	@Test
//	public void testGetClub() throws Exception {
//		
//		System.out.println("\n ===========================");
//		Club club = clubService.getClub(2);
//		System.out.println(club);
//		
//		Assert.assertEquals(1, club.getClubNo());
//		
//		System.out.println("========================\n");
//		
//	}
//	
//	@Test
//	public void testGetClubList() throws Exception {
//		
//	}

}
