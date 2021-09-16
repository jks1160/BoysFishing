<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
<h1>마이페이지</h1>
<div class="user">
<a href="#">회원정보</a>
<a href="#">포인트</a>
<a href="#">예약확인</a>
<a href="#">선장등록 요청</a>
</div>
<div class="captain">
<a href="#">배 정보 관리</a>
<a href="#">스케쥴</a>
<a href="#">운행 예약확인</a>
</div>

<h4>자유게시판</h4>
<table>
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
<table>
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
<table>
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
		url : 'sumsumlist',
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
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + item.b_regdate  + "</td>";
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
infoListCall();
function infoListCall() {
	$.ajax({
		type : 'get',
		url : 'infoList',
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
	list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + item.b_regdate  + "</td>";
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
				content += "<button onclick='listCall("+i+");'>"+i+"</button>";
			}else{
				content += "<b>"+i+"</b>";
			}
			content += "</span>";
		};
		$(".my_info_page").empty();
		$(".my_info_page").append(content);
}


//후기게시판 글 리스트 뿌리기
revListCall();
function revListCall() {
	$.ajax({
		type : 'get',
		url : 'revList',
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
	list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<tr>";
		content += "<td>" + item.b_num  + "</td>";
		content += "<td>" + item.b_userid  + "</td>";
		content += "<td>" + item.b_subject  + "</td>";
		content += "<td>" + item.b_regdate  + "</td>";
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
				content += "<button onclick='listCall("+i+");'>"+i+"</button>";
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