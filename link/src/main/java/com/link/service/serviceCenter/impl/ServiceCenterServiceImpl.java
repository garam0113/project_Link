package com.link.service.serviceCenter.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.link.common.Search;
import com.link.service.domain.Notice;
import com.link.service.serviceCenter.ServiceCenterDAO;
import com.link.service.serviceCenter.ServiceCenterService;


@Service("ServiceCenterServiceImpl")
public class ServiceCenterServiceImpl implements ServiceCenterService {
	
	
	@Autowired
	@Qualifier("ServiceCenterDAOImpl")
	private ServiceCenterDAO serviceCenterDAO;
	
	
	public void setNoticeDAO(ServiceCenterDAO serviceCenterDAO) {
		this.serviceCenterDAO = serviceCenterDAO;
	}

	public ServiceCenterServiceImpl() {
		// TODO Auto-generated constructor stub
		System.out.println("ServiceCenterServiceImpl default Constructor");
	}

	@Override
	public void addNotice(Notice notice) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl insertNotice start]\n");
		System.out.println(notice);
		
		
		serviceCenterDAO.addNotice(notice);
		System.out.println("\n[ServiceCenterServiceImpl insertNotice end]\n");
		
	}

	@Override
	public Notice getNotice(int noticeNo) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl findNotice start]\n");
		
		
		Notice notice = serviceCenterDAO.getNotice(noticeNo);
		System.out.println("\n[ServiceCenterServiceImpl findNotice end]\n");
		
		return notice;
	}

	@Override
	public Map<String, Object> getNoticeList(Search search) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl getNoticetList start]\n");
		
		List<Notice> list = serviceCenterDAO.getNoticeList(search);
		int totalCount = serviceCenterDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		/* System.out.println("32184732984798479843729428749    "+list); */
		map.put("totalCount", totalCount);
		
		System.out.println("\n[ServiceCenterServiceImpl getNoticeList end]\n");
		
		return map;
	}

	@Override
	public void updateNotice(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("\n[ServiceCenterServiceImpl updateNoticet start]\n");
		
		List<Notice> list = (List<Notice>)map.get("notice");
		
		for(int i = 0 ; i < list.size(); i++) {
			serviceCenterDAO.updateNotice(list.get(i));
		}
		
		System.out.println("\n[ServiceCenterServiceImpl updateNotice end]\n");
		
	}

	@Override
	public void removeFileNotice() {
		// TODO Auto-generated method stub
		serviceCenterDAO.removeFileNotice();
	}
	
	@Override
	public void getCount(int noticeNo) throws Exception{
		
		serviceCenterDAO.getCount(noticeNo);
	}

	
	
	
	

}
