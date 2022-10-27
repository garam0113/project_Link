package com.link.service.domain;

public class Live {
	
	private String roomName;
	private String nickName;
	private int limit;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "Live [roomName=" + roomName + ", nickName=" + nickName + ", limit=" + limit + "]";
	}

}
