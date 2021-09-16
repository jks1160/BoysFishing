<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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


	<jsp:include page="header.jsp"></jsp:include>
	
	<div class='container'>
		<h2 class='text-dark font-weight-bold'>섬 정보 / 예약하기</h2>
		<hr />
	</div>
	<div class='container'>
		<div id="map" style="width: 500px; height: 400px; float: left"  class='container'></div>
		<div class="select-zone row"
			style='background-color: rgb(126, 210, 248); width: 620px; float: left;'>
			<div class="col lg-5 text-center"style='display: inline; margin-left:20px'>
				<h2 class ='text-center'style='display: inline;'>섬 리스트</h2>
					<!-- 이곳에 섬 리스트 출력 -->
					<div class="list-group" style='overflow-y:scroll; max-height:350px ;' id='islands'>
  						<a class="list-group-item list-group-item-action">First item</a>
  						<a href="#" class="list-group-item list-group-item-action">Second item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						<a href="#" class="list-group-item list-group-item-action">Third item</a>
  						
					</div>
			</div>
			
			<div style='min-height: 400px; border-right: 2px solid gray; display:inline'></div>
			<div style='display: inline' class="col lg-6 text-center">
				<h2 class ='text-center' style='display: inline;'>섬 이름 검색하기</h2>
				<form action='reser/find_ship' method='GET' name='research_form'>
					<input type='text' class='form-control'  id='text-zone' placeholder='섬 이름 검색' name='searchData' />
					<button type='button' class='btn btn-dark' onclick= 'reser_research()'>검색</button>
				
				
				
				<div class='list-group'  style='overflow-y:scroll;' id='result' >
					<!-- 검색 결과 -->
					<a class="list-group-item list-group-item-action">First item</a>
					<a class="list-group-item list-group-item-action">First item</a>
				</div>
				
				<button type='button' class='btn btn-dark' onclick='search_ship()'>예약편 찾기</button>
				</form>
			</div>
			
		</div>
	</div>


</body>
<script>
    // 카카오 지도 API 
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(37.7111947, 126.3566827), //지도의 중심좌표.
		level : 3
	//지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	//마커가 표시될 위치입니다 
	var markerPosition = new kakao.maps.LatLng(37.7111947, 126.3566827);

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 리스트 클릭 시 이벤트 
	$(document).on("click",".list-group-item",function(){
		
		var researcher = $(this).html();
		console.log("선택한 섬 :", researcher);
		document.getElementById("text-zone").value = researcher;
	});
	
	// 검색
	function reser_research(){
		var r_rsc = document.getElementById("text-zone").value;
		
		$.ajax({
			url: "reser/reser_research",
			type : "GET",
			data : {
				'searchData' : r_rsc
			},
			dataType : "JSON",
			success : function(data){
				console.log("접속 성공", data);
				if(data.findData == null){
					$("#result").empty();
					$("#result").append("<h5 class='text-danger'>검색 결과가 존재하지 않습니다.</h5>");
				}
				
				
			},
			error : function(e) {
				console.log("오류 발생 ", e);
			}
			
		});
	}
	// 예약 배 선택
	function search_ship() {
		document.research_form.submit();
	}
	
</script>
</html>
