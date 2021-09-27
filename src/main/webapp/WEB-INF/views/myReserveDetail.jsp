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
		<title>MyReserveDetail</title>
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
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
		.head{
 		 margin-top: 50px;
 		 margin-bottom:50px;
 		 text-align: center;
 		 }
		.entire{
		text-align: center;
		margin-top: 5%;
		margin-right: 20%;
		margin-bottom: 5%;
		margin-left: 20%;
	}
		.date{
		text-align: center;
		margin-right: 20%;
		padding-right: 25%;
		}
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head"><h2>${sessionScope.userinfo.u_usernickname} 님의 예약정보</h2></div>
	<div class="date"><h4 id ="onDate">탑승 날짜 : ${map.RI_DATE}</h4></div>
	<div class="entire">
	<table class="table table-bordered">
	<thead>
			<tr>
				<td>항목</td>
				<td>값</td>
			</tr>
	</thead>
	    <tr>
			<th>예약번호</th>
			<td>${map.RI_NUM }</td>
		</tr>
		<tr>
			<th>예약자ID</th>
			<td>${map.RI_USERID }</td>
		</tr>
		<tr>
			<th>목적지</th>
			<c:choose>
			<c:when test="${map.RI_STARTRETURNYN eq 'Y'}"><td>${map.I_NAME }</td></c:when>
			<c:otherwise><td>${map.RI_STARTPOINT }</td></c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>출항지</th>
			<c:choose>
			<c:when test="${map.RI_STARTRETURNYN eq 'Y'}"><td>${map.RI_STARTPOINT }</td></c:when>
			<c:otherwise><td>${map.I_NAME }</td></c:otherwise>
			</c:choose>
		</tr>
		<c:choose>
		<c:when test="${map.RI_STARTRETURNYN eq 'Y'}">
		<tr>
			<th>출항시간</th>
			<td>${map.RI_STARTTIME }</td>
		</tr>
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${map.RI_STARTRETURNYN eq 'N'}">
		<tr>
			<th>회항시간</th>
			<td>${map.RI_RETURNTIME }</td>
		</tr>
		</c:when>
		</c:choose>
		<tr>
			<th>소요시간</th>
			<td>${map.RI_DURINGTIME }</td>
		</tr>
		<tr>
			<th>인원수</th>
			<td>${map.RI_PEOPLE}명</td>
		</tr>
		<tr>
			<th>결재금액</th>
			<td>${map.RI_PAY}원</td>
		</tr>
		<tr>
			<th>예약상태</th>
			<c:choose>
				<c:when test="${map.RI_CODE eq 'RI001' }"><td>예약신청</td></c:when>
				<c:when test="${map.RI_CODE eq 'RI002' }"><td>예약확정</td></c:when>
				<c:when test="${map.RI_CODE eq 'RI003' }"><td>유저예약취소</td></c:when>
				<c:when test="${map.RI_CODE eq 'RI004' }"><td>선장예약취소</td></c:when>
				<c:when test="${map.RI_CODE eq 'RI005' }"><td>선장예약취소</td></c:when>
				<c:when test="${map.RI_CODE eq 'RI006' }"><td>유저예약취소</td></c:when>
			</c:choose>
		</tr>
		<c:choose>
		<c:when test="${map.RI_CODE eq 'RI004' || map.RI_CODE eq 'RI005' }">
		<tr>
			<th>취소사유</th>
			<td>${map.RI_CANCELREASON}원</td>
		</tr>
		</c:when>
		</c:choose>
		<c:choose>
		<c:when test="${map.RI_DATE gt today}">
		<tr>
			<td colspan="2">
			<form action="reserveCancel" method="POST">
			<input type="hidden" name="ri_num" value="${map.RI_NUM }">
			<input type="hidden" name="ri_code" value="${map.RI_CODE }">
			<input type="hidden" name="s_num" value="${map.S_NUM }">
			<input type="hidden" name="ri_pay" value="${map.RI_PAY }">
			<button >취소하기</button>
			</form>
		</tr>
		</c:when>
		</c:choose>
		</table>
		</div>
	</body>
	<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	
 	var onDate = $("#onDate").html();
 	var Date = onDate.substring(0,onDate.lastIndexOf(" ")+1);
 	console.log(Date);
 	$("#onDate").html(Date);
 	
 	console.log("${map}");
	</script>
</html>