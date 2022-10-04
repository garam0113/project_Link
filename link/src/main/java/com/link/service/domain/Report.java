package com.link.service.domain;

import java.sql.Date;

public class Report{
	

	private int reportNo;
	private String reportTitle;
	private String reportContent;
	private int reportSource;
	private User user1;
	private User user2;
	private int reportCode;
	private int reportReason;
	private int reportCondition;
	private Date reportRegdate;
	private Date handleDate;
	private String reportImage1;
	private String reportImage2;
	
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public int getReportSource() {
		return reportSource;
	}
	public void setReportSource(int reportSource) {
		this.reportSource = reportSource;
	}
	public User getUser1() {
		return user1;
	}
	public void setUser1(User user1) {
		this.user1 = user1;
	}
	public User getUser2() {
		return user2;
	}
	public void setUser2(User user2) {
		this.user2 = user2;
	}
	public int getReportCode() {
		return reportCode;
	}
	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}
	public int getReportReason() {
		return reportReason;
	}
	public void setReportReason(int reportReason) {
		this.reportReason = reportReason;
	}
	public int getReportCondition() {
		return reportCondition;
	}
	public void setReportCondition(int reportCondition) {
		this.reportCondition = reportCondition;
	}
	public Date getReportRegdate() {
		return reportRegdate;
	}
	public void setReportRegdate(Date reportRegdate) {
		this.reportRegdate = reportRegdate;
	}
	public Date getHandleDate() {
		return handleDate;
	}
	public void setHandleDate(Date handleDate) {
		this.handleDate = handleDate;
	}
	public String getReportImage1() {
		return reportImage1;
	}
	public void setReportImage1(String reportImage1) {
		this.reportImage1 = reportImage1;
	}
	public String getReportImage2() {
		return reportImage2;
	}
	public void setReportImage2(String reportImage2) {
		this.reportImage2 = reportImage2;
	}
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportSource=" + reportSource + ", user1=" + user1 + ", user2=" + user2 + ", reportCode="
				+ reportCode + ", reportReason=" + reportReason + ", reportCondition=" + reportCondition
				+ ", reportRegdate=" + reportRegdate + ", handleDate=" + handleDate + ", reportImage1=" + reportImage1
				+ ", reportImage2=" + reportImage2 + "]";
	}

}
