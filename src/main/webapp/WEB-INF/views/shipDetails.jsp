<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
#remoCon {
	position: fixed;
	width: 60px;
	height: 20px;
	right: 20px;
	bottom: 20px;
	display: none;
 } 
</style>
</head>
<body>
	<!-- 헤더 부분 -->
	<jsp:include page="header.jsp"></jsp:include>
	<div class='container'>
		<h2 class='text-dark font-weight-bold'> 예약편 찾기</h2>
		<hr />
	</div>
	<div class='container'>
		<h4 class='text-dark font-weight-bold' style='display:inline'>&nbsp; ${islandName } 배편  &nbsp; <span style='font-size:small'><a href='/fishing/islandsReservation' >섬 리스트로 돌아가기</a></span></h4>
		
		<div class = 'list-group result_list'>
			<!-- 배 편 리스트 -->
				<!-- 배 편이 없을 경우 -->
				<c:choose>
					<c:when test="${fn:length(list) eq 0 }">
						<h1 class='text-danger' >해당 섬에 관한 배 편이 존재하지 않습니다!</h1>
						<a class='btn btn-default col align-self-center' style='border: 1px solid gray;' href="/fishing/islandsReservation">되돌아가기</a>
					</c:when>
					<c:when test="${list ne null }">
						<!-- 배편이 존재할 경우 -->
						<c:forEach items="${list }" var="item">
							<div class="list-group-item">
							<c:choose>
							<c:when test="${item.si_name  ne null}"><img src="/photo/${item.si_name }" style="width: 350px; height: 250px; float:left;" / ></c:when> 
							<c:otherwise><img src="../resources/defaultimg/default.png" style="width: 350px; height: 250px; float:left;" / ></c:otherwise>
							</c:choose>
							<div style="float:left; width : 15px; height:200px; background-color:white" ></div>
							<p class='text-dark font-weight-bold'>배 이름 : ${item.s_name }</p>
							<p style="margin:0px">최대 탑승 인원 : ${item.s_maxpassenger }</p>
							<p style="margin:0px">최소 탑승 인원 : ${item.s_minpassenger }</p>
							<p style="margin:0px">정박 위치 : ${item.s_address }</p>
							<p style="margin:0px">보유 장비 : ${item.s_equipment }</p>
							<p style="margin:0px">편의 시설 : ${item.s_convenient } </p>
							<h5 >인당 배 값 : ${item.op_price }</h5>
							<form action="userReservation">
								<input type='text' value='${item.i_num }' name='i_num' hidden='hidden'/>
								<input type='text' value='${item.s_num }' name='s_num' hidden='hidden'/>
							<button class= 'btn btn-primary' style="float:right">예약하기</button>
							</form>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
				
				<!-- <img src="../resources/defaultimg/bell.jpg" class="rounded float-start" style="width: 200px; height: 200px; float:left;"/>
				<div style="float:left; width : 15px; height:200px; background-color:white" ></div>
				<p class='text-dark font-weight-bold'>배 이름</p>
				<p style="margin:0px">최대 탑승 인원 : 10명</p>
				<p style="margin:0px">정박 위치 : 집</p>
				<p style="margin:0px">보유 장비 : 레이더</p>
				<p style="margin:0px">편의 시설 : 화장실 </p>
				<h5 >인당 배 값 : 12000</h5> 
				
				<a class= 'btn btn-primary' style="float:right">예약하기</a> -->
			
		</div>
	</div>

</body>
<script>

</script>
</html>