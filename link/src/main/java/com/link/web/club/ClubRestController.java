package com.link.web.club;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.club.ClubService;
import com.link.service.domain.Club;
import com.link.service.domain.ClubUser;

@RestController
@RequestMapping("/clubRest/*")
public class ClubRestController {

	
	@Autowired
	@Qualifier("clubServiceImpl")
	private ClubService clubService;
	
	public ClubRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + "default constructor") ;
	}
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@Value("#{commonPropertiest['pageUnit']")
	int pageUnit;


	@RequestMapping(value="json/getClubList/")
	public Map<String, Object> getClubList(@RequestBody Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/club/json/getClubList : GET / POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getClubList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);
		
		return map;
	}
	
	@RequestMapping(value="json/getClubMemberList/")
	public Map<String, Object> getClubMemberList(@RequestBody Search search, Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/club/json/getClubMemberList : GET / POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = clubService.getClubMemberList(search);
		
		Page resultPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage = " +resultPage);
		
		model.addAttribute("list",map.get("list"));
		model.addAttribute("resultPage",resultPage);
		model.addAttribute("search",search);
		
		return map;
	}
	
	@RequestMapping(value="json/updateMemberRole", method=RequestMethod.POST)
	public Club updateMemberRole(@RequestBody ClubUser clubUser, Model model) throws Exception {
		
		System.out.println("club/json/updateMemberRole : POST");
		
		clubService.updateMemberRole(clubUser);
		model.addAttribute("clubUser",clubUser);
		
		return clubService.getClub(clubUser.getClubNo());
	}
}
