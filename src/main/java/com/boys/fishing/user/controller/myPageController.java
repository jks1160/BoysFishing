package com.boys.fishing.user.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.reservation.dto.ReserDTO;
import com.boys.fishing.user.service.UserService;
import com.boys.fishing.user.service.myPageService;
import com.google.gson.Gson;

@Controller
public class myPageController {
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	@Autowired myPageService myservice;
	
	
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public ModelAndView loginPage(HttpSession session) {
		logger.info("마이 페이지 요청 ");
		ModelAndView mav = new ModelAndView();
		//테스트 세션
		//String id = "somefishing";
		//session.setAttribute("loginId", id);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		mav.setViewName("login");
		
		if(session.getAttribute("userinfo") != null ) {
			logger.info("세션에 값 있당");
			String userId = userInfo.get("u_userid");
			String captainYN = myservice.captainYN(userId);
			if(captainYN == null) {
				captainYN = "N";
			}
			logger.info("선장여부는? "+captainYN);
			if(captainYN.equals("Y") ) {
				session.setAttribute("captainYN", captainYN);
			}
			//mav.addObject("userId", userId); 아직 필요할지 모름
			mav.setViewName("myPage");
		}
		return mav;
	}
	

	@RequestMapping(value="/pointPage", method = RequestMethod.GET)
	public ModelAndView pointPage(HttpSession session) {
		logger.info("포인트 페이지 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		//이렇게 로그인 튕기는게 맞을까유?
		/*
		 * if(session.getAttribute("userinfo") == null ) { ModelAndView mav = new
		 * ModelAndView(); mav.setViewName("myPage"); return mav; }
		 */
		String userId = userInfo.get("u_userid");
		return myservice.point(userId);
	}
	
	@RequestMapping(value="/pointCharge")
	public String pointCharge(Model model, HttpSession session ,@RequestParam String p_charge) {
		logger.info("포인트충전 왔슈?"+p_charge);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		myservice.pointCharge(Integer.parseInt(p_charge),userId);
		return "redirect:/pointPage";
	}
	
	@RequestMapping(value="/pointWithdraw")
	public String pointWithdraw(Model model, HttpSession session, @RequestParam String p_withdraw ) {
		logger.info("포인트인출 왔슈?"+p_withdraw);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		myservice.pointWithdraw(Integer.parseInt(p_withdraw),userId);
		return "redirect:/pointPage";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/pointHistoryPage")
	public HashMap<String,Object> pointHistoryPage(HttpSession session, int page) {
		logger.info("포인트 히스토리 리스트 받기 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		logger.info("page:"+page+" user:"+userId);
		return myservice.pointHistoryPage(page, userId);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/mp_sumsumlist")
	public HashMap<String,Object> sumsumlist(int page, HttpSession session) {
		logger.info("자유글 리스트 받기 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		logger.info("page:"+page+" user:"+userId);
		return myservice.sumsumlist(page, userId);
	}
	
	@ResponseBody
	@RequestMapping(value="/mp_revList") 
	public HashMap<String,Object> revList(int page, HttpSession session) {
		logger.info("후기글 리스트 받기 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		logger.info("page:"+page+" user:"+userId);
		return myservice.revList(page, userId); 
	 }
	
	@ResponseBody
	@RequestMapping(value="/mp_infoList") 
	public HashMap<String,Object> infoList(int page, HttpSession session) {
		logger.info("정보글 리스트 받기 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		logger.info("page:"+page+" user:"+userId);
		return myservice.infoList(page, userId); 
	 }
	  
	/** 한준성
	 * 선장 스케줄 등록 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/captainWriteForm")
	public ModelAndView captainScheduleWrite(HttpSession session) {
		logger.info("선장 스케쥴 등록 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		return myservice.captainScheduleWrite(userId);
	}
	
	@ResponseBody
	@RequestMapping(value="/startPoint")
	public HashMap<String, Object> startPoint(int shipNum){
		logger.info("출항지 출력 요청");
		
		return myservice.startPoint(shipNum);
	}
	
	@RequestMapping(value="/captain_calendar", method=RequestMethod.GET)
	public String captain_calendar() {
		logger.info("캡팀 캘린더 보기 요청");
		
		return "captain_calendar";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/islandName")
	public HashMap<String, Object> islandName(){
		logger.info("섬 출력 요청");
		
		return myservice.islandName();
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/captain_requestForm")
	public ModelAndView captain_requestForm(HttpSession session, RedirectAttributes redirect) {
		logger.info("선장 요청 : {}",session.getAttribute("userinfo"));
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String userId =(String)map.get("u_userid");
		logger.info("유저 아이디 : {}",userId);
		
		
		return service.captain_requestForm(userId,redirect);
	}
	 
	
}
