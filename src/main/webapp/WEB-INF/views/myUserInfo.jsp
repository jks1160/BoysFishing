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
		  <link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
		<meta charset="UTF-8">
		<title>MyUserInfo</title>
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
		th{
		width: 200px;
		}
		td{
		height: 30px; 
		}
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
		.entire{
		text-align: center;
		margin-top: 5%;
		margin-right: 20%;
		margin-bottom: 5%;
		margin-left: 20%;
	}
		.head{
 		 margin-top: 50px;
 		 margin-bottom:50px;
 		 text-align: center;
 	}
 		 img {
 		 width: 200px;
 		 height: 200px;
		 object-fit: contain;
		}
	
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head"><h2>${sessionScope.userinfo.u_usernickname} 님의 회원정보</h2></div>
	<div class="entire">
	<div class="rounded float-start">
		<c:choose> 
		<c:when test="${dto.ui_name eq null}">
		<img src="resources/defaultimg/defaultprofile.png" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:when>
		<c:otherwise>
		<img src="/photo/${dto.ui_name}" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:otherwise>
	</c:choose>
	</div>
	<table class="table table-bordered">
	<thead>
			<tr>
				<td>항목</td>
				<td>정보</td>
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
		<tr>
			<td colspan="2">
			<button type="button" onclick="location.href='./myUserInfoUpdateForm'">수정하기</button>
			<button type="button" onclick="userQuit()">탈퇴하기</button>
			
		</tr>
		</table>
		</div>
	</body>
	<script>
	
	function userQuit(){
		if(confirm("정말 탈퇴하시겠습니까?")){
			 location.href="userQuit";
		}else{
			return;
		}
	}
	</script>
</html>