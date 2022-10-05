package com.link.web.user;

import java.util.Map;
import java.util.Random;

import javax.servlet.Servlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
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
	public String addUser(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/addUser : POST");
		
		userService.addUser(user);	//회원가입 정보 DB저장
		
		User getUser = userService.getUser(user);
		
		session.setAttribute("user", getUser);
		
		return "redirect:/main.jsp";
	}
	
	@RequestMapping(value="addSnsUser", method = RequestMethod.POST)
	public String addSnsUser(@ModelAttribute("user") User user) throws Exception{
		
		System.out.println("/user/addSnsUser : POST");
		
		Random rand = new Random();
		String no = "";
			
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			no += ran;
		}	
			user.setUserId("Link"+no);	//SNS회원 ID 임의로 생성 하여 저장
			
			userService.addUser(user);	//SNS회원 ID, 가입유형, 가입날짜 DB저장
			
		return "forward:/user/updateProfile.jsp";
	}
	
	@RequestMapping(value="getUser", method = RequestMethod.GET)
	public String getUser(@ModelAttribute("userId") String userId, Model model) throws Exception{
		
		System.out.println("/user/getUser : GET");
		
		User user = new User();
		
		user.setUserId(userId);
		
		User getUser = userService.getUser(user);	//회원의 정보를 얻기위해 회원ID DB전송
		
		model.addAttribute("user", getUser);	//DB에서 전송받은 회원의 정보를 Key(user)에 저장
		
		return "forward:/user/getUserView.jsp";
	}

	@RequestMapping(value="getUserId", method = RequestMethod.GET)
	public String getUserId() throws Exception{	
		
		System.out.println("/user/getUser : GET");
		
		return "forward:/user/getUserIdView.jsp";	// 화면Navigation
	}

	@RequestMapping(value="getUserId", method = RequestMethod.POST)
	public String getUserId(@ModelAttribute("user") User user, Model model) throws Exception{		
		
		System.out.println("/user/getUser : POST");
		
		User userId = userService.getUser(user);	//DB에 저장된 회원 정보 userId 객체에 set
		
		model.addAttribute("userId",userId);	//set한 회원Data session에 저장 
		
		return "forward:/user/getUserId.jsp";
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.GET)
	public String updateUser(@ModelAttribute("userId") String userId, Model model ) throws Exception{
		
		System.out.println("/user/updateUser : GET");
		
		User user = new User();
		
		user.setUserId(userId);
		
		User getUser = userService.getUser(user);	//회원정보를 수정하기 전 기존 회원 정보를 DB에서 출력 
		
		model.addAttribute("user", getUser);	//DB의 정보를 Key(user)에 저장
		
		return "forward:/user/getUserView.jsp";
	}
	
	@RequestMapping(value="updateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user") User user, Model model, HttpSession session) throws Exception{
		
		System.out.println("/user/updateUser : POST");
		
		userService.updateUser(user);	//입력받은 회원 정보를 DB에 저장

		String sessionId = ((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return "forward:/user/updateUser.jsp";
	}
	
	@RequestMapping(value="updateProfile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("uesr") User user, Model model, HttpSession session) throws Exception {
		
		System.out.println("/user/updateProfile : POST");
		
		userService.updateUser(user);	//SNS회원 프로필 작성
		
		String sessionId = ((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())) {
			session.setAttribute("user", user);
		}
		
		return "forward:/user/updateProfileView.jsp";
	}
	
	//REST
//	@RequestMapping(value = "updatePhoneNo", method = RequestMethod.GET)
//	public String updatePhoneNo(@ModelAttribute("user") User user, Model model) throws Exception{
//		
//	}
	
	@RequestMapping(value = "getPassword", method = RequestMethod.GET)
	public String getPassword() throws Exception{
		
		System.out.println("/user/updatePassword : GET");	//비밀번호 찾기 화면 Navigation
		
		return "forward:/user/getPasswordView.jsp";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() throws Exception{
		
		System.out.println("/user/login : GET");
		
		return "redirect:/user/login.jsp";	//login 화면 Navigation
	}
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/login : POST");
		
		User getUser = userService.getUser(user);	//입력받은 회원ID로 회원 정보 확인
		
		if(user.getPassword().equals(getUser.getPassword())) {
			session.setAttribute("user", getUser);	//DB에 있는 회원 pass와 입력받은 pass가 일치 할 경우 session에 정보 저장 후 로그인처리
		}
		
		return "redirect:/main.jsp";
	}

	@RequestMapping(value = "snsLogin", method = RequestMethod.POST)
	public String snsLogin(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/snsLogin : GET");
		
		User getUser = userService.getUser(user);	//SNS로그인시 snsUserId가 DB에 있는지 확인
		
		if(getUser != null && user.getAddType().equals(getUser.getAddType())) {
			
			session.setAttribute("user", getUser);	//입력받은 snsUserId와 가입유형 번호가 DB에 있는 데이터 내용과 같을 시 session에 정보 저장
			
			return "redirect:/main.jsp";
		}else {
			return "redirect:/user/addSnsUser";
		}
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(@ModelAttribute("userId") String userId, HttpSession session) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		userService.logout(userId);	//logout시간 저장
		
		session.invalidate();	//session정보 제거
		
		return "redirect:/main.jsp";
	}
	
	@RequestMapping(value = "deleteUser", method = RequestMethod.GET)
	public String deleteUser(@ModelAttribute("userId")String userId, @ModelAttribute("UserState") String userState) throws Exception{
		
		System.out.println("/user/deleteUser : GET");
		
		User user = new User();	// get방식으로 들어온 Data 저장을 위해 생성
		
		user.setUserId(userId);	//회원ID domain객체에 Set
		user.setOutUserState(userState);	//회원상태 domain객체에 Set
		
		userService.updateUser(user);	//회원 정보를 DB에 저장
		
		return "redirect:/main.jsp";
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
		
		return "forward:/user/getUesrList.jsp";
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
