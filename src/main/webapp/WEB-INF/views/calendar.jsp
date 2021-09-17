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


$('.pop').height(100);


console.log("year",year );
console.log("months", month);
console.log("date",date);
var O_nuel = year+'-'+month+'-'+date;
console.log(O_nuel);
 document.addEventListener('DOMContentLoaded', function() {
 var calendarEl = document.getElementById('calendar');
 var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title'
      },
      initialDate: O_nuel,
      navLinks: false, // can click day/week names to navigate views
      businessHours: true, // display business hours
      locale: "ko",
      editable: true,
      selectable: true,
      select : function(info){
    	 console.log(info);
    	 $(".pop").bPopup({
				modalClose: false,
			    opacity: 0.6,
			    positionStyle: 'fixed', //'fixed' or 'absolute'
			    folow: [false, false]
			});
    	var end_date = new Date(info.endStr);
    	var start_date = new Date(info.StartStr);
    	console.log("끝날짜 ",end_date);
    	console.log("시작 날짜 : ", start_date);
    	 
      }
      
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
	<h2> 팝업 테스트 </h2>
	<button>확인</button>
	<button>취소</button>
</div>
</body>
<script>

</script>
</html>
