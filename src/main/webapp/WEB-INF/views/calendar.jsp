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


	<div class="container mt-4">
		<div class="container justify-content-center">
			<h2 class='text-dark font-weight-bold ' style="margin-top: 25px; display:inline; ">날씨 정보 확인</h2><input type="button" class=" btn btn-primary"style="margin-left: 15px;"onclick="location.href='/fishing/weekendweather'" value="이번주 날씨 보러가기">
		<hr />
			<table class="mt-4 m-auto" id="tableone">
				<thead id="headlist">
			
				</thead>

				<tbody id="list" style="height: 20px;">
					
					

				</tbody>
					
			</table>
	
			<!-- 
			<table class="mt-4 m-auto" id="tableone">
				<thead>
					<tr>
						<th></th>
						<td>신청시간</td>
						<td>신청 날짜</td>
						<td>담당자</td>
						<td>신청 날짜</td>
						<td>신청 날짜</td>
					</tr>
				</thead>		
			
				<tbody>
					<tr>
						<td>첫날</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>
					
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>		
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>		
					<tr>
						<td>아이디</td>
						<td>신청시간</td>
						
						<td>신청 날짜</td>
						<td>담당자</td>
					</tr>	
						
				</tbody>		
			</table>
				 -->
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
	
	var content="";
		content +=	"<tr>";
		content +=	"<th>현재 날씨</th>";
		content +=		"<td>"+data.today.TW_SKY+"</td>";
		content +=		"<td>"+data.tomor.TW_SKY+"</td>";
		content +=		"<td>"+data.third.W_PMSKY+"</td>";
		content +=		"<td>"+data.fouth.W_PMSKY+"</td>";
		content +=		"<td>"+data.fifth.W_PMSKY+"</td>";
		content +=		"<td>"+data.sixth.W_PMSKY+"</td>";
		content +=		"<td>"+data.seventh.W_PMSKY+"</td>";
		content +=	"</tr>";	
	
		content +=	"<tr>";
		content +=	"<th>최고/최저 기온</th>";
		content +=		"<td>"+data.today.TW_TEMPERL+" / "+data.today.TW_TEMPERH+"</td>";
		content +=		"<td>"+data.tomor.TW_TEMPERL+" / "+data.today.TW_TEMPERH+"</td>";
		content +=		"<td>"+data.third.W_TEMPERL+" / "+data.third.W_TEMPERH+"</td>";
		content +=		"<td>"+data.fouth.W_TEMPERL+" / "+data.fouth.W_TEMPERH+"</td>";
		content +=		"<td>"+data.fifth.W_TEMPERL+" / "+data.fifth.W_TEMPERH+"</td>";
		content +=		"<td>"+data.sixth.W_TEMPERL+" / "+data.sixth.W_TEMPERH+"</td>";
		content +=		"<td>"+data.seventh.W_TEMPERL+" / "+data.seventh.W_TEMPERH+"</td>";		
		content +=	"</tr>";		
		
	
	$("#list").empty();
	$("#list").append(content);
	
			},
		error : function(e) {
			console.log("오류 발생 ", e);
		}
	});	


</script>
</html>