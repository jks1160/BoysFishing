package com.boys.fishing.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.reservation.dto.ReserDTO;
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {
UserDTO myUserInfo(String u_userid); //영환
	
	int nickcheck(String u_usernickname); //영환
	
	void userInfoUpdate(HashMap<String, String> params); //영환
	
	int PwUpdate(String enc_pass, String u_userid); //영환
	
	int fileCheck(String u_userid); //영환

	void fileDelete(String u_userid); //영환

	void fileUpdate(String u_userid, String newFileName); //영환

	UserDTO fileName(String u_userid); //영환

	void userQuit(String u_userid); //영환
	
	
	
	

	
	
	ArrayList<SumsumDTO> sumsumlist(int page, String user, int totalPage);

	ArrayList<SumsumDTO> infoList(int page, String user, int totalPage);

	ArrayList<SumsumDTO> revList(int page, String user, int totalPage);

	int totalPage(String user, String code);







	ArrayList<UserDTO> pointHistoryList(int start, String user, int end);
	int totalPageP(String user);
	int point(String userId);



	void pointCharge(int balance, int p_charge, String user);
	void pointWithdraw(int balance, int p_withdraw, String user);
	int overCheck(String string, String val);







	int join(UserDTO dto);







	int userProfile(String u_userid, String fileName);







	HashMap<String, String> login(String id);

	UserDTO lookUp(String id);







	void kakaoJoin(UserDTO dto);







	String captainYN(String userId);







	int captain_request(String userId);







	int captainPhoto(String path, String userId);







	String captain_requestForm(String userId);

	ArrayList<ReserDTO> shipNamee(String userId);

	ArrayList<ReserDTO> startPoint(int shipNum);

	ArrayList<ReserDTO> islandName(int shipNum);
		
	ReserDTO shipList(String u_userid); //영환

	String shipName(String userId);

	int check_cap(String userId);

	int captainWrite(ReserDTO reser);

	int notice(UserDTO dto);

	ArrayList<ReserDTO> captainSchedule(String u_userid);




















}
