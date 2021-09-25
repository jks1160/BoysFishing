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
		<title>SOMEFISH</title>
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
	
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head"><h2>${sessionScope.userinfo.u_usernickname} 님의 회원정보</h2></div>
	<div class="entire">
	<div class="rounded float-start">
		<img id="profileImg" class="rounded" alt="배 이미지" style="width: 200px;">
	</div>
	
	<div>
	<button type="button" onclick="location.href='shipJoinForm'">등록하기</button>
	<select onchange="select(this)" id="shipNameOption">
	<c:forEach items="${list}" var="shipName">
		<option id="shipName">${shipName.s_name }</option>
	</c:forEach>
	</select>
	</div>
	<div>
	
	<table class="table table-bordered">
		<tr>
			<th>배 이름</th>
			<td id="s_name"></td>
		</tr>
	    <tr>
			<th>최소탑승인원</th>
			<td id="s_minpassenger"></td>
		</tr>
		<tr>
			<th>최대탑승인원</th>
			<td id="s_maxpassenger"></td>
		</tr>
		<tr>
			<th>정박위치주소</th>
			<td id="s_address"></td>
		</tr>
		<tr>
			<th>장비 현황</th>
			<td id="s_equipment"></td>
		</tr>
		<tr>
			<th>편의시설 현황</th>
			<td id="s_convenient"></td>
		</tr>	
		<tr>
			<td colspan="2">
			
			<button type="button" onclick="">수정하기</button>
			
		</tr>
		</table>
		</div>
		</div>
	</body>
	<script>

	window.onload = function(){
		var s_name = $("#shipName").val();

		$.ajax({
			url:'shipListDetail',
			type:'POST',
			data:{'s_name':s_name},
			dataType:'JSON',
			success:function(data){
				$("#s_name").html(data.dto.s_name);
				$("#s_minpassenger").html(data.dto.s_minpassenger);
				$("#s_maxpassenger").html(data.dto.s_maxpassenger);
				$("#s_address").html(data.dto.s_address);
				$("#s_equipment").html(data.dto.s_equipment);
				$("#s_convenient").html(data.dto.s_convenient);
				if(data.dto.si_name == null){
					$("#profileImg").attr("src","resources/defaultimg/defaultprofile.png");
				}else{
					$("#profileImg").attr("src",data.path);
				}
			},
			error:function(e){
				console.log(e);
			}	
		}); 
		
	}


	function select(obj){
		console.log(obj.value);
		
		$.ajax({
			url:'shipListDetail',
			type:'POST',
			data:{'s_name':obj.value},
			dataType:'JSON',
			success:function(data){
				$("#s_name").html(data.dto.s_name);
				$("#s_minpassenger").html(data.dto.s_minpassenger);
				$("#s_maxpassenger").html(data.dto.s_maxpassenger);
				$("#s_address").html(data.dto.s_address);
				$("#s_equipment").html(data.dto.s_equipment);
				$("#s_convenient").html(data.dto.s_convenient);
				if(data.dto.si_name == null){
					$("#profileImg").attr("src","resources/defaultimg/defaultprofile.png");
				}else{
				$("#profileImg").attr("src",data.path);
				console.log(data.path);
				}
			},
			error:function(e){
				console.log(e);
			}	
		}); 
	}
	
	</script>
</html>


































