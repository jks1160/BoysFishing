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
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("보이즈 피싱 프로젝트 Some낚시 시작합니다.");

		return "mainPage";
	}
	@RequestMapping(value="/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		logger.info("로그인 페이지 요청 ");
		
		return "loginPage";
	}
		
	
}
