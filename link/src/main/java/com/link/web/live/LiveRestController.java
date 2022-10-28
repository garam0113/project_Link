package com.link.web.live;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.domain.Live;
import com.link.service.live.LiveService;

@RestController
@RequestMapping("/liveRset/*")
public class LiveRestController {
	
	@Autowired
	@Qualifier("liveServiceImpl")
	private LiveService liveService;

	public LiveRestController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value = "json/getRoomName")
	public Live exitLive(@RequestBody Live live) throws Exception {
		
		Live getLiveMember = liveService.getLive(live);
		int mem = getLiveMember.getMember()-1;
		getLiveMember.setMember(mem);
		liveService.deleteLive(getLiveMember);
		Live getLive = liveService.getLive(getLiveMember);
		
		if(getLive.getMember() == 0) { 
			liveService.deleteLive(getLive);
		}
		
		Live deleteLive = liveService.getLive(getLive);
		
		return deleteLive;
	}

}
