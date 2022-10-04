package com.link.web.myHome;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.link.service.myHome.MyHomeService;

@RestController
@RequestMapping("/product/*")
public class MyHomeRestController {
	
	@Autowired
	@Qualifier("myHomeServiceImpl")
	MyHomeService myHomeService;

	public MyHomeRestController() {
		// TODO Auto-generated constructor stub
		System.out.println(":: MyHomeRestController default Constructor");
	}

}
