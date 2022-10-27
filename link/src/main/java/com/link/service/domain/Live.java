package com.link.service.domain;

public class Live {
	
	private String roomName;

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "Live [roomName=" + roomName + "]";
	}

}
