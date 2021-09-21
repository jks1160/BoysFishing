package com.boys.fishing.apis.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.boys.fishing.apis.dao.ApisDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApisService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ApisDAO dao;

	/**
	 * 이선우
	 * 받아온 db값을 반복하여 insert 해주는 메서드
	 * @param params
	 * @return
	 */
	public HashMap<String, Object> apiCalls(HashMap<String,String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("서비스 진입");
		String url = "https://icloudgis.incheon.go.kr/server/rest/services/Hosted/UnmannedIslandInfo/FeatureServer/0/query?where=1%3D1&outFields=isln_nm,mng_num,lnm,lad_ar,mng_ty,dstnc,tp_ntrfs,objectid,xcnts,ydnts&outSR=4326&f=json";
		String param = null;
		ArrayList<String> urls = new ArrayList<String>();
		urls.add(url);
		
		HashMap<String, String> headers = new HashMap<String, String>();
	    headers.put("Content-type", "application/json");
	    String result = sendMsg(urls, headers, param, "get");
	    logger.info("RESULT :  {}",result);

	    JSONObject jsonObject1 = jsonStringToJson(result);
	    logger.info("이게 뭘까 : {} ", jsonObject1.get("features"));
	    ArrayList<HashMap<String, Object>> list = jsonArray(jsonObject1.get("features"));
	    

	    logger.info("cnt 확인 : {} ",dao.islandcnt());
	    if(dao.islandcnt()>1) {
	    	map.put("island", "이미 데이터가 있습니다.");
	    }else {
	    	map.put("island", "섬 정보가 업데이트 되었습니다.");
	    	  Connection con = null;
	          PreparedStatement pstmt = null;
	          String sql = "Insert Into island(i_num,i_name,i_controlnum,i_jibeon ,i_landarea,i_islandmanage,i_distance,i_distanceex,i_latitude,i_longitude) Values(?,?,?,?,?,?,?,?,?,?)";
	          
	  	    
	  	         try {
	  				Class.forName("net.sf.log4jdbc.DriverSpy");
	  				con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@61.78.121.242:1521:xe", "C##SEC_PRO4", "fish");
	  			    con.setAutoCommit(false);
	  	            pstmt = con.prepareStatement(sql);
	  	            for(int i=0; i<list.size(); i++) {
	  	    	    HashMap<String, Object> mapp = (HashMap<String, Object>) list.get(i).get("attributes");
	  	    	    pstmt.setString(1, String.valueOf(mapp.get("objectid")));//무인도 번호
	  	            pstmt.setString(2, String.valueOf(mapp.get("isln_nm")));// 무인도서명
	  	            pstmt.setString(3, String.valueOf(mapp.get("mng_num")));// 관리 번호
	              	pstmt.setString(4, String.valueOf(mapp.get("lnm")));// 지번
	              	pstmt.setString(5, String.valueOf(mapp.get("lad_ar")));// 토지전체면적
	              	pstmt.setString(6, String.valueOf(mapp.get("mng_ty")));//무인도서관리유형
	              	pstmt.setString(7, String.valueOf(mapp.get("dstnc")));//육지와의 거리
	              	pstmt.setString(8, String.valueOf(mapp.get("tp_ntrfs")));//육지와의거리부가설명
	              	pstmt.setString(9, String.valueOf(mapp.get("xcnts")));// x값
	              	pstmt.setString(10, String.valueOf(mapp.get("ydnts")));// y값
	   

	              	pstmt.executeUpdate();
	  	            }
	  	            con.commit();
	  			} catch (Exception e) {
	  				e.printStackTrace();
	  			}finally {
	  	            if (pstmt != null) try {
	  	                pstmt.close();
	  	                pstmt = null;
	  	            } catch (SQLException ex) {
	  	            }
	  	            if (con != null) try {
	  	                con.close();
	  	                con = null;
	  	            } catch (SQLException ex) {
	  	            }
	  	        }
	  	
	    }
		return map;
	  
	}

	private String sendMsg(ArrayList<String> urls, HashMap<String, String> header, String params,
			String method) {		
		StringBuffer sb = new StringBuffer();
		String result = "";
		HttpURLConnection con = null;
		BufferedReader reader = null;
		
		if(method.toUpperCase().equals("GET") && params != null) {
			urls.add("?"+params);
		}
		System.out.println("method 이후 찍는 코드 확인용 : " + urls);
		for(String url:urls) {
			sb.append(url);
		}
				
		URL url;
		try {
			url = new URL(sb.toString());
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod(method.toUpperCase());
			con.setDoOutput(true);
			
			if(header != null && header.size()>0) {
				for(String key : header.keySet()) {
					con.setRequestProperty(key, header.get(key));
				}
			}
			
			if(method.toUpperCase().equals("POST") && params != null) {
				con.getOutputStream().write(params.getBytes("UTF-8"));
				con.getOutputStream().flush();
			}
			int resultCode = con.getResponseCode();
			System.out.println("con이 대체 무엇인가? : " + con);
			logger.info("Code : "+resultCode);
			
			if(resultCode == 200) {
				reader = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			}else {
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			}
			
			String readLine = "";
			sb = new StringBuffer();
			while((readLine = reader.readLine())!= null) {
				sb.append(readLine);
			}
			result = sb.toString();
			if(resultCode != 200) {
				logger.info("Fail Message : " + result);
				result = "Fail Message : " + result;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(con != null) {					
					con.disconnect();
				}
				if(reader != null) {
					reader.close();					
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		return result;
	}
	
    /**
     * api 받은 Json문자열을 JSONObject로 바꿔준다 JSONObject도 map이랑 사용법 똑같다 get,put하면된다 작성자:
     * 박한솔
     *
     * @param result Object
     * @return 전송 결과 값 JSONObject
     */
    public static JSONObject jsonStringToJson(Object result) {
        System.out.println(result.toString());
        JSONObject jsonObject = null;
        try {
            // json 형태로 만들어버리기
            jsonObject = new JSONObject(result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    
    public static ArrayList<HashMap<String, Object>> jsonArray(Object result) {
        org.json.simple.JSONArray jsonArr = null;
        org.json.simple.JSONObject jsonObject = null;
        HashMap<String, Object> map = null;
        ArrayList<HashMap<String, Object>> arr = new ArrayList<HashMap<String, Object>>();
        try {
            jsonArr = (org.json.simple.JSONArray) new JSONParser().parse(result.toString());
            for (int i = 0; i < jsonArr.size(); i++) {
                jsonObject = (org.json.simple.JSONObject) jsonArr.get(i);
                map = new ObjectMapper().readValue(jsonObject.toString(), HashMap.class);
                arr.add(map);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }
    
	public HashMap<String,Object> islanddel() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object>map = new HashMap<String, Object>();
		String msg = "삭제에 실패하였습니다.";
		if(dao.islanddel()>0) {
			msg = "삭제에 성공하였습니다.";
			map.put("del", msg);
		}else {
			map.put("del", msg);
		}
		
		return map;
	}

	public HashMap<String, Object> todayweatherinsert(HashMap<String,String> params) {
		HashMap<String, Object>map = new HashMap<String, Object>();
		String url = "http://www.khoa.go.kr/oceangrid/grid/api/tideObsRecent/search.do?ServiceKey=so1KXS22diIuizQAlbrIQ==&ObsCode=DT_0001&ResultType=json";
		String param = null;
		ArrayList<String> urls = new ArrayList<String>();
		urls.add(url);
		
		HashMap<String, String> headers = new HashMap<String, String>();
	    headers.put("Content-type", "application/json");
	    String result = sendMsg(urls, headers, param, "get");
	    

	    JSONObject jsonObject1 = jsonStringToJson(result);
        JSONObject jsonObject2 = jsonStringToJson(jsonObject1.get("result"));
        JSONObject jsonObject3 = jsonStringToJson(jsonObject2.get("data"));
        
		
		String water_temp = (String) jsonObject3.get("water_temp");//수온
		String Salinity = (String) jsonObject3.get("Salinity");//염분
		String temper = (String) jsonObject3.get("air_temp");//기온
		String air_press = (String) jsonObject3.get("air_press");//기압
		String vec = (String) jsonObject3.get("wind_dir");//풍향
		String wsd = (String) jsonObject3.get("wind_speed");//풍속
			
		String url2 = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=aRrhNJkloo%2F8IhvjldPa3sCw8ndEp0rL3DEbV0q5DlQu4w%2BFHu2u%2FwOWaDcC8%2Fs5hsyxhQaP6bgNp%2FdEl7OCVQ%3D%3D&numOfRows=10&pageNo=1&dataType=json&base_date=20210921&base_time=0500&nx=55&ny=124";
		ArrayList<String> urls2 = new ArrayList<String>();
		urls2.add(url2);
		String result2 = sendMsg(urls2, headers, param, "get");
		JSONObject jsonObjecttwo1 = jsonStringToJson(result2);
		JSONObject jsonObjecttwo2 = jsonStringToJson(jsonObjecttwo1.get("response"));
        JSONObject jsonObjecttwo3 = jsonStringToJson(jsonObjecttwo2.get("body"));
        JSONObject jsonObjecttwo4 = jsonStringToJson(jsonObjecttwo3.get("items"));
        ArrayList<HashMap<String, Object>> list = jsonArray(jsonObjecttwo4.get("item"));
        logger.info("sky : {}",list.get(5).get("fcstValue"));
        logger.info("pty : {}",list.get(6).get("fcstValue"));
        logger.info("pop : {}",list.get(7).get("fcstValue"));
        logger.info("pcp : {}",list.get(8).get("fcstValue"));
		
        String sky = (String) list.get(5).get("fcstValue");
		if(sky.equals("0")) {
			sky="맑음";
		}else if(sky.equals("3")) {
			sky="구름많음";
		}else if(sky.equals("4")) {
			sky="흐림";
		}		
        String pty = (String) list.get(6).get("fcstValue");
        if(pty.equals("0")) {
        	pty="없음";
		}else if(pty.equals("1")) {
			pty="비";
		}else if(pty.equals("2")) {
			pty="비/눈";
		}else if(pty.equals("3")) {
			pty="눈";
		}else if(pty.equals("4")) {
			pty="소나기";
		}        
        String pop = (String) list.get(7).get("fcstValue");//강수확률
        String pcp = (String) list.get(8).get("fcstValue");//강수량

        
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "Insert Into todayweather(tw_date,tw_time,tw_temper,tw_vec,tw_wsd,tw_sky,tw_pty,tw_pop,tw_pcp) Values(sysdate,to_char(sysdate,'hh24:mi'),?,?,?,?,?,?,?)";
        
           
	         try {
				Class.forName("net.sf.log4jdbc.DriverSpy");
				con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@61.78.121.242:1521:xe", "C##SEC_PRO4", "fish");
			    con.setAutoCommit(false);
	            pstmt = con.prepareStatement(sql);
	           
	    	   
	    	    pstmt.setString(1, temper);
	            pstmt.setString(2, vec);
	            pstmt.setString(3, wsd);
            	pstmt.setString(4, sky);
            	pstmt.setString(5, pty);
            	pstmt.setString(6, pop);
            	pstmt.setString(7, pcp);
            	
            	pstmt.executeUpdate();	            
	            con.commit();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
	            if (pstmt != null) try {
	                pstmt.close();
	                pstmt = null;
	            } catch (SQLException ex) {
	            }
	            if (con != null) try {
	                con.close();
	                con = null;
	            } catch (SQLException ex) {
	            }
	        }
        
		return map;
	}

	
}
