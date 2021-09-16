<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<table>
<thead>
	<tr>
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>조회수</th>
		<th>좋아요</th>
		<th>날짜</th>
	</tr>
</thead>
</table>
</body>
<script>
function listCall(page) {
	$.ajax({
		type : 'get',
		url : 'someList',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			drawList(data.list);
			pageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}


function drawList(list) {
	//console.log(list);
	var content = "";
	list.forEach(function(item, idx) {
		console.log(item, idx);
		content += "<tr>";
		content += "</tr>";
	});
	$("tbody").empty();
	$("tbody").append(content);
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
		$("div").empty();
		$("div").append(content);
}
</script>
</html>