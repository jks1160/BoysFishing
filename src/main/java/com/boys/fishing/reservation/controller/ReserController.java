package com.boys.fishing.reservation.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.reservation.service.ReserService;


@Controller
@RequestMapping(value="/reser")
public class ReserController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserService service;
	
	// 섬 검색
	@RequestMapping(value="/reser_research", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reserResearch(@RequestParam HashMap<String, Object> searchData) {
		
		logger.info("섬 검색 요청 : {}", searchData );
		
		
		return service.reserResearch(searchData);
	}
	// 섬에 해당하는 배 찾기
	@RequestMapping(value="/find_ship", method = RequestMethod.GET)
	public ModelAndView findShip(@RequestParam HashMap<String, String> params) {
		
		logger.info("배 편찾기 : {}",params);
		
		String find_ship = params.get("choice");
		
		
		return service.findShip(find_ship);
	}
	@RequestMapping(value="/user_reser",method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> user_reser(HttpSession session){
		
		logger.info("아이디 정보 : {}",session.getAttribute("loginId"));
		String id = (String)session.getAttribute("loginId");
		
		return service.user_reser(id);
	}
	
}
