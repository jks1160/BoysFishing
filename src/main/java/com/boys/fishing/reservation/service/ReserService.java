package com.boys.fishing.reservation.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.apis.dao.ApisDAO;
import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.reservation.dao.ReserDAO;
import com.boys.fishing.reservation.dto.ReserDTO;
import com.boys.fishing.user.dao.UserDAO;

@Service
public class ReserService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ReserDAO reserDAO;
	@Autowired
	ApisDAO apiDAO;
	@Autowired
	UserDAO userDAO;
	
	
	/**
	 * 조재현 섬들을 검색하여 뿌려주기 위한 메소드
	 * 
	 * @param searchData (HashMap<String,Object>)타입으로 해당 섬 정보를 받는다
	 * 
	 * @return
	 */

	public HashMap<String, Object> reserResearch(HashMap<String, Object> searchData) {

		logger.info("검색 서비스 : {}", searchData);
		// 검색 결과들을 담아주는 리스트

		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<IslandDTO> research_list = apiDAO.reserResearch(searchData);

		map.put("findData", research_list);

		return map;
	}

	/**
	 * @author 조재현, 이선우 선택한 섬의 상세보기를 보기 위한 서비스
	 * @param choice 스트링타입으로 선택한 섬 번호를 뽑아온다.
	 * @return
	 */
	public ModelAndView detail_island(String choice) {
		logger.info("섬 상세보기 서비스 요청 : {}", choice);

		ModelAndView mav = new ModelAndView();
		// 테스트 용 입니다.
		IslandDTO dto = reserDAO.detail_island(choice);

		mav.setViewName("islandDetails");
		mav.addObject("isd", dto);
		return mav;
	}

	/**
	 * 조재현 해당 섬에 일치하는 배 편 찾기
	 * 
	 * @param find_ship (String) 배 번호를 받아온다.
	 * @return
	 */
	public ModelAndView findShip(String find_ship) {

		logger.info("배편 찾기 서비스 : {}", find_ship);
		ModelAndView mav = new ModelAndView();

		ArrayList<ReserDTO> list = reserDAO.findShip(find_ship);
		IslandDTO dto = apiDAO.getIslandName(find_ship);

		logger.info("완료 : {}", list);

		mav.addObject("islandName", dto.getI_name());
		mav.addObject("list", list);
		mav.setViewName("shipDetails");

		for(int i=0; i<list.size(); i++) {
			logger.info("배 번호 : {} ",list.get(i).getS_num());
			logger.info("배 이름 : {}",list.get(i).getS_name());
			logger.info("최대 탑승 인원 : {}",list.get(i).getS_maxpassenger());
			logger.info("최소 탑승 인원 : {}",list.get(i).getS_minpassenger());
			logger.info("출발지 : {}", list.get(i).getS_address());
			logger.info("보유 장비 : {}",list.get(i).getS_equipment());
			logger.info("편의 시설 : {}",list.get(i).getS_convenient());
			logger.info("인당 배 값 : {}",list.get(i).getOp_price());
			logger.info("이미지 이름 : {}" ,list.get(i).getSi_name());
			logger.info("이미지 경로  : {}",list.get(i).getS_img());
		}

		// 배 정보 페이지 완성 시 보내면 된다.
		return mav;
	}

	/**
	 * 조재현 로그인 한 유저의 예약 정보를 가져온다.
	 * 
	 * @param id : 유저의 아이디(세션에서 가져와야함)
	 * @return
	 */
	public HashMap<String, Object> user_reser(String id) {

		logger.info("예약 정보 서비스 요청 아이디 : {}", id);

		ArrayList<ReserDTO> list = reserDAO.user_reser(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		/*
		 * 테스트용 for (ReserDTO name : list) { logger.info("이름: {}",name.getRi_userid());
		 * logger.info("날짜 : {}",name.getRi_date()); }
		 */

		map.put("my_list", list);

		return map;
	}

	public HashMap<String, Object> captain_reser(String capId) {

		logger.info("선장 레저 진입 서비스 : {}" , capId);
		
		ArrayList<ReserDTO> list = userDAO.shipNamee(capId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("operList", list);
		
		
		return map;
	}

}
