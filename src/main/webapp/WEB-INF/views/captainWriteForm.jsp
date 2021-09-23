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
<jsp:include page="header.jsp"></jsp:include>

<form action="captainWrite" method="GET">

	<div>
		<select id = "shipName" onchange="chageShopSelect1()">
			<option>선택</option>
			<c:forEach var="name" items="${shipName}">
			<option value="${name.s_num}">${name.s_name}</option>
		</c:forEach>
		</select>
	</div>
	
	<div>
		<select id = "startPoint" onchange="chageShopSelect2()">
		
		</select>
	</div>
	
	<div>
		<select id = "islandName" onchange="chageShopSelect3()">
			
		</select>
	</div>
	
	<div>
		<input type="time"  required/>
	</div>
	
	<div>
		<input type="number" min="1", max="12" onkeydown="filterNumber(event);" required/>
	</div>
	
	<div>
		<input type="time" required/>
	</div>
	<button>저장하기</button>
</form>
</body>

<script>
//키 입력 못하게 막기
function filterNumber(event){
	event.preventDefault(); 1
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
function chageShopSelect3(){
	var shipSelect = document.getElementById("islandName");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	islandName(selectValue);
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
		content += "<option value='"+item.i_name+"'>"+item.i_name+"</option>"
	});
	$("#islandName").empty();
	$("#islandName").append(content);
}
</script>
</html>