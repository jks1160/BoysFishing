package com.boys.fishing.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.boys.fishing.user.dto.UserDTO;
import com.boys.fishing.user.service.UserService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KakaoLogin {

	@Autowired UserService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());	
	
	@RequestMapping(value = "/login/getKakaoAuthUrl")
	// 인증요청 > 인증코드 발급 > 인증토큰 요청
	// 우리 서버로 들어온 카카오 시작하기 요청을 카카오 서버로 인증요청을 보냄(HttpServletRequest)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		System.out.println("카카오 로그인 요청");
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=8b5c1dc8a514d8fc7e3ccc6c9602ecd4"
				+ "&redirect_uri=http://localhost:8080/fishing/login/oauth_kakao"
				+ "&response_type=code";
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	// 카카오 개발자에서 설정한 requestURL을 통하여 인증코드을 받아옴
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model, RedirectAttributes attr) throws Exception {
		String page = "redirect:/";
		System.out.println("#########" + code);
		// 받아온 인증코드 값으로 인증토큰을 요청 
		String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        // ---------- 여기까지 완료
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###id#### : " + userInfo.get("id"));
        
        UserDTO kakaoDTO = service.lookUp(userInfo.get("id").toString());
        if(kakaoDTO == null) {
        	page = "redirect:/joinForm";
        	attr.addFlashAttribute("kakaoid",userInfo.get("id"));
        }else {
        	logger.info("카카오 로그인 진입");
        	page = "redirect:/login";
        	attr.addAttribute("id",kakaoDTO.getK_userid());
        	attr.addAttribute("pw",kakaoDTO.getK_key());
        }
        return page; //본인 원하는 경로 설정
	}
	
    //토큰발급(인증코드로 토큰 요청)
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정해야함.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=8b5c1dc8a514d8fc7e3ccc6c9602ecd4");  //본인이 발급받은 key
            sb.append("&redirect_uri=http://localhost:8080/fishing/login/oauth_kakao");     // 본인이 설정해 놓은 경로
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
            
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            ObjectMapper mapper = new ObjectMapper();
            HashMap<String, Object> tokens = mapper.readValue(result, HashMap.class);

            access_Token = tokens.get("access_token").toString();
            refresh_Token = tokens.get("refresh_token").toString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return access_Token;
    }
	
    //유저정보조회
    public HashMap<String, Object> getUserInfo (String access_Token) {
    	
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("Authorization","Bearer "+ access_Token);
            
            conn.getOutputStream().write("kakao_account.email".getBytes("UTF-8"));
            conn.getOutputStream().flush();
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
            ObjectMapper mapper = new ObjectMapper();
            userInfo = mapper.readValue(result, HashMap.class);
            

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return userInfo;
    }
    
 }