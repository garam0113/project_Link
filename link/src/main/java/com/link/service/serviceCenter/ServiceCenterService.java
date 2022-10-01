package com.link.service.serviceCenter;

import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Notice;

public interface ServiceCenterService {
	
	public void addNotice(Notice notice) throws Exception;
	
	public Notice getNotice(int noticeNo) throws Exception;
	
	public Map<String, Object> getNoticeList(Search search) throws Exception;
	
	public void updateNotice(Map<String, Object> map) throws Exception;

	public void removeFileNotice();
	
	public void getCount(int noticeNo) throws Exception;
	
	//==여기까지가 공지사항 Notice ==//
	
	
	
	

}
