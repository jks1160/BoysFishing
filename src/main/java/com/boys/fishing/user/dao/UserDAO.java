package com.boys.fishing.user.dao;

import java.util.ArrayList;

import com.boys.fishing.board.dto.SumsumDTO;

public interface UserDAO {

	ArrayList<SumsumDTO> sumsumlist();
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {

	UserDTO myUserInfo(String u_userid);

}
