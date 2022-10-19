package com.link.web.serviceCenter;



import java.util.Map;

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
import com.link.service.domain.QandA;
import com.link.service.domain.Report;
import com.link.service.serviceCenter.ServiceCenterService;

@RestController
@RequestMapping("/serviceCenterRest/*")
public class ServiceCenterRestController {
	
	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;
	
	public ServiceCenterRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass() + "default constructor");
	}
	
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;
	
	@RequestMapping(value = "/json/addReport", method = RequestMethod.POST)
	public String addReport(@RequestBody Report report,  Model model )throws Exception {
		
		System.out.println("/serviceCenterRest/json/addReport : POST");
		System.out.println(report);
//		serviceCenterService.getReportDuple(report);
	
		serviceCenterService.addReport(report);
		
		model.addAttribute("report", report);
		
		//돌려보내는 곳 신고하기 전 -1하고, alter 창? 완료 되었습니다 2개 변경
		return "forward:/serviceCenter/serviceCenterHome.jsp";
	}
	
	/*
	 * @RequestMapping(value="/json/getQandAList", method = RequestMethod.POST)
	 * public Map<String, Object> getQandAList(@RequestBody Search search, QandA
	 * qandA, String userId) throws Exception {
	 * 
	 * System.out.println("/serviceCenter/getQandAList :POST");
	 * if(search.getCurrentPage() == 0) { search.setCurrentPage(1); }
	 * search.setPageSize(pageSize); String userId1=""; Map<String, Object> map =
	 * serviceCenterService.getQandAList(search, qandA , userId1);
	 * 
	 * Page resultPage = new Page(search.getCurrentPage(),
	 * ((Integer)map.get("totalCount")), pageUnit, pageSize);
	 * 
	 * map.put("search", search); map.put("qandA", qandA); map.put("resultPage",
	 * resultPage); map.put("userId", "userId");
	 * 
	 * return map; }
	 */
	

}//RestController 끝
