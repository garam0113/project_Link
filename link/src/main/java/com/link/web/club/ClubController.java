package com.link.web.club;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.link.service.club.ClubService;
import com.link.service.domain.Club;

@Controller
@RequestMapping("/club/*")
public class ClubController {

	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	
	public ClubController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + " default constructor");
	}
	
	@Value("#{commonProperties[pageSize]}")
	int pageSize;
	
	@Value("#{commonProperties[pageUnit]}")
	int pageUnit;

	@RequestMapping(value="addClub", method=RequestMethod.POST)
	public String addClub(@ModelAttribute Club club) throws Exception {
		System.out.println("/addClub : POST");
		clubService.addClub(club);
		return "forward:/club/getClub.jsp";
	}
	
	@RequestMapping(value="getClub", method=RequestMethod.GET)
	public String getClub(@ModelAttribute Club club) throws Exception {
		clubService.getClub(club.getClubNo());
		
		return "forward:/club/getClub.jsp";
	}
}
