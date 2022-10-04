package user;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.link.service.domain.User;
import com.link.service.user.UserDAO;
import com.link.service.user.UserService;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/context-*.xml"})
public class UserServiceTest {

	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("userDAO")
	private UserDAO userDAO;
	
	public void testAddUser() throws Exception {
		// TODO Auto-generated constructor stub
		
		System.out.println("\n================================");
		User user = new User();
		user.setUserId("user08");
		user.setPassword("8888");
		user.setName("이순신");
		user.setGender("남자");
		user.setNickName("림이");
		
		userService.addSnsUser(user);
		System.out.println("==============================\n");
	}

}
