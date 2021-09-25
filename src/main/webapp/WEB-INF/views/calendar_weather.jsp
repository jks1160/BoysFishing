<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}

thead td {

	font-weight: 600;
	text-align: center;
	background-color: activecaption;
	border: 1px solid black;
}

#tableone th{
	width:200px;
	font-size:15px;
}
#tableone thead td{
	width:500px;

}

#tabletwo th{
	width:170px;
	font-size:10px;
}

img{
	width : 100px;
}

</style>


</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-2">
		<div class="container justify-content-center">
			<div class='container'>
		<h2 class='text-dark font-weight-bold' style="margin-top: 25px;">이번주의 날씨</h2>
		<hr />
	</div>
			<table class="m-auto" id="tableone">
				<thead id="headlist">
					<tr>
						<th></th>
						<td>${today.TW_DATE}</td>
						<td>${tomor.TW_DATE}</td>
					</tr>
				</thead>

				<tbody id="list" style="height: 20px;">
					<tr>
						<td>첫날</td>
						<td>신청시간</td>						
						<td>신청 날짜</td>
					</tr>
					
					<tr>
						<td>두번째</td>
						<td>신청시간</td>						
						<td>신청 날짜</td>
					</tr>
					

				</tbody>
					
			</table>
	
			<hr/>
			<table class="m-auto mt-4" id="tableone">
				<thead>
					<tr>
						<th></th>
						<td>${today.TW_DATE}</td>
						<td>${tomor.TW_DATE}</td>
					</tr>
				</thead>		
			
				<tbody>
					<tr>
						<td>첫날</td>
						<td>신청시간</td>						
						<td>신청 날짜</td>
					</tr>
					
					<tr>
						<td>두번째</td>
						<td>신청시간</td>						
						<td>신청 날짜</td>
					</tr>
				</tbody>
			</table>
			
		</div>
			

	</div>
	
</body>
<script>

</script>
</html>