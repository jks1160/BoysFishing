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
<tbody class="hi">

</tbody>
</table>
<div class="bye">

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
<tbody>

</tbody>
</table>

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
<tbody>

</tbody>
</table>

</body>
<script>
listCall();
function listCall() {
	$.ajax({
		type : 'get',
		url : 'someList',
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			drawList(data);
			pageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function listCall() {
	$.ajax({
		type : 'get',
		url : 'someList',
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			drawList(data);
			pageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function listCall() {
	$.ajax({
		type : 'get',
		url : 'someList',
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			drawList(data);
			pageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}


function drawList(list) {
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
	$(".hi").empty();
	$(".hi").append(content);
}
function pageList(list){
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
		$(".bye").empty();
		$(".bye").append(content);
}
</script>
</html>