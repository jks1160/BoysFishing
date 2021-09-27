package com.boys.fishing.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.apis.dto.IslandDTO;
import com.boys.fishing.reservation.dto.ReserDTO;

public interface ReserDAO {

	ArrayList<ReserDTO> findShip(String find_ship);

	ArrayList<ReserDTO> user_reser(String id);

	IslandDTO detail_island(String choice);

	ArrayList<HashMap<String, Object>> captain_reser(String capId);

	int updateCapSche(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> choice_reser(String s_num, String i_num);

	int RealReser(HashMap<String, Object> params);

	int checkReser(HashMap<String, Object> params);

	int delSchdule(HashMap<String, Object> params);


	ArrayList<String> checkNReser(HashMap<String, Object> params);

	void delReser(String ri_num);

	int tryReser(String id, String capId, int i, int j);

	int returnPoint(String ri_num);

	String getReserId(String num);

	int getReserMoney(String num);

	int returnCapPoint(String num, String capId);

	int minusCap(String capId, String reserId, int reserMoney, int i);

	ArrayList<ReserDTO> getOldReser();



	

	

	

}
