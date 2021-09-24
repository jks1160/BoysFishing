package com.boys.fishing.apis.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.reservation.dto.ReserDTO;

public interface ApisDAO {

	ArrayList<IslandDTO> reserResearch(HashMap<String, Object> searchData);

	ArrayList<IslandDTO> islandsList();

	int islanddel();

	int islandcnt();

	IslandDTO getIslandName(String find_ship);

	void todayweatherdel();

	void weatherdel();


}
