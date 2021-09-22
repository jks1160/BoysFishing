package com.boys.fishing.apis.dto;

import org.apache.ibatis.type.Alias;

@Alias("weather")
public class WeatherDTO {

	//예보날씨
	private String w_date; //날짜
	private String w_amPOP; //오전강수확률
	private String w_pmPOP; //오후강수확률
	private String w_amSky; //오전 하늘 상태
	private String w_pmSky; //오후 하늘 상태
	private String w_temperL; //최저기온
	private String w_temperH; // 최고기온
	private String w_amWaveLow; //오전 최소 파고
	private String w_amWaveHigh; //오전 최고 파고
	private String w_pmWaveLow; //오후 최소 파고
	private String w_pmWaveHigh; //오후 최고 파고
	private String w_amHighLevel;// 오전만조높이
	private String w_amLowLevel; // 오전간조높이
	private String w_amHghTime; //오전 만조시간
	private String w_amLowTime;//오전 간조시간
	private String w_pmLowLevel; // 오후간조높이
	private String w_pmHighLevel;//오후만조높이
	private String w_pmLowTime;//오후간조시간
	private String w_pmHighTime;// 오후만조시간
	
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getW_amPOP() {
		return w_amPOP;
	}
	public void setW_amPOP(String w_amPOP) {
		this.w_amPOP = w_amPOP;
	}
	public String getW_pmPOP() {
		return w_pmPOP;
	}
	public void setW_pmPOP(String w_pmPOP) {
		this.w_pmPOP = w_pmPOP;
	}
	public String getW_amSky() {
		return w_amSky;
	}
	public void setW_amSky(String w_amSky) {
		this.w_amSky = w_amSky;
	}
	public String getW_pmSky() {
		return w_pmSky;
	}
	public void setW_pmSky(String w_pmSky) {
		this.w_pmSky = w_pmSky;
	}
	public String getW_temperL() {
		return w_temperL;
	}
	public void setW_temperL(String w_temperL) {
		this.w_temperL = w_temperL;
	}
	public String getW_temperH() {
		return w_temperH;
	}
	public void setW_temperH(String w_temperH) {
		this.w_temperH = w_temperH;
	}
	public String getW_amWaveLow() {
		return w_amWaveLow;
	}
	public void setW_amWaveLow(String w_amWaveLow) {
		this.w_amWaveLow = w_amWaveLow;
	}
	public String getW_amWaveHigh() {
		return w_amWaveHigh;
	}
	public void setW_amWaveHigh(String w_amWaveHigh) {
		this.w_amWaveHigh = w_amWaveHigh;
	}
	public String getW_pmWaveLow() {
		return w_pmWaveLow;
	}
	public void setW_pmWaveLow(String w_pmWaveLow) {
		this.w_pmWaveLow = w_pmWaveLow;
	}
	public String getW_pmWaveHigh() {
		return w_pmWaveHigh;
	}
	public void setW_pmWaveHigh(String w_pmWaveHigh) {
		this.w_pmWaveHigh = w_pmWaveHigh;
	}
	public String getW_amHighLevel() {
		return w_amHighLevel;
	}
	public void setW_amHighLevel(String w_amHighLevel) {
		this.w_amHighLevel = w_amHighLevel;
	}
	public String getW_amLowLevel() {
		return w_amLowLevel;
	}
	public void setW_amLowLevel(String w_amLowLevel) {
		this.w_amLowLevel = w_amLowLevel;
	}
	public String getW_amHghTime() {
		return w_amHghTime;
	}
	public void setW_amHghTime(String w_amHghTime) {
		this.w_amHghTime = w_amHghTime;
	}
	public String getW_amLowTime() {
		return w_amLowTime;
	}
	public void setW_amLowTime(String w_amLowTime) {
		this.w_amLowTime = w_amLowTime;
	}
	public String getW_pmLowLevel() {
		return w_pmLowLevel;
	}
	public void setW_pmLowLevel(String w_pmLowLevel) {
		this.w_pmLowLevel = w_pmLowLevel;
	}
	public String getW_pmHighLevel() {
		return w_pmHighLevel;
	}
	public void setW_pmHighLevel(String w_pmHighLevel) {
		this.w_pmHighLevel = w_pmHighLevel;
	}
	public String getW_pmLowTime() {
		return w_pmLowTime;
	}
	public void setW_pmLowTime(String w_pmLowTime) {
		this.w_pmLowTime = w_pmLowTime;
	}
	public String getW_pmHighTime() {
		return w_pmHighTime;
	}
	public void setW_pmHighTime(String w_pmHighTime) {
		this.w_pmHighTime = w_pmHighTime;
	}
	
	
	
	
	
}
