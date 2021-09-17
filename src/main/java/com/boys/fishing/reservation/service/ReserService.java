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

@Service
public class ReserService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ReserDAO reserDAO;
	@Autowired ApisDAO apiDAO;
	
	public HashMap<String, Object> reserResearch(HashMap<String, Object> searchData) {
		
		logger.info("검색 서비스 : {}",searchData);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		IslandDTO dto = apiDAO.reserResearch(searchData);
		
		map.put("findData", dto);
		
		return map;
	}

	public ModelAndView findShip(String find_ship) {
		
		logger.info("배편 찾기 서비스 : {}",find_ship);
		ArrayList<ReserDTO> list =reserDAO.findShip(find_ship);
		logger.info("완료 : {}",list);
		System.out.println("리스트 1 : " +list.get(0).getS_num());
		System.out.println("리스트 2 : " +list.get(1).getS_num());
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		
		// 배 정보 페이지 완성 시 보내면 된다.
		return null;
	}
	
	
}
