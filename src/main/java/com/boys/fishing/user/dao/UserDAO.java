package com.boys.fishing.user.dao;

import java.util.ArrayList;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {
	ArrayList<SumsumDTO> sumsumlist(int page, String user, int totalPage);


	UserDTO myUserInfo(String u_userid);


	ArrayList<SumsumDTO> infoList(int start, String user, int end);


	ArrayList<SumsumDTO> revList(int start, String user, int end);


	int totalPage(String user, String code);
}
