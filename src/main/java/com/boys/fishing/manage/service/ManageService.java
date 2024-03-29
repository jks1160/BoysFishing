package com.boys.fishing.manage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

	public ModelAndView capreq_detail(String u_userid) {
		ModelAndView mav = new ModelAndView();
		ManageDTO dto = dao.capreq_detail(u_userid);
		ManageDTO dtoimg = dao.capreq_detailimg(u_userid);
		
		mav.addObject("bbs",dto);
		mav.addObject("img",dtoimg);
		
		mav.setViewName("capreq_detail");
		return mav;
	}


	public void capreq_update(HashMap<String, String> map) {
		int suc = dao.capreq_update(map);
		logger.info("수정 성공 여부 :{}",suc);		
	}

	public void capreq_reject(HashMap<String, String> map) {
		int suc = dao.capreq_reject(map);
		logger.info("거절 성공 여부 :{}",suc);	
	}

	public ModelAndView peoplelist() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("peoplelist");		
		ArrayList<ManageDTO> list = dao.peoplelist();
		mav.addObject("list", list);
		
		return mav;
	}

	public ModelAndView peoplesearch(HashMap<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String searchvalue = (String) map.get("searchid");
		ArrayList<ManageDTO> peoplesearch = dao.peoplesearch(searchvalue);
		mav.addObject("peoplesearch", peoplesearch);
		mav.setViewName("peoplelist");		
		
		return mav;
	}

	public HashMap<String, Object> peoplelistcall(int startlist, int endlist) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		startlist = startlist + 5;
		endlist = endlist + 5;
		ArrayList<ManageDTO> list = dao.peoplelistcall(startlist,endlist);
	
		map.put("list", list);
	
		map.put("start", startlist);
		map.put("end", endlist);
		
		return map;
	}
	
}
