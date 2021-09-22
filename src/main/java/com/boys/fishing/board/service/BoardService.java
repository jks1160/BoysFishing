package com.boys.fishing.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.board.dao.BoardDAO;
import com.boys.fishing.board.dto.SumsumDTO;

@Service
public class BoardService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardDAO dao;
	
	public ModelAndView qna() {
		ModelAndView mav = new ModelAndView();
		ArrayList<SumsumDTO> qnaList = dao.qna();
		mav.addObject("QNAList",qnaList);
		mav.setViewName("QNA");
		return mav;
	}
	
}
