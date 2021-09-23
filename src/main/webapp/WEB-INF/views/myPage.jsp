<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String captainYN = (String)session.getAttribute("captainYN"); %>
<% System.out.println("캡틴옴?: "+captainYN); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

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
		text-align: center;
		margin-top: 5%;
		margin-right: 20%;
		margin-bottom: 5%;
		margin-left: 20%;
	}
	.user{
		display: inline-block;
		margin-right: 25px;
	}
	.captain{
		display: inline-block;
		margin-right: 25px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
<h1>마이페이지</h1>
<hr>
<div class="user">
	<div class="user">
		<a href="myUserInfo"><img src="resources/defaultimg/user.png" width="50px"/>
		 <br>마이페이지
		 </a>
	</div>
	<div class="user">
		<a href="pointPage"><img src="resources/defaultimg/point.png" width="50px"/>
		<br>포인트페이지
		</a>
	</div>
	<div class="user">
		<a href="myUserReserve"><img src="resources/defaultimg/calendar.png" width="50px"/>
		<br>예약확인
		</a>
	</div>
	<div class="user">
		<a href="captain_requestForm"><img src="resources/defaultimg/captain.png" width="50px"/>
		<br>선장신청
		</a>
	</div>
</div>
<hr>
<c:set var="captainYN" value = "<%=captainYN %>"/>
<c:if test="${captainYN eq 'Y'}">
<h1>선장페이지</h1>
<hr>
<div class="captain">
	<div class="captain">
		<a href="shipList"><img src="resources/defaultimg/ship.png" width="50px"/>
		 <br>배정보 관리
		 </a>
	</div>
	<div class="captain">
		<a href="captain_calendar"><img src="resources/defaultimg/clock.png" width="50px"/>
		<br>스케쥴
		</a>
	</div>
	<div class="captain">
		<a href="#"><img src="resources/defaultimg/calendar.png" width="50px"/>
		<br>운항예약확인
		</a>
	</div>
</div>
<hr>
</c:if>
<h4>자유게시판</h4>
<table class="table table-bordered">
<thead>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>날짜</th>
		<th>좋아요</th>
	</tr>
</thead>
<tbody class="my_free_cont">

</tbody>
</table>
<div class="my_free_page">

</div>

<h4>정보게시판</h4>
<table class="table table-bordered">
<thead>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>날짜</th>
		<th>좋아요</th>
	</tr>
</thead>
<tbody class="my_info_cont">

</tbody>
</table>
<div class="my_info_page">
</div>

<h4>후기게시판</h4>
<table class="table table-bordered">
<thead>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>날짜</th>
		<th>좋아요</th>
	</tr>
</thead>
<tbody class="my_rev_cont">

</tbody>
</table>
<div class="my_div_page">
</div>

</div>
</body>
<script>

//자유게시판 글 리스트 뿌리기
var sumPage = 1;
var infoPage = 1;
var revPage = 1;

sumListCall(sumPage);
function sumListCall(sumPage) {
	var param = {};
	param.page = sumPage;
	$.ajax({
		type : 'get',
		url : 'mp_sumsumlist',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			sumsumDrawList(data);
			sumsumPageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}
function sumsumDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		var date = new Date(item.b_regdate);
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() + "</td>";
		content += "<td>좋아요X</td>";
		content += "</tr>";
	});
	$(".my_free_cont").empty();
	$(".my_free_cont").append(content);
	console.log("자유게시판");
}

function sumsumPageList(list){
	var content = "";
	console.log("페이징처리 함수옴")
		for(i = 1; i<= list.totalPage; i++){
			content += "<span class='page'>";
			if(i != list.currPage){
				content += "<button onclick='sumListCall("+i+");'>"+i+"</button>";
			}else{
				content += "<b>"+i+"</b>";
			}
			content += "</span>";
		};
		$(".my_free_page").empty();
		$(".my_free_page").append(content);
}


//정보게시판 글 리스트 뿌리기
infoListCall(infoPage);
function infoListCall(infoPage) {
	var param = {};
	param.page = infoPage;
	$.ajax({
		type : 'get',
		url : 'mp_infoList',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			infoDrawList(data);
			infoPageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}
function infoDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		var date = new Date(item.b_regdate);
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() + "</td>";
		content += "<td>좋아요X</td>";
		content += "</tr>";
	});
	$(".my_info_cont").empty();
	$(".my_info_cont").append(content);
	console.log("정보게시판");
}

function infoPageList(list){
	var content = "";
	console.log("페이징처리 함수옴")
		for(i = 1; i<= list.totalPage; i++){
			content += "<span class='page'>";
			if(i != list.currPage){
				content += "<button onclick='infoListCall("+i+");'>"+i+"</button>";
			}else{
				content += "<b>"+i+"</b>";
			}
			content += "</span>";
		};
		$(".my_info_page").empty();
		$(".my_info_page").append(content);
}


//후기게시판 글 리스트 뿌리기
revListCall(revPage);
function revListCall(revPage) {
	var param = {};
	param.page = revPage;
	$.ajax({
		type : 'get',
		url : 'mp_revList',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			revDrawList(data);
			revPageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}


function revDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		var date = new Date(item.b_regdate);
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() + "</td>";
		content += "<td>좋아요X</td>";
		content += "</tr>";
	});
	$(".my_rev_cont").empty();
	$(".my_rev_cont").append(content);
	console.log("후기게시판");
}

function revPageList(list){
	var content = "";
	console.log("페이징처리 함수옴")
		for(i = 1; i<= list.totalPage; i++){
			content += "<span class='page'>";
			if(i != list.currPage){
				content += "<button onclick='revListCall("+i+");'>"+i+"</button>";
			}else{
				content += "<b>"+i+"</b>";
			}
			content += "</span>";
		};
		$(".my_div_page").empty();
		$(".my_div_page").append(content);
}
// 선장 페이지 메세지
var msg = "${msg}";
if(msg != ""){
	alert(msg);
	location.href="./myPage"
}
</script>
</html>