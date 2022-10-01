package com.link.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.domain.User;
import com.link.service.user.UserDAO;

@Repository("UserDAOImpl")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSesstion) {
		this.sqlSession = sqlSesstion;
	}
	
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addUser(User user) throws Exception {
		
		sqlSession.insert("UserMapper.addUser", user);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addSnsUser(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("UserMapper.addSnsUser", user);
	}

//	@Override
//	public void addBlockUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		sqlSession.insert()
//	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return (User)sqlSession.selectOne("UserMapper.getUser",userId);
	}

	@Override
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateProfile(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updateProfil", user);
		
	}

	@Override
	public void updatePhoneNo(int phoneNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updatePhoneNo", phoneNo);
		
	}

	@Override
	public void updatePassword(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updatePassword", user);
		
	}

//	@Override
//	public void updateBlockUser(User user) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public void logout(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.updateLogoutDate", user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("UserMapper.deleteUser", user);
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
