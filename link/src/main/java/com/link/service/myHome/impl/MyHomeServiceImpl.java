package com.link.service.myHome.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.domain.Feed;
import com.link.service.domain.User;
import com.link.service.myHome.MyHomeDAO;
import com.link.service.myHome.MyHomeService;

@Service("myHomeServiceImpl")
public class MyHomeServiceImpl implements MyHomeService {
    
	@Autowired
	@Qualifier("myHomeDAOImpl")
	private MyHomeDAO myHomeDAO;
	
	public void setMyHomeDAO(MyHomeDAO myHomeDAO) {
		this.myHomeDAO = myHomeDAO;
	}
	
	public MyHomeServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("MyHomeServiceImpl default Constructor");
	}
	
	@Override
    public void updateMyHomeOpenCondition(User user) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl updateMyHomeOpenCondition start]\n");
		myHomeDAO.updateMyHomeOpenCondition(user);
		
	}
	
	@Override
	public void updateMyHomePushCondition(User user) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl updateMyHomePushCondition start]\n");
		myHomeDAO.updateMyHomePushCondition(user);
	}
	
	@Override
	public User getMyHomeCount(int totalVisitorCount) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl getMyHomeCount start]\n");
		User user = myHomeDAO.getMyHomeCount(totalVisitorCount);
		
		return user;
	}
	
	@Override
	public void updateMyHomeCount(User user) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl updateMyHomeCount start]\n");
		myHomeDAO.updateMyHomeCount(user);
	}

	@Override
	public void addFollow(User user) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl addFollow start]\n");
		myHomeDAO.addFollow(user);
		
		
	}
	
	@Override
	public User getFollow(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("\n[MyHomeServiceImpl getFollow start]\n");
		return myHomeDAO.getFollow(user);
	}

	@Override
	public Map<String, Object> getFollowList (Search search) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl getFollowList start]\n");
		
		List<User> list = myHomeDAO.getFollowList(search);
	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
	
		
		return map;
	}
	@Override
	public Map<String, Object> getFollowerList(Search search) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl getFollowerList start]\n");
		
		List<User> list= myHomeDAO.getFollowerList(search);

		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("followerList", list);

		
		return map;
	}
	
	public void updateFollow(User user) throws Exception{
		
		System.out.println("\n[MyHomeServiceImpl deleteFollow start]\n");
		myHomeDAO.updateFollow(user);
		
	}



	

}
