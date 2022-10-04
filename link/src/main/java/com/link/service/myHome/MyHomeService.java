package com.link.service.myHome;

public interface MyHomeService  {

    public void updateMyHomeOpenCondition(User user) throws Exception;
	
	public void updateMyHomePushCondition(User user) throws Exception;
	
	public User getMyHomeCount(int totalVisitorCount) throws Exception;
	
	public void updateMyHomeCount(User user) throws Exception;
	
	public void addFollow(User user) throws Exception;
	
	public User getFollowList(String followId) throws Exception;
	
	public User getFollowerList(String followedId) throws Excepiton;
	
	public void deleteFollow(User user) throws Exception;
}



