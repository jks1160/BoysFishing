package com.boys.fishing.user.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("userInfo")
public class UserDTO {

	// 유저 테이블
	private String u_userid; // 아이디
	private String u_userpw; // 비밀번호(해쉬)
	private String u_userphonenum; // 핸드폰번호
	private String u_userninkname;// 닉네임
	private char u_managerYN; // 관리자 여부
	private char u_kakaoYN; // 카카오 가입 여부
	private char u_userdelYN; // 탈퇴 여부
	private String u_tiercode;// 티어 코드
	private Date u_joindate; // 가입 날짜
	// 카카오 회원
	private String k_key; // 카톡 키
	private String k_userid; // 임의의 아이디
	private String k_phone; // 핸드폰 번호
	private String k_email; // 이메일
	// 프로필 이미지
	private String ui_userid; // 아이디
	private String ui_name; // 사진 이름
	// 포인트 내역
	private String p_userid; // 아이디
	private String p_content; // 포인트 내역
	private Date p_regdate; // 날짜
	private String p_otherid;// 상대 아이디
	private int p_cost; // 비용
	// 선장 정보
	private char cap_licenseYN; // 자격증
	private char cap_idYSN; // 승인여부
	private String cap_cancelreason; // 취소 사유
	
	// 자격증
	private int l_num; // 배 번호
	private String l_name; // 사진 이름
	// 알람
	private int a_num; // 알람번호
	private String a_userid; // 아이디
	private Date a_regdate; // 알람 날짜
	private Date a_checkdate; // 알람 확인 날짜
	private char a_readYN; // 읽음 여부
	private char a_delYN; // 삭제 여부
	private String a_path; // 알람 경로
	private String a_code; // 알람 코드
	// 블랙 리스트
	private int bl_num;// 블랙리스트 번호
	private String bl_userid; // 아이디
	private String bl_code; // 금지 구별 코드
	private Date bl_regdate; // 등록 날짜
	private Date bl_disdate; // 해제 날짜
	
	
	
	
	public String getU_userid() {
		return u_userid;
	}
	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}
	public String getU_userpw() {
		return u_userpw;
	}
	public void setU_userpw(String u_userpw) {
		this.u_userpw = u_userpw;
	}
	public String getU_userphonenum() {
		return u_userphonenum;
	}
	public void setU_userphonenum(String u_userphonenum) {
		this.u_userphonenum = u_userphonenum;
	}
	public String getU_userninkname() {
		return u_userninkname;
	}
	public void setU_userninkname(String u_userninkname) {
		this.u_userninkname = u_userninkname;
	}
	public char getU_managerYN() {
		return u_managerYN;
	}
	public void setU_managerYN(char u_managerYN) {
		this.u_managerYN = u_managerYN;
	}
	public char getU_kakaoYN() {
		return u_kakaoYN;
	}
	public void setU_kakaoYN(char u_kakaoYN) {
		this.u_kakaoYN = u_kakaoYN;
	}
	public char getCap_licenseYN() {
		return cap_licenseYN;
	}
	public void setCap_licenseYN(char cap_licenseYN) {
		this.cap_licenseYN = cap_licenseYN;
	}
	public char getCap_idYSN() {
		return cap_idYSN;
	}
	public void setCap_idYSN(char cap_idYSN) {
		this.cap_idYSN = cap_idYSN;
	}
	public String getCap_cancelreason() {
		return cap_cancelreason;
	}
	public void setCap_cancelreason(String cap_cancelreason) {
		this.cap_cancelreason = cap_cancelreason;
	}
	public char getU_userdelYN() {
		return u_userdelYN;
	}
	public void setU_userdelYN(char u_userdelYN) {
		this.u_userdelYN = u_userdelYN;
	}
	public String getU_tiercode() {
		return u_tiercode;
	}
	public void setU_tiercode(String u_tiercode) {
		this.u_tiercode = u_tiercode;
	}
	public Date getU_joindate() {
		return u_joindate;
	}
	public void setU_joindate(Date u_joindate) {
		this.u_joindate = u_joindate;
	}
	public String getK_key() {
		return k_key;
	}
	public void setK_key(String k_key) {
		this.k_key = k_key;
	}
	public String getK_userid() {
		return k_userid;
	}
	public void setK_userid(String k_userid) {
		this.k_userid = k_userid;
	}
	public String getK_phone() {
		return k_phone;
	}
	public void setK_phone(String k_phone) {
		this.k_phone = k_phone;
	}
	public String getK_email() {
		return k_email;
	}
	public void setK_email(String k_email) {
		this.k_email = k_email;
	}
	public String getUi_userid() {
		return ui_userid;
	}
	public void setUi_userid(String ui_userid) {
		this.ui_userid = ui_userid;
	}
	public String getUi_name() {
		return ui_name;
	}
	public void setUi_name(String ui_name) {
		this.ui_name = ui_name;
	}
	public String getP_userid() {
		return p_userid;
	}
	public void setP_userid(String p_userid) {
		this.p_userid = p_userid;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	public String getP_otherid() {
		return p_otherid;
	}
	public void setP_otherid(String p_otherid) {
		this.p_otherid = p_otherid;
	}
	public int getP_cost() {
		return p_cost;
	}
	public void setP_cost(int p_cost) {
		this.p_cost = p_cost;
	}
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public int getA_num() {
		return a_num;
	}
	public void setA_num(int a_num) {
		this.a_num = a_num;
	}
	public String getA_userid() {
		return a_userid;
	}
	public void setA_userid(String a_userid) {
		this.a_userid = a_userid;
	}
	public Date getA_regdate() {
		return a_regdate;
	}
	public void setA_regdate(Date a_regdate) {
		this.a_regdate = a_regdate;
	}
	public Date getA_checkdate() {
		return a_checkdate;
	}
	public void setA_checkdate(Date a_checkdate) {
		this.a_checkdate = a_checkdate;
	}
	public char getA_readYN() {
		return a_readYN;
	}
	public void setA_readYN(char a_readYN) {
		this.a_readYN = a_readYN;
	}
	public char getA_delYN() {
		return a_delYN;
	}
	public void setA_delYN(char a_delYN) {
		this.a_delYN = a_delYN;
	}
	public String getA_path() {
		return a_path;
	}
	public void setA_path(String a_path) {
		this.a_path = a_path;
	}
	public String getA_code() {
		return a_code;
	}
	public void setA_code(String a_code) {
		this.a_code = a_code;
	}
	public int getBl_num() {
		return bl_num;
	}
	public void setBl_num(int bl_num) {
		this.bl_num = bl_num;
	}
	public String getBl_userid() {
		return bl_userid;
	}
	public void setBl_userid(String bl_userid) {
		this.bl_userid = bl_userid;
	}
	public String getBl_code() {
		return bl_code;
	}
	public void setBl_code(String bl_code) {
		this.bl_code = bl_code;
	}
	public Date getBl_regdate() {
		return bl_regdate;
	}
	public void setBl_regdate(Date bl_regdate) {
		this.bl_regdate = bl_regdate;
	}
	public Date getBl_disdate() {
		return bl_disdate;
	}
	public void setBl_disdate(Date bl_disdate) {
		this.bl_disdate = bl_disdate;
	}
	
	
	

}
