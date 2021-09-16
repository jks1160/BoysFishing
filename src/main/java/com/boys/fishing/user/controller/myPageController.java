package com.boys.fishing.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boys.fishing.user.service.UserService;

@Controller
public class myPageController {
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String loginPage() {
		logger.info("마이 페이지 요청 ");
		
		return "myPage";
	}
	
	@RequestMapping(value="/pointPage", method = RequestMethod.GET)
	public String pointPage() {
		logger.info("포인트 페이지 요청");
		
		return "pointPage";
	}
}
