package com.link.service.serviceCenter;

import java.util.List;

import com.link.common.Search;
import com.link.service.domain.Notice;

public interface ServiceCenterDAO {

	
	public void addNotice(Notice notice) throws Exception;
	
	public Notice getNotice(int noticeNo) throws Exception;
	
	public List<Notice> getNoticeList(Search search) throws Exception;
	
	public void updateNotice(Notice notice) throws Exception;
	
	public int getTotalCount(Search search) throws Exception;
	
	public void removeFileNotice();
	
	public void getCount(int noticeNo) throws Exception;
	
	//==여기까지가 Notice 공지사항 ==//
	
	
	
}
