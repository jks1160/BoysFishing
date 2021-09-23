<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</style>
</head>

<body>

<form action="captainWrite" method="GET">
	<div>
		<input type="text" value= "${op_date}" name = "op_date" />
	</div>
	
	<div>
		<select id = "shipName" name = "s_num" onchange="chageShopSelect1()">
			<option>선택</option>
			<c:forEach var="name" items="${shipName}">
			<option value="${name.s_num}">${name.s_name}</option>
		</c:forEach>
		</select>
	</div>
	
	<div>
		<select id = "startPoint" name = "op_startpoint" onchange="chageShopSelect2()">
		
		</select>
	</div>
	
	<div>
		<select id = "islandName" name = "i_num" onchange="chageShopSelect3()">
			
		</select>
	</div>
	
	<div>
		<input type="time" id = "startTime" name = "op_starttime" required/>
	</div>
	
	<div>
		<input type="number"  id = "changeTime" name = "op_duringtime" min="10" max="180" step="10" onkeydown="filterNumber(event)" required/>
	</div>
	
	<div>
		<input type="time" id = "returnTime"  name = "op_returntime" required/>
	</div>
	
	<div>
		<input type="number" name = "op_price" required/>
	</div>
	<button>저장하기</button>
</form>
</body>

<script>
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
		content += "<option value='"+item.i_num+"'>"+item.op_startpoint+"</option>"
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