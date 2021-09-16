package com.boys.fishing.reservation.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.reservation.service.ReserService;


@Controller
@RequestMapping(value="/reser")
public class ReserController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserService service;
	
	@RequestMapping(value="/reser_research", method = RequestMethod.GET)
	public ModelAndView myUserInfo(@RequestParam String searchData) {
		
		logger.info("섬 검색 요청 : {}", searchData );
		
		
		return null;
	}	
	
}
