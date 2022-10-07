package com.link.service.serviceCenter;

import java.util.List;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.domain.QandA;
import com.link.service.domain.Report;

public interface ServiceCenterDAO {

	public void addNotice(Notice notice) throws Exception;
	
	public Notice getNotice(int noticeNo) throws Exception;
	
	public void updateNotice(Notice notice) throws Exception;
	
	public void getCount(int noticeNo) throws Exception;
	
	public void deleteNotice(int noticeNo) throws Exception;
	
	//==여기까지가 공지사항 Notice ==//
	
	public List<Notice> getNoticeList(Search search) throws Exception;
	
	public List<Report> getReportList(Search search) throws Exception;
	
	public List<QandA> getQandAList(Search search) throws Exception;
	
	//List 들
	
	public void addQandA(QandA qandA) throws Exception;
	
	public QandA getQandA(int qandANo) throws Exception;
	
	public void updateQandA(QandA qandA) throws Exception;
	
	public void deleteQandA(int qandA) throws Exception;
	
	//==여기까지가 큐엔에이 QandA ==//
	
	public void addReport(Report report) throws Exception;
	
	public Report getReport(int reportNo) throws Exception;
	
	public void updateReport(Report report) throws Exception;
	
	public Report getReportDuple(Report report) throws Exception;
	
	//공통 메써드 
	
	public int getTotalCount(Search search, int a) throws Exception;

	
}
