package com.boys.fishing.board.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.board.service.BoardService;
import com.boys.fishing.user.dto.UserDTO;

@Controller
public class BoardController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired BoardService service;
	
	@RequestMapping(value = "/someTalk")
	public String someTalk(HttpSession session) {
		logger.info("섬섬톡페이지 요청");
		session.getAttribute("userId");
		
		return "someTalk";
	}
	
	@RequestMapping(value = "someList")
	public HashMap<String, Object> someList(){
		logger.info("자유게시판 리스트 요청");
		
		return null;
	}
	
	@RequestMapping(value = "infoList")
	public HashMap<String, Object> infoList(){
		logger.info("정보게시판 리스트 요청");
		
		return null;
	}
	
	@RequestMapping(value = "revList")
	public HashMap<String, Object> revList(){
		logger.info("후기게시판 리스트 요청");
		
		return null;
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public ModelAndView QNA(Model model, HttpSession session) {
		logger.info("QNA 요청");

		return service.qna();
	}
	@RequestMapping(value = "/QNAForm", method = RequestMethod.GET)
	public String QNAForm() {
		logger.info("QNA 작성폼 요청");

		return "QNAWriteForm";
	}
	@RequestMapping(value = "/QNAwrite", method = RequestMethod.POST)
	public String QNAForm(@ModelAttribute SumsumDTO dto, HttpSession session, RedirectAttributes attr) {
		logger.info("QNA 저장 요청");
		HashMap<String, String> userinfo = (HashMap<String, String>) session.getAttribute("userinfo");
		dto.setQ_writer(userinfo.get("u_userid"));

		return service.QNAwrite(dto,attr);
	}
}
