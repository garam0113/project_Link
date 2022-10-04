package com.link.service.club;

import java.util.Map;

import com.link.common.Search;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;

public interface ClubService {

	public void addClub(Club club) throws Exception;
				
	public Club getClub(int clubNo) throws Exception;
	
//	public Club getMyClubList(String userId) throws Exception;

	public void deleteClub(int clubNo) throws Exception;
	
	public void updateClub(Club club) throws Exception;
	
	public void addApprovalCondition(ClubUser clubUser) throws Exception;
		
	public void updateApprovalCondition(ClubUser clubUser) throws Exception;
		
	public void deleteClubMember(int clubUserNo) throws Exception;
	
	public void updateMemberRole(ClubUser clubUser) throws Exception;
	
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;
		
	public Meeting getMeeting(int meetingNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void deleteMeeting(Meeting meeting) throws Exception;
	
	public void addMeetingMember(Meeting meeting) throws Exception;
	
	public void deleteMeetingMember(Meeting meeting) throws Exception;
		
	public void addMeetingPush(Meeting meeting) throws Exception;
	
	public Map<String, Object> getClubList(Search search) throws Exception;
	
	public Map<String, Object> getApprovalConditionList(Search search) throws Exception;
	
	public Map<String, Object> getClubMemberList(Search search) throws Exception;
	
	public Map<String, Object> getMeetingList(Search search) throws Exception;
	
	public Map<String, Object> getMeetingMemberList(Search search) throws Exception;
	
}
