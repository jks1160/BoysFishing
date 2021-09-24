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
<button onclick="waiting()">대기중</button>
<button onclick="decide()">확정예약</button>

<div id="reserDetail">

</div>

</body>
<script>
//대기중
function waiting(){
	console.log("여기옴?");
	var param = {};
	var wait = 'RI001';
	param.wait = wait; 
	$.ajax({
		type : 'get',
		url : 'reserWait',
		data : param,
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			waitDetailDrawList(data);
		},
		error : function(e){
			console.log(e);
		}
	});
}

//예약확정
function decide(){
	console.log("여기옴?");
	var param = {};
	var wait = 'RI002';
	param.wait = wait; 
	$.ajax({
		type : 'get',
		url : 'reserWait',
		data : param,
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			decideDetailDrawList(data);
		},
		error : function(e){
			console.log(e);
		}
	});
	
}


function waitDetailDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<hr>";
		content += "<table class='table-bordered'>";
		content += "<tr><td>배이름</td><td>"+item.s_name+"</td></tr>";
		content += "<tr><td>예약번호</td><td>"+item.ri_num+"</td></tr>";
		content += "<tr><td>예약자ID</td><td>"+item.ri_userid+"</td></tr>";
		content += "<tr><td>목적지</td><td>"+item.i_name+"</td></tr>";
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

function decideDetailDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<hr>";
		content += "<table class='table-bordered'>";
		content += "<tr><td>배이름</td><td>"+item.s_name+"</td></tr>";
		content += "<tr><td>예약번호</td><td>"+item.ri_num+"</td></tr>";
		content += "<tr><td>예약자ID</td><td>"+item.ri_userid+"</td></tr>";
		content += "<tr><td>목적지</td><td>"+item.i_name+"</td></tr>";
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