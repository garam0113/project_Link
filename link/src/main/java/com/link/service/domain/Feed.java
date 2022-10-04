package com.link.service.domain;

import java.sql.Date;

public class Feed {

	private int feedNo;
	private String userId;
	private int openCondition;
	private String content;
	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String video;
	private String hashtag;
	private int likeCount;
	private int commentCount;
	private Date regDate;
	private Date updateDate;
	private int reportCondition;
	private int deleteCondition;
	
	public Feed() {
		// TODO Auto-generated constructor stub
	}
	
	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
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

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Feed [feedNo : " + feedNo + "] "
				+ "[userId : " + userId + "] "
				+ "[openCondition : " + openCondition + "] "
				+ "[content : " + content + "] "
				+ "[image1 : " + image1 + "] "
				+ "[image2 : " + image2 + "] "
				+ "[image3 : " + image3 + "] "
				+ "[image4 : " + image4 + "] "
				+ "[video : " + video + "] "
				+ "[hashtag : " + hashtag + "] "
				+ "[likeCount : " + likeCount + "] "
				+ "[commentCount : " + commentCount + "] "
				+ "[regDate : " + regDate + "] "
				+ "[updateDate : " + updateDate + "] "
				+ "[reportCondition : " + reportCondition + "] "
				+ "[deleteCondition : " + deleteCondition + "] ";
	}

}
