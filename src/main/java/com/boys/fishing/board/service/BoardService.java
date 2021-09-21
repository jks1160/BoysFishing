package com.boys.fishing.board.service;

<<<<<<< HEAD
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
=======
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
>>>>>>> d58958cf47a3bf6bed776e45383facb4a27c5690
	
}
