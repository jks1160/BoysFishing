<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>
		<meta charset="UTF-8">
		<title>MyUserInfo</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<style>
			table, td ,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
	
		</style>

	</head>
	<body>
	<h2>섬낚시장인 님의 회원정보</h2>
	<table>
	<thead>
			<tr>
				<td>항목</td>
				<td>값</td>
			</tr>
	</thead>
	    <tr>
			<th>핸드폰번호</th>
			<td>${dto.u_userphonenum}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.u_useremail}</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>${dto.u_usernickname}</td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>${dto.u_joindate}</td>
		</tr>
		</table>
	</body>
	<script>
	</script>
</html>