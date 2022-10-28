package com.link.service.domain;

public class Live {
	
	private String roomName;
	private String profileImage;
	private int limit;
	private int member;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	} 

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Live [roomName=" + roomName + ", profileImage=" + profileImage + ", limit=" + limit + ", member=" + member
				+ "]";
	}

}
