package com.boys.fishing.apis.dto;

import org.apache.ibatis.type.Alias;

@Alias("weather")
public class WeatherDTO {

	//예보날씨
	private String w_date; //날짜
	private String pop; //강수확률
	private String sky; // 하늘 상태
	private String wave; //파고
	private String temperL; //최저기온
	private String temperH; // 최고기온
	private String amHighLevel;// 오전만조높이
	private String amLowLevel; // 오전간조높이
	private String amHghTime; //오전 만조시간
	private String amLowTime;//오전 간조시간
	private String pmLowLevel; // 오후간조높이
	private String pmHighLevel;//오후만조높이
	private String pmLowTime;//오후간조시간
	private String pmHighTime;// 오후만조시간
	
	
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getPop() {
		return pop;
	}
	public void setPop(String pop) {
		this.pop = pop;
	}
	public String getSky() {
		return sky;
	}
	public void setSky(String sky) {
		this.sky = sky;
	}
	public String getWave() {
		return wave;
	}
	public void setWave(String wave) {
		this.wave = wave;
	}
	public String getTemperL() {
		return temperL;
	}
	public void setTemperL(String temperL) {
		this.temperL = temperL;
	}
	public String getTemperH() {
		return temperH;
	}
	public void setTemperH(String temperH) {
		this.temperH = temperH;
	}
	public String getAmHighLevel() {
		return amHighLevel;
	}
	public void setAmHighLevel(String amHighLevel) {
		this.amHighLevel = amHighLevel;
	}
	public String getAmLowLevel() {
		return amLowLevel;
	}
	public void setAmLowLevel(String amLowLevel) {
		this.amLowLevel = amLowLevel;
	}
	public String getAmHghTime() {
		return amHghTime;
	}
	public void setAmHghTime(String amHghTime) {
		this.amHghTime = amHghTime;
	}
	public String getAmLowTime() {
		return amLowTime;
	}
	public void setAmLowTime(String amLowTime) {
		this.amLowTime = amLowTime;
	}
	public String getPmLowLevel() {
		return pmLowLevel;
	}
	public void setPmLowLevel(String pmLowLevel) {
		this.pmLowLevel = pmLowLevel;
	}
	public String getPmHighLevel() {
		return pmHighLevel;
	}
	public void setPmHighLevel(String pmHighLevel) {
		this.pmHighLevel = pmHighLevel;
	}
	public String getPmLowTime() {
		return pmLowTime;
	}
	public void setPmLowTime(String pmLowTime) {
		this.pmLowTime = pmLowTime;
	}
	public String getPmHighTime() {
		return pmHighTime;
	}
	public void setPmHighTime(String pmHighTime) {
		this.pmHighTime = pmHighTime;
	}
	
	
	
	
}
