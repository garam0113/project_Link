package com.link.service.domain;

import java.sql.Date;

public class QandA {
	
	private int qandANo;				//Q&A 번호
	private String qandATitle;			//Q&A 제목
	private String qandAContent;		//Q&A 내용
	private User user;					//Q&A 이용자
	private String qandARegDate;		//Q&A 등록날짜
	private String qandAImage1;			//Q&A 이미지1
	private String qandAImage2;			//Q&A 이미지2
	private int qandACondition;			//Q&A 진행상황
	private String qandAAnswerContent;	//Q&A 답변내용
	private String qandAAnswerRegDate;	//Q&A 답변등록날짜
	private int qandAOpenCondition;		//Q&A 공개여부
	private int qandACount;				//Q&A 누적조회수
	
	
	
	public int getQandACount() {
		return qandACount;
	}
	public void setQandACount(int qandACount) {
		this.qandACount = qandACount;
	}
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
	public String getQandARegDate() {
		return qandARegDate;
	}
	public void setQandARegDate(String qandARegDate) {
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
	public String getQandAAnswerContent() {
		return qandAAnswerContent;
	}
	public void setQandAAnswerContent(String qandAAnswerContent) {
		this.qandAAnswerContent = qandAAnswerContent;
	}
	public String getQandAAnswerRegDate() {
		return qandAAnswerRegDate;
	}
	public void setQandAAnswerRegDate(String qandAAnswerRegDate) {
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
				+ qandAImage2 + ", qandACondition=" + qandACondition + ", qandAAnswerContent=" + qandAAnswerContent
				+ ", qandAAnswerRegDate=" + qandAAnswerRegDate + ", qandAOpenCondition=" + qandAOpenCondition
				+ ", qandACount=" + qandACount + "]";
	}
	
	

}
