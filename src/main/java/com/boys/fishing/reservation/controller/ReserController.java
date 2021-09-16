package com.boys.fishing.reservation.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boys.fishing.reservation.service.ReserService;


@Controller
@RequestMapping(value="/reser")
public class ReserController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserService service;
	
	@RequestMapping(value="/reser_research", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reserResearch(@RequestParam HashMap<String, Object> searchData) {
		
		logger.info("섬 검색 요청 : {}", searchData );
		
		
		return service.reserResearch(searchData);
	}	
	
}
