package com.boys.fishing.apis.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.apis.dao.ApisDAO;
import com.boys.fishing.apis.dto.IslandDTO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApisService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ApisDAO dao;

	public HashMap<String, Object> apiCalls() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		boolean success = false;
		
		String url = "https://icloudgis.incheon.go.kr/server/rest/services/Hosted/UnmannedIslandInfo/FeatureServer/0/query?where=1%3D1&outFields=isln_nm,mng_num&returnGeometry=false&outSR=4326&f=json";
		String result = sendMsg(url,null,"GET");
		
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

	private String sendMsg(String url, HashMap<String, String> header, String method) {
		StringBuffer sb = new StringBuffer();
		String result = "";
		HttpURLConnection con = null;
		BufferedReader reader = null;
		
		sb.append(url);
		
		try {
			URL urll = new URL(sb.toString());
			con = (HttpURLConnection) urll.openConnection();
			con.setRequestMethod(method.toUpperCase());
			con.setDoOutput(true);
			
			if(header != null && header.size()>0) {
				for(String key : header.keySet()) {
					con.setRequestProperty(key, header.get(key));
				}
			}
			
			int resultCode = con.getResponseCode();
			if(resultCode == 200) {
				reader = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
			}else {
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
			}
			System.out.println("reader는 무엇인가? : " + reader);
			String readLine = "";
			sb = new StringBuffer();
			while((readLine = reader.readLine())!= null) {
								
					sb.append(readLine);
			
			}
			result = sb.toString();
			logger.info("result 값 {}",result);
			if(resultCode != 200) {
				logger.info("Fail Message : " + result);
				result = "Fail Message : " + result;
			}

			System.out.println("readLine도 찍어볼게 : " + readLine);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "Fail Message : "  + e.toString();
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
}
