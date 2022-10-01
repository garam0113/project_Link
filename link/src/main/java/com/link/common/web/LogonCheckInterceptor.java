package com.link.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//public class LogonCheckInterceptor implements HandlerInterceptor {
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {
	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: " + this.getClass() + "\n");		
	}
	
}//end of class