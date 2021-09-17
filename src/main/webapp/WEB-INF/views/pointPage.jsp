<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<h1>님의 포인트 정보</h1>
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
				<button onclick='return withdraw(this.form)'>출금하기하기</button>
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
		content += "<tr>";
		content += "<td>" + item.p_content  + "</td>";
		content += "<td>" + item.p_cost  + "</td>";
		content += "<td>" + item.p_balance  + "</td>";
		content += "<td>" + item.p_regdate  + "</td>";
		content += "</tr>";
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