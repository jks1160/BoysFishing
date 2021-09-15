package com.boys.fishing.apis.dto;

import org.apache.ibatis.type.Alias;

@Alias("apis")
public class IslandDTO {

	//무인섬
	private int i_num; //무인도 번호
	private String i_name; // 무인도서명
	private String i_controlnum; // 관리 번호
	private String i_sido; //시도
	private String i_sigungu; // 시군구
	private String i_eupmyeondong; // 읍면동
	private String i_ri; // 리
	private String i_jibeon; // 지번
	private String i_jibeonex; //지번부가설명
	private String i_landclass; // 토지소유구분
	private String i_landowner; //토지 소유자
	private String i_landarea; // 토지전체면적
	private String i_statearea; //국유지면적
	private String i_commonarea; //공유지면적
	private String i_privatearea; //사유지면적
	private String i_areaex; //면적부가설명
	private String i_distance; //육지와의 거리
	private String i_distanceex; //육지와의거리부가설명
	private String i_useclass; //용도구분
	private String i_landpurpose; //지목
	private String i_isUITS; //영해기면무인도서유무
	private String i_islandmanage; //무인도서관리유형
	private String i_surrmanage; //주변해역관리유형
	private String i_latitude; //위도
	private String i_longitude;//경도
	private String i_appointeddate; // 지정고시일
	
	
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_controlnum() {
		return i_controlnum;
	}
	public void setI_controlnum(String i_controlnum) {
		this.i_controlnum = i_controlnum;
	}
	public String getI_sido() {
		return i_sido;
	}
	public void setI_sido(String i_sido) {
		this.i_sido = i_sido;
	}
	public String getI_sigungu() {
		return i_sigungu;
	}
	public void setI_sigungu(String i_sigungu) {
		this.i_sigungu = i_sigungu;
	}
	public String getI_eupmyeondong() {
		return i_eupmyeondong;
	}
	public void setI_eupmyeondong(String i_eupmyeondong) {
		this.i_eupmyeondong = i_eupmyeondong;
	}
	public String getI_ri() {
		return i_ri;
	}
	public void setI_ri(String i_ri) {
		this.i_ri = i_ri;
	}
	public String getI_jibeon() {
		return i_jibeon;
	}
	public void setI_jibeon(String i_jibeon) {
		this.i_jibeon = i_jibeon;
	}
	public String getI_jibeonex() {
		return i_jibeonex;
	}
	public void setI_jibeonex(String i_jibeonex) {
		this.i_jibeonex = i_jibeonex;
	}
	public String getI_landclass() {
		return i_landclass;
	}
	public void setI_landclass(String i_landclass) {
		this.i_landclass = i_landclass;
	}
	public String getI_landowner() {
		return i_landowner;
	}
	public void setI_landowner(String i_landowner) {
		this.i_landowner = i_landowner;
	}
	public String getI_landarea() {
		return i_landarea;
	}
	public void setI_landarea(String i_landarea) {
		this.i_landarea = i_landarea;
	}
	public String getI_statearea() {
		return i_statearea;
	}
	public void setI_statearea(String i_statearea) {
		this.i_statearea = i_statearea;
	}
	public String getI_commonarea() {
		return i_commonarea;
	}
	public void setI_commonarea(String i_commonarea) {
		this.i_commonarea = i_commonarea;
	}
	public String getI_privatearea() {
		return i_privatearea;
	}
	public void setI_privatearea(String i_privatearea) {
		this.i_privatearea = i_privatearea;
	}
	public String getI_areaex() {
		return i_areaex;
	}
	public void setI_areaex(String i_areaex) {
		this.i_areaex = i_areaex;
	}
	public String getI_distance() {
		return i_distance;
	}
	public void setI_distance(String i_distance) {
		this.i_distance = i_distance;
	}
	public String getI_distanceex() {
		return i_distanceex;
	}
	public void setI_distanceex(String i_distanceex) {
		this.i_distanceex = i_distanceex;
	}
	public String getI_useclass() {
		return i_useclass;
	}
	public void setI_useclass(String i_useclass) {
		this.i_useclass = i_useclass;
	}
	public String getI_landpurpose() {
		return i_landpurpose;
	}
	public void setI_landpurpose(String i_landpurpose) {
		this.i_landpurpose = i_landpurpose;
	}
	public String getI_isUITS() {
		return i_isUITS;
	}
	public void setI_isUITS(String i_isUITS) {
		this.i_isUITS = i_isUITS;
	}
	public String getI_islandmanage() {
		return i_islandmanage;
	}
	public void setI_islandmanage(String i_islandmanage) {
		this.i_islandmanage = i_islandmanage;
	}
	public String getI_surrmanage() {
		return i_surrmanage;
	}
	public void setI_surrmanage(String i_surrmanage) {
		this.i_surrmanage = i_surrmanage;
	}
	public String getI_latitude() {
		return i_latitude;
	}
	public void setI_latitude(String i_latitude) {
		this.i_latitude = i_latitude;
	}
	public String getI_longitude() {
		return i_longitude;
	}
	public void setI_longitude(String i_longitude) {
		this.i_longitude = i_longitude;
	}
	public String getI_appointeddate() {
		return i_appointeddate;
	}
	public void setI_appointeddate(String i_appointeddate) {
		this.i_appointeddate = i_appointeddate;
	}

	


	
}
