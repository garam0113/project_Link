package com.link.web.live;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/live/*")
public class LiveController {

	public LiveController() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}
	
	
	public String addLive() throws Exception{
		
		
		return null;
	}
	
	public String getLive() throws Exception{
		return null;
	}
	
	public String updateLive() throws Exception{
		return null;
	}
	
	public String getLiveList() throws Exception{
		return null;
	}
}
