package com.boys.fishing.user.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.service.UserService;
import com.boys.fishing.user.service.myPageService;

@Controller
public class myPageController {
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	@Autowired myPageService myservice;
	
	
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
	
	@ResponseBody
	@RequestMapping(value="/someList")
	public ArrayList<SumsumDTO> someList() {
		logger.info("자유글 리스트 받기 요청");
		
		return myservice.list();
	}
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/someList") public ArrayList<SumsumDTO> someList() {
	 * logger.info("정보글 리스트 받기 요청");
	 * 
	 * return myservice.list(); }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/someList") public ArrayList<SumsumDTO> someList() {
	 * logger.info("후기글 리스트 받기 요청");
	 * 
	 * return myservice.list(); }
	 */
	
}
