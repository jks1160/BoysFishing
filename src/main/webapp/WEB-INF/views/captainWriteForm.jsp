<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
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
</body>

<script>
//선택했을 때 값 가져오기
function chageShopSelect1(){
	var shipSelect = document.getElementById("shipName");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	selectValue = parseInt(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	startPoint(selectValue);
}
function chageShopSelect2(){
	var shipSelect = document.getElementById("startPoint");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	islandName(selectValue);
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

function islandName(shipNum) {
	console.log("여기옴?");
	var param = {};
	param.shipNum = shipNum;
	$.ajax({
		type : 'get',
		url : 'islandName',
		data : param,
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
		content += "<option>"+item.i_name+"</option>"
	});
	$("#islandName").empty();
	$("#islandName").append(content);
}
</script>
</html>