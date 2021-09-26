package com.boys.fishing.manage.dto;

import org.apache.ibatis.type.Alias;

@Alias("manageDTO")
public class ManageDTO {

	private String u_userid;
	private String cap_licenseYN;
	private String cap_idYSN;
	private String cap_cancelreason;
	private String cap_requestTime;
	private String cap_manager;
	private String L_name;

	private String u_userphonenum;
	private String u_useremail;
	private String u_usernickname;
	private String u_manageryn;
	private String u_kakaoyn;
	private String u_userdelyn;
	private String u_joindate;
	
	
	public String getU_userid() {
		return u_userid;
	}
	public void setU_userid(String u_userid) {
		this.u_userid = u_userid;
	}
	public String getCap_licenseYN() {
		return cap_licenseYN;
	}
	public void setCap_licenseYN(String cap_licenseYN) {
		this.cap_licenseYN = cap_licenseYN;
	}
	public String getCap_idYSN() {
		return cap_idYSN;
	}
	public void setCap_idYSN(String cap_idYSN) {
		this.cap_idYSN = cap_idYSN;
	}
	public String getCap_cancelreason() {
		return cap_cancelreason;
	}
	public void setCap_cancelreason(String cap_cancelreason) {
		this.cap_cancelreason = cap_cancelreason;
	}
	public String getCap_requestTime() {
		return cap_requestTime;
	}
	public void setCap_requestTime(String cap_requestTime) {
		this.cap_requestTime = cap_requestTime;
	}
	public String getCap_manager() {
		return cap_manager;
	}
	public void setCap_manager(String cap_manager) {
		this.cap_manager = cap_manager;
	}
	public String getL_name() {
		return L_name;
	}
	public void setL_name(String l_name) {
		L_name = l_name;
	}
	public String getU_userphonenum() {
		return u_userphonenum;
	}
	public void setU_userphonenum(String u_userphonenum) {
		this.u_userphonenum = u_userphonenum;
	}
	public String getU_useremail() {
		return u_useremail;
	}
	public void setU_useremail(String u_useremail) {
		this.u_useremail = u_useremail;
	}
	public String getU_usernickname() {
		return u_usernickname;
	}
	public void setU_usernickname(String u_usernickname) {
		this.u_usernickname = u_usernickname;
	}
	public String getU_manageryn() {
		return u_manageryn;
	}
	public void setU_manageryn(String u_manageryn) {
		this.u_manageryn = u_manageryn;
	}
	public String getU_kakaoyn() {
		return u_kakaoyn;
	}
	public void setU_kakaoyn(String u_kakaoyn) {
		this.u_kakaoyn = u_kakaoyn;
	}
	public String getU_userdelyn() {
		return u_userdelyn;
	}
	public void setU_userdelyn(String u_userdelyn) {
		this.u_userdelyn = u_userdelyn;
	}
	public String getU_joindate() {
		return u_joindate;
	}
	public void setU_joindate(String u_joindate) {
		this.u_joindate = u_joindate;
	}
}
