<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String userid = (String)session.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	.entire{
		display : inline-block;
		text-align: center;
	}
	.user{
		display: inline;
	}
</style>
</head>
<body>
<div class="entire">
<h1>마이페이지</h1>
<hr>
<div class="user">
	<div class="user">
		<a href="myUserInfo"><img src="resources/user.png" width="50px"/><br>회원정보</a>
	</div>
	<div class="user">
		<a href="pointPage"><img src="resources/point.png" width="50px"/><br>포인트</a>
	</div>
	<div class="user">
		<a href="#"><img src="resources/calendar.png" width="50px"/><br>예약확인</a>
	</div>
	<div class="user">
		<a href="#"><img src="resources/ship.png" width="50px"/><br>선장등록</a>
	</div>
</div>

<h1>선장페이지</h1>
<hr>
<c:if >
<div class="captain">
<a href="#">배 정보 관리</a>
<a href="#">스케쥴</a>
<a href="#">운행 예약확인</a>
</div>
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
var user = 'somefishing';

sumListCall(sumPage);
function sumListCall(sumPage) {
	var param = {};
	param.page = sumPage;
	param.user = user;
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
	param.user = user;
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
	param.user = user;
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
</script>
</html>