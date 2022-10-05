package com.link.service.domain;

import java.sql.Date;

public class Report{
	

	private int reportNo;				//신고 번호
	private String reportTitle;			//신고 제목
	private String reportContent;		//신고 내용
	private int reportSource;			//신고 출처
	private User user1;					//신고 한 사람
	private User user2;					//신고 받은 사람
	private int reportReason;			//신고 사유
	private int reportCondition;		//신고 진행상황
	private Date reportRegDate;			//신고 등록 날짜
	private Date handleDate;			//신고 처리 날짜
	private String reportImage1;		//신고 이미지1
	private String reportImage2;		//신고 이미지2
	private int type;					//신고/알림 타입
	private ClubPost clubPost;			//모임 게시물
	private Comment clubPostComment;    //모임 게시물 댓글
	private Feed feed;					//피드
	private Comment feedCommentNo; 		//피드 댓글	
	private Live live;					//라이브
 	
	/* private Chatting chatiing; */
 	
 	
 	
	public int getReportNo() {
		return reportNo;
	}
	public Live getLive() {
		return live;
	}
	public void setLive(Live live) {
		this.live = live;
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
	public Date getReportRegDate() {
		return reportRegDate;
	}
	public void setReportRegDate(Date reportRegDate) {
		this.reportRegDate = reportRegDate;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public ClubPost getClubPost() {
		return clubPost;
	}
	public void setClubPost(ClubPost clubPost) {
		this.clubPost = clubPost;
	}
	public Comment getClubPostComment() {
		return clubPostComment;
	}
	public void setClubPostComment(Comment clubPostComment) {
		this.clubPostComment = clubPostComment;
	}
	public Feed getFeed() {
		return feed;
	}
	public void setFeed(Feed feed) {
		this.feed = feed;
	}
	public Comment getFeedCommentNo() {
		return feedCommentNo;
	}
	public void setFeedCommentNo(Comment feedCommentNo) {
		this.feedCommentNo = feedCommentNo;
	}
	
	
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportSource=" + reportSource + ", user1=" + user1 + ", user2=" + user2 + ", reportReason="
				+ reportReason + ", reportCondition=" + reportCondition + ", reportRegDate=" + reportRegDate
				+ ", handleDate=" + handleDate + ", reportImage1=" + reportImage1 + ", reportImage2=" + reportImage2
				+ ", type=" + type + ", clubPost=" + clubPost + ", clubPostComment=" + clubPostComment + ", feed="
				+ feed + ", feedCommentNo=" + feedCommentNo + "]";
	}
	



}
