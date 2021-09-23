<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		 rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
		 crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		  integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" 
		  crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<title>회원 예약 정보 조회</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<!-- 캘린더 -->
		<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
		<script src='resources/fullcalendar-5.9.0/calendar.js'></script>
		<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src='resources/js/bPopup.js'></script>
		
		<!-- 글꼴 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<style>
		* {
 	    font-family: 'Do Hyeon', sans-serif;
 	    }
 		 #calendar {
  		  max-width: 1100px;
  		  margin: 0 auto;
  		  margin-bottom: 50px;
 		 }
 		 .head{
 		 margin-top: 50px;
 		 margin-bottom:50px;
 		 text-align: center;
 		 }
 		 
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head"><h2>${sessionScope.loginId} 님의 예약정보</h2></div>
	<input type="text" hidden="hidden" id="date"/>
	<div id='calendar'></div>
	
	<div class='pop' hidden='hidden' style='width:100px; height:100px;'>
	
	</div>
	</body>
	<script>
	var checker = "${sessionScope.loginId}";
	console.log(checker);
	
	// 날짜 설정
	var today = new Date();
	var year = today.getFullYear();//년도
	var month = today.getMonth() + 1; // 월
	var date = today.getDate(); //날짜
	var last = new Date(year,month);
	last = new Date(last-1);
	var lastD = last.getDate(); //이번달 마지막 날짜
	console.log(lastD);
	if(month <10){
		month = "0"+month;
	}
	if(date <10){
		date = "0"+date;
	}


	console.log("year",year );
	console.log("months", month);
	console.log("date",date);
	//오늘 날짜
	var O_nuel = year+'-'+month+'-'+date;

	// fullCalendar 영역
	 document.addEventListener('DOMContentLoaded', function() {
	 var calendarEl = document.getElementById('calendar');
	 var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar: { //헤더
	        left: 'prev,next today',
	        center: 'title',
	        right: ''
	      },
	      initialDate: O_nuel, //오늘의 날짜
	      navLinks: false, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      locale: "ko", //한글 설정
	      editable: true, // 에디터 가능한지 
	      selectable: true, //선택 가능한지
	      dateClick: function(e){
	    	  
	    	  location.href="myReserveDetail";
	    	  
	      },
	       events: function(info, successCallback, failureCallback){
	    	   $.ajax({
					url:'./reser/user_reser',
					type: 'POST',
					dataType :"JSON",
					success : function(data) {
						// fullCalendar에 넣을 이벤트를 받아 줄 리스트
						var my_reser = [];
						//성공 했는지 확인
						console.log("성공 데이터 : " ,data);
						// 받은 데이터 중 my_list 부분을 가져온다.
						data.my_list.forEach(function(myReser){
							var get_year = new Date(myReser.ri_date).getFullYear();
							var get_month = new Date(myReser.ri_date).getMonth()+1;
							var get_day = new Date(myReser.ri_date).getDate();

							if(get_month <10){
								get_month = "0"+get_month;
							}
							if(get_day <10){
								get_day = "0"+get_day;
							}
							var reserDate = get_year+"-"+get_month+"-"+get_day;
							
							
							console.log("스타트데이 : " , reserDate);
							my_reser.push({
								start : reserDate,
								title : "예약"
							});
						}); // forEach end
						

						console.log(successCallback(my_reser));
					}, // ajax success end
					error : function(e){
					console.log("에러났습니다." ,e);
					} // ajax error end
	    	  });// ajax end  
	      }// events:function end */ 
	     
	       
	    });// full Calendar end 

	    calendar.render();
	  });
	</script>
</html>