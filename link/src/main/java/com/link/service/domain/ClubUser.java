package com.link.service.domain;

import java.sql.Date;

public class ClubUser {
	
	private int clubNo;
	private String userId;
	private Date applicationRegDate;
	private Date joinRegDate;
	private Date logoutDate;
	private String memberRole;
	private String approvalStatus;
	private String joinGreeting;
	

	public ClubUser() {
		// TODO Auto-generated constructor stub
	}


	public int getClubNo() {
		return clubNo;
	}
	
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getApplicationRegDate() {
		return applicationRegDate;
	}

	public void setApplicationRegDate(Date applicationRegDate) {
		this.applicationRegDate = applicationRegDate;
	}

	public Date getJoinRegDate() {
		return joinRegDate;
	}

	public void setJoinRegDate(Date joinRegDate) {
		this.joinRegDate = joinRegDate;
	}

	public Date getLogoutDate() {
		return logoutDate;
	}

	public void setLogoutDate(Date logoutDate) {
		this.logoutDate = logoutDate;
	}

	public String getMemberRole() {
		return memberRole;
	}

	public void setMemberRole(String memberRole) {
		this.memberRole = memberRole;
	}

	public String getApprovalStatus() {
		return approvalStatus;
	}

	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}

	public String getJoinGreeting() {
		return joinGreeting;
	}

	public void setJoinGreeting(String joinGreeting) {
		this.joinGreeting = joinGreeting;
	}


	@Override
	public String toString() {
		return "ClubUser [clubNo=" + clubNo + ", userId=" + userId + ", applicationRegDate=" + applicationRegDate
				+ ", joinRegDate=" + joinRegDate + ", logoutDate=" + logoutDate + ", memberRole=" + memberRole
				+ ", approvalStatus=" + approvalStatus + ", joinGreeting=" + joinGreeting + "]";
	}
		
	

}
