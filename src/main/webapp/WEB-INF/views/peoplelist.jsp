<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>


		<meta charset="UTF-8">
		<title>SOMEFISH</title>
		
		
		<!-- 글꼴 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<style>
		* {
 	    font-family: 'Do Hyeon', sans-serif;
	}
		table, td ,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	    thead td{
	    width:300px;
		font-weight:600;
		text-align: center;
		background-color: activecaption;
		border: 1px solid black;
	}
		
		</style>


	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>

<div class="container mt-4">
	<div class="">
	<p class="text-center" style="font-size:40px;">회원정보</p>
					<form action="peoplesearch" class="d-flex m-auto position-absolute top-20 start-50 translate-middle" method="get">
					<input type="text" placeholder="ID 검색" aria-label="Search" name="searchid">
					<button class="btn btn-outline-primary btn-sm ms-2 text-cornflowerblue" type="submit">검색</button>
					</form>
	<input type="hidden" value="칸띄우기">				
<br/>
<br/>
	<hr/>
	<table class="container justify-content-center">
		<tr>
			<th>ID</th>
			<th>NICKNAME</th>
			<th>매니저 여부</th>
			<th>카카오 여부</th>
			<th>선장 여부</th>
			<th>계정 삭제 여부</th>
			<th>등록 날짜 여부</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.u_userid}</td>
				<td>${dto.u_usernickname}</td>				
				<td>${dto.u_manageryn}</td>
				<td>${dto.u_kakaoyn}</td>
				<td>${dto.cap_idYSN}</td>				
				<td>${dto.u_userdelyn}</td>
				<td>${dto.u_joindate}</td>
			</tr>
		</c:forEach>
		
		<c:forEach items="${peoplesearch}" var="search">
			<tr>
				<td>${search.u_userid}</td>
				<td>${search.u_usernickname}</td>				
				<td>${search.u_manageryn}</td>
				<td>${search.u_kakaoyn}</td>
				<td>${search.cap_idYSN}</td>				
				<td>${search.u_userdelyn}</td>
				<td>${search.u_joindate}</td>
			</tr>
		</c:forEach>
		
		<tbody id="list">
		</tbody>
	</table>	
			

		<div  class="position-relative">
		<input type="button" class="mt-4 position-absolute top-20 start-50 translate-middle" value="더보기" onclick="listCall()">
		</div>
	<div class="container mt-4 " style="overflow:auto;"></div>
		</div>
	<div class="container mt-4 " style="overflow:auto;"></div>
		<hr/>

</div>
	</body>
	<script>
		var startlist = 1;
		var endlist = 5;
	function listCall(){
		var reqUrl = '/fishing/manage/peoplelistcall/'+startlist+'/'+endlist;
		var content = "";
		$.ajax({
			url:reqUrl,
			type:'get',
			dataType:'JSON',
			success:function(data){
				console.log(data.list);
				startlist=data.start;
				endlist=data.end;	
				for(var i=0; i<data.list.length; i++){				
				content += "<tr>";
				content +=	"<td>"+data.list[i].u_userid+"</td>";
				content +=	"<td>"+data.list[i].u_usernickname+"</td>";				
				content +=	"<td>"+data.list[i].u_manageryn+"</td>";
				content +=	"<td>"+data.list[i].u_kakaoyn+"</td>";
				content +=	"<td>"+data.list[i].cap_idYSN+"</td>";		
				content +=	"<td>"+data.list[i].u_userdelyn+"</td>";
				content +=	"<td>"+data.list[i].u_joindate+"</td>";
				content += "</tr>";
				}
				$("#list").append(content);
				
			},
			error:function(error){
				console.log(error);
			}			
		});		
	}
	</script>
</html>


































