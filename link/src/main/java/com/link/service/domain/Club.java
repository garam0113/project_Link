package com.link.service.domain;

import java.sql.Date;

public class Club {

	private int clubNo;
	private String userId;
	private String clubTitle;
	private String clubDetail;
	private Date clubRegDate;
	private String clubImage;
	private int currentMember;
	private int clubMaxMember;
	private String clubCategory;
	private String clubArea;
	
	
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
	public String getClubTitle() {
		return clubTitle;
	}
	public void setClubTitle(String clubTitle) {
		this.clubTitle = clubTitle;
	}
	public String getClubDetail() {
		return clubDetail;
	}
	public void setClubDetail(String clubDetail) {
		this.clubDetail = clubDetail;
	}
	public Date getClubRegDate() {
		return clubRegDate;
	}
	public void setClubRegDate(Date clubRegDate) {
		this.clubRegDate = clubRegDate;
	}
	public String getClubImage() {
		return clubImage;
	}
	public void setClubImage(String clubImage) {
		this.clubImage = clubImage;
	}
	public int getCurrentMember() {
		return currentMember;
	}
	public void setCurrentMember(int currentMember) {
		this.currentMember = currentMember;
	}
	public int getClubMaxMember() {
		return clubMaxMember;
	}
	public void setClubMaxMember(int clubMaxMember) {
		this.clubMaxMember = clubMaxMember;
	}
	public String getClubCategory() {
		return clubCategory;
	}
	public void setClubCategory(String clubCategory) {
		this.clubCategory = clubCategory;
	}
	public String getClubArea() {
		return clubArea;
	}
	public void setClubArea(String clubArea) {
		this.clubArea = clubArea;
	}
	@Override
	public String toString() {
		return "Club [clubNo=" + clubNo + ", userId=" + userId + ", clubTitle=" + clubTitle + ", clubDetail="
				+ clubDetail + ", clubRegDate=" + clubRegDate + ", clubImage=" + clubImage + ", currentMember="
				+ currentMember + ", clubMaxMember=" + clubMaxMember + ", clubCategory=" + clubCategory + ", clubArea="
				+ clubArea + "]";
	}
	
	
}
