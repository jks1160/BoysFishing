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
<!-- 지도 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ad015af81e6fe8681aaca4a1fd22948"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ad015af81e6fe8681aaca4a1fd22948&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ad015af81e6fe8681aaca4a1fd22948&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7ad015af81e6fe8681aaca4a1fd22948&libraries=services,clusterer,drawing"></script>
<style>	

* {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
	<!-- 헤더 인클루드 -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class='container me-auto mt-3'>
		<h2 class='text-dark font-weight-bold'>섬 상세보기</h2>
		<hr />
		
		<div class="d-flex" style="border: 1px solid blue">
	<div class="container">
	<div style="border:1px solid black" class="container mt-4">
	<div id="map" style="width: 500px; height: 400px;" class='container'></div>
	</div>
	<hr/>
	
	<div class="container pd-2 mb-4">
	
		<div class ="row" >
		<div class = "col-2"  style="border: 1px solid black; background-color:cornflowerblue; color:white">도서이름</div>
		<div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_name }</div>
		<div class = "col-2" style="border: 1px solid black; background-color:cornflowerblue; color:white">관리번호</div>
		<div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_name }</div>
		</div>
		
		<div class ="row" >
		<div class = "col-2"  style="border: 1px solid black; background-color:cornflowerblue; color:white">지번</div>
		<div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_name }</div>
		<div class = "col-2" style="border: 1px solid black; background-color:cornflowerblue; color:white">토지면적</div>
		<div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_landarea }</div>
		</div>
		
		<div class ="row">
		<div class = "col-2"  style="border: 1px solid black; background-color:cornflowerblue; color:white">용도구분</div>
		<div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_islandmanage }</div>
		
		<div class = "col-2" style="border: 1px solid black; background-color:cornflowerblue; color:white">육지와의 거리(m2)</div>	
		<c:if test="${isd.i_distance  eq 'null' }"><div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">해당 정보가 없습니다.</div></c:if>
		<c:if test="${isd.i_distance  ne 'null' }"><div class = "col-4"  style="border: 1px solid black; color:cornflowerblue">${isd.i_distance }</div></c:if>	
		</div>
		
		<div class ="row">
		<div class = "col-2" style="border: 1px solid black; background-color:cornflowerblue; color:white">부가설명</div>
		<c:if test="${isd.i_distanceex eq 'null' }"> <div class = "col-10"  style="border: 1px solid black; color:cornflowerblue; color:cornflowerblue">해당 정보가 없습니다.</div></c:if>
		<c:if test="${isd.i_distanceex ne 'null' }"> <div class = "col-10"  style="border: 1px solid black; color:cornflowerblue; color:cornflowerblue">${isd.i_distanceex }</div></c:if>
		</div>
		<input value="${isd.i_latitude }" id="xlocation" type="hidden"/>
		<input value="${isd.i_longitude}" id="ylocation" type="hidden"/>
		<input value="${isd.i_num}" id="islandnum" type="hidden"/>
	<button onclick="findreser()" class="mt-3">예약편 찾기 </button>
	<button onclick="location.href='/fishing/islandsReservation'">리스트</button>
	</div>
	</div>
	</div>	
	<hr/>
	</div>
	
</body>
<script>
var xlo =$("#xlocation").val();
var ylo =$("#ylocation").val();
var num = $("#islandnum").val();

function findreser(){
	location.href="find_ship?choice="+num;
}
// 카카오 지도 API 
var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center : new kakao.maps.LatLng(ylo, xlo), //지도의 중심좌표.
	level : 7
//지도의 레벨(확대, 축소 정도)
};

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
//마커가 표시될 위치입니다 
var markerPosition = new kakao.maps.LatLng(ylo, xlo);

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
	position : markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

</script>
</html>
