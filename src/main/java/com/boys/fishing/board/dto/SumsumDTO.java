package com.boys.fishing.board.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("sumsum")
public class SumsumDTO {

	//섬섬 톡 테이블
	private int b_num; // 글 번호
	private String fish; // 어종 이름
	private String b_subject; // 글 제목
	private String b_content; // 글 내용
	private Date b_regdate; //등록 날짜
	private String b_userid; // 작성자아이디
	private String b_code; // 카테고리
	private char b_blindYN; // 삭제 여부
	//댓글 테이블
	private int c_num; //댓글 번호
	private int c_momnum; // 부모 댓글 번호
	private Date c_regdate; // 등록 날짜
	private String c_content;// 댓글 내용
	private char c_blindYN;//삭제 여부
	private int c_idx; // 글 번호
	private int c_userid; // 댓글 작성자
	//태그 모음, 태그 테이블
	private int tags_num;//태그 넘버
	private int tag_num;//태그 넘버
	private String tag; // 태그
	//글 이미지
	private int bi_num;//글 번호
	private String bi_name;//사진 이름
	// 좋아요
	private String l_userid;// 좋아요 누른 아이디
	private int l_num;// 글 번호
	private Date l_regdate; // 누른 날짜
	// 신고
	private int r_num; // 신고 번호
	private String r_userid; // 신고한 아이디
	private String r_code; // 신고 종류
	private char r_stateYSN; // 신고 처리상태
	private String r_target; // 대상자
	private Date r_regdate;// 신고 날짜
	private String r_reason; // 사유
	private String r_admin; // 등록자
	// Q&A
	private int q_num; // Q&A 글번호
	private String q_writer; // 작성자
	private String q_subject; // 제목
	private String q_content; // 내용
	private Date q_regdate; // 등록날짜
	private char q_answernum; // 답변 YN
	private char q_blindYN; // 공개/비공개여부
	private String q_answercon; // 답글내용
	// 공지사항
	private int n_num; // 공지사항번호
	private String n_userid; // 작성자 아이디
	private String n_subject; // 제목
	private String n_content; // 내용
	// 공지사항 이미지
	private int ni_num; //공지사항번호
	private String ni_name; // 공지사항이미지 이름
	
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getFish() {
		return fish;
	}
	public void setFish(String fish) {
		this.fish = fish;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}
	public String getB_userid() {
		return b_userid;
	}
	public void setB_userid(String b_userid) {
		this.b_userid = b_userid;
	}
	public String getB_code() {
		return b_code;
	}
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	public char getB_blindYN() {
		return b_blindYN;
	}
	public void setB_blindYN(char b_blindYN) {
		this.b_blindYN = b_blindYN;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getC_momnum() {
		return c_momnum;
	}
	public void setC_momnum(int c_momnum) {
		this.c_momnum = c_momnum;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public char getC_blindYN() {
		return c_blindYN;
	}
	public void setC_blindYN(char c_blindYN) {
		this.c_blindYN = c_blindYN;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getC_userid() {
		return c_userid;
	}
	public void setC_userid(int c_userid) {
		this.c_userid = c_userid;
	}
	public int getTags_num() {
		return tags_num;
	}
	public void setTags_num(int tags_num) {
		this.tags_num = tags_num;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getBi_name() {
		return bi_name;
	}
	public void setBi_name(String bi_name) {
		this.bi_name = bi_name;
	}
	public int getBi_num() {
		return bi_num;
	}
	public void setBi_num(int bi_num) {
		this.bi_num = bi_num;
	}
	public String getL_userid() {
		return l_userid;
	}
	public void setL_userid(String l_userid) {
		this.l_userid = l_userid;
	}
	public int getL_num() {
		return l_num;
	}
	public void setL_num(int l_num) {
		this.l_num = l_num;
	}
	public Date getL_regdate() {
		return l_regdate;
	}
	public void setL_regdate(Date l_regdate) {
		this.l_regdate = l_regdate;
	}
	public int getTag_num() {
		return tag_num;
	}
	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getR_userid() {
		return r_userid;
	}
	public void setR_userid(String r_userid) {
		this.r_userid = r_userid;
	}
	public String getR_code() {
		return r_code;
	}
	public void setR_code(String r_code) {
		this.r_code = r_code;
	}
	public char getR_stateYSN() {
		return r_stateYSN;
	}
	public void setR_stateYSN(char r_stateYSN) {
		this.r_stateYSN = r_stateYSN;
	}
	public String getR_target() {
		return r_target;
	}
	public void setR_target(String r_target) {
		this.r_target = r_target;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	public String getR_reason() {
		return r_reason;
	}
	public void setR_reason(String r_reason) {
		this.r_reason = r_reason;
	}
	public String getR_admin() {
		return r_admin;
	}
	public void setR_admin(String r_admin) {
		this.r_admin = r_admin;
	}
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_writer() {
		return q_writer;
	}
	public void setQ_writer(String q_writer) {
		this.q_writer = q_writer;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_regdate() {
		return q_regdate;
	}
	public void setQ_regdate(Date q_regdate) {
		this.q_regdate = q_regdate;
	}
	public char getQ_answernum() {
		return q_answernum;
	}
	public void setQ_answernum(char q_answernum) {
		this.q_answernum = q_answernum;
	}
	public char getQ_blindYN() {
		return q_blindYN;
	}
	public void setQ_blindYN(char q_blindYN) {
		this.q_blindYN = q_blindYN;
	}
	public String getQ_answercon() {
		return q_answercon;
	}
	public void setQ_answercon(String q_answercon) {
		this.q_answercon = q_answercon;
	}
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_userid() {
		return n_userid;
	}
	public void setN_userid(String n_userid) {
		this.n_userid = n_userid;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getNi_num() {
		return ni_num;
	}
	public void setNi_num(int ni_num) {
		this.ni_num = ni_num;
	}
	public String getNi_name() {
		return ni_name;
	}
	public void setNi_name(String ni_name) {
		this.ni_name = ni_name;
	}
}
