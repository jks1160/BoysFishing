package com.boys.fishing.manage.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.manage.service.ManageService;

@Controller
@RequestMapping(value="/manage")
public class ManageController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManageService service;
	
	@RequestMapping(value="/captainlist", method = RequestMethod.GET)
	public ModelAndView detail_island(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		logger.info("선장 정보 요청 : {}", params);
		mav.setViewName("captainlist");
		return mav;
	}
}
