package com.link.service.domain;

import java.util.Date;

public class User {
	
	String userid;
	String receiveId;
	String password;
	String name;
	int rrn;
	String gender;
	int phoneNo;
	String email;
	String role;
	String nickName;
	String profileImage;
	String profilewriting;
	String area1;
	String area2;
	String area3;
	String category1;
	String category2;
	String category3;
	String penaltyType;
	int reportCount;
	Date stopStartDate;
	Date stopEndDate;
	String outUserType;
	Date outUserDate;
	String addType;
	Date logoutDate;
	Date addUserDate;
	int totalVisitCount;
	String openCondition;
	String pushCondition;
	int joinClubCount;
	String followState;
	Boolean loginStart;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void getReceiveId(String receiveId) {
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
	public int getRrn() {
		return rrn;
	}
	public void setRrn(int rrn) {
		this.rrn = rrn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(int phoneNo) {
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
	public String getProfilewriting() {
		return profilewriting;
	}
	public void setProfilewriting(String profilewriting) {
		this.profilewriting = profilewriting;
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
	public String getOutUserType() {
		return outUserType;
	}
	public void setOutUserType(String outUserType) {
		this.outUserType = outUserType;
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
	public String getFollowState() {
		return followState;
	}
	public void setFollowState(String followState) {
		this.followState = followState;
	}
	public Boolean getLoginStart() {
		return loginStart;
	}
	public void setLoginStart(Boolean loginStart) {
		this.loginStart = loginStart;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", ReceiveId=" + receiveId + ", password=" + password + ", name=" + name
				+ ", rrn=" + rrn + ", gender=" + gender + ", phoneNo=" + phoneNo + ", email=" + email + ", role=" + role
				+ ", nickName=" + nickName + ", profileImage=" + profileImage + ", profilewriting=" + profilewriting
				+ ", area1=" + area1 + ", area2=" + area2 + ", area3=" + area3 + ", category1=" + category1
				+ ", category2=" + category2 + ", category3=" + category3 + ", penaltyType=" + penaltyType
				+ ", reportCount=" + reportCount + ", stopStartDate=" + stopStartDate + ", stopEndDate=" + stopEndDate
				+ ", outUserType=" + outUserType + ", outUserDate=" + outUserDate + ", addType=" + addType
				+ ", logoutDate=" + logoutDate + ", addUserDate=" + addUserDate + ", totalVisitCount=" + totalVisitCount
				+ ", openCondition=" + openCondition + ", pushCondition=" + pushCondition + ", joinClubCount="
				+ joinClubCount + ", followState=" + followState + ", loginStart=" + loginStart + "]";
	}

}
