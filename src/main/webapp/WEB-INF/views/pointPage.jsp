<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String id = (String)session.getAttribute("userId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
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
	.p_history{
		text-align: center;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="entire">
	<img src="resources/user.png"  width="50px"/> <div class="user">${loginId}님의 포인트 정보</div>
	<br><br>
	<div>
		<form action="pointCharge" method="GET">
		<table class="table table-bordered">
			<tr>
				<td>보유 포인트</td>
				<td>${point}</td>
			</tr>
			<tr>
				<td>포인트 충전하기</td>
				<td>
					<input id = "chargeNumber" type="text" name="p_charge" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
					<button>충전하기</button>
				</td>
			</tr>
			<tr>
				<td>포인트 출금하기</td>
				<td>
					<input id = "withdrawNumber" type="text" name="p_withdraw" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="8">
					<button onclick='return withdraw(this.form)'>출금하기</button>
				</td>		
			</tr>
		</table>
	</form>
	</div>
	
	<div class="p_history">
		<h3>포인트 히스토리</h3>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>항목</th>
					<th>대상자 아이디</th>
					<th>금액</th>
					<th>잔액</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody class="p_history_cont">
			
			</tbody>
		</table>
			<div class="container row" >
				<nav class="container col-auto mt-3" aria-lable="Page navigation"  style="text-align: center;">
					<ul class="pagination" id="pagination"></ul>
				</nav>
			</div>
			
	</div>
<button onclick="location.href='myPage'">뒤로가기</button>
</div>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
//0원 입력 금지!
$(document).ready(function(){
	$('#chargeNumber').focusout(function(){
		var a = document.getElementById("chargeNumber").value;
		console.log(a);
		if(a <= 0 ){
			if(!a){
				return false;
			}
			alert("0보다 큰 수를 입력해주세요");
			document.getElementById("chargeNumber").value = "";
		}
	});
})

$(document).ready(function(){
	$('#withdrawNumber').focusout(function(){
		var a = document.getElementById("withdrawNumber").value;
		console.log(a);
		if(a <= 0 ){
			if(!a){
				return false;
			}
			alert("0보다 큰 수를 입력해주세요");
			document.getElementById("withdrawNumber").value = "";
		}
	});
})

//
function withdraw(form) {
	var withdraw = document.getElementById('withdrawNumber').value;
	var balance = ${point};
	withdraw = Number(withdraw);
	if(withdraw > balance){
		alert("출금액을 다시 확인하세요.");
		document.getElementById("withdrawNumber").value = "";
		//window.location.reload();
		return false;
	}
    form.action='pointWithdraw'; 
    form.submit(); 
  } 
var code;
var p_page = 1;
pointListCall(p_page);

$("#pagePerNum").change(function(){
	//페이징 초기화
	console.log("뿌찍");
	$("#pagination").twbsPagination('destroy');
	pointlistCall(p_page);
});

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
			p_page = data.currPage;
			$("#pagination").twbsPagination({
				startPage: data.currPage,//시작페이지
				totalPages: data.totalPage,  //총 페이지 갯수
				visiblePages:5, //보여줄 페이지 갯수
				onPageClick: function(e,page){
					//console.log(e,page);
					pointListCall(page);
				}
			});	
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
		content += "<td>" + item.p_otherid  + "</td>";
		content += "<td>" + item.p_cost  + "</td>";
		content += "<td>" + item.p_balance  + "</td>";
		content += "<td>" + date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() + "</td>";
		content += "</tr>";
	});
	$(".p_history_cont").empty();
	$(".p_history_cont").append(content);
}
</script>
</html>