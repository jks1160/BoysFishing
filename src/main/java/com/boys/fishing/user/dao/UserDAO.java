package com.boys.fishing.user.dao;

import java.util.ArrayList;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {
	ArrayList<SumsumDTO> sumsumlist();


	UserDTO myUserInfo(String u_userid);
}
