package com.boys.fishing.apis.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.apis.service.ApisService;
import com.boys.fishing.user.service.UserService;

//test controller
@Controller
public class ApisController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ApisService service;
	
	@RequestMapping(value = "/insertisland", method = RequestMethod.GET)
	public String home(Model model) {
		
		return "insertisland";
	}
	@RequestMapping(value = "/apiCalls", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> apiCalls
	(@RequestParam HashMap<String, String> params) {
		logger.info("params : {}",params);
		return service.apiCalls(params);
	}
}
