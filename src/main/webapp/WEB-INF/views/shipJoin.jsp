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
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
	
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h2>${sessionScope.loginId} 님의 배 정보 등록</h2>
	<div class="rounded float-start">
	<c:choose> 
		<c:when test="${dto.ui_name eq null}">
		<img src="resources/defaultprofile.png" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:when>
		<c:otherwise>
		<img src="/photo/${dto.ui_name}" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:otherwise>
	</c:choose>
 	
	<div style="margin: 20px 50px;">
 	<form id="fileUpload">
	<input type="file" hidden="hidden}"" name="file" id="fileinput" onchange="uploadFile()">
	<button type="button" id="fileUpdate">등록</button>
	<button type="button" id="fileDelete">삭제</button>
	</form>
	</div>
	
	</div>
	<form action="shipJoin" name="shipJoin" method="POST">
	<table>
	<thead>
			<tr>
				<td>항목</td>
				<td>값</td>
			</tr>
	</thead>
	    <tr>
			<th>배이름</th>
			<td>
			<input type="text" name="s_name" id="s_name" value=""/>
			</td>
		</tr>

		<tr>
			<th>최소탑승인원</th>
			<td>
			<input name="s_minpassenger" id="s_minpassenger" type="text" value=""/>
			</td>
		</tr>
		<tr>
			<th>최대탑승인원</th>
			<td>
			<input name="s_minpassenger" id="s_minpassenger" type="text" value=""/>
			</td>
		</tr>
		<tr>
			<th>정박위치주소</th>
			<td>
			<input name="s_address" id="s_address" type="text" value=""/>
			<button type="button" id="address">주소 검색</button></td>
		</tr>
		<tr>
			<th>장비현황</th>
			<td>
			안내방송<input type="checkbox" name="s_equipment" value="안내방송"/>
			플로터<input type="checkbox" name="s_equipment" value="플로터"/>
			무전기<input type="checkbox" name="s_equipment" value="무전기"/>
			레이더<input type="checkbox" name="s_equipment" value="레이더"/>
			쏘나<input type="checkbox" name="s_equipment" value="쏘나"/>
			</td>
		</tr>
		<tr>
			<th>편의시설 현황</th>
			<td>
			에어컨<input type="checkbox" name="s_equipment" value="에어컨"/>
			TV<input type="checkbox" name="s_equipment" value="TV"/>
			화장실<input type="checkbox" name="s_equipment" value="화장실"/>
			주차장<input type="checkbox" name="s_equipment" value="주차장"/>
			휴게실<input type="checkbox" name="s_equipment" value="휴게실"/>
			냉장고<input type="checkbox" name="s_equipment" value="냉장고"/>
			커피포트<input type="checkbox" name="s_equipment" value="커피포트"/>
			구명조끼<input type="checkbox" name="s_equipment" value="구명조끼"/>
			난방<input type="checkbox" name="s_equipment" value="난방"/>
			구명밧줄<input type="checkbox" name="s_equipment" value="구명밧줄"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" id="submitBtn" onclick="">저장하기</button>
			</td>
			
		</tr>
		</table>
		</form>
	</body>
	<script>
$("#fileinput").hide(); //input 버튼 숨기기
	
	$(function(){
	    $('#fileUpdate').on('click', function(){
	    	$("#fileinput").click();
	    });
	});
	
	$(function(){
	    $('#fileDelete').on('click', function(){
	    	fileDel();
	    });
	});


	function uploadFile(){
		console.log("프로필이미지 업데이트");
		var form = $('#fileUpload')[0];
	    var formData = new FormData(form);

		 $.ajax({
				url:'fileUpdate',
				type:'POST',
				data:formData,
				dataType:'JSON',
			    contentType:false,
			    processData:false,
				success:function(data){
					console.log("성공");
					console.log(data.path);
					$("#profileImg").attr("src",data.path);				
				},
				error:function(e){
					console.log("실패");
					console.log(e);
				}	
			}); 
	}
	
	function fileDel(){
		console.log("프로필이미지삭제");
		 $.ajax({
				url:'fileDel',
				type:'POST',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log("성공");
					console.log(data);
					if(data){
					$("#profileImg").attr("src","resources/defaultprofile.png");	
					}else{
						alert("등록된 프로필 이미지가 없습니다.");
					}
				},
				error:function(e){
					console.log("실패");
					console.log(e);
				}	
			}); 
	}
	</script>
</html>


































