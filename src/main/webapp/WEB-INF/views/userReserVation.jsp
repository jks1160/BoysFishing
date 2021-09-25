<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
	
	<div class='container'>
		<h4 class='text-center'>배 편 예약하기</h4>
		<hr/>
		<div>
			<h6>날짜 : ${reser.op_date} </h6>
			<table>
				<tr>
					<td>목적지 : ${reser.i_name }
						<input type='text' hidden='hidden' value="${reser.i_name}" name='i_name'/>
						<input type='text' hidden='hidden' value="${reser.op_date}" name='op_date'/>
						<input type='text' hidden='hidden' value="${reser.s_num}" name='s_num'/>
						<input type='text' hidden='hidden' value="${reser.i_num}" name='i_num'/>
					</td>
				</tr>
				<tr>
					<td>출항지 : ${reser.op_startpoint }
						<input type='text' hidden='hidden' value="${reser.op_startpoint}" name='op_startpoint'/>
					</td>
				</tr>
				<tr>
					<td>출항 시간 : ${reser.op_starttime }
						<input type='text' hidden='hidden' value="${reser.op_starttime}" name='op_starttime'/>
					</td>
				</tr>
				<tr>
					<td>소요 시간 : ${reser.op_duringtime }
						<input type='text' hidden='hidden' value="${reser.op_duringtime}" name='op_duringtime'/>
					</td>
				</tr>
				<tr>
					<td>회항 시간 : ${reser.op_returntime }
						<input type='text' hidden='hidden' value="${reser.op_returntime}" name='op_returntime'/>
					</td>
				</tr>
				<tr>
					<td>결제 금액 : ${reser.op_price }
						<input type='text' hidden='hidden' value="${reser.op_price}" name='op_price'/>
					</td>
				</tr>
				<tr>
					<td>탑승 인원  : <input type='text' name='ri_people' id='people'/></td>
				</tr>
				<tr>
					<td>
						<input type='radio' name='ri_start' value='Y' id='sr' /> 출항
						<input type='radio' name='ri_start' value='N' id='sr' /> 입항
					</td>
				</tr>
			</table>
			<button class='btn btn-primary' onclick="RealReser()">예약하기</button>
			<input type='button' class = 'btn btn-primary' value='종료' onclick='window.close()'/>

		</div>
	</div>
	
</body>
<script>
function RealReser(){ //예약 신청하기 function
	var people = document.getElementById("people").value;
	var sr =document.getElementsByName('ri_start');
	var pick;
	sr.forEach(function(node){
		if(node.checked){
			pick = node.value;
		}
	});
	console.log(people);
	$.ajax({
		url: "RealReser",
		type : "POST",
		data : {
			"ri_userid" : "${id}",
			"i_num" : "${reser.i_num}",
			"s_num" : "${reser.s_num}",
			"ri_startpoint" : "${reser.op_startpoint}",
			"ri_starttime" : "${reser.op_starttime}",
			"ri_duringtime" : "${reser.op_starttime}",
			"ri_returntime" : "${reser.op_returntime}",
			"ri_people" : people,
			"ri_startreturnYN" : pick,
			"ri_date" : "${reser.op_date}",
			"op_price" : "${reser.op_price}"
		},
		dataType : "JSON",
		success : function(data){
			
			console.log("성공 ", data);
			alert("예약 되었습니다!");
			opener.document.location.reload();
			window.close();
		},
		error : function(e){
			console.log("에러입니다 :",e);
		}
	});
}



</script>
</html>