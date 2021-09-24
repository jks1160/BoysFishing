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
	    width:500px;
		font-weight:600;
		text-align: center;
		border: 1px solid black;
	}
		thead th{
		background-color:activecaption;
		width:500px;
		font-weight:600;
		text-align: center;
		border: 1px solid black;
		}
		
		img{
		width:400px;
		height:200px;
		
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
				<th>선장 아이디</th>
				<td>${bbs.u_userid}</td>
			</tr>
			
			<tr>
				<th>라이센스 여부</th>
				<td>${bbs.cap_licenseYN}</td>
			</tr>
			
			<tr>
				<th>진행 상태</th>
				<td>${bbs.cap_idYSN}</td>
			</tr>
			
			<tr>
				<th>신청 날짜</th>
				<td>${bbs.cap_requestTime}</td>
			</tr>			
			
			<tr>
				<th>거절 사유</th>
				<td><input type="text" id="cap_cancelreason" name="cap_cancelreason" style="width:100%;" value=""></td>
			</tr>
			
			<tr>
				<th>라이센스 이미지</th>
				<td><img src="${img.l_name}"></td>
			</tr>
				
						
	</thead>
		
		
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


































