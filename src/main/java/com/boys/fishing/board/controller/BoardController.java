package com.boys.fishing.board.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.board.service.BoardService;
import com.boys.fishing.user.service.UserService;

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public ModelAndView QNA(Model model, HttpSession session) {
		logger.info("QNA 요청");

		return service.qna();
	}
}
