<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		 rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
		 crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		  integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" 
		  crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<title>MyUserInfoUpdate</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<!-- 글꼴 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<style>
		* {
 	    font-family: 'Do Hyeon', sans-serif;
	}
		table, td ,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}

	
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>${sessionScope.userinfo.u_usernickname} 님의 배 정보</h2>
	<div class="rounded float-start">
		<img src="/photo/${dto.si_name }" id="profileImg" class="rounded" alt="배 이미지" style="width: 200px;">
	</div>
	
	<div>
	<button type="button" onclick="location.href='shipJoin'">등록하기</button>
	<select>
		<option>${dto.s_name }</option>
	</select>
	</div>
	<div>
	
	<table>
		<tr>
			<th>배 이름</th>
			<td>${dto.s_name }</td>
		</tr>
	    <tr>
			<th>최소탑승인원</th>
			<td>${dto.s_minpassenger }</td>
		</tr>
		<tr>
			<th>최대탑승인원</th>
			<td>${dto.s_maxpassenger }</td>
		</tr>
		<tr>
			<th>정박위치주소</th>
			<td>${dto.s_address }</td>
		</tr>
		<tr>
			<th>장비 현황</th>
			<td>${dto.s_equipment }</td>
		</tr>
		<tr>
			<th>편의시설 현황</th>
			<td>${dto.s_convenient }</td>
		</tr>	
		<tr>
			<td colspan="2">
			
			<button type="button" onclick="">수정하기</button>
			
		</tr>
		</table>
		</div>
	</body>
	<script>

	</script>
</html>


































