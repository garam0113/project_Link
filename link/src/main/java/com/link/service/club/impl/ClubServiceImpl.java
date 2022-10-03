package com.link.service.club.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.service.club.ClubDAO;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;

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
		System.out.println(this.getClass());
	}
	
	public void addClub(Club club) throws Exception {
		clubDAO.addClub(club);
	}
	
	public void getClub(int clubNo) throws Exception {
		clubDAO.getClub(clubNo);
	}

}
