<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
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
.entire{
		margin:auto;
		text-align : center;
}
.entire1{
		margin:auto;
		text-align : center;
}
table{
		width:50px;
		height:400px;
		text-align: center;
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container entire mt-3">
	<h3>스케쥴 상세보기</h3>
	<button onclick="waiting()">대기중</button>
	<button onclick="decide()">확정예약</button>
	<button onclick="location.href='captainSchedule'" >뒤로가기</button>
		<div id="reserDetail" class="container justify-content-center">
	
		</div>
	</div>
</body>
<script>
//예약 확정하기
function decideButton(number){
	console.log("예약확정간다?");
	var param = {};
	param.num = number;
	$.ajax({
		type : 'get',
		url : 'reserDecide',
		data : param,
		success : function(data){
			console.log("데이터 :", data);
			if(data>1){
				alert("확정 완료");
				waiting(); // 다시 그려주기 위함.				
			}else{
				alert("다시 시도해 주세요!");
				waiting(); // 다시 그려주기 위함.
			}
			
		},
		error : function(e){
			console.log(e);
		}
	});
}

//예약 대기중인거 취소하기
function cancelButton(number){
	console.log("예약취소간다?");
	var cancelReason = prompt("예약 취소 사유가 무엇인가요?");
	console.log("사유: ",cancelReason);
	if(!cancelReason){
		return false;
	}
	var param = {};
	param.num = number;
	param.cancelReason = cancelReason;
	$.ajax({
		type : 'get',
		url : 'reserCancel',
		data : param,
		success : function(data){
			console.log("데이터 :",data);
			waiting();
		},
		error : function(e){
			console.log(e);
		}
	});
}

//예약 확정인거 취소하기
function decideCancelButton(number){
	console.log("예약취소간다?");
	var cancelReason = prompt("예약 취소 사유가 무엇인가요?");
	console.log("사유: ",cancelReason);
	if(!cancelReason){
		return false;
	}
	var param = {};
	param.num = number;
	param.cancelReason = cancelReason;
	$.ajax({
		type : 'get',
		url : 'decideCancel',
		data : param,
		success : function(data){
			console.log(data);
			decide();
		},
		error : function(e){
			console.log(e);
		}
	});
}
//대기중
function waiting(){
	console.log("여기옴?");
	var param = {};
	var wait = 'RI001';
	var date = "${date}";
	param.date = date;
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
	var date = "${date}";
	param.date = date;
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
		content += "<br/>";
		content += "<div class='entire'>";
		content += "<table class='table-bordered container justify-content-center'>";
		content += "<tr style='background-color:lightgrey'><td>배이름</td><td>"+item.S_NAME+"</td></tr>";
		content += "<tr><td>예약번호</td><td>"+item.RI_NUM+"</td></tr>";
		content += "<tr><td>예약자ID</td><td>"+item.RI_USERID+"</td></tr>";
		content += "<tr><td>목적지</td><td>"+item.I_NAME+"</td></tr>";
		content += "<tr><td>출항지</td><td>"+item.RI_STARTPOINT+"</td></tr>";
		content += "<tr><td>출항시간</td><td>"+item.RI_STARTTIME+"</td></tr>";
		content += "<tr><td>회항시간</td><td>"+item.RI_RETURNTIME+"</td></tr>";
		content += "<tr><td>소요시간</td><td>"+item.RI_DURINGTIME+"</td></tr>";
		content += "<tr><td>인원수</td><td>"+item.RI_PEOPLE+"</td></tr>";
		content += "<tr><td>결제금액</td><td>"+item.RI_PAY+"</td></tr>";
		content += "<tr><td><button onclick='decideButton("+item.RI_NUM+")'>확정하기</button></td>";
		content += "<td><button onclick='cancelButton("+item.RI_NUM+")'>취소하기</button></td></tr>";
		content += "</table>";
		content += "</div>";
		content += "<br/>";
	});
	$("#reserDetail").empty();
	$("#reserDetail").append(content);
}

function decideDetailDrawList(list) {
	console.log(list);
	var content = "";
	list.list.forEach(function(item, idx) {
		console.log(item.i_name);
		console.log(item, idx);
		content += "<hr>";
		content += "<br/>";
		content += "<div class='entire1'>";
		content += "<table class='table-bordered container justify-content-center'>";
		content += "<tr style='background-color:lightgrey'><td>배이름</td><td>"+item.S_NAME+"</td></tr>";
		content += "<tr><td>예약번호</td><td>"+item.RI_NUM+"</td></tr>";
		content += "<tr><td>예약자ID</td><td>"+item.RI_USERID+"</td></tr>";
		content += "<tr><td>목적지</td><td>"+item.I_NAME+"</td></tr>";
		content += "<tr><td>출항지</td><td>"+item.RI_STARTPOINT+"</td></tr>";
		content += "<tr><td>출항시간</td><td>"+item.RI_STARTTIME+"</td></tr>";
		content += "<tr><td>회항시간</td><td>"+item.RI_RETURNTIME+"</td></tr>";
		content += "<tr><td>소요시간</td><td>"+item.RI_DURINGTIME+"</td></tr>";
		content += "<tr><td>인원수</td><td>"+item.RI_PEOPLE+"</td></tr>";
		content += "<tr><td>결제금액</td><td>"+item.RI_PAY+"</td></tr>";
		content += "<tr><td colspan='2'><button onclick='decideCancelButton("+item.RI_NUM+")'>확정취소하기</button></td></tr>";
		content +="</table>";
		content += "</div>";
		content += "<br/>";
	});
	$("#reserDetail").empty();
	$("#reserDetail").append(content);
	
	
}
</script>
</html>