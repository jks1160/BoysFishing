package com.boys.fishing.manage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.manage.dto.ManageDTO;

public interface ManageDAO {

	ArrayList<ManageDTO> capRequestList();

	ArrayList<ManageDTO> capRequestList(int start, int end);

	int allCount();

	ManageDTO capreq_detail(String u_userid);

	int capreq_update(HashMap<String, String> map);

	int capreq_reject(HashMap<String, String> map);

	ManageDTO capreq_detailimg(String u_userid);

	ArrayList<ManageDTO> peoplelist();

	ArrayList<ManageDTO> peoplesearch(String searchvalue);

	ArrayList<ManageDTO> peoplelistcall(int startlist, int endlist);

}
