package com.link.web.live;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.domain.Live;

@RestController
@RequestMapping("/liveRset/*")
public class LiveRestController {

	public LiveRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "json/addRoomName", method = RequestMethod.POST)
	public Live addRoomName(@RequestBody String roomName, Live live) throws Exception {
		System.out.println("/liveRest/json/addRoomName : POST");
		
		roomName = "1234";
		
		live.setRoomName(roomName);
		
		return live;
	}
}
