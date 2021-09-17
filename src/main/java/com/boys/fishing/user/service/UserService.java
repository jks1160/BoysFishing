package com.boys.fishing.user.service;



import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

	public HashMap<String, Object> overCheck(String col, String val) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "일치하는 사용자가 없습니다.";
		if(dao.overCheck(col, val)>0) {
			msg = "일치하는 사용자가 있습니다.";
			if(col.equals("U_userid")) {
				map.put("idChvar", true);
			}else {
				map.put("nickChvar", true);
			}
		}
		map.put("msg", msg);
		return map;
	}

}
