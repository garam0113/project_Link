package com.link.web.serviceCenter;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.link.common.Page;
import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.domain.QandA;
import com.link.service.domain.Report;
import com.link.service.domain.User;
import com.link.service.serviceCenter.ServiceCenterService;

@Controller

@RequestMapping("/serviceCenter/*")
public class ServiceCenterController {

	@Autowired
	@Qualifier("ServiceCenterServiceImpl")
	private ServiceCenterService serviceCenterService;
	
	
	public ServiceCenterController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass()+ " default constructor ");
	}
	
	@Value("#{commonProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{commonProperties['pageUnit'] ?: 10}")
	int pageUnit;
	
	@RequestMapping(value = "addNotice" , method = RequestMethod.POST)
	public String addNotice(@ModelAttribute Notice notice, @RequestParam("image") MultipartFile[] file, Model model) throws Exception {
		System.out.println(notice);
		User user = new User();																			//★ 지워야됨
		user.setUserId("admin1");																		//★ 
		notice.setUserId(user);																			//★
		System.out.println("/ServiceCenter/addNotice : GET & POST");
		
		//파일 업로드 시작
		int fileCount = 0;
		
		String root ="C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles\\";
		 
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println(files.getOriginalFilename());
			
			if(fileCount != file.length) {
			  notice.setNoticeImage2(files.getOriginalFilename());
			}
			 notice.setNoticeImage1(files.getOriginalFilename());
			File saveFile = new File(root+ files.getOriginalFilename());
			boolean isExists = saveFile.exists();
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}

		serviceCenterService.addNotice(notice);
		
		model.addAttribute("notice", notice);
		System.out.println(notice+"확인용 데이터");
		return "forward:/serviceCenter/addNotice.jsp";
	}


		
	
	@RequestMapping(value = "getNotice")
	public String getNotice(@ModelAttribute Notice notice, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/getNotice : GET & POST");
		
		User user = new User();																			//★ 지워야됨
		user.setUserId("admin1");																		//★ 
		notice.setUserId(user);
		
		serviceCenterService.getCount(notice.getNoticeNo());
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		
		model.addAttribute("notice", notice);
		model.addAttribute("menu", menu);
		
		String URI = null;
		
		if(menu.equals("manage")) {
			URI = "forward:/serviceCenter/updateNotice";
		} else if (menu.equals("search")) {
			URI = "forward:/serviceCenter/getNotice.jsp";
		} else {
			URI = "forward:/serviceCenter/getNotice.jsp";   //지워야됨
		}
		
		return URI;
	}
	
	
	@RequestMapping(value = "deleteNotice")
	public String deleteNotice(@ModelAttribute Notice notice, @RequestParam(value ="menu", defaultValue ="search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		System.out.println("/ServiceCenter/deleteNotice : GET & POST");
		serviceCenterService.deleteNotice(notice.getNoticeNo());
		return "forward:/serviceCenter/getNoticeList";
		
	}

	@RequestMapping(value = "updateNotice", method = RequestMethod.GET)
	public String updateNotice(@ModelAttribute Notice notice, Model model) throws Exception {
		
		System.out.println("/serviceCenter/updateNotice : GET");
		System.out.println(notice);
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		model.addAttribute("notice", notice);
		return "forward:/serviceCenter/updateNoticeView.jsp";
	}	
	



	
	@RequestMapping(value = "updateNotice", method = RequestMethod.POST)
	public String updateNotice(@ModelAttribute Notice notice, Model model, User user) throws Exception {
		
		System.out.println("/serviceCenter/updateNotice : POST");
		serviceCenterService.updateNotice(notice);
		System.out.println(notice);
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		model.addAttribute("notice", notice);
		return "forward:/serviceCenter/getNotice.jsp";
	}
	
	
	@RequestMapping(value = "getNoticeList")
	public String getNoticeList(@ModelAttribute("search") Search search, Notice notice, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								Model model) throws Exception {
		System.out.println("/ServiceCenter/listNotice : GET & POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		System.out.println(search);
		Map<String, Object> map = serviceCenterService.getNoticeList(search,notice);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")), pageUnit, pageSize);
		
		model.addAttribute("getNoticeList", map.get("getNoticeList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/serviceCenter/getNoticeList.jsp";
	}
	
//======================================================================================여기까지가 Notice	
	
	
	@RequestMapping(value = "addQandA" , method = RequestMethod.POST)
	public String addQandA(@ModelAttribute QandA qandA, @RequestParam("image") MultipartFile[] file, Model model) throws Exception {
		System.out.println(qandA);
	
		System.out.println("/ServiceCenter/addQandA : GET& POST");
		
		System.out.println(qandA);
		User user = new User();																			//★ 지워야됨
		user.setUserId("user03");																		//★ 
		qandA.setUserId(user);																			//★
		
		

		System.out.println(qandA.getQandAOpenCondition()+"테스트용");
		int fileCount = 0;
		String root ="C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles\\";
		 
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println(files.getOriginalFilename());
			
			if(fileCount != file.length) {
			  qandA.setQandAImage2(files.getOriginalFilename());
			}
			
			 qandA.setQandAImage1(files.getOriginalFilename());
			 
			File saveFile = new File(root+ files.getOriginalFilename());
			
			boolean isExists = saveFile.exists();
			
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}

		serviceCenterService.addQandA(qandA);
		
		model.addAttribute("qandA", qandA);
		
		return "forward:/serviceCenter/addQandA.jsp";
	}


	@RequestMapping(value = "getQandA")
	public String getQandA(@ModelAttribute QandA qandA, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/getNotice : GET & POST");
		
		
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		model.addAttribute("qandA", qandA);
		model.addAttribute("menu", menu);
		
		String URI = null;
		
		if(menu.equals("manage")) {
			URI = "forward:/serviceCenter/updateQandA";
		} else if (menu.equals("search")) {
			URI = "forward:/serviceCenter/getQandA.jsp";
		} else {
			URI = "forward:/serviceCenter/getQandA.jsp";  //지워야됨
		}
		
		return URI;
	}

	@RequestMapping(value = "updateQandA", method = RequestMethod.GET)
	public String updateQandA(@ModelAttribute QandA qandA, Model model) throws Exception {
		
		System.out.println("/ServiceCenter/updateQandA : GET");

		System.out.println(qandA);
		
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		model.addAttribute("qandA", qandA);
		
		return "forward:/serviceCenter/updateQandAView.jsp";
	}


	
	@RequestMapping(value = "updateQandA", method = RequestMethod.POST)
	public String updateQandA(@ModelAttribute QandA qandA, Model model, User user) throws Exception {
		
		System.out.println("/ServiceCenter/updateQandA : POST");
	
		user.setUserId("admin1");
		qandA.setUserId(user);
		
		serviceCenterService.updateQandA(qandA);
		
		System.out.println(qandA);
		
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		model.addAttribute("qandA", qandA);
		
		return "forward:/serviceCenter/getQandA.jsp";
	}


	
	@RequestMapping(value = "deleteQandA")
	public String deleteQandA(@ModelAttribute QandA qandA, @RequestParam(defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/deleteQandA : GET & POST");

		serviceCenterService.deleteQandA(qandA.getQandANo());
		
		

		return "forward:/serviceCenter/getQandAList";
	}
	
	@RequestMapping(value = "getQandAList")
	public String getQandAList(@ModelAttribute("search") Search search, QandA qandA,
			@RequestParam(value = "menu", defaultValue = "search") String menu, Model model) throws Exception {
		
		System.out.println("/serviceCenter/getQandAList : GET & POST");
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		//세션으로 이름 받아와서 넣어야됨
		String userId ="user03";

		Map<String, Object> map = serviceCenterService.getQandAList(search, qandA , userId);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")), pageUnit, pageSize);
		
		model.addAttribute("getQandAList", map.get("getQandAList"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/serviceCenter/getQandAList.jsp";
	}
	
// 여기까지가 QandA 끝 ====================================================================



	@RequestMapping(value = "updateReport", method = RequestMethod.GET)
	public String updateReport(@ModelAttribute Report report, Model model) throws Exception {
		
		System.out.println("/ServiceCenter/updateReport : GET");
		
		report = serviceCenterService.getReport(report.getNo());
		
		model.addAttribute("report", report);
		
		return "forward:/serviceCenter/updateReportView.jsp";
	}	
	
	
	
	
	@RequestMapping(value = "updateReport", method = RequestMethod.POST)
	public String updateReport(@ModelAttribute Report report, Model model, User user) throws Exception {
		
		System.out.println("/ServiceCenter/updateReport : POST");

		serviceCenterService.updateReport(report);

		System.out.println(report);
		
		report = serviceCenterService.getReport(report.getNo());
		
		model.addAttribute("report", report);
		System.out.println("들렸다 갑니다.");
		return "forward:/serviceCenter/getReportList";
	}
	
	@RequestMapping(value = "getReport")
	public String getReport(@ModelAttribute Report report, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/getReport : GET & POST");
		
		
		report = serviceCenterService.getReport(report.getNo());
		
		model.addAttribute("report", report);
		model.addAttribute("menu", menu);
		
		String URI = null;
		
		if(menu.equals("manage")) {
			URI = "forward:/serviceCenter/updateReport";  //매니저일경우
		} else if (menu.equals("search")) {
			URI = "forward:/serviceCenter/getReport.jsp"; //회원일경우
		} else {
			URI = "forward:/serviceCenter/getReport.jsp"; 
		}
		
		return URI;
	}
	
	@RequestMapping(value = "getReportList")
	public String getReportList(@ModelAttribute("search") Search search, Report report, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								Model model) throws Exception {
		
		System.out.println("/serviceCenter/getReportList : GET & POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		
		System.out.println(search);
		Map<String, Object> map = serviceCenterService.getReportList(search, report);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/serviceCenter/getReportList.jsp";
	}
	
}//ServiceCenter 끝
