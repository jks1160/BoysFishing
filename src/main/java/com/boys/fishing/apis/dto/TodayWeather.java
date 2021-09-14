package com.boys.fishing.apis.dto;

import org.apache.ibatis.type.Alias;

@Alias("today")
public class TodayWeather {

	//당일 날씨
	private String tw_date;//날짜
	private String tw_time;//시간
	private String temper;//기온
	private String temperH; //최고기온
	private String temperL; //최저기온
	private String vec; // 풍향
	private String wsd; //풍속
	private String sky; // 하늘상태
	private String pty; //강수형태
	private String pop; //강수확률
	private String pcp; //강수량
	
	
	
}
