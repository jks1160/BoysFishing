package com.boys.fishing.apis.dao;

import java.util.HashMap;

import com.boys.fishing.apis.dto.IslandDTO;

public interface ApisDAO {

	IslandDTO reserResearch(HashMap<String, Object> searchData);

}
