package com.link.service.domain;

import java.util.Date;

public class User {
	
	private String userId;
	private String receiveId;
	private String password;
	private String name;
	private String rrn;
	private String gender;
	private String phoneNo;
	private String email;
	private String role;
	private String nickName;
	private String profileImage;
	private String profileWriting;
	private String area1;
	private String area2;
	private String area3;
	private String category1;
	private String category2;
	private String category3;
	private String penaltyType;
	private int reportCount;
	private Date stopStartDate;
	private Date stopEndDate;
	private String outUserState;
	private Date outUserDate;
	private String addType;
	private Date logoutDate;
	private Date addUserDate;
	private int totalVisitCount;
	private String openCondition;
	private String pushCondition;
	private int joinClubCount;
	private int joinClubLimit;
	private String fbState;
	private String fbtype;
	private Boolean loginStart;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRrn() {
		return rrn;
	}
	public void setRrn(String rrn) {
		this.rrn = rrn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getProfileWriting() {
		return profileWriting;
	}
	public void setProfileWriting(String profileWriting) {
		this.profileWriting = profileWriting;
	}
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getArea2() {
		return area2;
	}
	public void setArea2(String area2) {
		this.area2 = area2;
	}
	public String getArea3() {
		return area3;
	}
	public void setArea3(String area3) {
		this.area3 = area3;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getCategory3() {
		return category3;
	}
	public void setCategory3(String category3) {
		this.category3 = category3;
	}
	public String getPenaltyType() {
		return penaltyType;
	}
	public void setPenaltyType(String penaltyType) {
		this.penaltyType = penaltyType;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public Date getStopStartDate() {
		return stopStartDate;
	}
	public void setStopStartDate(Date stopStartDate) {
		this.stopStartDate = stopStartDate;
	}
	public Date getStopEndDate() {
		return stopEndDate;
	}
	public void setStopEndDate(Date stopEndDate) {
		this.stopEndDate = stopEndDate;
	}
	public String getOutUserState() {
		return outUserState;
	}
	public void setOutUserState(String outUserState) {
		this.outUserState = outUserState;
	}
	public Date getOutUserDate() {
		return outUserDate;
	}
	public void setOutUserDate(Date outUserDate) {
		this.outUserDate = outUserDate;
	}
	public String getAddType() {
		return addType;
	}
	public void setAddType(String addType) {
		this.addType = addType;
	}
	public Date getLogoutDate() {
		return logoutDate;
	}
	public void setLogoutDate(Date logoutDate) {
		this.logoutDate = logoutDate;
	}
	public Date getAddUserDate() {
		return addUserDate;
	}
	public void setAddUserDate(Date addUserDate) {
		this.addUserDate = addUserDate;
	}
	public int getTotalVisitCount() {
		return totalVisitCount;
	}
	public void setTotalVisitCount(int totalVisitCount) {
		this.totalVisitCount = totalVisitCount;
	}
	public String getOpenCondition() {
		return openCondition;
	}
	public void setOpenCondition(String openCondition) {
		this.openCondition = openCondition;
	}
	public String getPushCondition() {
		return pushCondition;
	}
	public void setPushCondition(String pushCondition) {
		this.pushCondition = pushCondition;
	}
	public int getJoinClubCount() {
		return joinClubCount;
	}
	public void setJoinClubCount(int joinClubCount) {
		this.joinClubCount = joinClubCount;
	}
	public int getJoinClubLimit() {
		return joinClubLimit;
	}
	public void setJoinClubLimit(int joinClubLimit) {
		this.joinClubLimit = joinClubLimit;
	}
	public String getFbState() {
		return fbState;
	}
	public void setFbState(String fbState) {
		this.fbState = fbState;
	}
	public String getFbtype() {
		return fbtype;
	}
	public void setFbtype(String fbtype) {
		this.fbtype = fbtype;
	}
	public Boolean getLoginStart() {
		return loginStart;
	}
	public void setLoginStart(Boolean loginStart) {
		this.loginStart = loginStart;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", receiveId=" + receiveId + ", password=" + password + ", name=" + name
				+ ", rrn=" + rrn + ", gender=" + gender + ", phoneNo=" + phoneNo + ", email=" + email + ", role=" + role
				+ ", nickName=" + nickName + ", profileImage=" + profileImage + ", profilewriting=" + profileWriting
				+ ", area1=" + area1 + ", area2=" + area2 + ", area3=" + area3 + ", category1=" + category1
				+ ", category2=" + category2 + ", category3=" + category3 + ", penaltyType=" + penaltyType
				+ ", reportCount=" + reportCount + ", stopStartDate=" + stopStartDate + ", stopEndDate=" + stopEndDate
				+ ", outUserType=" + outUserState + ", outUserDate=" + outUserDate + ", addType=" + addType
				+ ", logoutDate=" + logoutDate + ", addUserDate=" + addUserDate + ", totalVisitCount=" + totalVisitCount
				+ ", openCondition=" + openCondition + ", pushCondition=" + pushCondition + ", joinClubCount="
				+ joinClubCount + ", joinClubLimit=" + joinClubLimit + ", fbState=" + fbState + ", fbtype=" + fbtype
				+ ", loginStart=" + loginStart + "]";
	}
	
}
