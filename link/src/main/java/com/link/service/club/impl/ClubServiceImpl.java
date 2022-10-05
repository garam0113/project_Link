package com.link.service.club.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.club.ClubDAO;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;

@Service("clubServiceImpl")
public class ClubServiceImpl implements ClubService {

	
	
	//Field
	@Autowired
	@Qualifier("clubDAOImpl")
	private ClubDAO clubDAO;
	public void setClubDAO(ClubDAO clubDAO) {
		this.clubDAO = clubDAO;
	}
	
	
	public ClubServiceImpl() {
		System.out.println(this.getClass()+ " default constructor");
	}
	
	@Override
	public void addClub(Club club) throws Exception {
		clubDAO.addClub(club);
	}
	
	@Override
	public Club getClub(int clubNo) throws Exception {
		return clubDAO.getClub(clubNo);
	}
	
	@Override
	public void deleteClub(int clubNo) throws Exception {
		clubDAO.deleteClub(clubNo);
	}
	
	@Override
	public void updateClub(Club club) throws Exception {
		clubDAO.updateClub(club);
	}
	
	@Override
	public void addApprovalCondition(ClubUser clubUser) throws Exception {
		clubDAO.addApprovalCondition(clubUser);
	}
	
	@Override
	public void updateApprovalCondition(ClubUser clubUser) throws Exception {
		clubDAO.updateApprovalCondition(clubUser);
	}
	
	@Override
	public void deleteClubMember(int clubUserNo) throws Exception {
		clubDAO.deleteClubMember(clubUserNo);
	}
	
	@Override
	public void updateMemberRole(ClubUser clubUser) throws Exception {
		clubDAO.updateMemberRole(clubUser);
	}
	
	@Override
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception {
		clubDAO.deleteApprovalCondition(clubUser);
	}
	
	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		clubDAO.addMeeting(meeting);
		clubDAO.addMeetingPush(meeting);
	}
	
	@Override
	public Meeting getMeeting(int meetingNo) throws Exception {
		return clubDAO.getMeeting(meetingNo);
	}
	
	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		clubDAO.updateMeeting(meeting);
	}
	
	@Override
	public void deleteMeeting(Meeting meeting) throws Exception {
		clubDAO.deleteMeeting(meeting);
	}
	
	@Override
	public void addMeetingMember(Meeting meeting) throws Exception {
		clubDAO.addMeetingMember(meeting);
	}
	
	@Override
	public void deleteMeetingMember(Meeting meeting) throws Exception {
		clubDAO.deleteMeetingMember(meeting);
	}
	
	@Override
	public void addMeetingPush(Meeting meeting) throws Exception {
		clubDAO.addMeetingPush(meeting);
	}
	
	@Override
	public Map<String, Object> getClubList(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Club> list = clubDAO.getClubList(search);
		int totalClubCount = clubDAO.getTotalClubCount(search);
		
		map.put("list", list);
		map.put("totalClubCount", totalClubCount);
		
		return map;
	}
	
	@Override
	public Map<String, Object> getApprovalConditionList(Search search) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ClubUser> list = clubDAO.getApprovalConditionList(search);
		int totalApprovalConditionCount = clubDAO.getTotalApprovalConditionCount(search);
		
		map.put("list", list);
		map.put("totalApprovalConditionCount", totalApprovalConditionCount);
		
		return map;
	}
	
	@Override
	public Map<String, Object> getClubMemberList(Search search) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ClubUser> list = clubDAO.getClubMemberList(search);
		int totalClubMemberCount = clubDAO.getTotalClubMemberCount(search);
		
		map.put("list", list);
		map.put("totalClubMemberCount", totalClubMemberCount);
		
		return map;
	}
		
	@Override
	public Map<String, Object> getMeetingList(Search search) throws Exception {

		Map<String, Object> map = new HashMap<String,Object>();
		
		List<Meeting> list = clubDAO.getMeetingList(search);
		int totalMeetingCount = clubDAO.getTotalMeetingCount(search);
		
		map.put("list", list);
		map.put("totalMeetingCount", totalMeetingCount);
		
		return map;
	}
	
	@Override
	public Map<String, Object> getMeetingMemberList(Search search) throws Exception {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Meeting> list = clubDAO.getMeetingMemberList(search);
		int totalMeetingMemberCount = clubDAO.getTotalMeetingMemberCount(search);
		
		map.put("list", list);
		map.put("totalMeetingMemberCount",totalMeetingMemberCount);
		
		return map;
	}	
	
}
