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
}
