package user;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.service.domain.User;
import com.link.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-*.xml"})
public class UserServiceTest {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
//	@Test
	public void testAddUser() throws Exception {
		// TODO Auto-generated constructor stub
		
		System.out.println("\n================================");
		User user = new User();
		user.setUserId("user09");
		user.setPassword("9999");
		user.setName("이순신");
		user.setGender("남자");
		user.setNickName("랑이");
		
		System.out.println("insert 결과 : "+userService.addUser(user) );
//		Assert.assertEquals(0, userService.addUser(user)); 
		System.out.println("==============================\n");
	}

//	@Test
	public void testGetUser() throws Exception{
		
		System.out.println("\n===================================");
		User user = userService.getUser("user01");
		System.out.println(user);
		
		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}
}
