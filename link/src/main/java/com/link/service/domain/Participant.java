package com.link.service.domain;

public class Participant {

	//Field
	private int participantNo;
	private int meetingNo;
	private String participantUserId;
	
	
	public Participant() {
		// TODO Auto-generated constructor stub
	}


	public int getParticipantNo() {
		return participantNo;
	}


	public void setParticipantNo(int participantNo) {
		this.participantNo = participantNo;
	}


	public int getMeetingNo() {
		return meetingNo;
	}


	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}


	public String getParticipantUserId() {
		return participantUserId;
	}


	public void setParticipantUserId(String participantUserId) {
		this.participantUserId = participantUserId;
	}


	@Override
	public String toString() {
		return "Participant [participantNo=" + participantNo + ", meetingNo=" + meetingNo + ", participantUserId="
				+ participantUserId + "]";
	}
	
	

}
