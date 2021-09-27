package com.boys.fishing.user.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
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
	public ModelAndView pointCharge(Model model, HttpSession session ,@RequestParam String p_charge, RedirectAttributes rAttr) {
		logger.info("포인트충전 왔슈?"+p_charge);
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		String msg = myservice.pointCharge(Integer.parseInt(p_charge),userId);
		rAttr.addFlashAttribute("msg",msg);
		mav.setViewName("redirect:/pointPage");
		return mav;
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
	@RequestMapping(value="/reserHistoryList")
	public HashMap<String,Object> reserHistoryList(HttpSession session, int page) {
		logger.info("포인트 히스토리 리스트 받기 요청");
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		logger.info("page:"+page+" user:"+userId);
		return myservice.reserHistoryList(page, userId);
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
	public ModelAndView captainScheduleWrite(HttpSession session, @RequestParam Date op_date) {
		logger.info("선장 스케쥴 등록 요청");
		logger.info("학인 : {}", op_date);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		return myservice.captainScheduleWrite(userId,op_date);
	}
	/** 조재현
	 * 선장 스케줄 상세보기 -> 변경
	 * 
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/captainUpdateForm")
	public ModelAndView captainUpdateForm(HttpSession session, @RequestParam HashMap<String, String> params) {
		logger.info("선장 스케쥴 등록 요청");
		logger.info("학인 : {}", params.get("op_date"));

		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		
		
		return myservice.captainScheduleUpdate(userId, params);
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
	
	@ResponseBody 
	@RequestMapping(value="/captainWrite")
	public String captainWrite(@ModelAttribute ReserDTO reser ) {
		logger.info("캡틴 라이트 진입");
		
		return myservice.captainWrite(reser);
	}
	
	/* 이게진짜
	@RequestMapping(value="/captainScheduleDetail")
	public ModelAndView captainScheduleDetail(HttpSession session, @RequestParam Date op_date) {
		logger.info("선장 운항 요청 페이지 이동");
		logger.info("학인 : {}", op_date);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		return myservice.captainScheduleDetail(userId,op_date);
	}
	*/
	@RequestMapping(value="/captainScheduleDetail")
	public ModelAndView captainScheduleDetail(HttpSession session, @RequestParam String date) {
		logger.info("선장 운항 요청 페이지 이동");
		logger.info("데이트 : {}",date);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		return myservice.captainScheduleDetail(userId,date);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/reserWait")
	public HashMap<String, Object> reserWait(HttpSession session, String wait, String date) {
		logger.info("배 넘버당 예약 대기중 내역 요청");
		logger.info(wait);
		logger.info(date);
		HashMap<String, String> userInfo = (HashMap<String, String>) session.getAttribute("userinfo");
		String userId = userInfo.get("u_userid");
		return myservice.reserWait(userId, wait, date);
	}
	
	/** 조재현 , 한준성
	 *  선장 예약 확인 시 포인트 수거
	 * @param num
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reserDecide")
	public String reserDecide(String num, HttpSession session) {
		logger.info("예약번호: {}",num);
		HashMap<String, Object > map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String capId = (String) map.get("u_userid");
		
		return myservice.reserDecide(num,capId);
	}
	/** 조재현, 한준성
	 * 예약 대기 중 취소하기 및 포인트 반납(선장에게는 영향 X)
	 * 
	 * @param num
	 * @param cancelReason
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/reserCancel")
	public String reserCancel(String num, String cancelReason) {
		logger.info("예약번호: {}",num);
		logger.info("취소 사유: {}",cancelReason);
		return myservice.reserCancel(num,cancelReason);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/decideCancel")
	public String decideCancel(String num, String cancelReason, HttpSession session) {
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String capId = (String) map.get("u_userid");
		
		logger.info("선장 아이디 :{}",capId);
		logger.info("예약번호: {}",num);
		logger.info("취소 사유: {}",cancelReason);
		
		
		return myservice.decideCancel(num,cancelReason,capId);
	}
	
	
	
	@RequestMapping(value="/captain_requestForm")
	public ModelAndView captain_requestForm(HttpSession session, RedirectAttributes redirect) {
		logger.info("선장 요청 : {}",session.getAttribute("userinfo"));
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String userId =(String)map.get("u_userid");
		logger.info("유저 아이디 : {}",userId);
		
		
		return service.captain_requestForm(userId,redirect);
	}
	 
	@RequestMapping(value="/captainSchedule", method=RequestMethod.GET)
	public ModelAndView captainShedule(HttpSession session) {
		logger.info("캡틴 예약일정 폼 요청");
		
		HashMap<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userinfo");
		String userid = (String)userInfo.get("u_userid");
		
		return myservice.captainSchedule(userid);
	}
	
	@ResponseBody
	@RequestMapping(value="/captainScheduleList")
	public ArrayList<HashMap<String, String>> captainScheduleList(HttpSession session) {
		logger.info("선장 예약정보 조회 요청");
		HashMap<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userinfo");
		String userid = (String)userInfo.get("u_userid");
		return myservice.captainScheduleList(userid);
	}
	
	
	//선장 운항예약 히스토리(예약확정만)
	@ResponseBody
	@RequestMapping(value="/reserHistory")
	public HashMap<String, Object> reserHistory(int shipNum, int page){
		logger.info("선장 운항예약 히스토리 요청");
		return myservice.reserHistory(shipNum, page);
	}
	
}
