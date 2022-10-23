package com.link.service.club;

import java.util.List;
import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Club;
import com.link.service.domain.ClubPost;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;
import com.link.service.domain.Participant;
import com.link.service.domain.Pay;

public interface ClubService {

	public void addClub(Club club) throws Exception;
	
//	//JUNIT TEST
//	public int addClub(Club club) throws Exception;
	
	//getClub bak
//	public Club getClub(int clubNo) throws Exception;
	
	public Map<String, Object> getClub(int clubNo) throws Exception;

	public void deleteClub(int clubNo) throws Exception;
	
	public void updateClub(Club club) throws Exception;
	
	public void addApprovalCondition(ClubUser clubUser) throws Exception;
	
	//JUNIT TEST
//	public int addApprovalCondition(ClubUser clubUser) throws Exception;
		
	public void updateApprovalCondition(ClubUser clubUser) throws Exception;
		
	public void deleteClubMember(ClubUser clubUser) throws Exception;
	
	public void updateMemberRole(ClubUser clubUser) throws Exception;
	
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;
	
	//JUNIT TEST
//	public int addMeeting(Meeting meeting) throws Exception;
		
	public Map<String, Object> getMeeting(int meetingNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void deleteMeeting(int meetingNo) throws Exception;
	
	public void addMeetingMember(Participant participant) throws Exception;
	
	public void deleteMeetingMember(Participant participant) throws Exception;
		
	public void addMeetingPush(Meeting meeting) throws Exception;
	
	public Map<String, Object> getClubList(Search search) throws Exception;
	
	//GetMyClubList
//	public Map<String, Object> getMyClubList(Map<String, Object> map) throws Exception;
	
//	public Map<String, Object> getMyClubList(Search search) throws Exception;
	
	//가입신청현황 리스트 --> GetMyClubList와 병합
	public Map<String, Object> getApprovalConditionList(Search search) throws Exception;
	
	public Map<String, Object> getClubMemberList(Search search) throws Exception;
	
	public Map<String, Object> getMeetingList(Search search) throws Exception;
	
	public Map<String, Object> getMeetingMemberList(Search search) throws Exception;
	
	//결제
	public List<ClubUser> updateClubMember(Pay pay, Search search) throws Exception;

	
}
