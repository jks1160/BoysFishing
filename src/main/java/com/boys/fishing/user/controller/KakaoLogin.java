package com.boys.fishing.user.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class KakaoLogin {

@RequestMapping(value = "/login/getKakaoAuthUrl")
	// 인증요청 > 인증코드 발급 > 인증토큰 요청
	// 우리 서버로 들어온 카카오 시작하기 요청을 카카오 서버로 인증요청을 보냄(HttpServletRequest)
	public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) throws Exception {
		System.out.println("카카오 로그인 요청");
		String reqUrl = 
				"https://kauth.kakao.com/oauth/authorize"
				+ "?client_id=8b5c1dc8a514d8fc7e3ccc6c9602ecd4"
				+ "&redirect_uri=http://localhost:8090/fishing/login/oauth_kakao"
				+ "&response_type=code";
		return reqUrl;
	}
	
	// 카카오 연동정보 조회
	// 카카오 개발자에서 설정한 requestURL을 통하여 인증코드을 받아옴
	@RequestMapping(value = "/login/oauth_kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model) throws Exception {

		System.out.println("#########" + code);
		// 받아온 인증코드 값으로 인증토큰을 요청 
        String access_Token = getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        
        // ---------- 여기까지 완료
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("###access_Token#### : " + access_Token);
        System.out.println("###userInfo#### : " + userInfo.get("email"));
        System.out.println("###nickname#### : " + userInfo.get("nickname"));
        
        
        
        return "/home"; //본인 원하는 경로 설정
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
            sb.append("&redirect_uri=http://localhost:8090/fishing/login/oauth_kakao");     // 본인이 설정해 놓은 경로
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

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "http://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);
            
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            System.out.println("readLine : "+br.readLine());
            
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }
    
    
 // 전송을 해주는 기능 - 여러가지 상황에도 대응 할 수 있는 메소드를 생성
 	/**
 	 * 요청한 내용을 다른 서버로 전송하여 결과값을 받아오는 메서드
 	 * 작성자 : 송봉조
 	 * 작성일 : 2021-08-31
 	 * @param urls : ArrayList<String> buffer - 다중 스레드 접근 가능한 문자열
 	 * @param header : HashMap<String, String> (컨텐츠 타입을 선언하고 인증키 등의 먼저 읽혀야 하는 정보들을 담는다.)
 	 * @param method : String (POST, GET)
 	 * @param params : String
 	 * @return 전송 결과 값 : String(JSON)
 	 * 
 	 */
 	public String sendMsg(ArrayList<String> urls, HashMap<String, String> header, String params, String method) {
 		
 		StringBuffer sb = new StringBuffer(); // buffer/builder의 경우 객체를 추가해서 생성하지 않는다. buffer는 다중 스레드의 접근도 가능함으로 buffer로 담는다.
 		String result = ""; // 결과값 저장
 		HttpURLConnection con = null; // finally에서 자원반납을 해주기 위하여(서버와 통신을 하기위한 Connection 선언.)
 		BufferedReader reader = null; // 메세지를 받아올 Buffer 보조스트림 - 자원반납을 위하여
 		// 혹시 소문자로 들어올 경우
 		if(method.toUpperCase().equals("GET") && params != null) {// GET 방식으로 통신하는 경우이고 param이 있는 경우는 param을 url뒤에다 담아줘야 함으로.
 			urls.add("?"+params);
 		}
 		
 		
 		for(String url : urls) {// ArrayList로 받아온 url을 하나의 주소로 만드는 과정(위에서 GET 방식일 경우 url 뒤에 전달하고자 하는 값들을 붙여줬음. POST는 아래에서 다른 방식으로 전달한다.)
 			sb.append(url); 
 		}

 		try {
 			// URL 클래스와 HttpURLConnection 모두 서버와 서버간의 통신을 위한 클래스이다 하지만 가장 큰 차이점은 HttpURLConnection의 경우 POST방식을 지원한다는 차이가 있다.
 			URL url = new URL(sb.toString()); // buffer에 있는 값을 URL 에 String으로 담는다.
 			con = (HttpURLConnection) url.openConnection(); // 작성된 URL을 통하여 connection을 만든다.(서버와 POST 방식으로 통신을 하기 위하여.)
 		
 			con.setRequestMethod(method.toUpperCase()); // 통신방법을 설정 - 그냥 둘 경우 GET이 기본 - 지금은 method에 의해서 바뀜
 			
 			con.setDoOutput(true);// 결과값을 받아야 하는지?
 			
 			if(header != null && header.size() >0){ // 헤더 값(key:value)을 추가해야 하는지 여부를 확인하고 
 				for(String key : header.keySet()) { // 있다면 있는 만큼 헤더에 값을 넣어준다.
 					con.setRequestProperty(key, header.get(key));
 				}
 			}
 			
 			if(method.toUpperCase().equals("POST") && params != null){// Body 값이 있는가?(POST 인 경우 parameter 가  Http의 BODY에 담겨 온다.)
 				con.getOutputStream().write(params.getBytes("UTF-8")); // 연결된 커넥션에 byte 배열(Output)로 스트림을 통해서 보낸다.
 				con.getOutputStream().flush();
 			}
 			
 			int resultCode = con.getResponseCode(); // 코드가 200이 나오면 성공!! 403 - 권한없을 경우, 405 - 전송방식이 다른 경우, 401 key 가 잘못된 경우
 			
 			if(resultCode == 200) { // 성공 했을 경우
 				reader = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); // 받을 떄는 문자열로 받는다. - 단일 바이트(문자를 뜻함.)- Output은 바이트로 통신 (둘이 다르다.)(빠르게 받기 위하여 buffer까지)
 			}else { // 실패 했을 경우
 				reader = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8")); // 실패 했을 경우 실패 메세지를 받기 위하여 getErrorStream으로 받는다.
 			}
 			
 			String readLine = "";
 			sb = new StringBuffer(); // StringBuffer를 새로 객체화 해서 만드는 과정.
 			
 			while((readLine = reader.readLine()) != null) { // HTTP body 부분을 한줄씩 읽어들여서 끝날때 까지. 한줄로 보내지 않는 경우도 있어서 처리해줌.
 				sb.append(readLine);
 			}
 			result = sb.toString(); // 최종 메세지는 [성공 / 실패]
 			
 			if(resultCode != 200) { // 실패 했을 경우 모두 Fail이라는 단어를 모두 포함하여 던지다. 이를 통하여 Fail을 담고있으면 실패로 간주한다.
 				logger.info("Fail Message : "+result); // 여기서는 통신중에 발생하는 오류들에 대하여 Fail Message 를 담아준다.
 				result = "Fail Message : "+result;
 			}
 			
 		} catch (IOException e) {
 			e.printStackTrace();
 			result = "Fail Message : " + e.toString();  // 여기서는 예외로 발생한 애러들에 대하여 Fail Message 를 담아준다.
 		}finally {
 			if(con != null) {con.disconnect();}
 			if(reader != null) {try {
 				reader.close();
 			} catch (IOException e) {
 				e.printStackTrace();
 			}}
 		}
 		
 		// HTTP에 관한 속성 공부하기 , 아파치에서 제공하는 라이브러리가 있음 참고하기.
 		return result;
 	}
 }