package user;

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
		user.setUserId("user11");
		user.setPassword("1111");
		user.setName("을지문덕");
		user.setGender("남자");
		user.setNickName("낭만");
		
		userService.addUser(user);
//		Assert.assertEquals(0, userService.addUser(user)); 
		System.out.println("==============================\n");
	}

	@Test
	public void testSnsAddUser() throws Exception {
		// TODO Auto-generated constructor stub
		
		System.out.println("\n================================");
		User user = new User();
		user.setUserId("user12");
		user.setAddType("1");
		
		userService.addUser(user);
		
		User getUser = userService.getUser(user);
		System.out.println("GET한 DATA : "+getUser);
//		Assert.assertEquals(0, userService.addUser(user)); 
		System.out.println("==============================\n");
	}

//	@Test
	public void testGetUser() throws Exception{
		
		System.out.println("\n===================================");
		User userId = new User();
		userId.setUserId("user11");
		User user = userService.getUser(userId);
		System.out.println("GET한 DATA : "+user);
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}

//	@Test
	public void testUpdateUser() throws Exception{
		
		System.out.println("\n===================================");
		User user = new User();
		user.setUserId("user01");
		user.setPassword("8520");
		user.setEmail("skdi@gmail.com");

		userService.updateUser(user);
		
		User getUser = userService.getUser(user);
		
		System.out.println("변경된 결과 값 : "+getUser);
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}

//	@Test
	public void testUpdateProfile() throws Exception{
		
		System.out.println("\n===================================");
		
		User user2 = new User();
		user2.setUserId("user01");
		
		User user1 = userService.getUser(user2);
		
		System.out.println("변경전 Data : "+user1);
		
		User user = new User();
		user.setUserId("user01");
		user.setNickName("향기");
		user.setGender("여자");
		user.setArea1("영등포구");
		user.setArea2("금천구");
		user.setCategory1("운동");
		user.setCategory2("음악/댄스");
		user.setCategory3("여행");
		user.setProfileWriting("만나서 반갑습니다!");
		
		userService.updateUser(user);
		
		User getUser = userService.getUser(user);
		
		System.out.println("변경된 결과 값 : "+getUser);
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}
	
//	@Test
	public void testDeleteUser() throws Exception{
		
		System.out.println("\n===================================");
		
		User user2 = new User();
		user2.setUserId("user02");
		
		User user1 = userService.getUser(user2);
		
		System.out.println("변경 전 Data : "+ user1);
		
		User user = new User();
		user.setUserId("user02");
		user.setOutUserState("1");
		
		userService.updateUser(user);
		
		User getUser = userService.getUser(user);
		
		System.out.println("변경된 Data : "+getUser);
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}
	
//	@Test
	public void testGetUserList() throws Exception{
		
		System.out.println("\n===================================");
		
		Search search = new Search(); 
		
		Map<String, Object> map = userService.getUserList(search);
		
		List<User> list = (List<User>) map.get("userList");
		
		System.out.println("select 결과 : "+list);
		System.out.println("==============================\n");
	}
}
