package com.boys.fishing.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.manage.dto.ManageDTO;
import com.boys.fishing.manage.service.ManageService;

@Controller
@RequestMapping(value="/manage")
public class ManageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManageService service;

	@RequestMapping(value="/captainlist", method = RequestMethod.GET)
	public String caplist(@RequestParam HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		//logger.info("선장 정보 요청 : {}", params);
		//ArrayList<ManageDTO> list = service.capRequestList();
		//mav.addObject("list",list);
		
		return "captainlist";
	}
	
	
	@RequestMapping(value="/captainlist/{pagePerNum}/{page}")
	public @ResponseBody HashMap<String , Object> list(@PathVariable int pagePerNum,@PathVariable int page){
	logger.info("page :{}",page);
	HashMap<String, Object> map = service.list(page,pagePerNum);
		return map;
	}
	
}
