package com.boys.fishing.apis.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.apis.dao.ApisDAO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApisService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ApisDAO dao;

	public HashMap<String, Object> apiCalls(HashMap<String,String> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = false;
		System.out.println("서비스 진입");
		String url = "https://icloudgis.incheon.go.kr/server/rest/services/Hosted/UnmannedIslandInfo/FeatureServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json";
		String param = null;
		ArrayList<String> urls = new ArrayList<String>();
		urls.add(url);
		
		HashMap<String, String> headers = new HashMap<String, String>();
	    headers.put("Content-type", "application/json");
	     
	    String result = sendMsg(urls, headers, param, "get");
	    logger.info("result : {}", result);
	    JSONObject jsonObject1 = jsonStringToJson(result);
	    logger.info("이게 뭘까 : {} ", jsonObject1.get("features").getClass().getName());
	    JSONArray jsonObject2 = (JSONArray) jsonObject1.get("features");
        logger.info("jsonObject2 : {}", jsonObject2);
	    JSONObject jsonObject3 = jsonObject2.getJSONObject(0);
        
        logger.info("테스트 : {}", jsonObject3);
        // 배열화
        ArrayList<HashMap<String, Object>> hashMapArrayList = jsonArray(jsonObject1.get("features"));
        logger.info("hashMapArrayList: {}", hashMapArrayList);
        System.out.println("size" + hashMapArrayList.size());
        HashMap<String, Object> ob = new HashMap<String, Object>();
        ob.put("sdf", "sdf");
        
        logger.info("봐보자2 : {}",ob);
        logger.info("봐보자 : {} ", hashMapArrayList.get(0).get("attributes"));
        
        // DB 연결
        /*
        Connection con = null;
        PreparedStatement pstmt = null;
        
        String sql = "Insert Into island(i_num,i_name,i_controlnum,i_jibeon ,i_landarea,i_islandmanage,i_distance,i_distanceex) Values(island_SEQ.NEXTVAL,?,?,?,?,?,?,?)";
        
        try {
			Class.forName("net.sf.log4jdbc.DriverSpy");
			con = DriverManager.getConnection("jdbc:log4jdbc:oracle:thin:@61.78.121.242:1521:xe", "C##SEC_PRO4", "fish");
            
            pstmt = con.prepareStatement(sql);
            for(int i = 0; i<hashMapArrayList.size(); i++) {
            	pstmt.setString(1, (String) hashMapArrayList.get(i).get("attributes").get("isln_nm"));
            	pstmt.setString(2, (String) hashMapArrayList.get(i).get("mng_num"));
            	pstmt.setString(3, (String) hashMapArrayList.get(i).get("lnm"));
            	pstmt.setString(4, (String) hashMapArrayList.get(i).get("lad_ar"));
            	pstmt.setString(5, (String) hashMapArrayList.get(i).get("mng_ty"));
            	pstmt.setString(6, (String) hashMapArrayList.get(i).get("dstnc"));
            	pstmt.setString(7, (String) hashMapArrayList.get(i).get("tp_ntrfs"));
            	pstmt.executeUpdate();
            }
            
            logger.info("성공");
           
		} catch (Exception e1) {
			e1.printStackTrace();
		}finally {
			if(pstmt != null)try {
				pstmt.close();
				pstmt = null;
			}catch (Exception e) {
				e.printStackTrace();
			}if(con != null)try {
				con.close();
				con = null;
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
         */
        
               
		if(!result.contains("Fail")) {
			success = true;
			ObjectMapper mapper = new ObjectMapper();
			try {
				map = mapper.readValue(result, new TypeReference<HashMap<String, Object>>() {});
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		map.put("suc", success);
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
		logger.info("sb가 무엇인지 확인해보자 : " + sb);
		
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
			System.out.println("sb 찍어볼게 : "+ sb);
			
			
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

	
}
