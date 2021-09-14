package com.boys.fishing.reservation.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("reser")
public class reserDTO {

	//예약 정보
	private int ri_num; //예약 번호
	private String ri_userid; // 예약자 아이디
	private int i_num; // 무인도 번호
	private String ri_startpoint;// 출항지
	private String ri_starttime;// 출항시간
	private String ri_duringtime;// 소요시간
	private String ri_returntime; // 회항시간
	private int ri_people; // 인원수
	private char ri_startreturnYN; // 입항 / 회항
	private Date ri_date; // 날짜
	private String ri_code; // 예약 상태 코드
	private String ri_cancelreason; //취소 사유
	//운행 범위
	private int s_num; // 배 번호
	private String op_startpoint; // 출항지
	private String op_starttime; // 출항시간
	private String op_duringtime; // 소요 시간
	private String op_returntime; // 회항시간
	private Date op_date; // 날짜
	
	
	
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getOp_startpoint() {
		return op_startpoint;
	}
	public void setOp_startpoint(String op_startpoint) {
		this.op_startpoint = op_startpoint;
	}
	public String getOp_starttime() {
		return op_starttime;
	}
	public void setOp_starttime(String op_starttime) {
		this.op_starttime = op_starttime;
	}
	public String getOp_duringtime() {
		return op_duringtime;
	}
	public void setOp_duringtime(String op_duringtime) {
		this.op_duringtime = op_duringtime;
	}
	public String getOp_returntime() {
		return op_returntime;
	}
	public void setOp_returntime(String op_returntime) {
		this.op_returntime = op_returntime;
	}
	public Date getOp_date() {
		return op_date;
	}
	public void setOp_date(Date op_date) {
		this.op_date = op_date;
	}
	public int getRi_num() {
		return ri_num;
	}
	public void setRi_num(int ri_num) {
		this.ri_num = ri_num;
	}
	public String getRi_userid() {
		return ri_userid;
	}
	public void setRi_userid(String ri_userid) {
		this.ri_userid = ri_userid;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getRi_startpoint() {
		return ri_startpoint;
	}
	public void setRi_startpoint(String ri_startpoint) {
		this.ri_startpoint = ri_startpoint;
	}
	public String getRi_starttime() {
		return ri_starttime;
	}
	public void setRi_starttime(String ri_starttime) {
		this.ri_starttime = ri_starttime;
	}
	public String getRi_duringtime() {
		return ri_duringtime;
	}
	public void setRi_duringtime(String ri_duringtime) {
		this.ri_duringtime = ri_duringtime;
	}
	public String getRi_returntime() {
		return ri_returntime;
	}
	public void setRi_returntime(String ri_returntime) {
		this.ri_returntime = ri_returntime;
	}
	public int getRi_people() {
		return ri_people;
	}
	public void setRi_people(int ri_people) {
		this.ri_people = ri_people;
	}
	public char getRi_startreturnYN() {
		return ri_startreturnYN;
	}
	public void setRi_startreturnYN(char ri_startreturnYN) {
		this.ri_startreturnYN = ri_startreturnYN;
	}
	public Date getRi_date() {
		return ri_date;
	}
	public void setRi_date(Date ri_date) {
		this.ri_date = ri_date;
	}
	public String getRi_code() {
		return ri_code;
	}
	public void setRi_code(String ri_code) {
		this.ri_code = ri_code;
	}
	public String getRi_cancelreason() {
		return ri_cancelreason;
	}
	public void setRi_cancelreason(String ri_cancelreason) {
		this.ri_cancelreason = ri_cancelreason;
	}
	
	
}
