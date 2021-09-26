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
		<h4 class='text-center'>${id }의 스케줄</h4>
		<hr/>
		<div class='table-responsive'>
			<h6 class='text-center info'>${reser.op_date} 스케줄</h6>
			<form action='/fishing/captainUpdateForm' method='GET' id='frm'>
			<table class='table table-hover text-center''>
			<tbody class='table-bordered'>
				<tr>
					<th>목적지
						<input type='text' hidden='hidden' value="${reser.i_name}" name='i_name'/>
						<input type='text' hidden='hidden' value="${reser.op_date}" name='op_date'/>
						<input type='text' hidden='hidden' value="${reser.s_num}" name='s_num'/>
						<input type='text' hidden='hidden' value="${reser.i_num}" name='i_num'/>
					</th>
					<td>
						${reser.i_name }
					</td>
				</tr>
				<tr>
					<th>출항지 
						<input type='text' hidden='hidden' value="${reser.op_startpoint}" name='op_startpoint'/>
					</th>
					<td>
						${reser.op_startpoint }
					</td>
				</tr>
				<tr>
					<th>출항 시간 
						<input type='text' hidden='hidden' value="${reser.op_starttime}" name='op_starttime'/>
					</th>
					<td>
						${reser.op_starttime }
					</td>
				</tr>
				<tr>
					<th>소요 시간 
						<input type='text' hidden='hidden' value="${reser.op_duringtime}" name='op_duringtime'/>
					</th>
					<td>
						${reser.op_duringtime }
					</td>
				</tr>
				<tr>
					<th>회항 시간
						<input type='text' hidden='hidden' value="${reser.op_returntime}" name='op_returntime'/>
					</th>
					<td>
						${reser.op_returntime }
					</td>
				</tr>
				<tr>
					<th>결제 금액
						<input type='text' hidden='hidden' value="${reser.op_price}" name='op_price'/>
					</th>
					<td>
						${reser.op_price }
					</td>
				</tr>
				</tbody>
			</table>
			<div  style='text-align:center'>
				<button class='btn btn-outline-primary text-center'>수정하기</button>
				<input type='button' class='btn btn-outline-primary'  value='스케줄 제거' onclick='delSchedule()'/>
				<input type='button' class = 'btn btn-outline-primary' value='종료' onclick='window.close()'/>
				</div>
			</form>
			
		</div>
	</div>
</body>
<script>
function delSchedule(){ //스케줄 삭제 메소드
	$.ajax({
		url:'delSchedule',
		data: $("#frm").serialize(),
		dataType : "JSON",
		type: "POST",
		success : function(data){
			console.log("삭제 성공 :", data);
		},
		error: function(e) {
			console.log("에러 발생 ",e);
		}
	});
}

</script>

</html>