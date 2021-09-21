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
var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

var titles = [
	<c:forEach items="${island_list}" var ="item">
	 "${item.i_name}",
   </c:forEach> 
];


var positions = [  // 마커의 위치
	
	<c:forEach items="${island_list}" var ="item">
		new kakao.maps.LatLng("${item.i_longitude}","${item.i_latitude}"),
	</c:forEach> 
],
selectedMarker = null; // 클릭한 마커를 담을 변수

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
mapOption = { 
    center: new kakao.maps.LatLng(37.711886226271055, 126.35332920975232), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//지도 위에 마커를 표시합니다
for (var i = 0, len = positions.length; i < len; i++) {
var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
    originY = (MARKER_HEIGHT + SPRITE_GAP) , // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
    overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP), // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
    normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
    clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
    overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
    
// 마커를 생성하고 지도위에 표시합니다
addMarker(positions[i], normalOrigin, overOrigin, clickOrigin,titles[i]);
}

//마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker(position, normalOrigin, overOrigin, clickOrigin,title) {

// 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
    overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
    clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);

// 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
var marker = new kakao.maps.Marker({
    map: map,
    position: position,
    image: normalImage,
    title : title
});

// 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
marker.normalImage = normalImage;

// 마커에 표시할 인포 윈도우 생성
<c:forEach items="${island_list}" var ="item">
	var infowindow = new kakao.maps.InfoWindow({
		content : "${item.i_name}", // 인포 윈도우에 표시할 내용
	});
</c:forEach> 


// 마커에 mouseover 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseover', function() {

    // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
    // 마커의 이미지를 오버 이미지로 변경합니다
    if (!selectedMarker || selectedMarker !== marker) {
        marker.setImage(overImage);
    }
});


// 마커에 mouseout 이벤트를 등록합니다
kakao.maps.event.addListener(marker, 'mouseout', function() {

    // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
    // 마커의 이미지를 기본 이미지로 변경합니다
    if (!selectedMarker || selectedMarker !== marker) {
        marker.setImage(normalImage);
    }
});



kakao.maps.event.addListener(marker, 'click', function() {

    // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
    // 마커의 이미지를 클릭 이미지로 변경합니다
    if (!selectedMarker || selectedMarker !== marker) {

        // 클릭된 마커 객체가 null이 아니면
        // 클릭된 마커의 이미지를 기본 이미지로 변경하고
        !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

        // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
        marker.setImage(clickImage);
    }

    // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
    selectedMarker = marker;
    console.log("섬 이름",$(this).attr("Fb"));
    var is_name = $(this).attr("Fb");
    var regex = /[\s\uFEFF\xA0]+$/gi;
    document.getElementById("text-zone").value = $(this).attr("Fb").replace(regex,"");
  
});

}

//MakrerImage 객체를 생성하여 반환하는 함수입니다
function createMarkerImage(markerSize, offset, spriteOrigin) {
var markerImage = new kakao.maps.MarkerImage(
    SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
    markerSize, // 마커의 크기
    {
        offset: offset, // 마커 이미지에서의 기준 좌표
        spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
        spriteSize: spriteImageSize // 스프라이트 이미지의 크기
    }
);

return markerImage;
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
