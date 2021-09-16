package com.boys.fishing.user.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.user.dao.UserDAO;

@Service
public class myPageService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired UserDAO dao;
	
	public ArrayList<SumsumDTO> list() {
		ArrayList<SumsumDTO> sumsum = new ArrayList<SumsumDTO>();
		sumsum = dao.sumsumlist();
		return sumsum;
	}


}
