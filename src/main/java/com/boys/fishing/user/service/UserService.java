package com.boys.fishing.user.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.apis.dao.ApisDAO;
import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.user.dao.UserDAO;
import com.boys.fishing.user.dto.UserDTO;

@Service
public class UserService {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	UserDAO dao;
	@Autowired
	ApisDAO apiDAO;

	public ModelAndView myUserInfo(String u_userid) {
		logger.info("회원조회 서비스");
		System.out.println("id : " + u_userid);
		ModelAndView mav = new ModelAndView();
		UserDTO dto = dao.myUserInfo(u_userid);
		System.out.println("유저닉네임:" + dto.getU_usernickname());
		mav.addObject("dto", dto);
		mav.setViewName("myUserInfo");

		return mav;
	}

	public HashMap<String, String> overCheck(String col, String val) {
		HashMap<String, String> map = new HashMap<String, String>();
		String msg = "일치하는 사용자가 없습니다.";
		map.put("idChvar", "true");
		map.put("nickChvar", "true");
		if (dao.overCheck(col, val) > 0) {
			msg = "일치하는 사용자가 있습니다.";
			if (col.equals("U_userid")) {
				map.put("idChvar", "false");
			} else {
				map.put("nickChvar", "false");
			}
		}
		map.put("msg", msg);
		return map;
	}

	@Transactional
	public String join(UserDTO dto, String fileName, RedirectAttributes attr) {
		logger.info("kakaoYN : "+dto.getU_kakaoYN());
		String pw = dto.getU_userpw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		dto.setU_userpw(encoder.encode(dto.getU_userpw()));
		String page = "redirect:/joinForm";
		if (dao.join(dto) > 0) {
			logger.info("회원가입 정보 DB 입력완료");
			page = "redirect:/login";
			attr.addAttribute("id", dto.getU_userid());
			attr.addAttribute("pw", pw);
		} else {
			attr.addFlashAttribute("msg", "다시 시도해주세요.");
		}

		if (fileName != "") {
			dao.userProfile(dto.getU_userid(), fileName);
		}
		if(dto.getU_kakaoYN() == 'Y') {
			logger.info("카카오 회원가입 dao 진입");
			dao.kakaoJoin(dto);
		}
		return page;
	}

	public String fileUpload(MultipartFile file, RedirectAttributes attr) {

		String fileName = file.getOriginalFilename();
		logger.info(fileName);
		fileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get("C:/upload/" + fileName);
			Files.write(filePath, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
		attr.addFlashAttribute("fileName", fileName);
		return "redirect:/uploadForm";
	}

	public ModelAndView login(String id, String pw, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> userInfo = dao.login(id);
		String page = "login";
		String msg = "로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		logger.info(userInfo.get("U_USERPW"));
		if (encoder.matches(pw, userInfo.get("U_USERPW"))) {
			userInfo.put("u_userid", userInfo.get("U_USERID"));
			userInfo.put("u_usernickname", userInfo.get("U_USERNICKNAME"));
			userInfo.put("u_managerYN", userInfo.get("U_MANAGERYN"));
			userInfo.put("u_kakaoYN", userInfo.get("U_KAKAOYN"));
			userInfo.put("ui_name", userInfo.get("UI_NAME"));
			page = "mainPage";
			msg = "환영합니다. " + userInfo.get("u_usernickname") + "님";
		}
		session.setAttribute("userinfo", userInfo);
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	/**
	 * 조재현 모든 섬들의 정보를 가져오는 메소드이다.
	 * 
	 * @return ArrayList<IslandDTO>
	 */
	public ModelAndView islandsReservation() {

		logger.info("섬 목록보기 / 예약하기 서비스 요청 ");
		ModelAndView mav = new ModelAndView();

		// 모든 섬들의 리스트를 가져온다.
		ArrayList<IslandDTO> list = apiDAO.islandsList();

		// 섬정보들을 여기에 담아서 보낸다.
		mav.addObject("island_list", list);
		// 섬 정보 페이지로 이동시키기위한 view 설정
		mav.setViewName("islandsReservation");
		
		  // 데이터 제대로 받았는지 테스트
		  
			/*
			 * for (IslandDTO items : list) { logger.info("섬 번호 : {} 섬 이름 : {}",
			 * items.getI_num(), items.getI_name()); }
			 */
		 

		return mav;
	}

	

}
