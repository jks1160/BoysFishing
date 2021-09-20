package com.boys.fishing.reservation.dao;

import java.util.ArrayList;

import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.reservation.dto.ReserDTO;

public interface ReserDAO {

	ArrayList<ReserDTO> findShip(String find_ship);

	ArrayList<ReserDTO> user_reser(String id);

	IslandDTO detail_island(String choice);

	

	

	

}
