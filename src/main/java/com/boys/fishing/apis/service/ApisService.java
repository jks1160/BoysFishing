package com.boys.fishing.apis.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boys.fishing.apis.dao.ApisDAO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class ApisService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	ApisDAO dao;

	// @Scheduled(cron = "0/5 * * * * MON-FRI *")
	public String apiCall() {
		boolean success = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Object> list = new ArrayList<Object>();
		// 중기 기온 정보
		ArrayList<String> urls = new ArrayList<String>();
		urls.add("http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa");
		String params = "ServiceKey=tnf09jRSI4xmyCxSTqus6bG%2F9xBmzhvJZrnw6bFUG8fQyLmCc3dq0nFIkYVSO0FgkuKZLLmaatdn0CQvCmpVVg%3D%3D&numOfRows=400&pageNo=1&dataType=JSON&regId=11B20201&tmFc=202109140600";
		String result = sendMsg(urls, null, params, "GET");
		if (!result.contains("Fail")) { // 실패시 result의 key 값에 모두 Fail을 넣어 놨음으로.
			success = true;
			ObjectMapper mapper = new ObjectMapper(); // Jackson에 있는 메서드. JSON형테의 데이터를 자바의 데이터 타입으로 바꿔주는 클래스.
			try {
				map = mapper.readValue(result, new TypeReference<HashMap<String, Object>>() {// 문자열을 무엇으로 변환할 것이냐.
				});
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		map = (HashMap<String, Object>) map.get("response");
		map = (HashMap<String, Object>) map.get("body");
		map = (HashMap<String, Object>) map.get("items");
		list = (ArrayList<Object>) map.get("item");
		map = (HashMap<String, Object>) list.get(0);
		logger.info((String) map.get("regId"));
		return "home";
	}

	// @Scheduled(cron = "0/5 * * * * MON-FRI *")
	public String islandCall() {
		boolean success = false;
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Object> list = new ArrayList<Object>();
		// 인천 섬 정보
		ArrayList<String> urls = new ArrayList<String>();
		urls.add("https://api.odcloud.kr/api/15048891/v1/uddi:93176ba4-c5de-4d27-b1fb-d2e092a17796_201912091414");
		String params = "serviceKey=tnf09jRSI4xmyCxSTqus6bG%2F9xBmzhvJZrnw6bFUG8fQyLmCc3dq0nFIkYVSO0FgkuKZLLmaatdn0CQvCmpVVg%3D%3D&page=1&perPage=500";
		String result = sendMsg(urls, null, params, "GET");
		if (!result.contains("Fail")) { // 실패시 result의 key 값에 모두 Fail을 넣어 놨음으로.
			success = true;
			ObjectMapper mapper = new ObjectMapper(); // Jackson에 있는 메서드. JSON형테의 데이터를 자바의 데이터 타입으로 바꿔주는 클래스.
			try {
				map = mapper.readValue(result, new TypeReference<HashMap<String, Object>>() {// 문자열을 무엇으로 변환할 것이냐.
				});
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		list = (ArrayList<Object>) map.get("data");
		for (Object item : list) {
			HashMap<String, String> island = (HashMap<String, String>) item;
			if (island.get("관리유형").equals("이용가능") || island.get("관리유형").equals("개발가능")) {
				Set<String> set = island.keySet();
				for (String key : set) {
					
				}
			}
		}
		return "home";
	}

	// 전송을 해주는 기능 - 여러가지 상황에도 대응 할 수 있는 메소드를 생성
	/**
	 * 요청한 내용을 다른 서버로 전송하여 결과값을 받아오는 메서드 작성자 : 송봉조 작성일 : 2021-08-31
	 * 
	 * @param urls   : ArrayList<String> buffer - 다중 스레드 접근 가능한 문자열
	 * @param header : HashMap<String, String> (컨텐츠 타입을 선언하고 인증키 등의 먼저 읽혀야 하는 정보들을
	 *               담는다.)
	 * @param method : String (POST, GET)
	 * @param params : String
	 * @return 전송 결과 값 : String(JSON)
	 * 
	 */
	public String sendMsg(ArrayList<String> urls, HashMap<String, String> header, String params, String method) {

		StringBuffer sb = new StringBuffer(); // buffer/builder의 경우 객체를 추가해서 생성하지 않는다. buffer는 다중 스레드의 접근도 가능함으로 buffer로
												// 담는다.
		String result = ""; // 결과값 저장
		HttpURLConnection con = null; // finally에서 자원반납을 해주기 위하여(서버와 통신을 하기위한 Connection 선언.)
		BufferedReader reader = null; // 메세지를 받아올 Buffer 보조스트림 - 자원반납을 위하여
		// 혹시 소문자로 들어올 경우
		if (method.toUpperCase().equals("GET") && params != null) {// GET 방식으로 통신하는 경우이고 param이 있는 경우는 param을 url뒤에다
																	// 담아줘야 함으로.
			urls.add("?" + params);
		}

		for (String url : urls) {// ArrayList로 받아온 url을 하나의 주소로 만드는 과정(위에서 GET 방식일 경우 url 뒤에 전달하고자 하는 값들을 붙여줬음.
									// POST는 아래에서 다른 방식으로 전달한다.)
			sb.append(url);
		}

		try {
			// URL 클래스와 HttpURLConnection 모두 서버와 서버간의 통신을 위한 클래스이다 하지만 가장 큰 차이점은
			// HttpURLConnection의 경우 POST방식을 지원한다는 차이가 있다.
			URL url = new URL(sb.toString()); // buffer에 있는 값을 URL 에 String으로 담는다.
			con = (HttpURLConnection) url.openConnection(); // 작성된 URL을 통하여 connection을 만든다.(서버와 POST 방식으로 통신을 하기 위하여.)

			con.setRequestMethod(method.toUpperCase()); // 통신방법을 설정 - 그냥 둘 경우 GET이 기본 - 지금은 method에 의해서 바뀜

			con.setDoOutput(true);// 결과값을 받아야 하는지?

			if (header != null && header.size() > 0) { // 헤더 값(key:value)을 추가해야 하는지 여부를 확인하고
				for (String key : header.keySet()) { // 있다면 있는 만큼 헤더에 값을 넣어준다.
					con.setRequestProperty(key, header.get(key));
				}
			}

			if (method.toUpperCase().equals("POST") && params != null) {// Body 값이 있는가?(POST 인 경우 parameter 가 Http의
																		// BODY에 담겨 온다.)
				con.getOutputStream().write(params.getBytes("UTF-8")); // 연결된 커넥션에 byte 배열(Output)로 스트림을 통해서 보낸다.
				con.getOutputStream().flush();
			}

			int resultCode = con.getResponseCode(); // 코드가 200이 나오면 성공!! 403 - 권한없을 경우, 405 - 전송방식이 다른 경우, 401 key 가 잘못된
													// 경우

			if (resultCode == 200) { // 성공 했을 경우
				reader = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8")); // 받을 떄는 문자열로 받는다. -
																									// 단일 바이트(문자를 뜻함.)-
																									// Output은 바이트로 통신
																									// (둘이 다르다.)(빠르게 받기
																									// 위하여 buffer까지)
			} else { // 실패 했을 경우
				reader = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8")); // 실패 했을 경우 실패 메세지를
																									// 받기 위하여
																									// getErrorStream으로
																									// 받는다.
			}

			String readLine = "";
			sb = new StringBuffer(); // StringBuffer를 새로 객체화 해서 만드는 과정.

			while ((readLine = reader.readLine()) != null) { // HTTP body 부분을 한줄씩 읽어들여서 끝날때 까지. 한줄로 보내지 않는 경우도 있어서 처리해줌.
				sb.append(readLine);
			}
			result = sb.toString(); // 최종 메세지는 [성공 / 실패]

			if (resultCode != 200) { // 실패 했을 경우 모두 Fail이라는 단어를 모두 포함하여 던지다. 이를 통하여 Fail을 담고있으면 실패로 간주한다.
				logger.info("Fail Message : " + result); // 여기서는 통신중에 발생하는 오류들에 대하여 Fail Message 를 담아준다.
				result = "Fail Message : " + result;
			}

		} catch (IOException e) {
			e.printStackTrace();
			result = "Fail Message : " + e.toString(); // 여기서는 예외로 발생한 애러들에 대하여 Fail Message 를 담아준다.
		} finally {
			if (con != null) {
				con.disconnect();
			}
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		// HTTP에 관한 속성 공부하기 , 아파치에서 제공하는 라이브러리가 있음 참고하기.
		return result;
	}
}
