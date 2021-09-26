package com.boys.fishing.apis.controller;

import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.apis.service.ApisService;
import com.boys.fishing.user.dto.UserDTO;
import com.boys.fishing.user.service.UserService;

//test controller
@Controller
public class ApisController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ApisService service;

	@RequestMapping(value = "/insertisland", method = RequestMethod.GET)
	public String home(Model model) {

		return "insertisland";
	}

	// 섬정보 db insert 메서드
	@RequestMapping(value = "/apiCalls")
	public @ResponseBody HashMap<String, Object> apiCalls(@RequestParam HashMap<String, String> params) {
		logger.info("params : {}", params);
		return service.apiCalls(params);
	}

	// 섬정보 db del 메서드
	@RequestMapping(value = "/islanddel")
	public @ResponseBody HashMap<String, Object> islanddel() {
		logger.info("db 삭제 요청");
		return service.islanddel();
	}

	// 
	@RequestMapping(value = "/todayweatherinsert")
	public @ResponseBody HashMap<String, Object> todayweatherinsert(@RequestParam HashMap<String, String> params) {
		logger.info("당일 날씨 insert 요청");
		return service.todayweatherinsert(params);

	}
	
	@RequestMapping(value = "/weekendweatherinsert")
	public @ResponseBody HashMap<String, Object> weekendweatherinsert(@RequestParam HashMap<String, String> params) {
		logger.info("일주일 날씨 insert 요청?");
		return service.weekendweatherinsert(params);
		
	}
	
	//날
		@RequestMapping(value="/calendar", method = RequestMethod.GET)
		public String calendar() {
			logger.info("리스트 진입");
			return "calendar";
	}
	
		@RequestMapping(value="/calendar_call", method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> calendar_call() {
			HashMap<String, Object> map = service.todayweahterlist();//u_userid/weekendweather
			return map;
	}
		@RequestMapping(value="/weekendweather")
		public ModelAndView weekendweather() {
			return service.weekendweahter();
	}
		
}
