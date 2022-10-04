package com.link.service.domain;

import java.sql.Date;

public class QandA {
	
	private int qandANo;
	private String qandATitle;
	private String qandAContent;
	private User user;
	private Date qandARegDate;
	private String qandAImage1;
	private String qandAImage2;
	private int qandACondition;
	private String qandAAnswerContetnt;
	private Date qandAAnswerRegDate;
	private int qandAOpenCondition;
	
	
	
	public int getQandANo() {
		return qandANo;
	}
	public void setQandANo(int qandANo) {
		this.qandANo = qandANo;
	}
	public String getQandATitle() {
		return qandATitle;
	}
	public void setQandATitle(String qandATitle) {
		this.qandATitle = qandATitle;
	}
	public String getQandAContent() {
		return qandAContent;
	}
	public void setQandAContent(String qandAContent) {
		this.qandAContent = qandAContent;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getQandARegDate() {
		return qandARegDate;
	}
	public void setQandARegDate(Date qandARegDate) {
		this.qandARegDate = qandARegDate;
	}
	public String getQandAImage1() {
		return qandAImage1;
	}
	public void setQandAImage1(String qandAImage1) {
		this.qandAImage1 = qandAImage1;
	}
	public String getQandAImage2() {
		return qandAImage2;
	}
	public void setQandAImage2(String qandAImage2) {
		this.qandAImage2 = qandAImage2;
	}
	public int getQandACondition() {
		return qandACondition;
	}
	public void setQandACondition(int qandACondition) {
		this.qandACondition = qandACondition;
	}
	public String getQandAAnswerContetnt() {
		return qandAAnswerContetnt;
	}
	public void setQandAAnswerContetnt(String qandAAnswerContetnt) {
		this.qandAAnswerContetnt = qandAAnswerContetnt;
	}
	public Date getQandAAnswerRegDate() {
		return qandAAnswerRegDate;
	}
	public void setQandAAnswerRegDate(Date qandAAnswerRegDate) {
		this.qandAAnswerRegDate = qandAAnswerRegDate;
	}
	public int getQandAOpenCondition() {
		return qandAOpenCondition;
	}
	public void setQandAOpenCondition(int qandAOpenCondition) {
		this.qandAOpenCondition = qandAOpenCondition;
	}
	
	
	@Override
	public String toString() {
		return "QandA [qandANo=" + qandANo + ", qandATitle=" + qandATitle + ", qandAContent=" + qandAContent + ", user="
				+ user + ", qandARegDate=" + qandARegDate + ", qandAImage1=" + qandAImage1 + ", qandAImage2="
				+ qandAImage2 + ", qandACondition=" + qandACondition + ", qandAAnswerContetnt=" + qandAAnswerContetnt
				+ ", qandAAnswerRegDate=" + qandAAnswerRegDate + ", qandAOpenCondition=" + qandAOpenCondition + "]";
	}
	
	

}
