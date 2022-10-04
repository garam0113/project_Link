package com.link.service.domain;

import java.sql.Date;

public class Meeting {

	private int meetingNo;
	private int clubNo;
	private String userId;
	private String meetingTitle;
	private String meetingImage;
	private String meetingDate;
	private String meetingTime;
	private String meetingPlace;
	private String meetingWeather;
	private Date meetingRegDate;
	private int meetingMember;
	private int meetingMaxMember;
	private String meetingContent;
		
	public Meeting() {
		// TODO Auto-generated constructor stub
	}

	public int getMeetingNo() {
		return meetingNo;
	}

	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
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

	public String getMeetingTitle() {
		return meetingTitle;
	}

	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}

	public String getMeetingImage() {
		return meetingImage;
	}

	public void setMeetingImage(String meetingImage) {
		this.meetingImage = meetingImage;
	}

	public String getMeetingDate() {
		return meetingDate;
	}

	public void setMeetingDate(String meetingDate) {
		this.meetingDate = meetingDate;
	}

	public String getMeetingTime() {
		return meetingTime;
	}

	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}

	public String getMeetingPlace() {
		return meetingPlace;
	}

	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}

	public String getMeetingWeather() {
		return meetingWeather;
	}

	public void setMeetingWeather(String meetingWeather) {
		this.meetingWeather = meetingWeather;
	}

	public Date getMeetingRegDate() {
		return meetingRegDate;
	}

	public void setMeetingRegDate(Date meetingRegDate) {
		this.meetingRegDate = meetingRegDate;
	}

	public int getMeetingMember() {
		return meetingMember;
	}

	public void setMeetingMember(int meetingMember) {
		this.meetingMember = meetingMember;
	}

	public int getMeetingMaxMember() {
		return meetingMaxMember;
	}

	public void setMeetingMaxMember(int meetingMaxMember) {
		this.meetingMaxMember = meetingMaxMember;
	}

	public String getMeetingContent() {
		return meetingContent;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	@Override
	public String toString() {
		return "Meeting [meetingNo=" + meetingNo + ", clubNo=" + clubNo + ", userId=" + userId + ", meetingTitle="
				+ meetingTitle + ", meetingImage=" + meetingImage + ", meetingDate=" + meetingDate + ", meetingTime="
				+ meetingTime + ", meetingPlace=" + meetingPlace + ", meetingWeather=" + meetingWeather
				+ ", meetingRegDate=" + meetingRegDate + ", meetingMember=" + meetingMember + ", meetingMaxMember="
				+ meetingMaxMember + ", meetingContent=" + meetingContent + "]";
	}

	
}
