package com.boys.fishing.apis.dto;

import org.apache.ibatis.type.Alias;

@Alias("today")
public class TodayWeather {

	//당일 날씨
	private String tw_date;//날짜O
	private String tw_time;//시간O
	private String tw_temper;//기온O
	private String tw_temperH; //최고기온O
	private String tw_temperL; //최저기온O
	private String tw_vec; // 풍향O
	private String tw_wsd; //풍속O
	private String tw_sky; // 하늘상태O
	private String tw_pty; //강수형태O
	private String tw_pop; //강수확률O
	private String tw_pcp; //강수량O
	private String tw_wave; //파고 O
	private String tw_amLowLevel; //오전간조높이
	private String tw_amHighLevel; //오전만조높이
	private String tw_amLowTime;//오전 간조 시간
	private String tw_amHighTime;//오전 만조 시간
	private String tw_pmLowLevel;//오후 간조 높이
	private String tw_pmHighLevel;//오후 만조 높이
	private String tw_pmLowTime; //오후 간조 시간
	private String tw_pmHighTime;//오후 만조 시간
	
	
	
	public String getTw_date() {
		return tw_date;
	}
	public void setTw_date(String tw_date) {
		this.tw_date = tw_date;
	}
	public String getTw_time() {
		return tw_time;
	}
	public void setTw_time(String tw_time) {
		this.tw_time = tw_time;
	}
	public String getTw_temper() {
		return tw_temper;
	}
	public void setTw_temper(String tw_temper) {
		this.tw_temper = tw_temper;
	}
	public String getTw_temperH() {
		return tw_temperH;
	}
	public void setTw_temperH(String tw_temperH) {
		this.tw_temperH = tw_temperH;
	}
	public String getTw_temperL() {
		return tw_temperL;
	}
	public void setTw_temperL(String tw_temperL) {
		this.tw_temperL = tw_temperL;
	}
	public String getTw_vec() {
		return tw_vec;
	}
	public void setTw_vec(String tw_vec) {
		this.tw_vec = tw_vec;
	}
	public String getTw_wsd() {
		return tw_wsd;
	}
	public void setTw_wsd(String tw_wsd) {
		this.tw_wsd = tw_wsd;
	}
	public String getTw_sky() {
		return tw_sky;
	}
	public void setTw_sky(String tw_sky) {
		this.tw_sky = tw_sky;
	}
	public String getTw_pty() {
		return tw_pty;
	}
	public void setTw_pty(String tw_pty) {
		this.tw_pty = tw_pty;
	}
	public String getTw_pop() {
		return tw_pop;
	}
	public void setTw_pop(String tw_pop) {
		this.tw_pop = tw_pop;
	}
	public String getTw_pcp() {
		return tw_pcp;
	}
	public void setTw_pcp(String tw_pcp) {
		this.tw_pcp = tw_pcp;
	}
	public String getTw_wave() {
		return tw_wave;
	}
	public void setTw_wave(String tw_wave) {
		this.tw_wave = tw_wave;
	}
	public String getTw_amLowLevel() {
		return tw_amLowLevel;
	}
	public void setTw_amLowLevel(String tw_amLowLevel) {
		this.tw_amLowLevel = tw_amLowLevel;
	}
	public String getTw_amHighLevel() {
		return tw_amHighLevel;
	}
	public void setTw_amHighLevel(String tw_amHighLevel) {
		this.tw_amHighLevel = tw_amHighLevel;
	}
	public String getTw_amLowTime() {
		return tw_amLowTime;
	}
	public void setTw_amLowTime(String tw_amLowTime) {
		this.tw_amLowTime = tw_amLowTime;
	}
	public String getTw_amHighTime() {
		return tw_amHighTime;
	}
	public void setTw_amHighTime(String tw_amHighTime) {
		this.tw_amHighTime = tw_amHighTime;
	}
	public String getTw_pmLowLevel() {
		return tw_pmLowLevel;
	}
	public void setTw_pmLowLevel(String tw_pmLowLevel) {
		this.tw_pmLowLevel = tw_pmLowLevel;
	}
	public String getTw_pmHighLevel() {
		return tw_pmHighLevel;
	}
	public void setTw_pmHighLevel(String tw_pmHighLevel) {
		this.tw_pmHighLevel = tw_pmHighLevel;
	}
	public String getTw_pmLowTime() {
		return tw_pmLowTime;
	}
	public void setTw_pmLowTime(String tw_pmLowTime) {
		this.tw_pmLowTime = tw_pmLowTime;
	}
	public String getTw_pmHighTime() {
		return tw_pmHighTime;
	}
	public void setTw_pmHighTime(String tw_pmHighTime) {
		this.tw_pmHighTime = tw_pmHighTime;
	}
	
	
}
