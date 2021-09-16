package com.boys.fishing.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dao.UserDAO;

@Service
public class myPageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDAO dao;
	
	public HashMap<String,Object> sumsumlist(int page, String user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		String code = "B001";
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<SumsumDTO> sumsum = new ArrayList<SumsumDTO>();
		totalPage = dao.totalPage(user,code);
		sumsum = dao.sumsumlist(start,user,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		map.put("list", sumsum);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

	public ArrayList<SumsumDTO> infoList() {
		ArrayList<SumsumDTO> infoinfo = new ArrayList<SumsumDTO>();
		infoinfo = dao.infoList();
		return infoinfo;
	}

	public ArrayList<SumsumDTO> revList() {
		ArrayList<SumsumDTO> revrev = new ArrayList<SumsumDTO>();
		revrev = dao.revList();
		return revrev;
	}


}
