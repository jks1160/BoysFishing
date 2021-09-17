package com.boys.fishing.user.dao;

import java.util.ArrayList;

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
	int point(String id);



	void pointCharge(int balance, int p_charge, String user);
	void pointWithdraw(int balance, int p_withdraw, String user);

}
