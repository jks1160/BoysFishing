package com.boys.fishing.user.service;

import java.io.File;
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
import com.boys.fishing.reservation.dto.ReserDTO;
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
		System.out.println("유저닉네임:" + dto.getU_usernickname()+"프로필이미지:"+dto.getUi_name());
		mav.addObject("dto", dto);
		mav.setViewName("myUserInfo");

		return mav;
	}

	public HashMap<String, String> overCheck(String col, String val) {
		HashMap<String, String> map = new HashMap<String, String>();
		String msg = "일치하는 사용자가 있습니다.";
		String idChvar = "false";
		String nickChvar = "false";
		if (dao.overCheck(col, val) == 0) {
			msg = "일치하는 사용자가 없습니다.";
			if (col.equals("u_userid")) {
				idChvar = "true";
			} else {
				nickChvar = "true";
			}
		}
		map.put("msg", msg);
		map.put("idChvar", idChvar);
		map.put("nickChvar", nickChvar);
		return map;
	}

	@Transactional
	public String join(UserDTO dto, RedirectAttributes attr, MultipartFile file) {
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
		
		String fileName = file.getOriginalFilename();
		logger.info("fileName : "+fileName);
		if (!fileName.isEmpty() || !fileName.equals("")) {
			logger.info("파일 등록 진입");
			fileName = fileUpload(file, attr);
			dao.userProfile(dto.getU_userid(), fileName);
		}
		if (dto.getU_kakaoYN() == 'Y') {
			logger.info("카카오 회원가입 dao 진입");
			dto.setU_userpw(pw);
			logger.info("pw : " + pw);
			dao.kakaoJoin(dto);
		}
		dao.pointSet(dto.getU_userid());
		return page;
	}

	public String fileUpload(MultipartFile file, RedirectAttributes attr) {
		
		String fileName = file.getOriginalFilename();
		fileName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get("C:/upload/" + fileName);
			Files.write(filePath, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return fileName;
	}

	public ModelAndView login(String id, String pw, HttpSession session) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm");
		ModelAndView mav = new ModelAndView();

		HashMap<String, String> map = dao.login(id);
		HashMap<String, String> userInfo = new HashMap<String, String>();
		String page = "login";
		String msg = "로그인에 실패하였습니다. \\n아이디와 비밀번호를 확인해주세요.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if(map != null) {		
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

	/**
	 * 조재현 선장 요청 메소드 선장 요청 테이블과 사진 테이블에 들어간다.(트랜잭션)
	 * 
	 * @param userId   유저의 아이디
	 * @param fileList 자격증 정보들 파일이다.
	 * @return
	 */
	@Transactional
	public ModelAndView captain_request(String userId, List<MultipartFile> fileList) {
		logger.info("아이디 : {}", userId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myPage");
		// 선장 요청은 한번만 들어가면 된다.
		int request_cap = dao.captain_request(userId);

		// 파일 추출
		for (MultipartFile files : fileList) {
			// 원본 파일 명
			logger.info("파일명 :{} 업로드 시작", files.getOriginalFilename());
			// 이름을 바꾸어서 저장 (원본 이름은 필요 없다.)
			String newFileName = System.currentTimeMillis()
					+ files.getOriginalFilename().substring(files.getOriginalFilename().lastIndexOf("."));

			// 파일 다운로드
			try {
				byte[] bytes = files.getBytes(); // 바이트로 다운
				Path filePath = Paths.get(root + newFileName); // 경로 설정
				Files.write(filePath, bytes); // 파일 저장
				// 저장 된 파일 호출 경로
				String path = "/photo/" + newFileName;
				// db에 사진 넣기.
				int success = dao.captainPhoto(path, userId);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return mav;
	}

	/** 선장 요청 폼 진입 여부
	 * 
	 * @param userId
	 * @param redirect 
	 * @return
	 */
	public ModelAndView captain_requestForm(String userId, RedirectAttributes redirect) {
		logger.info("선장 신청 페이지 요청 아이디: {}", userId);
		ModelAndView mav = new ModelAndView();

		String path = "captain_requestForm";
		logger.info("이것이 레전드 : {}", dao.captain_requestForm(userId));
		
		if(dao.check_cap(userId) >0) { //선장 요청했는지 확인
			// 해당 요청이 있는지 검사
			if (dao.captain_requestForm(userId).equals("Y") || dao.captain_requestForm(userId).equals("S")) {
				String msg = "이미 요청이 된 상태입니다.";
				redirect.addFlashAttribute("msg",msg);
				path = "redirect:/myPage";
			}			
		}
		
		

		mav.setViewName(path);

		return mav;
	}
	
	public ModelAndView myUserInfoUpdateForm(String u_userid) { //영환
		logger.info("회원정보 수정폼 서비스");
		System.out.println("id : "+u_userid);
		ModelAndView mav = new ModelAndView();
		UserDTO dto = dao.myUserInfo(u_userid);
		System.out.println("유저 이메일:"+dto.getU_useremail());
		String email = dto.getU_useremail();
		String emailname = email.substring(0,email.lastIndexOf("@"));
		String emaildomain = email.substring(email.lastIndexOf("@")+1);
		System.out.println(emailname+"/"+emaildomain);
		mav.addObject("emailname",emailname);
		mav.addObject("emaildomain",emaildomain);
		mav.addObject("dto",dto);
		mav.setViewName("myUserInfoUpdateForm");
		
		return mav;
	}

	public boolean nickcheck(String u_usernickname) { //영환
		logger.info("닉네임 중복체크 서비스");
		boolean overChk = false;
		int isOverChk = dao.nickcheck(u_usernickname);
		if(isOverChk == 0) {
			overChk = true;
		}
		return overChk;
	}

	public ModelAndView userInfoUpdate(HashMap<String, String> params, String u_userid) { //영환
		logger.info("회원정보 수정 요청 서비스");
		params.get("emailname");
		String useremail = params.get("emailname") + "@" + params.get("emaildomain");
		System.out.println(useremail);
		params.put("useremail", useremail);
		params.put("u_userid", u_userid);
		logger.info("수정 요청 : {}",params);
		ModelAndView mav = new ModelAndView();
		dao.userInfoUpdate(params);
		UserDTO dto = dao.myUserInfo(u_userid);
		mav.addObject("dto",dto);
		mav.setViewName("myUserInfo");
		return mav;
	}

	public ModelAndView PwUpdate(String newPw, String u_userid) { //영환
		logger.info("비밀번호 변경 서비스");
		ModelAndView mav = new ModelAndView();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String enc_pass = encoder.encode(newPw);
		System.out.println(enc_pass);
		int PwUpdate = dao.PwUpdate(enc_pass,u_userid);
		if(PwUpdate>0) {
			mav.addObject("msg","성공");
			mav.setViewName("myUserInfoPwUpdate");
		}else {
			mav.addObject("msg","실패");
			mav.setViewName("myUserInfoPwUpdate");
		}
		return mav;
	}

	public HashMap<String, String> fileUpdate(String u_userid, MultipartFile file) {
		logger.info("프로필 이미지 수정");
		HashMap<String, String> map = new HashMap<String, String>();
		
		int fileCheck = dao.fileCheck(u_userid);
		if(fileCheck>0) {
			UserDTO dto = dao.fileName(u_userid);
			String fileName = dto.getUi_name();
			System.out.println("파일이름"+fileName);
			dao.fileDelete(u_userid);
			
			File delFile = new File("C:/upload/"+fileName);
			
			if(delFile.exists()) {
				delFile.delete();
			}
		}
		
		String fileName = file.getOriginalFilename();//파일명추출
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		System.out.println("파일이름:"+fileName+"/새파일이름:"+newFileName);
		try {
			 byte[] bytes = file.getBytes();

			 Path filePath = Paths.get("C:/upload/"+newFileName); 
			 Files.write(filePath, bytes); 

			 String path = "/photo/"+newFileName;
			 map.put("path", path);

			 dao.fileUpdate(u_userid,newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}

	public boolean fileDel(String u_userid) { //영환
		logger.info("프로필 이미지 삭제");
		boolean fileDel = false;
		int fileCheck = dao.fileCheck(u_userid);
		if(fileCheck>0) {
			UserDTO dto = dao.fileName(u_userid);
			String fileName = dto.getUi_name();
			System.out.println("파일이름"+fileName);
			dao.fileDelete(u_userid);
			
			File delFile = new File("C:/upload/"+fileName);
			
			if(delFile.exists()) {
				delFile.delete();
				fileDel = true;
			}
		}
		return fileDel;
	}

	public void userQuit(String u_userid) { //영환
		logger.info("회원 탈퇴 요청");
		dao.userQuit(u_userid);
		
	}

	public ModelAndView shipList(String u_userid, RedirectAttributes rttr) {
		logger.info("배 리스트");
		ArrayList<ReserDTO> list = new ArrayList<ReserDTO>();
		ModelAndView mav = new ModelAndView();
		list =  dao.shipList(u_userid);
		String path = "shipList";
		if(list.size()==0) {
			rttr.addFlashAttribute("msg","등록된 배 정보가 없습니다. 먼저 등록을 진행해 주세요.");
			path = "redirect:/shipJoinForm";	
		}
		mav.addObject("list",list);
		mav.setViewName(path);			
		return mav;
	}

	/**
	 * 알람을 보내는 메서드
	 * 
	 * @param u_userid : String - 알람을 받을 userid
	 * @param content  : String - 알람창에 띄워줄 내용
	 * @param code     : String - 알람코드 ( - 일반 유저 A1_001 : 예약확정알람 A1_002 : 예약취소알람
	 *                 A1_003 : 댓글알람 A1_004 : 대댓글알람 A1_006 : Q&A알람
	 * 
	 *                 - 선장 A2_001 : 예약신청알람 A2_002 : 예약취소알람 A2_003 : 선장인증알람
	 * @param num : Number 글번호가 필요한 경우 입력
	 * @return 전송 결과 값 : void
	 */
	public void notice(String u_userid, String content, String code) {
		logger.info("일반 알림 삽입");
		UserDTO dto = new UserDTO();
		dto.setA_userid(u_userid);
		dto.setA_code(code);
		dto.setA_content(content);
		dto.setA_path("redirect:/myUserReserve");
		dao.notice(dto);
	}
	public void notice(String u_userid, String content, String code, int num) {
		logger.info("글 관련 알림 삽입");
		UserDTO dto = new UserDTO();
		dto.setA_userid(u_userid);
		dto.setA_code(code);
		dto.setA_content(content);
		dto.setA_pathnum(num);
		dto.setA_path("redirect:/");
		dao.notice(dto);
	}


	public HashMap<String, String> shipFileUpdate(HttpSession session, MultipartFile file) { //영환
		logger.info("배 이미지 업로드");
		HashMap<String, String> map = new HashMap<String, String>();
			
		String fileName = file.getOriginalFilename();//파일명추출
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		System.out.println("파일이름:"+fileName+"/새파일이름:"+newFileName);
		try {
			 byte[] bytes = file.getBytes();

			 Path filePath = Paths.get("C:/upload/"+newFileName); 
			 Files.write(filePath, bytes); 

			 String path = "/photo/"+newFileName;
			 map.put("path", path);
			 session.setAttribute("newFileName", newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public void shipFileDelete(HttpSession session) {
		logger.info("배 이미지 제거");
		
			System.out.println("파일이름"+session.getAttribute("newFileName"));		
			File delFile = new File("C:/upload/"+session.getAttribute("newFileName"));
			
			if(delFile.exists()) {
				delFile.delete();
			}
		
}
	@Transactional
	public ModelAndView shipJoin(String newFileName, HashMap<String, String> params, String u_userid, String ship) { //영환
		logger.info("배 등록");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/shipList");
		String s_address = params.get("address") + " " +params.get("addressDetail");
		
		//장비
		String equipment = "";
		for(int i=0; i < 6; i++) {
			String e = "e_"+i;
			String ee = params.get(e);
			if(ee != null) {
				String eee = params.get(e)+","; 
				equipment += eee; 
				
			}
		}
		String s_equipment = equipment.substring(0,equipment.length()-1);
		
		//편의시설
		String convenient = "";
		for(int i=0; i < 11; i++) {
			String c = "c_"+i;
			String cc = params.get(c);
			if(cc != null) {
				String ccc = params.get(c)+","; 
				convenient += ccc; 
				
			}
		}
		String s_convenient = convenient.substring(0,convenient.length()-1);
		
		logger.info("장비 :"+s_equipment);
		logger.info("편의시설 :"+s_convenient);
		logger.info("주소 :"+s_address);
		logger.info("params {}", params);
		params.put("newFileName", newFileName); //세션에서 가져온 이미지이름
		
		ReserDTO dto = new ReserDTO();
		params.put("u_userid", u_userid); // 세션에서 가져온 값
		params.put("address", s_address); // 도로명주소  + 상세주소 합친 주소
		params.put("equipment", s_equipment); // 체크한 장비
		params.put("convenient", s_convenient); // 체크한 편의시설
		
		dto.setU_userid(u_userid);
		dto.setS_address(s_address);
		dto.setS_equipment(s_equipment);
		dto.setS_convenient(s_convenient);
		dto.setS_name(params.get("s_name"));
		
		dto.setS_minpassenger(Integer.parseInt(params.get("s_minpassenger")));
		dto.setS_maxpassenger(Integer.parseInt(params.get("s_maxpassenger")));
		
		if(ship.equals("join")) { // 배 신규 등록할 경우
			dao.shipJoin(dto); //배 정보 인서트 (이미지여부 N) 배 넘버 key값 가져오기
			logger.info("등록한 s_num :"+dto.getS_num());
			String s_num = Integer.toString(dto.getS_num());
			params.put("s_num", s_num); //key값 params에 넣기
		if(newFileName !=null) { //이미지가 있을 경우 
			dao.shipImgY(params); //이미지 여부 Y로 업데이트
			dao.shipImgInsert(params); //이미지 테이블에 인서트
			}
		}
		
		if(ship.equals("update")) { // 배 정보 업데이트 할 경우
			dao.shipUpdate(dto); //배 정보 업데이트 (이미지여부 N) 배 넘버 key값 가져오기
			logger.info("업데이트 s_num :"+params.get("s_num"));
			//String s_num = Integer.toString(dto.getS_num());
			//params.put("s_num", s_num); //key값 params에 넣기
		if(newFileName !=null) { //이미지가 있을 경우 
			dao.shipImgUpdate(params); // 이미지 테이블 업데이트
		}else{
			dao.shipImgDelete(params); //이미지 테이블 딜리트
			dao.shipImgN(params); // 이미지 여부 N 업데이트
			}
		}
		
		return mav;
	}

	public HashMap<String, Object> shipListDetail(String u_userid, String s_name) { //영환
		logger.info("배 정보 불러오기 서비스");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ReserDTO dto = dao.shipListDetail(u_userid,s_name);
		if(dto.getSi_name() != null) {
			String path = "/photo/" + dto.getSi_name();
			map.put("path", path);
		}
		
		map.put("dto", dto);
		return map;
	}

	public ModelAndView myReserveDetail(String ri_num) { //영환
		logger.info("예약 상세보기 서비스");
		String page = "myReserveDetail";
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map = dao.myReserveDetail(ri_num); //해당 회원의 예약정보
		mav.addObject("map",map);
		mav.setViewName(page);
		
		return mav;
	}
	
	
}
