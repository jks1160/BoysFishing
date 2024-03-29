package com.boys.fishing.user.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.boys.fishing.board.dto.SumsumDTO;
import com.boys.fishing.reservation.dto.ReserDTO;
import com.boys.fishing.user.dto.UserDTO;

public interface UserDAO {
UserDTO myUserInfo(String u_userid); //영환
	
	int nickcheck(String u_usernickname); //영환
	
	void userInfoUpdate(HashMap<String, String> params); //영환
	
	int PwUpdate(String enc_pass, String u_userid); //영환
	
	int fileCheck(String u_userid); //영환

	void fileDelete(String u_userid); //영환

	void fileUpdate(String u_userid, String newFileName); //영환

	UserDTO fileName(String u_userid); //영환

	void userQuit(String u_userid); //영환
	
	
	
	

	
	
	ArrayList<SumsumDTO> sumsumlist(int page, String user, int totalPage);

	ArrayList<SumsumDTO> infoList(int page, String user, int totalPage);

	ArrayList<SumsumDTO> revList(int page, String user, int totalPage);

	int totalPage(String user, String code);







	ArrayList<UserDTO> pointHistoryList(int start, String user, int end);
	int totalPageP(String user);
	int point(String userId);



	void pointCharge(int balance, int p_charge, String user);
	void pointWithdraw(int balance, int p_withdraw, String user);
	int overCheck(String string, String val);







	int join(UserDTO dto);







	int userProfile(String u_userid, String fileName);







	HashMap<String, String> login(String id);

	UserDTO lookUp(String id);







	void kakaoJoin(UserDTO dto);







	String captainYN(String userId);







	int captain_request(String userId);







	int captainPhoto(String path, String userId);







	String captain_requestForm(String userId);

	ArrayList<ReserDTO> shipNamee(String userId);

	ArrayList<ReserDTO> startPoint(int shipNum);

	ArrayList<ReserDTO> islandName(int shipNum);
		
	ArrayList<ReserDTO> shipList(String u_userid); //영환

	String shipName(String userId); 

	int check_cap(String userId);

	int captainWrite(ReserDTO reser);


	int shipJoin(ReserDTO dto); //영환

	int notice(UserDTO dto);


	ArrayList<HashMap<String, String>> captainScheduleList(String userid);
	ArrayList<ReserDTO> captainScheduleDetail(String userId, Date date);
	ArrayList<HashMap<String, Object>> reserWait(String userId, String wait, String date); //예약 대기중 리스트
	

	int reserDecide(String num);
	ReserDTO shipListDetail(String u_userid, String s_name);


	int pointSet(String u_userid);

	void shipImgY(HashMap<String, String> params); //영환

	void shipImgInsert(HashMap<String, String> params); //영환

	HashMap<String, Object> myReserveDetail(String ri_num); //영환

	ArrayList<HashMap<String, Object>> reserHistory(int start, int shipNum, int end);

	int totalPageCR(int shipNum);

	int reserCancel(String num, String cancelReason);

	int decideCancel(String num, String cancelReason);

	ArrayList<HashMap<String, Object>> reserHistoryList(int start, String userId, int end);

	int totalPageR(String userId);
	String findCap_ship(String string);

	void shipUpdate(ReserDTO dto); //영환

	void shipImgUpdate(HashMap<String, String> params); //영환

	void shipImgDelete(HashMap<String, String> params); //영환

	void shipImgN(HashMap<String, String> params); //영환

	void reserveCancel(String ri_num, String ri_code); //영환


	String shipOwner(String s_num); //영환

	void reserveCancelPoint(String u_userid, String ri_pay); //영환

	void reserveCancelCap(String u_userid, String s_userid, String ri_pay);//영환

	void reserveCancelUser(String u_userid, String s_userid, String ri_pay);//영환


	ArrayList<SumsumDTO> recentlylist();//선우

	int getReserPoint(String capId, String num);

	int shipNameChk(String s_name);

	int isShipImg(HashMap<String, String> params);



	



	





















}
