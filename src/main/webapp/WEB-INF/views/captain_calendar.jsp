<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 풀 캘린더 -->
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
<script src='resources/fullcalendar-5.9.0/calendar.js'></script>
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />

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
<style>
* {
	font-family: 'Do Hyeon', sans-serif;
	font-size: '12px'
}
</style>
</head>
<body>
	<!-- 헤더  -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 선장 등록 요청 페이지 -->
	<div class='container'>
		<h2 class='text-dark font-weight-bold text-center'
			style="margin-top: 25px;">선장 스케줄</h2>
		<hr />
		<!-- 맵 부분 -->
		<div id='calendar'></div>
	</div>


</body>
<script>
	// 아이디 가져오기
	var checker = "${sessionScope.u_userid}";
	console.log("아이디 가져오기", checker);

	// 날짜 설정
	var today = new Date();
	console.log('투데이', today);
	var year = today.getFullYear();//년도
	var month = today.getMonth() + 1; // 월
	var date = today.getDate(); //날짜

	if (month < 10) {
		month = "0" + month;
	}
	if (date < 10) {
		date = "0" + date;
	}

	console.log("year", year);
	console.log("months", month);
	console.log("date", date);
	//오늘 날짜
	var O_nuel = year + '-' + month + '-' + date;

	// fullCalendar 영역
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : { //헤더
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
			initialDate : O_nuel, //오늘의 날짜
			navLinks : false, // can click day/week names to navigate views
			businessHours : true, // display business hours
			locale : "ko", //한글 설정
			editable : true, // 에디터 가능한지 
			selectable : true, //선택 가능한지
			dateClick : function(e) {
				//오늘 이후의 일정만 클릭 이벤트가 붙는다.
				if (Number(e.date) > Number(today)) {
					console.log(e);
					
					//풀 캘린더 소환
					calendar.render();
				}
			},
			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : './reser/captain_reser',
					type : 'POST',
					dataType : "JSON",
					success : function(data) {
						// fullCalendar에 넣을 이벤트를 받아 줄 리스트
						var my_reser = [];
						//성공 했는지 확인
						console.log("성공 데이터 : ", data);
						// 받은 데이터 중 my_list 부분을 가져온다.
						data.my_list.forEach(function(myReser) {
							var get_year = new Date(myReser.ri_date)
									.getFullYear();
							var get_month = new Date(myReser.ri_date)
									.getMonth() + 1;
							var get_day = new Date(myReser.ri_date).getDate();

							if (get_month < 10) {
								get_month = "0" + get_month;
							}
							if (get_day < 10) {
								get_day = "0" + get_day;
							}
							var reserDate = get_year + "-" + get_month + "-"
									+ get_day;

							console.log("스타트데이 : ", reserDate);
							my_reser.push({
								start : reserDate,
								title : "예약"
							});
						}); // forEach end

						console.log(successCallback(my_reser));
					}, // ajax success end
					error : function(e) {
						console.log("에러났습니다.", e);
					} // ajax error end
				});// ajax end  
			}// events:function end */ 

		});// full Calendar end 

		calendar.render();
	});
</script>
</html>