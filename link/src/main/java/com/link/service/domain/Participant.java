package com.link.service.domain;

public class Participant {

	//Field
	private int participantNo;
	private int meetingNo;
	private User user;
	private Meeting meeting;
	
	
	public Participant() {
		// TODO Auto-generated constructor stub
	}


	public int getParticipantNo() {
		return participantNo;
	}


	public Meeting getMeeting() {
		return meeting;
	}


	public void setMeeting(Meeting meeting) {
		this.meeting = meeting;
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


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Participant [participantNo=");
		builder.append(participantNo);
		builder.append(", meetingNo=");
		builder.append(meetingNo);
		builder.append(", user=");
		builder.append(user);
		builder.append(", meeting=");
		builder.append(meeting);
		builder.append("]");
		return builder.toString();
	}


	
	
	

}
