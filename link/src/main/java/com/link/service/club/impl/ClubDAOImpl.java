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
import com.link.service.domain.Participant;

@Repository("clubDAOImpl")
public class ClubDAOImpl implements ClubDAO {
	
	/*
	 * @Repository("clubDAOImpl") public class ClubDAOImpl implements ClubDAO {
	 */	

	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		System.out.println("::"+getClass() + ".setSqlSession() Call....");
		this.sqlSession = sqlSession;
	}
	
	
	public ClubDAOImpl() {
		System.out.println(this.getClass());
	}

	
	//Method
	@Override
	public void addClub(Club club) throws Exception {
		sqlSession.insert("ClubMapper.addClub",club);
	}
	
//	//JUNIT TEST
//	@Override
//	public int addClub(Club club) throws Exception {
//		return sqlSession.insert("ClubMapper.addClub",club);
//	}

	
	@Override
	public Club getClub(int clubNo) throws Exception {
		return sqlSession.selectOne("ClubMapper.getClub",clubNo);
	}
	

////	@Override
//	public Club getClub(int clubNo) throws Exception {
//		return (Club)sqlSession.selectOne("ClubMapper.getClub",clubNo);
//	}
	
	
	
	@Override
	public List<Club> getClubList(Search search) throws Exception {
		return sqlSession.selectList("ClubMapper.getClubList",search);
	}
	
	@Override
	public void deleteClub(int clubNo) throws Exception {
		sqlSession.delete("ClubMapper.deleteClub",clubNo);
	}
	
	@Override
	public void updateClub(Club club) throws Exception {
		sqlSession.update("ClubMapper.updateClub",club);
	}
	
	@Override
	public void addApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.insert("ClubMapper.addApprovalCondition",clubUser);
	}
	
	//JUNIT TEst
//	@Override
//	public int addApprovalCondition(ClubUser clubUser) throws Exception {
//		return sqlSession.insert("ClubMapper.addApprovalCondition",clubUser);
//	}
	
	@Override
	public List<ClubUser> getApprovalConditionList(Search search) throws Exception {
		return sqlSession.selectList("ClubMapper.getApprovalConditionList",search);
	}
	
	@Override
	public void updateApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.update("ClubMapper.updateApprovalCondition",clubUser);
	}
	
	@Override
	public List<ClubUser> getClubMemberList(Search search, int clubNo) throws Exception {
		return sqlSession.selectList("ClubMapper.getClubMemberList",search);
	}
	
	@Override
	public void deleteClubMember(int clubUserNo) throws Exception {
		sqlSession.delete("ClubMapper.deleteClubMember",clubUserNo);
	}
	
	@Override
	public void updateMemberRole(ClubUser clubUser) throws Exception {
		sqlSession.update("ClubMapper.updateMemberRole",clubUser);
	}
	
	@Override
	public void deleteApprovalCondition(ClubUser clubUser) throws Exception {
		sqlSession.delete("ClubMapper.deleteApprovalCondition",clubUser);		
	}
	
	@Override
	public void addMeeting(Meeting meeting) throws Exception {
		sqlSession.insert("ClubMapper.addMeeting",meeting); 
	}
	
	//JUNIT TEST
//	@Override
//	public int addMeeting(Meeting meeting) throws Exception {
//		return sqlSession.insert("ClubMapper.addMeeting",meeting); 
//	}
	
	@Override
	public List<Meeting> getMeetingList(Search search) throws Exception {
		return sqlSession.selectList("ClubMapper.getMeetingList",search);
	}
	
	@Override
	public Meeting getMeeting(int meetingNo) throws Exception {
		return sqlSession.selectOne("ClubMapper.getMeeting",meetingNo);
	}
	
	@Override
	public void updateMeeting(Meeting meeting) throws Exception {
		sqlSession.update("ClubMapper.updateMeeting",meeting);
	}
	
	@Override
	public void deleteMeeting(int meetingNo) throws Exception {
		sqlSession.delete("ClubMapper.deleteMeeting",meetingNo);
	}
	
//	@Override
//	public void addMeetingMember(Participant participant) throws Exception {
//		sqlSession.insert("ClubMapper.addMeetingMember",participant);
//	}
	
	//JUNIT TEST
	@Override
	public int addMeetingMember(Participant participant) throws Exception {
		return sqlSession.insert("ClubMapper.addMeetingMember",participant);
	}
	
	@Override
	public void deleteMeetingMember(int participant) throws Exception {
		sqlSession.delete("ClubMapper.deleteMeetingMember",participant);
	}
	
	@Override
	public List<Meeting> getMeetingMemberList(Search search) throws Exception {
		return sqlSession.selectList("ClubMapper.getMeetingMemberList",search);
	}
	
	@Override
	public void addMeetingPush(Meeting meeting) throws Exception {
		
	}
	
	@Override
	public int getTotalClubCount(Search search) {
		return sqlSession.selectOne("ClubMapper.getTotalClubCount",search);
	}
	
	@Override
	public int getTotalApprovalConditionCount(Search search) {
		return sqlSession.selectOne("ClubMapper.getTotalApprovalConditionCount",search);
	}
	
	@Override
	public int getTotalClubMemberCount(Search search) {
		return sqlSession.selectOne("ClubMapper.getTotalClubMemberCount",search);
	}
	
	@Override
	public int getTotalMeetingCount(Search search) {
		return sqlSession.selectOne("ClubMapper.getTotalMeetingCount",search);
	}
	
	@Override
	public int getTotalMeetingMemberCount(Search search) {
		return sqlSession.selectOne("ClubMapper.getTotalMeetingMemberCount",search);
	}
}
