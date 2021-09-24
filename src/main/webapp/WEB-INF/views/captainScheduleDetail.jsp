<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<h3>스케쥴 상세보기</h3>
<button onclick="">대기중</button>
<button onclick="">확정예약</button>

<select id = "shipName" name = "s_num" onchange="chageShopSelect1()">
	<option>선택</option>
	<c:forEach var="name" items="${shipName}">
	<option value="${name.s_num}">${name.s_name}</option>
	</c:forEach>
</select>

<div id="reserDetail">

</div>




</body>
<script>
function chageShopSelect1(){
	var shipSelect = document.getElementById("shipName");
	var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
	console.log(selectValue);
	selectValue = parseInt(selectValue);
	//배 이름을 받아오면 출항지를 뿌리는 함수 출력
	$("#reserDetail").empty();
	startPoint(selectValue);
}

function startPoint(shipNum) {
	console.log("여기옴?");
	var param = {};
	param.shipNum = shipNum;
	$.ajax({
		type : 'get',
		url : 'reserDetail',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			reserDetailDrawList(data)
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function reserDetailDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<hr>";
		content += "<table class='table-bordered'>";
		content += "<tr><td>예약번호</td><td>"+item.ri_num+"</td></tr>";
		content += "<tr><td>예약자ID</td><td>"+item.ri_userid+"</td></tr>";
		content += "<tr><td>목적지</td><td>"+item.i_num+"</td></tr>";
		content += "<tr><td>출항지</td><td>"+item.ri_startpoint+"</td></tr>";
		content += "<tr><td>출항시간</td><td>"+item.ri_starttime+"</td></tr>";
		content += "<tr><td>회항시간</td><td>"+item.ri_returntime+"</td></tr>";
		content += "<tr><td>소요시간</td><td>"+item.ri_duringtime+"</td></tr>";
		content += "<tr><td>인원수</td><td>"+item.ri_people+"</td></tr>";
		content += "<tr><td>결제금액</td><td>"+item.ri_pay+"</td></tr>";
		
		content +="</table>"
	});
	$("#reserDetail").empty();
	$("#reserDetail").append(content);
	
	
}
</script>
</html>