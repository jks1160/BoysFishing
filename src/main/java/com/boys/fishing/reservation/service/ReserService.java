package com.boys.fishing.reservation.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	
}
