<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div>
			<h6>${reser.op_date} 스케줄</h6>
			<form action='/fishing/captainUpdateForm' method='GET'>
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
			</table>
			<button class='btn btn-primary'>수정하기</button>
			</form>
			<input type='button' class = 'btn btn-primary' value='종료' onclick='window.close()'/>
		</div>
	</div>
	
</body>
</html>