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
		<h4 class='text-dark font-weight-bold' style='display:inline'>&nbsp; ${islandName } 배편  &nbsp; <span style='font-size:small'><a class='' >섬 리스트로 돌아가기</a></span></h4>
		
		<div class = 'list-group result_list'>
			<!-- 배 편 리스트 -->
			<div class="list-group-item">
				<!-- 배 편이 없을 경우 -->
				<c:choose>
					<c:when test="${list eq null }">
						<h1>테스트</h1>
					</c:when>
					<c:when test="${list ne null }">
						<c:forEach items="${list }" var="item">
							
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
				<h5 >인당 배 값 : 12000</h5> -->
				
				<a class= 'btn btn-primary' style="float:right">예약하기</a>
			</div>
		</div>
	</div>
	<span id="remoCon">
		위로가기
	</span>
</body>
<script>
//리모컨
$(document).scroll(function(){

	var con = $("#remoCon");

	var position = $(window).scrollTop();

	

	if(position > 250){ con.fadeIn(500); }

	else if(position < 250){ con.fadeOut(500); }

 });

 $("#remoCon").click(function(){
	$("html, body").animate({scrollTop: 0}, 1000);
 });
var i = 10
 while(i>0){
	 i--;
	 console.log("${list[0].s_num}");
 }
 
</script>
</html>