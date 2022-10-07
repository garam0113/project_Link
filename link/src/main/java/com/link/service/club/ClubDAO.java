package com.link.service.club;

import java.util.List;
import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;
import com.link.service.domain.Participant;
import com.link.service.domain.Pay;

public interface ClubDAO {

	public void addClub(Club club) throws Exception;
	
//	//JUNIT TEST
//	public int addClub(Club club) throws Exception;
	
	public Club getClub(int clubNo) throws Exception;
	
	public List<Club> getClubList(Search search) throws Exception;
	
	//GetMyClubList
//	public List<ClubUser> getMyClubList(Map<String, Object> map) throws Exception;
	
	public List<ClubUser> getMyClubList(Search search) throws Exception;
	
	public void deleteClub(int clubNo) throws Exception;
	
	public void updateClub(Club club) throws Exception;
	
	public void addApprovalCondition(ClubUser clubUser) throws Exception;
	
	//JUNIT TEST
//	public int addApprovalCondition(ClubUser clubUser) throws Exception;
	
	//가입신청현황 리스트 --> GetMyClubList와 병합
	//public List<ClubUser> getApprovalConditionList(Search search) throws Exception;
	
	public void updateApprovalCondition(ClubUser clubUser) throws Exception;
	
	public List<ClubUser> getClubMemberList(Search search) throws Exception;
	
	public void deleteClubMember(int clubUserNo) throws Exception;
	
	public void updateMemberRole(ClubUser clubUser) throws Exception;
	
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;
	
	//JUNIT TEST
//	public int addMeeting(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingList(Search search) throws Exception;
	
	public Meeting getMeeting(int meetingNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void deleteMeeting(int meetingNo) throws Exception;
	
//	public void addMeetingMember(Participant participant) throws Exception;
	
	//JUNIT TEST
	public int addMeetingMember(Participant participant) throws Exception;
	
	public void deleteMeetingMember(int participantNo) throws Exception;
	
	public List<Meeting> getMeetingMemberList(Search search) throws Exception;
	
	public void addMeetingPush(Meeting meeting) throws Exception;
	
	public int getTotalClubCount(Search search) throws Exception;
	
	//가입신청현황 리스트 --> GetMyClubList와 병합
//	public int getTotalApprovalConditionCount(Search search) throws Exception;
	
	public int getTotalClubMemberCount(Search search) throws Exception;
	
	public int getTotalMeetingCount(Search search) throws Exception;
	
	public int getTotalMeetingMemberCount(Search search) throws Exception;
	
	public int getTotalMyClubCount(Search search) throws Exception;
	
	//결제
	public List <ClubUser> updateClubMember(Pay pay, Search search) throws Exception;
	
}