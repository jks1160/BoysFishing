package com.boys.fishing.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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
	public ModelAndView someTalk(@RequestParam(required = false) String selec) {
		logger.info("섬섬톡페이지 요청");
		logger.info("cate : "+selec);
		if(selec == null) {
			selec = "B001";
		}
		String title = "";
		switch (selec) {
		case "B001":
			title = "자유게시판";
			break;
		case "B002":
			title = "후기게시판";
			break;
		case "B003":
			title = "정보게시판";
			break;
		}
		return service.someTalkList(selec).addObject("selec",title);
	}
	@RequestMapping(value = "/someWriteForm")
	public ModelAndView someWriteForm(HttpSession session) {
		logger.info("섬섬톡 글쓰기폼 요청");
		
		
		return service.someWriteForm();
	}
	
	@RequestMapping(value = "/someWrite")
	public String someWrite(@ModelAttribute SumsumDTO dto, HttpSession session) {
		logger.info("섬섬톡 글쓰고 요청");
		HashMap<String, String> userinfo = (HashMap<String, String>) session.getAttribute("userinfo");
		dto.setB_userid(userinfo.get("u_userid"));
		
		
		return service.someWrite(dto);
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
	
	
	@RequestMapping(value = "/upload", method= RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) { // input의 name과 맞춰서 받아야함. session은 글에 등록된 파일을 저장하기 위하여 활용
		logger.info("파일업로드 요청");
		return service.fileUpload(file, session);
	}
	
	
	@RequestMapping(value = "/fileDelete",method= RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> fileDelete(@RequestParam String fileName, HttpSession session) {
		logger.info("파일삭제 요청 : "+fileName);
		return service.fileDelete(fileName, session);
	}
	
	

}
