package com.link.service.myHome;

public interface MyHomeDAO {

	public void updateMyHomeOpenCondition(User user) throws Exception;
	
	public void updateMyHomePushCondition(User user) throws Exception;
	
	public User getMyHomeCount(int totalVisitorCount) throws Exception;
	
	public void updateMyHomeCount(User user) throws Exception;
	
	
	
}
