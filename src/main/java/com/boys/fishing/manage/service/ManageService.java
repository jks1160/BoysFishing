package com.boys.fishing.manage.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/manage")
public class ManageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManageService service;
	
	@RequestMapping(value="/captain_mange", method = RequestMethod.GET)
	public ModelAndView detail_island(@RequestParam HashMap<String, String> params) {
		
		logger.info("선장 정보 요청 : {}", params);
		
		return null;
	}
}
