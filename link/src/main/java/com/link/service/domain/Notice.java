package com.link.service.domain;

import java.sql.Date;


public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeImage1;
	private String noticeImage2;
	private Date noticeRegDate;
	private int noticeCount;
	private User userId;
	
	
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeImage1=" + noticeImage1 + ", noticeImage2=" + noticeImage2 + ", noticeRegDate="
				+ noticeRegDate + ", noticeCount=" + noticeCount + ", adminId=" + userId + "]";
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeImage1() {
		return noticeImage1;
	}
	public void setNoticeImage1(String noticeImage1) {
		this.noticeImage1 = noticeImage1;
	}
	public String getNoticeImage2() {
		return noticeImage2;
	}
	public void setNoticeImage2(String noticeImage2) {
		this.noticeImage2 = noticeImage2;
	}
	public Date getNoticeRegDate() {
		return noticeRegDate;
	}
	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}
	public int getNoticeCount() {
		return noticeCount;
	}
	public void setNoticeCount(int noticeCount) {
		
		this.noticeCount = noticeCount;
	}
	public User getUserId() {
		return userId;
	}
	public void setUserId(User adminId) {
		this.userId = adminId;
	}
	
}