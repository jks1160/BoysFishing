<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Do Hyeon', sans-serif;
}
.entire{
	
		margin-top: 5%;
		margin-right: 30%;
		margin-bottom: 5%;
		margin-left: 30%;
}
input{
	
}
</style>
</head>

<body>
<h4 class='text-center'>운항 스케줄 수정</h4>
<hr/>
<div class="entire">
<form id = "frm" method="POST">
	<table class="table-bordered justify-content-md-center" style="width:800px">
	<tr>
		<td>오늘 날짜</td>
		<td><input type="text" value= "${reser.op_date}" name = "op_date" readonly/></td>
	</tr>
	
	<tr>
		<td>배 이름</td>
		<td>
			<select id = "shipName" name = "s_num" onchange="chageShopSelect1()">
				<option>선택</option>
				<c:forEach var="name" items="${shipName}">
				<option value="${name.s_num}">${name.s_name}</option>
			</c:forEach>
			</select>
		</td>
	</tr>
	
	<tr>
		<td>출항지</td>
		<td>
			<select id = "startPoint" name = "op_startpoint" onchange="chageShopSelect2()">
			
			</select>
		</td>
	</tr>
	
	<tr>
		<td>목적지</td>
		<td>
			<select id = "islandName" name = "i_num">
				
			</select>
		</td>
	</tr>
	
	<tr>
		<td>출항시간</td>
		<td>
			<input type="time" id = "startTime" name = "op_starttime" required/>
		</td>
	</tr>
	
	<tr>
		<td>소요시간</td>
		<td>
			<input type="number"  id = "changeTime" name = "op_duringtime" min="10" max="180" step="10" onkeydown="filterNumber(event)" required/>
		</td>
	</tr>
	
	<tr>
	<td>회항시간</td>
		<td>
			<input type="time" id = "returnTime"  name = "op_returntime" readonly required/>
		</td>
	</tr>
	<tr>
		<td>운항비용</td>
		<td>
			<input type="number" name = "op_price" step="1000"  required/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" onclick="updateCaptainSchedule()" value="수정하기"/>
		</td>
	</tr>
	</table>
	<input type="text" name = "ori_s_num"  value="${reser.s_num }" hidden='hidden'/>
	<input type="text" name = "ori_i_num"  value="${reser.i_num }" hidden='hidden'/>
	<input type="text" name = "ori_op_date"  value="${reser.op_date }" hidden='hidden'/>
	<input type="text" name = "ori_op_starttime"  value="${reser.op_starttime }" hidden='hidden'/>
</form>
</div>
</body>
<script>
function updateCaptainSchedule(){
	$.ajax({
		url:"./reser/captain_sche_detail",
		type: "POST",
		data : $("#frm").serialize(),
		dataType : "JSON",
		success : function(data){
			console.log("성공",data);
			opener.document.location.reload();
			window.close();
		},
		error: function(e){
			console.log("에러 : ", e);
		}
	});
	
}


//키 입력 못하게 막기
function filterNumber(event){
	event.preventDefault(); 
}

$(function(){
    $("#changeTime").on('input',function(){
      var changeTime = document.getElementById("changeTime").value; 
      console.log(changeTime);
      returnTime(changeTime);
    });
 })
 
 $(function(){
    $("#startTime").on('input',function(){
    	document.getElementById("changeTime").value = 0;
    	document.getElementById("returnTime").value = 0;
    });
 })
 
function returnTime(changeTime){
	var startTime = document.getElementById("startTime").value;
	startTime_str = startTime.split(":");
	var hour = startTime_str[0];
	var min = startTime_str[1];
	
	console.log(startTime_str);
	console.log(startTime_str[1]);
	console.log(parseInt(min) + parseInt(changeTime));
	var a = parseInt(startTime_str[1]) + parseInt(changeTime);
	console.log(parseInt(a/60));
	console.log(parseInt(a%60));
	hour = startTime_str[0];
	min = a;
	if(parseInt(a/60) >0 ){
		hour = parseInt(startTime_str[0]) + parseInt(a/60);
		min = parseInt(a%60);
		if(hour<10){
			hour = "0"+hour;
		}
		if(min<10){
			min = "0"+min;
		}
		if(hour >= 24){
			hour = hour - 1;
			document.getElementById("changeTime").value = 0;
			alert("24시간이 넘었습니다!");
		}
	}
	console.log(hour +":"+ min);
	document.getElementById("returnTime").value = hour +":"+ min;
}

//선택했을 때 값 가져오기
function chageShopSelect1(){
	var shipSelect = document.getElementById("shipName");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	selectValue = parseInt(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	startPoint(selectValue);
	$("#islandName").empty();
	islandName();
}
function chageShopSelect2(){
	var shipSelect = document.getElementById("startPoint");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	$("#islandName").empty();
	islandName();
}



function startPoint(shipNum) {
	console.log("여기옴?");
	var param = {};
	param.shipNum = shipNum;
	$.ajax({
		type : 'get',
		url : 'startPoint',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			startPointDrawList(data)
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function startPointDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<option value='"+item.s_address+"'>"+item.s_address+"</option>"
	});
	$("#startPoint").empty();
	$("#startPoint").append(content);
	
	
}

function islandName() {
	console.log("여기옴?");
	$.ajax({
		type : 'get',
		url : 'islandName',
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			islandDrawList(data)
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function islandDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<option value='"+item.i_num+"'>"+item.i_name+"</option>"
	});
	$("#islandName").empty();
	$("#islandName").append(content);
}
</script>
</html>