package com.boys.fishing.user.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dao.UserDAO;
import com.boys.fishing.user.dto.UserDTO;

@Service
public class myPageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDAO dao;
	
	//자유게시판 글리스트
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

	//후기게시판 글리스트
	public HashMap<String, Object> revList(int page, String user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		String code = "B002";
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<SumsumDTO> sumsum = new ArrayList<SumsumDTO>();
		totalPage = dao.totalPage(user,code);
		sumsum = dao.revList(start,user,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		map.put("list", sumsum);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}
	
	//정보게시판 글리스트	
	public HashMap<String, Object> infoList(int page, String user) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		String code = "B003";
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<SumsumDTO> sumsum = new ArrayList<SumsumDTO>();
		totalPage = dao.totalPage(user,code);
		sumsum = dao.infoList(start,user,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		map.put("list", sumsum);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView point(String id) {
		logger.info("회원 포인트조회 서비스");
		ModelAndView mav = new ModelAndView();
		int p_point = dao.point(id);
		mav.addObject("point",p_point);
		mav.setViewName("pointPage");
		return mav;
	}

	public HashMap<String, Object> pointHistoryPage(int page, String user) {
		logger.info("회원 포인트히스토리 조회 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<UserDTO> pointHistory = new ArrayList<UserDTO>();
		totalPage = dao.totalPageP(user);
		pointHistory = dao.pointHistoryList(start,user,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		map.put("list", pointHistory);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

	public void pointCharge(int p_charge, String user) {
		int balance;
		dao.pointCharge(p_charge,user);
		
	}

}
