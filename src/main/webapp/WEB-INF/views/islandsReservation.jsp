<%@page import="org.apache.taglibs.standard.tei.ForEachTEI"%>
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
		<h2 class='text-dark font-weight-bold' style="margin-top: 25px;">섬
			정보 / 예약하기</h2>
		<hr />
	</div>
	<div class='container'>
		<div id="map" style="width: 500px; height: 400px; float: left"
			class='container'></div>
		<div class="select-zone row"
			style='background-color: rgb(126, 210, 248); width: 620px; float: left;'>
			<div class="col lg-5 text-center"
				style='display: inline; margin-left: 20px'>
				<h2 class='text-center' style='display: inline;'>섬 리스트</h2>
				<!-- 이곳에 섬 리스트 출력 -->
				<div class="list-group"
					style='overflow-y: scroll; max-height: 350px;' id='islands'>
					<!-- 섬 리스트 출력 부분 -->
					<c:if test="${island_list ne null }">
						<c:forEach items="${island_list }" var="item">
							<a class="list-group-item list-group-item-action island_data">${item.i_name}
							</a>
						</c:forEach>
					</c:if>


				</div>
			</div>

			<div
				style='min-height: 400px; border-right: 2px solid gray; display: inline'></div>
			<div style='display: inline' class="col lg-6 text-center">
				<h2 class='text-center' style='display: inline;'>섬 이름 검색하기</h2>
				<form action='reser/detail_island' method='GET' name='research_form'>
					<input type='text' class='form-control' id='text-zone'
						placeholder='섬 이름 검색' name='searchData' />
					<button type='button' class='btn btn-dark'
						onclick='reser_research()'>검색</button>



					<div class='list-group result_list'
						style='overflow-y: scroll; max-height: 248px;' id='result'>
						<!-- 검색 결과 -->
						<a class="list-group-item list-group-item-action pick_data">검색
							결과</a>
					</div>
					<button type='button' class='btn btn-dark'
						onclick='detail_island()'>섬 상세보기</button>
				</form>
			</div>

		</div>
	</div>


</body>
<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = { 
    center: new kakao.maps.LatLng(37.711886226271055, 126.35332920975232), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};
	
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		// c:forEach로 
		<c:forEach items="${island_list}" var ="item">
			{
				title : "${item.i_name}",
				latlng: new kakao.maps.LatLng("${item.i_longitude}","${item.i_latitude}")
			},
		</c:forEach>
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	// 지도 API END
	
	
	// 리스트 클릭 시 이벤트 
	$(document).on("click",".island_data",function(){
		
		var researcher = $(this).html();
		// 정규표현식으로 띄어쓰기 맨 끝만 제거
		var regex = /[\s\uFEFF\xA0]+$/gi;
		console.log("선택한 섬 :", researcher);
		document.getElementById("text-zone").value = researcher.replace(regex,"");
	});
	
	// 검색
	function reser_research(){
		var r_rsc = document.getElementById("text-zone").value;
		console.log(r_rsc);
		$.ajax({
			url: "reser/reser_research",
			type : "GET",
			data : {
				'searchData' : r_rsc
			},
			dataType : "JSON",
			success : function(data){
				var context ="";
				if(data.findData.length == 0){
					$("#result").empty();
					$("#result").append("<h6 class='text-danger'><a class='list-group-item list-group-item-action pick_data text-danger'>검색 결과가 존재하지 않습니다.</a></h6>");
				}else{
					data.findData.forEach(function(item){
						// 여러개가 나오기 때문에 += 으로 해야한다.
						context += "<a class='list-group-item list-group-item-action pick_data' id='"+item.i_num+"'>"+item.i_name+"</a>";

					})
					$(".result_list").empty();
					$(".result_list").append(context);
				}
			},
			error : function(e) {
				console.log("오류 발생 ", e);
			}
			
		});
	}
	// 검색 결과 확정
	$(document).on("click",".pick_data",function(){
		var me = $(this);
		$(".pick_data").css("background-color","white");
		$(this).css("background-color","#FFDEE9");
		var context = "<input type='text' class='form-control pick_island' value='"+this.id+"'  name='choice' readonly/>";
		$(".pick_island").remove();
		$("#result").append(context);
	});
	
	// 섬 상세보기
	function detail_island() {
		// 검색 결과를 선택하지 않으면...
		console.log("으아아 " ,$(".pick_island").val());
		//오류 대폭 수정
		if($(".pick_island").val() == null || $(".pick_island").val() == "" || $(".pick_data").val() ==null ){
			alert("섬을 선택하세요");
		}
		else{ //검색 결과를 선택하면 진행
			document.research_form.submit();
		}
	}
	
</script>
</html>
