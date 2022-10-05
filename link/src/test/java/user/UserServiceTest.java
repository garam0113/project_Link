package user;

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
		user.setUserId("user09");
		user.setPassword("9999");
		user.setName("이순신");
		user.setGender("남자");
		user.setNickName("랑이");
		
//		System.out.println("insert 결과 : "+userService.addUser(user) );
//		Assert.assertEquals(0, userService.addUser(user)); 
		System.out.println("==============================\n");
	}

	//	@Test
	public void testSnsAddUser() throws Exception {
		// TODO Auto-generated constructor stub
		
		System.out.println("\n================================");
		User user = new User();
		user.setUserId("user10");
		user.setAddType("1");
		
		System.out.println("insert 결과 : "+userService.addSnsUser(user) );
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

	//	@Test
	public void testUpdateUser() throws Exception{
		
		System.out.println("\n===================================");
		User user = new User();
		user.setUserId("user09");
		user.setPassword("8520");
		user.setEmail("skdi@gmail.com");

		System.out.println("update 결과 : "+userService.updateUser(user) );
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}

	//	@Test
	public void testUpdateProfile() throws Exception{
		
		System.out.println("\n===================================");
		User user = new User();
		user.setUserId("user02");
		user.setNickName("향기");
		user.setGender("여자");
		user.setArea1("영등포구");
		user.setArea2("금천구");
		user.setCategory1("운동");
		user.setCategory2("음악/댄스");
		user.setCategory3("여행");
		user.setProfilewriting("만나서 반갑습니다!");
		
		System.out.println("update 결과 : "+userService.updateProfile(user) );
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}
	
	//	@Test
	public void testDeleteUser() throws Exception{
		
		System.out.println("\n===================================");
		User user = new User();
		user.setUserId("user01");
		user.setOutUserState("향기");
		
		System.out.println("update 결과 : "+userService.deleteUser(user) );
		
//		Assert.assertEquals("uesr01", user.getUserId());
		System.out.println("==============================\n");
	}
	
	//@Test
	public void testGetUserList() throws Exception{
		
		System.out.println("\n===================================");
		
		Search search = new Search(); 
		
		Map<String, Object> map = userService.getUserList(search);
		
		System.out.println("select 결과 : "+map.get("list") );
		System.out.println("==============================\n");
	}
}
