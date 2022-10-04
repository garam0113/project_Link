package com.link.service.club;

import java.util.List;

import com.link.common.Search;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;

public interface ClubDAO {

	public void addClub(Club club) throws Exception;
	
	public void getClub(int clubNo) throws Exception;
	
	public List<Club> getClubList(Search search) throws Exception;
	
	public void deleteClub(Club club) throws Exception;
	
	public void updateClub(Club club) throws Exception;
	
	public void addApprovalCondition(ClubUser clubUser) throws Exception;
	
	public List<ClubUser> getApprovalConditionList(Search search) throws Exception;
	
	public void updateApprovalCondition(ClubUser clubUser) throws Exception;
	
	public List<ClubUser> getClubMemberList(Search search) throws Exception;
	
	public void deleteClubMember(ClubUser clubUser) throws Exception;
	
	public void updateMemberRole(ClubUser clubUser) throws Exception;
	
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception;
	
	public void addMeeting(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingList(Search search) throws Exception;
	
	public Meeting getMeeting(int meetingNo) throws Exception;
	
	public void updateMeeting(Meeting meeting) throws Exception;
	
	public void deleteMeeting(Meeting meeting) throws Exception;
	
	public void addMeetingMember(Meeting meeting) throws Exception;
	
	public void deleteMeetingMember(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingMemberList(Search search) throws Exception;
	
	public void addMeetingPush(Meeting meeting) throws Exception;
	
	
}