package com.link.web.serviceCenter;



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
	

	

}//RestController 끝
