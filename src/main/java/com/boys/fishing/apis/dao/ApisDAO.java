package com.boys.fishing.apis.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.apis.dto.IslandDTO;

public interface ApisDAO {

	ArrayList<IslandDTO> reserResearch(HashMap<String, Object> searchData);

	ArrayList<IslandDTO> islandsList();


}
