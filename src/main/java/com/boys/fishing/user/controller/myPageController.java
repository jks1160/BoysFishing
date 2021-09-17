package com.boys.fishing.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.service.UserService;
import com.boys.fishing.user.service.myPageService;

@Controller
public class myPageController {
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	@Autowired myPageService myservice;
	
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpSession session) {
		logger.info("마이 페이지 요청 ");
		ModelAndView mav = new ModelAndView();
		//테스트 세션
		String id = "somefishing";
		session.setAttribute("loginId", id);
		mav.setViewName("loginPage");
		return mav;
	}
	
	@RequestMapping(value="/pointPage", method = RequestMethod.GET)
	public ModelAndView pointPage(HttpSession session) {
		logger.info("포인트 페이지 요청");
		ModelAndView mav = new ModelAndView();
		//테스트 세션
		String id = "somefishing";
		session.setAttribute("loginId", id);
		
		return myservice.point(id);
	}
	
	@ResponseBody
	@RequestMapping(value="/sumsumlist")
	public HashMap<String,Object> sumsumlist(int page, String user) {
		logger.info("자유글 리스트 받기 요청");
		logger.info("page:"+page+" user:"+user);
		//int page1 = Integer.parseInt(String.valueOf(page));
		return myservice.sumsumlist(page, user);
	}
	
	@ResponseBody
	@RequestMapping(value="/revList") 
	public HashMap<String,Object> revList(int page, String user) {
		logger.info("후기글 리스트 받기 요청");
		logger.info("page:"+page+" user:"+user);
		return myservice.revList(page, user); 
	 }
	
	@ResponseBody
	@RequestMapping(value="/infoList") 
	public HashMap<String,Object> infoList(int page, String user) {
		logger.info("정보글 리스트 받기 요청");
		logger.info("page:"+page+" user:"+user);
		return myservice.infoList(page, user); 
	 }
	  
	  
	 
	
}
