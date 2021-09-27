package com.boys.fishing.user.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.apis.dao.ApisDAO;
import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.reservation.dto.ReserDTO;
import com.boys.fishing.user.dao.UserDAO;
import com.boys.fishing.user.dto.UserDTO;

@Service
public class myPageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDAO dao;
	@Autowired ApisDAO apiDAO; 
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

	//회원 포인트 조회
	public ModelAndView point(String userId) {
		logger.info("회원 포인트조회 서비스");
		ModelAndView mav = new ModelAndView();
		int p_point = dao.point(userId);
		mav.addObject("point",p_point);
		mav.addObject("loginId", userId);
		mav.setViewName("pointPage");
		return mav;
	}

	//회원 포인트 히스토리 조회
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
		
		page = page>pages ? pages : page;
		
		map.put("list", pointHistory);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

	//회원 포인트 충전
	public String pointCharge(int p_charge, String user) {
		int balance = 0;
		int currBalance;
		currBalance = dao.point(user);
		balance = currBalance + p_charge;
		if(balance > 3000000) {
			return "잔액 최대치(3억)을 넘길 수 없습니다.";
		}
		logger.info("balance: "+ balance + "p_charge: "+ p_charge + "user: " + user);
		dao.pointCharge(balance, p_charge, user);
		
		return null;
	}

	//회원 포인트 출금
	public void pointWithdraw(int p_withdraw, String user) {
		int balance = 0;
		int currBalance;
		currBalance = dao.point(user);
		balance = currBalance - p_withdraw;
		logger.info("balance: "+ balance + "p_charge: "+ p_withdraw + "user: " + user);
		dao.pointWithdraw(balance, p_withdraw, user);
		
	}
	
	
	
	public ModelAndView captainScheduleWrite(String userId, Date op_date) {
		logger.info("선장 스케쥴 등록 서비스 진입");
		
		ModelAndView mav = new ModelAndView();
		ArrayList<ReserDTO> shipName = new ArrayList<ReserDTO>();
		shipName = dao.shipNamee(userId);
		mav.addObject("shipName", shipName);
		mav.addObject("op_date", op_date);
		mav.setViewName("captainWriteForm");
		logger.info("여기는 문제없징?");
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	//선장 여부 파악
	public String captainYN(String userId) {
		logger.info("선장 여부 파악 서비스 진입");
		String captainYN = dao.captainYN(userId);
		logger.info("yn여부: "+captainYN);
		return captainYN;
	}

	public HashMap<String, Object> startPoint(int shipNum) {
		logger.info("배 이름 서비스 진입");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReserDTO> startPoint = new ArrayList<ReserDTO>();
		startPoint = dao.startPoint(shipNum);
		for(ReserDTO i : startPoint) {
			System.out.println(i);
		}
		map.put("list", startPoint);
		
		return map;
	}

	public HashMap<String, Object> islandName( ) {
		logger.info("섬 이름 서비스 진입");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<IslandDTO> islandName = new ArrayList<IslandDTO>();
		islandName = apiDAO.islandsList();
		
		map.put("list", islandName);
		
		return map;
	}
	

	/** 한준성
	 *  선장 스케줄 등록 메소드
	 *  
	 *  
	 * @param reser ReserDTO 의 값들입니다.
	 * @return 없음
	 */
		public String captainWrite(ReserDTO reser) {
			logger.info("서비스 진입 : {}", reser);
			int success = dao.captainWrite(reser);
			System.out.println("성공 "+success);
			
		return String.valueOf(success);
	}
		/** 조재현
		 *  선장 업데이트 폼 소환
		 * @param userId
		 * @param params
		 * @return
		 */
	public ModelAndView captainScheduleUpdate(String userId, HashMap<String, String> params) {
		logger.info("스케줄 업데이트 진입 : {}" , userId);
		ModelAndView mav =  new ModelAndView();
		
		ArrayList<ReserDTO> shipName = new ArrayList<ReserDTO>();
		shipName = dao.shipNamee(userId);
		
		logger.info("파람스 :{} ",params);
		mav.addObject("reser",params);
		mav.addObject("shipName",shipName);
		mav.setViewName("captainUpdateForm");
		
		return mav;
	}

	/* 이게 진짜
	public ModelAndView captainScheduleDetail(String userId, Date op_date) {
		//운행관리 예약관리 디테일폼 이동
		ModelAndView mav = new ModelAndView();
		ArrayList<ReserDTO> shipName = new ArrayList<ReserDTO>();
		shipName = dao.shipNamee(userId);
		mav.addObject("shipName", shipName);
		mav.addObject("op_date", op_date);
		mav.setViewName("captainScheduleDetail");
		logger.info("여기는 문제없징?");
		return mav;
	}	
	
	*/
		
		public ModelAndView captainScheduleDetail(String userId, String date) {
			//운행관리 예약관리 디테일폼 이동
			ModelAndView mav = new ModelAndView();
			ArrayList<ReserDTO> shipName = new ArrayList<ReserDTO>();
			shipName = dao.shipNamee(userId);
			mav.addObject("shipName", shipName);
			mav.addObject("date", date);
			mav.setViewName("captainScheduleDetail");
			logger.info("여기는 문제없징?");
			return mav;
		}			
		
	public HashMap<String, Object> reserWait(String userId, String wait, String date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> waitScheduleDetail = new ArrayList<HashMap<String,Object>>();
		waitScheduleDetail = dao.reserWait(userId, wait, date);
		logger.info("Test : {}", waitScheduleDetail);
		map.put("list", waitScheduleDetail);
		return map;
	}
		
		
	public ArrayList<HashMap<String, String>> captainScheduleList(String userid) {
			
		ArrayList<HashMap<String, String>> reserList = dao.captainScheduleList(userid);
			
		for (HashMap<String, String> item : reserList) {
			logger.info("날짜 : {}",item.get("END"));
		}
		
		return reserList;
	}

	public String reserDecide(String num) {
		logger.info("예약확정 서비스 진입");
		int success;
		success = dao.reserDecide(num);
		return String.valueOf(success);
	}

	public HashMap<String, Object> reserHistory(int shipNum, int page) {
		logger.info("운항예약확정 히스토리 서비스 진입");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1; 
		ArrayList<HashMap<String, Object>> reserHistory = new ArrayList<HashMap<String,Object>>();
		
		totalPage = dao.totalPageCR(shipNum);
		reserHistory = dao.reserHistory(start,shipNum,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		
		page = page>pages ? pages : page;
		
		map.put("list", reserHistory);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

	public ModelAndView captainSchedule(String userid) {
		ModelAndView mav = new ModelAndView();
		ArrayList<ReserDTO> shipName = new ArrayList<ReserDTO>();
		shipName = dao.shipNamee(userid);
		mav.addObject("shipName", shipName);
		mav.setViewName("captainSchedule");
		return mav;
	}

	//선장이 운항 예약 취소
	public String reserCancel(String num, String cancelReason) {
		logger.info("예약취소 서비스 진입");
		int success;
		success = dao.reserCancel(num,cancelReason);
		return String.valueOf(success);
	}

	public String decideCancel(String num, String cancelReason) {
		logger.info("예약취소 서비스 진입");
		int success;
		success = dao.decideCancel(num,cancelReason);
		return String.valueOf(success);
	}

	public HashMap<String, Object> reserHistoryList(int page, String userId) {
		logger.info("회원 예약히스토리 조회 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPage;
		int pagePerCnt = 5;
		int end = page*pagePerCnt;
		int start = (end-pagePerCnt)+1;
		
		ArrayList<HashMap<String, Object>> reserHistoryList = new ArrayList<HashMap<String,Object>>();
		totalPage = dao.totalPageR(userId);
		reserHistoryList = dao.reserHistoryList(start,userId,end);
		int pages = (totalPage%pagePerCnt == 0) ? totalPage/pagePerCnt : totalPage/pagePerCnt+1;
		logger.info("총 페이지: "+totalPage);
		
		page = page>pages ? pages : page;
		
		map.put("list", reserHistoryList);
		map.put("totalPage", pages);
		map.put("currPage", page);
		return map;
	}

		
		
		
		
		
		
}
