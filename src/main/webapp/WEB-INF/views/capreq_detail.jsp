<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>


		<meta charset="UTF-8">
		<title>SOMEFISH</title>
		
		
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
	    thead td{
	    width:300px;
		font-weight:600;
		text-align: center;
		background-color: activecaption;
		border: 1px solid black;
	}
		
		</style>


	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container mx-auto mt-4 position-relative">
	<p class="text-center" style="font-size:40px;">선장 신청내역 상세보기</p>
	<table class="mt-4 mx-auto">
	
	<thead>
			<tr>
				<td>선장 아이디</td>
				<td>라이센스 여부</td>
				
				<td>진행 상태</td>
				<td>신청 날짜</td>
				<td>거절 사유</td>
			</tr>
	</thead>
		
			<tbody id="list" >
				<tr>
					<td>${bbs.u_userid}</td>
					<td>${bbs.cap_licenseYN}</td>
					
					<td>${bbs.cap_idYSN}</td>
					<td>${bbs.cap_requestTime}</td>
					<td><input type="text" id="cap_cancelreason" name="cap_cancelreason" value=""></td>
				</tr>
				
			</tbody>	

			</table>
				
					<div class = "container">
						<div class="mx-auto text-center mt-3">
							<button onclick="location.href='/fishing/manage/capreq_update?u_userid=${bbs.u_userid}'">권한 허락</button>
							<button type="button" id="reject">권한 거절</button>		
							<button onclick="location.href='/fishing/manage/captainlist'">리스트로</button>
						</div>
					</div>
	</div>
					<input type="hidden" value="${bbs.u_userid}" id="hdnid" name="hdnid">
	</body>
	<script>
	
	var userid = $("#hdnid").val();
	
		$("#reject").click(function(){
			if($("#cap_cancelreason").val().length>0){
				var cap_cancelreason = $("#cap_cancelreason").val();
				console.log(cap_cancelreason);
				location.href='/fishing/manage/capreq_reject?u_userid='+userid+'&cap_cancelreason='+cap_cancelreason;
			}else{
				alert("거절 사유를 입력해 주세요.");
				focus($(this));
			}
		})


</script>
</html>


































