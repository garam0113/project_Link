package com.link.web.serviceCenter;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.link.service.serviceCenter.ServiceCenterService;

@Controller
@SessionAttributes("user")
@RequestMapping("/ServiceCenter/*")
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
	
	@RequestMapping(value = "addNotice", method = RequestMethod.POST)
	public String addNotice(@ModelAttribute Notice notice, @RequestParam("image") MultipartFile[] file, Model model) throws Exception {
		System.out.println(notice);
	
		System.out.println("/ServiceCenter/addNotice : POST");
		
		notice.setNoticeRegDate(notice.getNoticeRegDate());
		
		StringBuilder sb = new StringBuilder();
		
		int fileCount = 0;
		
		
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println(files.getOriginalFilename());
			sb.append(files.getOriginalFilename());
			
			if(fileCount != file.length) {
				sb.append("*");
			}
			
			String path = "C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles";
			File saveFile = new File(path + files.getOriginalFilename());
			
			boolean isExists = saveFile.exists();
			
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}
		
		System.out.println(sb.toString());
		
		notice.setNoticeImage1(sb.toString());
		
		serviceCenterService.addNotice(notice);
		
		model.addAttribute("notice", notice);
		
		return "forward:/ServiceCenter/addNotice.jsp";
	}


		
	
	@RequestMapping(value = "getNotice")
	public String getNotice(@ModelAttribute Notice notice, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/getNotice : GET & POST");
		
		serviceCenterService.getCount(notice.getNoticeNo());
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		
		model.addAttribute("notice", notice);
		model.addAttribute("menu", menu);
		
		String URI = null;
		
		if(menu.equals("manage")) {
			URI = "forward:/ServiceCenter/updateNotice";
		} else if (menu.equals("search")) {
			URI = "forward:/ServiceCenter/getNotice.jsp";
		}
		
		return URI;
	}
	
	
	@RequestMapping(value = "deleteNotice")
	public String deleteNotice(@ModelAttribute Notice notice, @RequestParam(defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/deleteNotice : GET & POST");
		
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		
		

		return "forward:/ServiceCenter/listNotice.jsp";
	}

	
	
	//@RequestMapping("/updateNoticeView.do")
	@RequestMapping(value = "updateNotice", method = RequestMethod.GET)
	public String updateNotice(@ModelAttribute Notice notice, Model model) throws Exception {
		
		System.out.println("/ServiceCenter/updateNotice : GET");
		
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		
		model.addAttribute("notice", notice);
		
		return "forward:/ServiceCenter/updateNoticeView.jsp";
	}

	//@RequestMapping("/updateNotice.do")
	@RequestMapping(value = "updateNotice", method = RequestMethod.POST)
	public String updateNotice(@ModelAttribute Notice notice, Model model,
								@RequestParam("image") MultipartFile[] file) throws Exception {
		
		System.out.println("/ServiceCenter/updateNotice : POST");
		
		notice.setNoticeRegDate(notice.getNoticeRegDate());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Notice> list = new ArrayList<Notice>();
		
		StringBuilder sb = new StringBuilder();

		int fileCount = 0;
		
		for(MultipartFile files : file) {
			
			if(!files.getOriginalFilename().equals("")) {
				fileCount++;
				System.out.println(files.getOriginalFilename());
				sb.append(files.getOriginalFilename());
				
				if(fileCount != file.length) {
					sb.append("*");
				}
				
				String path = "C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles";
	
				File saveFile = new File(path + files.getOriginalFilename());
				
				boolean isExists = saveFile.exists();
				
				if(!isExists) {
					files.transferTo(saveFile);
				}
			}
		}
		sb.append("*" + notice.getNoticeImage1());
		
		if(sb.charAt(0) == '*') {
			sb.deleteCharAt(0);
		}
		notice.setNoticeImage1(sb.toString());		
		list.add(notice);
		
		map.put("notice", list);
		serviceCenterService.updateNotice(map);
		
		System.out.println(notice);
		
		notice = serviceCenterService.getNotice(notice.getNoticeNo());
		
		model.addAttribute("notice", notice);
		
		return "forward:/ServiceCenter/getNotice.jsp";
	}
	
	
	@RequestMapping(value = "listNotice")
	public String listNotice(@ModelAttribute("search") Search search, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								Model model) throws Exception {
		
		System.out.println("/ServiceCenter/listNotice : GET & POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		
		System.out.println(search);
		Map<String, Object> map = serviceCenterService.getNoticeList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/ServiceCenter/listNotice.jsp";
	}
	
//======================================================================================여기까지가 Notice	
	
	
	@RequestMapping(value = "addQandA", method = RequestMethod.POST)
	public String addQandA(@ModelAttribute QandA qandA, @RequestParam("image") MultipartFile[] file, Model model) throws Exception {
		System.out.println(qandA);
	
		System.out.println("/ServiceCenter/addNotice : POST");
		
		qandA.setQandARegDate(qandA.getQandARegDate());
		
		StringBuilder sb = new StringBuilder();
		
		int fileCount = 0;
		
		
		for(MultipartFile files : file) {
			fileCount++;
			System.out.println(files.getOriginalFilename());
			sb.append(files.getOriginalFilename());
			
			if(fileCount != file.length) {
				sb.append("*");
			}
			
			String path = "C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles";
			File saveFile = new File(path + files.getOriginalFilename());
			
			boolean isExists = saveFile.exists();
			
			if(!isExists) {
				files.transferTo(saveFile);
			}
		}
		
		System.out.println(sb.toString());
		
		qandA.setQandAImage1(sb.toString());
		
		serviceCenterService.addQandA(qandA);
		
		model.addAttribute("qandA", qandA);
		
		return "forward:/ServiceCenter/addQandA.jsp";
	}


	@RequestMapping(value = "getQandA")
	public String getQandA(@ModelAttribute QandA qandA, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/getNotice : GET & POST");
		
		serviceCenterService.getCount(qandA.getQandANo());
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		model.addAttribute("qandA", qandA);
		model.addAttribute("menu", menu);
		
		String URI = null;
		
		if(menu.equals("manage")) {
			URI = "forward:/ServiceCenter/updateQandA";
		} else if (menu.equals("search")) {
			URI = "forward:/ServiceCenter/getQandA.jsp";
		}
		
		return URI;
	}

	
	@RequestMapping(value = "updateQandA", method = RequestMethod.POST)
	public String updateQandA(@ModelAttribute QandA qandA, Model model,
								@RequestParam("image") MultipartFile[] file) throws Exception {
		
		System.out.println("/ServiceCenter/updateNotice : POST");
		
		qandA.setQandARegDate(qandA.getQandARegDate());
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<QandA> list = new ArrayList<QandA>();
		
		StringBuilder sb = new StringBuilder();

		int fileCount = 0;
		
		for(MultipartFile files : file) {
			
			if(!files.getOriginalFilename().equals("")) {
				fileCount++;
				System.out.println(files.getOriginalFilename());
				sb.append(files.getOriginalFilename());
				
				if(fileCount != file.length) {
					sb.append("*");
				}
				
				String path = "C:\\Users\\903-16\\git\\link\\link\\src\\main\\webapp\\resources\\image\\uploadFiles";
	
				File saveFile = new File(path + files.getOriginalFilename());
				
				boolean isExists = saveFile.exists();
				
				if(!isExists) {
					files.transferTo(saveFile);
				}
			}
		}
		sb.append("*" + qandA.getQandAImage1());
		
		if(sb.charAt(0) == '*') {
			sb.deleteCharAt(0);
		}
		qandA.setQandAImage1(sb.toString());		
		list.add(qandA);
		
		map.put("notice", list);
		serviceCenterService.updateNotice(map);
		
		System.out.println(qandA);
		
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		model.addAttribute("qandA", qandA);
		
		return "forward:/ServiceCenter/getQandA.jsp";
	}
	
	
	@RequestMapping(value = "deleteQandA")
	public String deleteQandA(@ModelAttribute QandA qandA, @RequestParam(defaultValue = "search") String menu, 
								 Model model , HttpServletResponse response) throws Exception {
		
		
		System.out.println("/ServiceCenter/deleteQandA : GET & POST");
		
		qandA = serviceCenterService.getQandA(qandA.getQandANo());
		
		

		return "forward:/ServiceCenter/listQandA.jsp";
	}
	
	@RequestMapping(value = "listQandA")
	public String listQandA(@ModelAttribute("search") Search search, @RequestParam(value = "menu", defaultValue = "search") String menu, 
								Model model) throws Exception {
		
		System.out.println("/ServiceCenter/listQandA : GET & POST");
		
		if(search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(pageSize);
		
		
		System.out.println(search);
		Map<String, Object> map = serviceCenterService.getQandAList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		return "forward:/ServiceCenter/listQandA.jsp";
	}
	
// 여기까지가 QandA 끝 ====================================================================
	
	
	


}
