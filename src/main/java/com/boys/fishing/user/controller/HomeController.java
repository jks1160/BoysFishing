package com.boys.fishing.user.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		
		session.removeAttribute("userinfo");
		session.removeAttribute("captainYN");
		
		return "mainPage";
	}
		
	@RequestMapping(value="/myUserInfo", method = RequestMethod.GET)
	public ModelAndView myUserInfo(HttpSession session) {
		logger.info("회원정보조회 페이지 ");
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return service.myUserInfo(u_userid);
	}	
	
	@RequestMapping(value="/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("회원가입 페이지 요청 ");
		
		return "joinForm";
	}
	
	@RequestMapping(value="/join", method = RequestMethod.POST)
	public String join(@ModelAttribute UserDTO dto, @RequestParam String emailEnd, RedirectAttributes attr, MultipartFile file) {
		logger.info("회원가입 요청 ");
		dto.setU_useremail(dto.getU_useremail() + "@" + emailEnd);
		logger.info(dto.getU_useremail());
		return service.join(dto, attr, file);
	}
	//달력
	@RequestMapping(value="/calendar", method = RequestMethod.GET)
	public String calendar(@ModelAttribute UserDTO dto, HttpSession session) {
		logger.info("달력 테스트 ");
		
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("맵 : {}",map);
		logger.info("아이디 : {}", map.get("u_userid"));
		session.setAttribute("u_userid", map.get("u_userid"));
		
		
		return "calendar";
	}
	@RequestMapping(value="/overCheck", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> overCheck(@RequestParam HashMap<String, String> map) {
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
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam String id, @RequestParam String pw, HttpSession session) { // input의 name과 맞춰서 받아야함. session은 글에 등록된 파일을 저장하기 위하여 활용
		logger.info("로그인 요청");
		
		return service.login(id, pw ,session);
	}
	
	@RequestMapping(value = "/uploadForm")
	public String uploadForm() {
		logger.info("파일업로드 폼 요청");
		return "uploadForm";
	}
	@RequestMapping(value="/captain_request", method= RequestMethod.POST)
	public ModelAndView captain_request(HttpSession session, MultipartHttpServletRequest multi) {
		logger.info("왔나?:{}", session.getAttribute("userinfo"));
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String userId = (String) map.get("u_userid");
		
		List<MultipartFile> fileList = multi.getFiles("filesname[]");
		
		logger.info("등록된 사진의 수 : {}",fileList.size());
		
		return service.captain_request(userId,fileList);
	}
	
	@RequestMapping(value="/myUserInfoUpdateForm", method = RequestMethod.GET)
	public ModelAndView myUserInfoUpdateForm(HttpSession session) {
		logger.info("회원정보수정 페이지 ");
	
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return service.myUserInfoUpdateForm(u_userid);
	}
	
	@RequestMapping(value="/nickcheck", method = RequestMethod.POST)
	public @ResponseBody boolean nickcheck(String u_usernickname) {
		logger.info("닉네임 중복체크 ");

		return service.nickcheck(u_usernickname);
	}
	
	@RequestMapping(value="/userInfoUpdate", method = RequestMethod.POST)
	public ModelAndView userInfoUpdate(@RequestParam HashMap<String, String> params, HttpSession session) { //영환
		logger.info("회원정보수정 ");
		
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		
		logger.info("수정 요청 : {}",params);
		return service.userInfoUpdate(params,u_userid);
	}	
	
	@RequestMapping(value = "/myUserInfoPwUpdate")
	public String myUserInfoPwUpdate(Model model) { //영환
		return "myUserInfoPwUpdate";
	}
	
	@RequestMapping(value = "/PwUpdate", method = RequestMethod.POST)
	public ModelAndView PwUpdate(HttpSession session,@RequestParam String newPw) { //영환
		logger.info("회원 비밀번호 변경 ");
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		System.out.println(u_userid+"/"+newPw);
		
		return service.PwUpdate(newPw,u_userid);
	}
	
	@RequestMapping(value="/fileUpdate", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, String> fileUpdate(HttpSession session,MultipartFile file) { //영환
		logger.info("프로필이미지 수정 ");

		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return service.fileUpdate(u_userid,file);
	}
	
	@RequestMapping(value="/fileDel", method = RequestMethod.POST)
	public @ResponseBody boolean fileDel(HttpSession session) { //영환
		logger.info("프로필이미지 삭제 ");

		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return service.fileDel(u_userid);
	}
	
	@RequestMapping(value="/userQuit", method = RequestMethod.GET)
	public String userQuit(HttpSession session) { //영환
		logger.info("회원탈퇴 ");
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		service.userQuit(u_userid);
		session.removeAttribute("userinfo"); //모든 세션정보 삭제
		return "redirect:/";
	}
	
	@RequestMapping(value="/myUserReserve", method = RequestMethod.GET)
	public String myUserReserve(HttpSession session) { //영환
		
		HashMap<String, Object> map = (HashMap<String, Object>) session.getAttribute("userinfo");
		String u_userid = (String)map.get("u_userid");
		session.setAttribute("u_userid", u_userid);
		
		logger.info("예약확인페이지 요청 아이디: {}", u_userid);
			
		return "myUserReserve";
	}	
	
	@RequestMapping(value="/myReserveDetail", method = RequestMethod.GET)
	public String myReserveDetail(HttpSession session) { //영환
		logger.info("예약확인 상세보기 ");
	
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return "myReserveDetail";
	}	
	
	@RequestMapping(value="/shipList", method = RequestMethod.GET)
	public ModelAndView shipList(HttpSession session) { //영환
		logger.info("배 리스트보기");
	
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return service.shipList(u_userid);
	}	
	
	@RequestMapping(value="/shipJoin", method = RequestMethod.GET)
	public String shipJoin(HttpSession session) { //영환
		logger.info("배 등록하기");
	
		HashMap<String, Object> map = (HashMap<String, Object>)session.getAttribute("userinfo");
		logger.info("아이디 : {}", map.get("u_userid"));
		String u_userid = (String) map.get("u_userid");
		return "shipJoin";
	}	
}
