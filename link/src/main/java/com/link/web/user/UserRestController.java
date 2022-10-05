package com.link.web.user;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.domain.User;
import com.link.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "json/getUser/{userId}", method = RequestMethod.GET)
	public User getUser(@PathVariable String userId) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		User user = new User();
		
		user.setUserId(userId);
		
		return userService.getUser(user);	//회원정보 리턴
		
	}
	
	
	@RequestMapping(value = "json/updatePassword", method = RequestMethod.POST)
	public User updatePassword(@RequestBody User user ) throws Exception{
		
		System.out.println("/user/json/updatePassword : POST");
		
		Random rand = new Random();
		String password = "";
		
		for(int i=0; i<6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			password += ran;	//Random한 숫자 6자리 생성
		}
		
		user.setPassword(password);	//임의의 6자리 숫자 Set
		
		userService.updateUser(user);	//임의의 password DB에 update
		
		User getUser = userService.getUser(user);
		
		System.out.println(getUser.getPassword());
		
		userService.sendPasswordSMS(getUser);
		
		return getUser;
	}
	
	@RequestMapping(value = "json/updatePhoneNo", method = RequestMethod.POST)
	public User updatePhoneNo(@RequestBody User user) throws Exception{
		
		System.out.println("/user/json/updatePhoneNo : POST");
		
		userService.updateUser(user);	//입력받은 핸드폰번호 DB에 update
		
		return userService.getUser(user);	//update된 회원의 핸드폰번호 출력
	}
	
	@RequestMapping(value = "json/sendSMS", method = RequestMethod.GET)
	public @ResponseBody
	String sendSMS(String phoneNo) throws Exception{
		
		System.out.println("/user/json/sendSMS : GET");
		
		Random rand = new Random();
		String numStr = "";
		
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		System.out.println("수신자 번호 : "+phoneNo);
		System.out.println("인증번호 : "+numStr);
		
		return numStr;
	}
}
