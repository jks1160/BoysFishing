<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='resources/fullcalendar-5.9.0/lib/main.js'></script>
<script src='resources/fullcalendar-5.9.0/calendar.js'></script>
<link href='resources/fullcalendar-5.9.0/lib/main.css' rel='stylesheet' />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='resources/js/bPopup.js'></script>
<script>

// 아이디 가져오기
var checker = "${sessionScope.loginId}";
console.log(checker);

// 날짜 설정
var today = new Date();
var year = today.getFullYear();//년도
var month = today.getMonth() + 1; // 월
var date = today.getDate(); //날짜

if(month <10){
	month = "0"+month;
}
if(date <10){
	date = "0"+date;
}


console.log("year",year );
console.log("months", month);
console.log("date",date);
var O_nuel = year+'-'+month+'-'+date;
console.log(today);
console.log(O_nuel);
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
    	  if(Number(e.date) > Number(today)){
    		alert("브라보");  
    	  }
      },
      events: [ // 이벤트 등록
    	  
    	  
      ]
      
      
    	  
      
     
      
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

<div class='pop' hidden='hidden' style='width:100px; height:100px;'>
	<!-- 이 부분에 일정이 나온다. -->
	<h2> 팝업 테스트 </h2>
	<button>확인</button>
	<button>취소</button>
</div>
</body>
<script>
/* $(".pop").bPopup({
	modalClose: false,
    opacity: 0.6,
    positionStyle: 'fixed', //'fixed' or 'absolute'
    folow: [false, false]
}); */
</script>
</html>
