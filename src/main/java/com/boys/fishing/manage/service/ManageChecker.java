package com.boys.fishing.manage.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ManageChecker extends HandlerInterceptorAdapter {
	
	// 컨트롤러 들어가기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("관리자 체크");
		boolean pass = false;
		HashMap<String,Object> map = (HashMap<String, Object>) request.getSession().getAttribute("userinfo");
		if(request.getSession().getAttribute("userinfo") !=null) {
			if(map.get("u_manageryn").equals("Y")) {
				pass = true;
				return pass;
			}else {
				response.sendRedirect("/fishing/");
				return false;
			}			
		}else {			
			response.sendRedirect("/fishing/");
		}
	return pass;
	}
	
	//컨트롤러 들어가고 뷰에 가기 직전
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

}
