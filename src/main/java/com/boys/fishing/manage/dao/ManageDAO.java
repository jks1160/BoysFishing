package com.boys.fishing.manage.dao;

import java.util.ArrayList;

import com.boys.fishing.manage.dto.ManageDTO;

public interface ManageDAO {

	ArrayList<ManageDTO> capRequestList();

	ArrayList<ManageDTO> capRequestList(int start, int end);

	int allCount();

}
