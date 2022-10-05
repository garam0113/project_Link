package com.link.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.domain.Pay;
import com.link.service.domain.Report;
import com.link.service.domain.User;
import com.link.service.user.UserDAO;
import com.link.service.user.UserService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.addUser(user);
		
	}
	
//	@Override
//	public void addSnsUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		userDAO.addSnsUser(user);
//	}
	
//	@Override
//	public void addBlockUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public User getUser(User user) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.getUser(user);
	}

//	@Override
//	public User getUserId(User user) throws Exception {
//		// TODO Auto-generated method stub
//		return userDAO.getUserId(user);
//	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateUser(user);
	}

	/*
	 * @Override public void updateProfile(User user) throws Exception { // TODO
	 * Auto-generated method stub userDAO.updateProfile(user); }
	 * 
	 * @Override public void updatePhoneNo(User user) throws Exception { // TODO
	 * Auto-generated method stub userDAO.updatePhoneNo(user); }
	 * 
	 * @Override public void updatePassword(User user) throws Exception { // TODO
	 * Auto-generated method stub userDAO.updatePassword(user); }
	 */

//	@Override
//	public void updateBlockUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void logout(String userId) throws Exception {
		// TODO Auto-generated method stub
		userDAO.logout(userId);
	}

//	@Override
//	public void deleteUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		userDAO.deleteUser(user);
//	}
	
	@Override
	public void updateClub(Pay pay) throws Exception {
	   System.out.println(getClass() + ".updateClub(Pay pay) 도착");
	   userDAO.updateClub(pay);
	}// updateClub(Pay pay)
	
	@Override
	public boolean checkDuplication(User user) throws Exception {
		// TODO Auto-generated method stub
		boolean result = true;			//중복확인을 위해 Default 값을 True로 준다.
		
		User getUser = userDAO.getUser(user);
		
		if(getUser != null) {
			result = false;					//userId로 확인 하여 값이 있을 경우 False로 처리 한다.
		}
		
		return result;
	}

	@Override
	public void sendSMS(String phoneNo, String cerNo) {
		// TODO Auto-generated method stub
		String api_key = "NCSLBJQF2TUBD2NO";
		String api_secret = "Y7LH5YMNTFYTCWBHKDJ2YEJRTFOPE9EN";
		Message coolsms = new Message(api_key,api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNo);
		params.put("from", "01099636601");
		params.put("type", "SMS");
		params.put("text", "Link에서 보낸 인증번호["+cerNo+"]");
		params.put("app_version", "test app 1,2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch (CoolsmsException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
	
	@Override
	public void sendPasswordSMS(User user) {
		// TODO Auto-generated method stub
		String api_key = "NCSLBJQF2TUBD2NO";
		String api_secret = "Y7LH5YMNTFYTCWBHKDJ2YEJRTFOPE9EN";
		Message coolsms = new Message(api_key,api_secret);
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("to",(user.getPhoneNo()));
		param.put("from","01099636601");
		param.put("type","SMS");
		param.put("text","임시비밀번호발급["+user.getPassword()+"]");
		param.put("app_version", "test app 1,2");
		
		try {
			JSONObject obj = (JSONObject) coolsms.send(param);
			System.out.println(obj.toString());
		}catch (CoolsmsException e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		List<User> list = userDAO.getUserList(search);
		int totalCount = userDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userList", list);
		map.put("totalCount",new Integer(totalCount));
		return map;
	}

//	@Override
//	public Map<String, Object> getStopList(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		
//		List<User> stopUserList = userDAO.getUserList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("stopUserList", stopUserList);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}

//	@Override
//	public Map<String, Object> getForeverStopList(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		
//		List<User> list = userDAO.getUserList(search);
//		int totalCount = userDAO.getTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("ForeverStopUserList", list);
//		map.put("totalCount", new Integer(totalCount));
//		
//		return map;
//	}

//	@Override
//	public Map<String, Object> getPushList(Search search) throws Exception {
//		// TODO Auto-generated method stub
//		
//		List<Report> list = userDAO.getPushList(search);
//		int totalCount = userDAO.getPushTotalCount(search);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("Push", list);
//		map.put("tatalCount", totalCount);
//		
//		return map;
//	}


}
