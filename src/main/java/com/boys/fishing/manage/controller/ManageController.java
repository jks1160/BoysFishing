package com.boys.fishing.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	HashMap<String, Object> map = service.list(page,pagePerNum);//u_userid
		return map;
	}
	
	@RequestMapping(value = "/capreq_detail")
	public ModelAndView capreq_detail(@RequestParam String u_userid) {
		logger.info("u_userid : "+u_userid);				
		return service.capreq_detail(u_userid);
	}
	
	@RequestMapping(value = "/capreq_update")
	public String capreq_update(@RequestParam String u_userid, HttpSession session, HttpServletRequest req) {
		HashMap<String,Object> map2 = (HashMap<String, Object>) req.getSession().getAttribute("userinfo");
		HashMap<String, String> map = new HashMap<String, String>();
		String cap_manager =  (String) map2.get("u_userid");

		map.put("cap_manager", cap_manager);
		map.put("u_userid", u_userid);
		service.capreq_update(map);
		
		return "redirect:/manage/captainlist";

	}
	
	@RequestMapping(value = "/capreq_reject")
	public String capreq_reject(@RequestParam HashMap<String, String> params, HttpSession session, HttpServletRequest req) {
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String,Object> map2 = (HashMap<String, Object>) req.getSession().getAttribute("userinfo");
		String cap_manager =  (String) map2.get("u_userid");
		String cap_cancelreason = req.getParameter("cap_cancelreason");

		map.put("cap_manager", cap_manager);
		map.put("cap_cancelreason", cap_cancelreason);
		map.put("u_userid", params.get("u_userid"));
		service.capreq_reject(map);
		//service.capreq_update(map);
		//"redirect:/manage/captainlist"
		return "redirect:/manage/captainlist";

	}
	
	@RequestMapping(value="/peoplelist", method = RequestMethod.GET)
	public ModelAndView peoplelist(@RequestParam HashMap<String, String> params) {
		logger.info("기본 회원정보 요청 : {}", params);
		return service.peoplelist();
	}
	@RequestMapping(value="/peoplesearch", method = RequestMethod.GET)
	public ModelAndView peoplesearch(@RequestParam HashMap<String, Object> map) {
		logger.info("회원정보 서치 : {}", map);
		return service.peoplesearch(map);
	}
	
	@RequestMapping(value="/peoplelistcall/{startlist}/{endlist}", method = RequestMethod.GET)
	public @ResponseBody HashMap<String , Object> peoplelistcall(@PathVariable int startlist,@PathVariable int endlist) {
		return service.peoplelistcall(startlist,endlist);
	}
}
