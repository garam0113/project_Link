package com.link.service.user;

import java.util.List;

import com.link.common.Search;
import com.link.service.domain.User;

public interface UserDAO {

	public void addUser(User user) throws Exception;
	
	public void addSnsUser(User user) throws Exception;
	
//	public void addBlockUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public void updateUser(User user) throws Exception;
	
	public void updateProfile(User user) throws Exception;
	
	public void updatePhoneNo(int phoneNo) throws Exception;
	
	public void updatePassword(User user) throws Exception;
	
//	public void updateBlockUser(User user) throws Exception;
	
	public void logout(User user) throws Exception;
	
	public void deleteUser(User user) throws Exception;
	
	public List<User> getUserList(Search search) throws Exception;
	
}
