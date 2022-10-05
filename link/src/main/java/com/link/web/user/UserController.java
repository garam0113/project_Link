package com.link.web.user;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.domain.User;
import com.link.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@RequestMapping(value="addUser", method = RequestMethod.GET)
	public String addUser() throws Exception{
		
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping(value="addUser", method = RequestMethod.POST)
	public String addUser(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/user/addUser : POST");
		
		userService.addUser(user);	//회원가입 정보 DB저장
		
		return null;
	}
	
	@RequestMapping(value="addSnsUser", method = RequestMethod.POST)
	public String addSnsUser(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/user/addSnsUser : POST");
		
		userService.addSnsUser(user);	//SNS회원 ID, 가입유형, 가입날짜 DB저장
		
		return null;
	}
	
	@RequestMapping(value="getUser", method = RequestMethod.GET)
	public String getUser(@ModelAttribute("userId") String userId, Model model) throws Exception{
		
		System.out.println("/user/getUser : GET");
		
		User user = userService.getUser(userId);	//회원의 정보를 얻기위해 회원ID DB전송
		
		model.addAttribute("user", user);	//DB에서 전송받은 회원의 정보를 Key(user)에 저장
		
		return null;
	}

	@RequestMapping(value="getUserId", method = RequestMethod.GET)
	public String getUserId() throws Exception{	
		
		System.out.println("/user/getUser : GET");
		
		return null;
	}

	@RequestMapping(value="getUserId", method = RequestMethod.POST)
	public String getUserId(@ModelAttribute("user") User user, Model model) throws Exception{		
		
		System.out.println("/user/getUser : POST");
		
		User userId = userService.getUserId(user);
		
		model.addAttribute("userId",userId);
		
		return null;
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.GET)
	public String updateUser(@ModelAttribute("userId") String userId, Model model ) throws Exception{
		
		System.out.println("/user/updateUser : GET");
		
		User user = userService.getUser(userId);	//회원정보를 수정하기 전 기존 회원 정보를 DB에서 출력 
		
		model.addAttribute("user", user);	//DB의 정보를 Key(user)에 저장
		
		return null;
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("/user/updateUser : POST");
		
		userService.updateUser(user);	//입력받은 회원 정보를 DB에 저장

		String sessionId = ((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return null;
	}
	
	@RequestMapping(value="updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("uesr") User user, Model model, HttpSession session) throws Exception {
		
		System.out.println("/user/updateProfile : POST");
		
		userService.updateProfile(user);	//SNS회원 프로필 작성
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return null;
	}
	
	//REST
//	@RequestMapping(value = "updatePhoneNo", method = RequestMethod.GET)
//	public String updatePhoneNo(@ModelAttribute("user") User user, Model model) throws Exception{
//		
//	}
	
	@RequestMapping(value = "getPassword", method = RequestMethod.GET)
	public String getPassword() throws Exception{
		
		System.out.println("/user/updatePassword : GET");	//비밀번호 찾기 화면 Navigation
		
		return null;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("userId") String userId, HttpSession session) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		userService.logout(userId);	//logout시간 저장
		
		session.invalidate();	//session정보 제거
		
		return null;
	}
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(@ModelAttribute("userId")String userId, @ModelAttribute("UserState") String userState) throws Exception{
		
		System.out.println("/user/deleteUser : GET");
		
		User user = new User();	// get방식으로 들어온 Data 저장을 위해 생성
		
		user.setUserId(userId);	//회원ID domain객체에 Set
		user.setOutUserState(userState);	//회원상태 domain객체에 Set
		
		userService.deleteUser(user);	//회원 정보를 DB에 저장
		
		return null;
	}
	
	
	public String getUserList(@ModelAttribute("search") Search search, Model model) throws Exception{
		
		System.out.println("/user/getUserList : GET/POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setCurrentPage(pageSize);
		
		Map<String, Object> map = userService.getUserList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search",search);
		
		return null;
	}
	
//	REST
//	@RequestMapping(value = "checkDuplication", method = RequestMethod.GET)
//	public String checkDuplication(@ModelAttribute("userId") String userId, Model model) throws Exception{
//		
//		System.out.println("/user/json/checkDuplication : GET");
//
//		boolean result = userService.checkDuplication(userId);
//		
//		return null;
//	}
}
