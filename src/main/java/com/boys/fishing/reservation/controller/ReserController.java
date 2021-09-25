package com.boys.fishing.reservation.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.reservation.service.ReserService;

@Controller
@RequestMapping(value = "/reser")
public class ReserController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ReserService service;

	// 섬 검색
	@RequestMapping(value = "/reser_research", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> reserResearch(@RequestParam HashMap<String, Object> searchData) {

		logger.info("섬 검색 요청 : {}", searchData);

		return service.reserResearch(searchData);
	}

	// 섬 상세보기
	@RequestMapping(value = "/detail_island", method = RequestMethod.GET)
	public ModelAndView detail_island(@RequestParam HashMap<String, String> params, RedirectAttributes rAttr) {

		logger.info("섬 정보 요청 : {}", params.get("choice"));
		ModelAndView mav = new ModelAndView();
		if(params.get("choice") == null) {
			rAttr.addFlashAttribute("msg","섬을 선택해 주세요!");
			mav.setViewName("redirect:/islandsReservation");
			return mav;
		}
		
		return service.detail_island(params.get("choice"));
	}

	// 섬에 해당하는 배 찾기
	@RequestMapping(value = "/find_ship", method = RequestMethod.GET)
	public ModelAndView findShip(@RequestParam HashMap<String, String> params) {

		logger.info("배 편찾기 : {}", params);

		String find_ship = params.get("choice");

		return service.findShip(find_ship);
	}

	// 유저의 예약 정보를 가져오는 기능
	@RequestMapping(value = "/user_reser", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> user_reser(HttpSession session) {

		logger.info("아이디 정보 : {}", session.getAttribute("userinfo"));
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String id = (String) map.get("u_userid");

		logger.info("이제 진짜 세션 받아옴 : {} ", id);

		return service.user_reser(id);
	}

	// 선장의 예약 정보를 가져오는 기능
	@RequestMapping(value = "/captain_reser", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> captain_reser(HttpSession session) {
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");

		String capId = (String) map.get("u_userid");

		return service.captain_reser(capId);
	}

	@RequestMapping(value = "/cap_check_res", method = RequestMethod.GET)
	public ModelAndView cap_check_res(@RequestParam HashMap<String, Object> params, HttpSession session) {
		logger.info("선장 스케줄 상세보기 진입");
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");

		String id = (String) map.get("u_userid");

		return service.cap_check_res(params, id);
	}

	/**
	 * 조재현 선장 스케줄 업데이트하자
	 * 
	 * @param params
	 * @return
	 */

	@RequestMapping(value = "/captain_sche_detail", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> captain_sche_detail(@RequestParam HashMap<String, Object> params) {

		logger.info("업데이트 진입 : {}", params);
		
		
		return service.captain_sche_detail(params);
	}
	
	/** 조재현
	 * 유저 배편 예약하기 진입 컨트롤러
	 * @return
	 */
	@RequestMapping(value="/userReservation")
	public ModelAndView userReservation(@RequestParam HashMap<String, Object> params) {
		
		logger.info("섬 번호 : {}, 배 번호: {}",params.get("i_num"), params.get("s_num"));

		return service.userReservation(params);
	}
	/** 조재현
	 *  예약 가능한 날짜를 뿌려주는 AJAX
	 * @return
	 */
	@RequestMapping(value="/show_ship_sch", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> show_ship_sch(@RequestParam HashMap<String, Object> params){
		
		logger.info(" 여기는 에이잭스 섬 번호 : {}, 배 번호: {}",params.get("i_num"), params.get("s_num"));
		
		
		return service.show_List(params);
	}
}
