package com.boys.fishing.user.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {
	UserDTO myUserInfo(String u_userid);
	
	
	
	

	
	
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



















}
