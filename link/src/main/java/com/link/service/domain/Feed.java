package com.link.service.domain;

import java.sql.Date;

public class Feed {

	private int feedNo;				// 피드 번호
	private User user;				// 회원 아이디
	private int openCondition;		// 공개 여부
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String video;
	private String hashtag;
	private int heartCount;
	private int commentCount;
	private Date regDate;
	private Date updateDate;
	private int reportCondition;
	private int deleteCondition;
	private int checkHeart;			// -1 	: 추가,		-2 : 취소
	private int checkMyHome;		// 1	: myHome 호출
	private int checkComment;
	private int currentPage;
	
	public Feed() {
		// TODO Auto-generated constructor stub
	}
	
	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getOpenCondition() {
		return openCondition;
	}

	public void setOpenCondition(int openCondition) {
		this.openCondition = openCondition;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getHeartCount() {
		return heartCount;
	}

	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getReportCondition() {
		return reportCondition;
	}

	public void setReportCondition(int reportCondition) {
		this.reportCondition = reportCondition;
	}

	public int getDeleteCondition() {
		return deleteCondition;
	}

	public void setDeleteCondition(int deleteCondition) {
		this.deleteCondition = deleteCondition;
	}

	public int getCheckHeart() {
		return checkHeart;
	}

	public void setCheckHeart(int checkHeart) {
		this.checkHeart = checkHeart;
	}

	public int getCheckMyHome() {
		return checkMyHome;
	}

	public void setCheckMyHome(int checkMyHome) {
		this.checkMyHome = checkMyHome;
	}

	public int getCheckComment() {
		return checkComment;
	}

	public void setCheckComment(int checkComment) {
		this.checkComment = checkComment;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Feed [feedNo : " + feedNo + "] "
				+ "[user : " + user + "] "
				+ "[openCondition : " + openCondition + "] "
				+ "[content : " + content + "] "
				+ "[image1 : " + image1 + "] "
				+ "[image2 : " + image2 + "] "
				+ "[image3 : " + image3 + "] "
				+ "[image4 : " + image4 + "] "
				+ "[video : " + video + "] "
				+ "[hashtag : " + hashtag + "] "
				+ "[heartCount : " + heartCount + "] "
				+ "[commentCount : " + commentCount + "] "
				+ "[regDate : " + regDate + "] "
				+ "[updateDate : " + updateDate + "] "
				+ "[reportCondition : " + reportCondition + "] "
				+ "[deleteCondition : " + deleteCondition + "] "
				+ "[checkHeart : " + checkHeart + "] "
				+ "[checkMyHome : " + checkMyHome + "] "
				+ "[checkComment : " + checkComment + "] "
				+ "[currentPage : " + currentPage + "] ";
	}

}
