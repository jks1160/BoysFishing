package com.boys.fishing.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.board.dao.BoardDAO;
import com.boys.fishing.board.dto.SumsumDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;
	
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		ArrayList<HashMap<String, String>> qnaList = dao.qna();
		/*
		 * for (HashMap<String, String> hashMap : qnaList) { String regdate =
		 * hashMap.get("Q_REGDATE"); hashMap.replace("Q_REGDATE",
		 * regdate.substring(regdate.lastIndexOf(" "))); }
		 */
		mav.addObject("QNAList",qnaList);
		mav.setViewName("QNA");
		return mav;
	}

	public String QNAwrite(SumsumDTO dto, RedirectAttributes attr) {
		String page = "redirect:/qna";
		String msg = "QNA 등록에 실패했습니다.";
		if(dao.QNAwrite(dto)>0) {
			msg = "QNA 등록에 성공했습니다.";
		}
		attr.addFlashAttribute("msg",msg);
		return page;
	}
	
}
