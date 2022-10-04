package com.link.service.club.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.link.common.Search;
import com.link.service.club.ClubDAO;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;
import com.link.service.domain.Meeting;

@Repository("clubDAOImpl")
public class ClubDAOImpl implements ClubDAO {

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	public ClubDAOImpl() {
		System.out.println(this.getClass());
	}

	
	//Method
	public void addClub(Club club) throws Exception {
		sqlSession.insert("ClubMapper.addClub",club);
	}
	
	public void getClub(int clubNo) throws Exception {
		sqlSession.selectOne("ClubMapper.getClub",clubNo);
	}
	
	public List<Club> getClubList(Search search) throws Exception {
		return null;
	}
	
	public void deleteClub(Club club) throws Exception {
		sqlSession.delete("ClubMapper.deleteClub",club);
	}
	
	public void updateClub(Club club) throws Exception {
		sqlSession.update("ClubMapper.updateClub",club);
	}
	
	public void addApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.insert("ClubMapper.addApprovalCondition",clubUser);
	}
	
	public List<ClubUser> getApprovalConditionList(Search search) throws Exception {
		return null;
	}
	
	public void updateApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.update("ClubMapper.updateApprovalCondition",clubUser);
	}
	
	public List<ClubUser> getClubMemberList(Search search) throws Exception {
		return null;
	}
	
	public void deleteClubMember(ClubUser clubUser) throws Exception {
		sqlSession.delete("ClubMapper.deleteClubMember",clubUser);
	}
	
	public void updateMemberRole(ClubUser clubUser) throws Exception {
		sqlSession.update("ClubMapper.updateMemberRole",clubUser);
	}
	
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.delete("ClubMapper.deleteApprovalCondition",clubUser);		
	}
	
	public void addMeeting(Meeting meeting) throws Exception {
		sqlSession.insert("ClubMapper.addMeeting",meeting); 
	}
	
	public List<Meeting> getMeetingList(Search search) throws Exception {
		return null;
	}
	
	public Meeting getMeeting(int meetingNo) throws Exception {
		return null;
	}
	
	public void updateMeeting(Meeting meeting) throws Exception {
		sqlSession.update("ClubMapper.updateMeeting",meeting);
	}
	
	public void deleteMeeting(Meeting meeting) throws Exception {
		sqlSession.delete("ClubMapper.deleteMeeting",meeting);
	}
	
	public void addMeetingMember(Meeting meeting) throws Exception {
		sqlSession.insert("ClubMapper.addMeetingMember",meeting);
	}
	
	public void deleteMeetingMember(Meeting meeting) throws Exception {
		sqlSession.delete("ClubMapper.deleteMeetingMember",meeting);
	}
	
	public List<Meeting> getMeetingMemberList(Search search) throws Exception {
		return null;
	}
	
	public void addMeetingPush(Meeting meeting) throws Exception {
		
	}
}
