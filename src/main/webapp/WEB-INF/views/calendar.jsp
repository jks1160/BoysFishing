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
	width: 300px;
	font-weight: 600;
	text-align: center;
	background-color: activecaption;
	border: 1px solid black;
}
th{
	width:100px;
}
img{
	width : 100px;
}
</style>


</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="container mt-4">
		<div class="container justify-content-center">
			<p class="text-center" style="font-size: 20px;">이번주 날씨 예상</p>
			<table class="mt-4">
				<thead id="headlist">
			
				</thead>

				<tbody id="list">
					<tr>
						<th>현재날씨</th>
						<c:if test="${today.TW_SKY eq '맑음'}" ><td><img src="./resources/defaultimg/sun.jpg"></td></c:if>
						
						<td>2일자리</td>
						<td>맑은가</td>
						<td>확인을</td>
						<td>해보자</td>
						<td>확인을</td>
						<td>해보자</td>
					</tr>
					
						<tr>
						<th>현재온도</th>
						<td>${today.TW_TEMPER}</td>
						<td>좋은가2</td>
						<td>맑은가3</td>
						<td>확인을4</td>
						<td>해보자5</td>
						<td>확인을</td>
						<td>해보자</td>
					</tr>
						
				</tbody>
			</table>
		</div>

	</div>
	
</body>
<script>

	$.ajax({
		url: "calendar_call",
		type : "GET",
		data : {
			
		},
		dataType : "JSON",
		success : function(data){
			console.log(data.today);
			var contenthead="";
	contenthead +=	"<tr>";
	contenthead +=	"<th></th>";
	contenthead +=		"<td>"+data.today.TW_DATE+"</td>";
	contenthead +=		"<td>"+data.tomor.TW_DATE+"</td>";
	contenthead +=		"<td>"+data.third.W_DATE+"</td>";
	contenthead +=		"<td>"+data.fouth.W_DATE+"</td>";
	contenthead +=		"<td>"+data.fifth.W_DATE+"</td>";
	contenthead +=		"<td>"+data.sixth.W_DATE+"</td>";
	contenthead +=		"<td>"+data.seventh.W_DATE+"</td>";
	contenthead +=	"</tr>";
	$("#headlist").empty();
	$("#headlist").append(contenthead);
			},
		error : function(e) {
			console.log("오류 발생 ", e);
		}
	});	


</script>
</html>