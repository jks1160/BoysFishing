package com.boys.fishing.manage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.manage.dao.ManageDAO;
import com.boys.fishing.manage.dto.ManageDTO;


@Service
public class ManageService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired ManageDAO dao;
	
	public ArrayList<ManageDTO> capRequestList() {
		return dao.capRequestList();
	}

	public HashMap<String, Object> list(int page, int pagePerNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int end = page * pagePerNum;
		int start = end - pagePerNum+1;
		ArrayList<ManageDTO> list = dao.capRequestList(start,end);
		
		int totalCnt = dao.allCount();
		logger.info(list.size()+"/"+totalCnt);
		map.put("list", list);
		map.put("cnt", totalCnt);
		
		int pages = (int) (totalCnt%pagePerNum>0 
				? Math.floor(totalCnt/pagePerNum)+1
						: Math.floor(totalCnt/pagePerNum));
		
		page = page>pages ? pages:page;
		
		map.put("currPage", page);
		map.put("pages", pages);
		
		return map;
	}
	
}
