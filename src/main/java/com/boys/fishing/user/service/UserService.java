package com.boys.fishing.user.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
	// 외우자 외우자 외우자 외우자!!
	@Value("#{config['Globals.filePath']}")
	String root;
	
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
		logger.info("kakaoYN : " + dto.getU_kakaoYN());
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
		if (dto.getU_kakaoYN() == 'Y') {
			logger.info("카카오 회원가입 dao 진입");
			dto.setU_userpw(pw);
			logger.info("pw : "+pw);
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, String> map = dao.login(id);
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String page = "login";
		String msg = "로그인에 실패하였습니다. \\n아이디와 비밀번호를 확인해주세요.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(map.get("BL_CODE") != null && map.get("BL_CODE").equals("BL003")) {
			logger.info("블랙리스트 확인");
			msg = "고객님 께서는 "+sdf.format(map.get("BL_REGDATE"))+"기준으로\\n 블랙리스트로 등록되어 "
					+ "로그인이 제한됩니다.\\n 해지일은 "+sdf.format(map.get("BL_DISDATE"))+"일 입니다.";
		}else {
			if (encoder.matches(pw, map.get("U_USERPW"))) {	
				Iterator<String> iteratorKey = map.keySet().iterator();
				while (iteratorKey.hasNext()) {
			        String key = iteratorKey.next();
			        userInfo.put(key.toLowerCase(), map.get(key).toString());
			    }
				userInfo.remove("u_userpw");
				page = "mainPage";
				msg = "환영합니다. " + userInfo.get("u_usernickname") + "님";
			}			
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
		 * for (IslandDTO items : list) { logger.info("섬 x좌표 : {} 섬 y좌표 : {}",
		 * items.getI_latitude(), items.getI_longitude()); }
		 */

		return mav;
	}

	public UserDTO lookUp(String id) {
		logger.info("카카오 테이블 조회");
		return dao.lookUp(id);
	}
/** 조재현
 *  선장 요청 메소드 
 *  선장 요청 테이블과 사진 테이블에 들어간다.(트랜잭션)
 * @param userId 유저의 아이디
 * @param fileList 자격증 정보들 파일이다.
 * @return
 */
	@Transactional
	public ModelAndView captain_request(String userId, List<MultipartFile> fileList) {
		logger.info("아이디 : {}", userId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("captain_requestForm");
		//선장 요청은 한번만 들어가면 된다.
		int request_cap = dao.captain_request(userId);
		
		//파일 추출
		for (MultipartFile files : fileList) {
			//원본 파일 명
			logger.info("파일명 :{} 업로드 시작",files.getOriginalFilename());
			// 이름을 바꾸어서 저장 (원본 이름은 필요 없다.)
			String newFileName = System.currentTimeMillis()+files.getOriginalFilename().substring(files.getOriginalFilename().lastIndexOf("."));			
			
			// 파일 다운로드
			try {
				byte[] bytes = files.getBytes(); // 바이트로 다운
				Path filePath = Paths.get(root+newFileName); //경로 설정
				Files.write(filePath, bytes); //파일 저장
				// 저장 된 파일 호출 경로
				String path = "/photo/" + newFileName;
				int success = dao.captainPhoto(path,userId);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		
		return mav;
	}


}
