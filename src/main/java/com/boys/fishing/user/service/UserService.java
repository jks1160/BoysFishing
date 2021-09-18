package com.boys.fishing.user.service;



import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

import com.boys.fishing.user.dao.UserDAO;
import com.boys.fishing.user.dto.UserDTO;

@Service
public class UserService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired UserDAO dao;
	
	public ModelAndView myUserInfo(String u_userid) {
		logger.info("회원조회 서비스");
		System.out.println("id : "+u_userid);
		ModelAndView mav = new ModelAndView();
		UserDTO dto = dao.myUserInfo(u_userid);
		System.out.println("유저닉네임:"+dto.getU_usernickname());
		mav.addObject("dto",dto);
		mav.setViewName("myUserInfo");
		
		return mav;
	}

	public HashMap<String, String> overCheck(String col, String val) {
		HashMap<String, String> map = new HashMap<String, String>();
		String msg = "일치하는 사용자가 없습니다.";
		map.put("idChvar", "true");
		map.put("nickChvar", "true");
		if(dao.overCheck(col, val)>0) {
			msg = "일치하는 사용자가 있습니다.";
			if(col.equals("U_userid")) {
				map.put("idChvar", "false");
			}else {
				map.put("nickChvar", "false");
			}
		}
		map.put("msg", msg);
		return map;
	}
	
	@Transactional
	public ModelAndView join(UserDTO dto, String fileName) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> map = new HashMap<String, String>();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		dto.setU_userpw(encoder.encode(dto.getU_userpw()));
		mav.setViewName("joinForm");
		mav.addObject("msg","회원가입에 실패했습니다. 다시 시도해주세요");
		if(dao.join(dto)>0) {
			mav.setViewName("mainPage");
			map.put("msg", "회원가입에 성공했습니다.");
			mav.addObject(map);
		}
		
		if(fileName != null) {
			dao.userProfile(dto.getU_userid(), fileName);		
		}
		return mav;
	}

	public String fileUpload(MultipartFile file, RedirectAttributes attr) {
		String path = null;
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
		return "redirect:/joinForm";
	}

	public HashMap<String, String> login(String id, String pw) {
		HashMap<String, String> userInfo = dao.login(id);
		logger.info(userInfo.toString());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		  if(encoder.matches(pw, userInfo.get("U_USERPW"))){
			  userInfo.put("u_userid", userInfo.get("U_USERID"));
			  userInfo.put("u_usernickname", userInfo.get("U_USERNICKNAME"));
			  userInfo.put("u_managerYN", userInfo.get("U_MANAGERYN"));
			  userInfo.put("u_kakaoYN", userInfo.get("U_KAKAOYN"));
			  userInfo.put("ui_name", userInfo.get("UI_NAME"));
		  }

		return userInfo;
	}


}
