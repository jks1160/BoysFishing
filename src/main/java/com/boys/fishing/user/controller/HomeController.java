package com.boys.fishing.user.controller;

import java.util.HashMap;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.user.dto.UserDTO;
import com.boys.fishing.user.service.UserService;


@Controller
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UserService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model, HttpSession session) {
		logger.info("보이즈 피싱 프로젝트 Some낚시 시작합니다.");
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("loginId") != null) {
			mav.setViewName("mainPage");
		}
		mav.setViewName("mainPage");
		return mav;
		
	}
	@RequestMapping(value="/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		logger.info("로그인 페이지 요청 ");
		
		return "login";
	}
	@RequestMapping(value="/islandsReservation", method = RequestMethod.GET)
	public ModelAndView islandsReservation() {
		logger.info("섬 정보/ 예약 페이지 입장 ");
		
		return service.islandsReservation();
	}
	@RequestMapping(value="/logOut", method = RequestMethod.GET)
	public String logOut(HttpSession session) {
		logger.info("로그아웃 요청 ");
		
		session.removeAttribute("loginId");
		
		return "mainPage";
	}
		
	@RequestMapping(value="/myUserInfo", method = RequestMethod.GET)
	public ModelAndView myUserInfo(HttpSession session) {
		logger.info("회원정보조회 페이지 ");
		//테스트 세션
		String id = "somefishing";
		session.setAttribute("loginId", id);
		
		String u_userid = (String) session.getAttribute("loginId");
		return service.myUserInfo(u_userid);
	}	
	
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("회원가입 페이지 요청 ");
		
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserDTO dto, @RequestParam String emailEnd, @RequestParam String fileName, RedirectAttributes attr) {
		logger.info("회원가입 요청 ");
		dto.setU_useremail(dto.getU_useremail() + "@" + emailEnd);
		logger.info(dto.getU_useremail());
		return service.join(dto, fileName, attr);
	}
	//달력
	@RequestMapping(value="/calendar", method = RequestMethod.GET)
	public String calendar(@ModelAttribute UserDTO dto, HttpSession session) {
		logger.info("달력 테스트 ");
		session.setAttribute("loginId","test_user1");
		
		
		return "calendar";
	}
	@RequestMapping(value="/overCheck", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> idCheck(@RequestParam HashMap<String, String> map) {
		logger.info("중복 확인 요청 ");
		String col = null;
		String val = null;
		for (Entry<String, String> elem : map.entrySet()) {
			System.out.println("키 : " + elem.getKey() + "값 : " + elem.getValue());
			col = elem.getKey();
			val = elem.getValue();
		}
		
		return service.overCheck(col, val);
	}
	@RequestMapping(value = "/upload", method= RequestMethod.POST)
	public String upload(MultipartFile file, RedirectAttributes attr) { // input의 name과 맞춰서 받아야함. session은 글에 등록된 파일을 저장하기 위하여 활용
		logger.info("파일업로드 요청");
		return service.fileUpload(file, attr);
	}
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam String id, @RequestParam String pw, HttpSession session) { // input의 name과 맞춰서 받아야함. session은 글에 등록된 파일을 저장하기 위하여 활용
		logger.info("로그인 요청");
		
		return service.login(id, pw, session);
	}
}
