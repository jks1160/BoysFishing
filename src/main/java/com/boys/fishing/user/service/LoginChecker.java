package com.boys.fishing.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginChecker extends HandlerInterceptorAdapter {

	// 컨트롤러 들어가기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("로그인 체크");
	
		//System.out.println(request.getSession().getAttribute("loginId"));
		//System.out.println(request.getSession().getAttribute(""));
		if(request.getSession().getAttribute("userInfo") != null) {
			
			return true;
		}
		
		return true;
	}

	//컨트롤러 들어가고 뷰에 가기 직전
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView mav) throws Exception {
		
		
		
		System.out.println(request.getSession().getAttribute("loginId"));
		
		System.out.println("야호");
		
	}

	
	
}
