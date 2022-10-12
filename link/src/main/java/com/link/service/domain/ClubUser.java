package com.link.service.domain;

import java.sql.Date;

public class ClubUser {
	
	private int clubUserNo;
	private int clubNo;
	private User user;
	private Date applicationRegDate;
	private Date joinRegDate;
	private Date logoutDate;
	private String memberRole;
	private String approvalCondition;
	private String joinGreeting;
	private String nickName;
	private Club club;
	

	public ClubUser() {
		// TODO Auto-generated constructor stub
	}


	public int getClubUserNo() {
		return clubUserNo;
	}


	public void setClubUserNo(int clubUserNo) {
		this.clubUserNo = clubUserNo;
	}


	public int getClubNo() {
		return clubNo;
	}
	
	public void setClubNo(int clubNo) {
		this.clubNo = clubNo;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public String getApprovalCondition() {
		return approvalCondition;
	}

	public void setApprovalCondition(String approvalCondition) {
		this.approvalCondition = approvalCondition;
	}

	public String getJoinGreeting() {
		return joinGreeting;
	}

	public void setJoinGreeting(String joinGreeting) {
		this.joinGreeting = joinGreeting;
	}


	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public Club getClub() {
		return club;
	}


	public void setClub(Club club) {
		this.club = club;
	}


	@Override
	public String toString() {
		return "ClubUser [clubUserNo=" + clubUserNo + ", clubNo=" + clubNo + ", user=" + user + ", applicationRegDate="
				+ applicationRegDate + ", joinRegDate=" + joinRegDate + ", logoutDate=" + logoutDate + ", memberRole="
				+ memberRole + ", approvalCondition=" + approvalCondition + ", joinGreeting=" + joinGreeting
				+ ", nickName=" + nickName + ", club=" + club + "]";
	}


	





	

}
