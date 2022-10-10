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
@RequestMapping("/userRest/*")
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

	@RequestMapping(value = "json/getUser", method = RequestMethod.POST)
	public User getUser(@RequestBody User user ) throws Exception{
		
		System.out.println("/userRest/json/getUser : POST");
		
		System.out.println("입력받은 User 값 : "+user);
		
		User getUser = userService.getUser(user);
		
		System.out.println("DB에서 받은 정보 : "+user);
		
		if(getUser != null) {
			
			return getUser;	//회원정보가 null이 아닐경우 리턴
		
		}else{
			
			user.setUserId("");
			user.setNickName("");
			
			System.out.println("null값을 넣은 User : "+user);
			
			return user;	//회원정보가 없을 경우 회원ID에 null값을 저장하여 출력
		}
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
	
//	@RequestMapping(value = "json/checkDuplication/{userId}", method = RequestMethod.GET)
//	public String checkDuplication(@RequestBody String userId) throws Exception{
//		
//		System.out.println("/user/json/checkDuplication : GET");
//		
//		User user = new User();
//		
//		user.setUserId(userId);
//
//		boolean result = userService.checkDuplication(user);
//		
//		return result;
//	}
	
	@RequestMapping(value = "json/sendSMS", method = RequestMethod.GET)
	public @ResponseBody
	String sendSMS(String phoneNo) throws Exception{
		
		System.out.println("/userRest/json/sendSMS : GET");
		
		Random rand = new Random();
		String numStr = "";
		
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		System.out.println("수신자 번호 : "+phoneNo);
		System.out.println("인증번호 : "+numStr);
		
		userService.sendSMS(phoneNo, numStr);
		
		return numStr;
	}
}
