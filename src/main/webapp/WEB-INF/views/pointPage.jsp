<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String id = (String)session.getAttribute("loginid"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>${loginId}님의 포인트 정보</h1>
<div>
	<form action="pointCharge" method="GET">
	<table>
		<tr>
			<td>보유 포인트</td>
			<td>${point}</td>
		</tr>
		<tr>
			<td>포인트 충전하기</td>
			<td>
				<input type="text" name="p_charge">
				<button>충전하기</button>
			</td>
		</tr>
		<tr>
			<td>포인트 출금하기</td>
			<td>
				<input type="text" name="p_withdraw">
				<button onclick='return withdraw(this.form)'>출금하기</button>
			</td>		
		</tr>
	</table>
</form>
</div>

<div class="p_history">
<h3>포인트 히스토리</h3>
<table>
	<thead>
		<tr>
			<th>항목</th>
			<th>금액</th>
			<th>잔액</th>
			<th>날짜</th>
		</tr>
	</thead>
	<tbody class="p_history_cont">
	
	</tbody>
</table>
<div class="p_point_page">
</div>
</div>

</body>
<script>
function withdraw(form) { 
    form.action='pointWithdraw'; 
    form.submit(); 
    return true; 
  } 
var code;
var p_page = 1;
pointListCall(p_page);
function pointListCall(p_page) {
	var param = {};
	param.page = p_page;
	$.ajax({
		type : 'get',
		url : 'pointHistoryPage',
		data : param,
		dataType : 'JSON',
		success : function(data) {
			console.log(data);
			pointDrawList(data);
			pointPageList(data);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function pointDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item, idx);
		var date = new Date(item.p_regdate);
		switch(item.p_content){
		case "PNT_001":
			code = "충전";
			break;
		case "PNT_002":
			code = "출금";
			break;
		case "PNT_003":
			code = "예약";
			break;
		case "PNT_004":
			code = "환불";
			break;
		case "PNT_005":
			code = "운행";
			break;
		case "PNT_006":
			code = "운행취소";
			break;
		}
		content += "<tr>";
		content += "<td>" + code + "</td>";
		content += "<td>" + item.p_cost  + "</td>";
		content += "<td>" + item.p_balance  + "</td>";
		content += "<td>" + date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() + "</td>";
		content += "</tr>";
	console.log(typeof date.getMonth());
	});
	$(".p_history_cont").empty();
	$(".p_history_cont").append(content);
	console.log("자유게시판");
}

function pointPageList(list){
	var content = "";
	console.log("페이징처리 함수옴")
		for(i = 1; i<= list.totalPage; i++){
			content += "<span class='page'>";
			if(i != list.currPage){
				content += "<button onclick='pointListCall("+i+");'>"+i+"</button>";
			}else{
				content += "<b>"+i+"</b>";
			}
			content += "</span>";
		};
		$(".p_point_page").empty();
		$(".p_point_page").append(content);
}
</script>
</html>