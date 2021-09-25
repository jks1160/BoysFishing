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
</style>
<script>

// 아이디 가져오기
var checker = "${sessionScope.u_userid}";
console.log("아이디 가져오기" , checker);

// 날짜 설정
var today = new Date();
console.log('투데이',today);
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
      dateClick: false,
      events: function(info, successCallback, failureCallback){
    	   $.ajax({
				url:'/fishing/captainScheduleList',
				type: 'POST',
				dataType :"JSON",
				success : function(data) {
					// fullCalendar에 넣을 이벤트를 받아 줄 리스트
					var my_reser = [];
					//성공 했는지 확인
					console.log("성공 데이터 : " ,data);
					// 받은 데이터 중 my_list 부분을 가져온다.
					data.forEach(function(myReser){
						var get_year = new Date(myReser.END).getFullYear();
						var get_month = new Date(myReser.END).getMonth()+1;
						var get_day = new Date(myReser.END).getDate();

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
							title : "예약 확인"
						});
					}); // forEach end
					

					console.log(successCallback(my_reser));
				}, // ajax success end
				error : function(e){
				console.log("에러났습니다." ,e);
				} // ajax error end
    	  });// ajax end  
      },
      eventClick:function(event){
    	  console.log("이벤트 클릭");
    	  const today = new Date(event.event._instance.range.start);
    	  var day = today.toISOString();
    	  location.href="/fishing/captainScheduleDetail?date="+day.substr(0,10);
      },// events:function end */ 
     
       
    });// full Calendar end 

    calendar.render();
  });

 function chageShopSelect1(){
		var shipSelect = document.getElementById("shipName");
		var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
		console.log("배넘버: ",selectValue);
		selectValue = parseInt(selectValue);
		//배 이름을 받아오면 출항지를 뿌리는 함수 출력
		reserHistory(selectValue);
	}

	function reserHistory(shipNum){
		console.log("여기옴?");
		var param = {};
		param.shipNum = shipNum;
		$.ajax({
			type : 'get',
			url : 'reserHistory',
			data : param,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				if(data.length > 0){
					reserHitoryFormDraw();
					reserHistoryDrawList(data)
				}else{
					$("#reserHistory").empty();
					$("#tableDraw").empty();
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

	function reserHitoryFormDraw(){
		var content = "";
		content += "<table><thead>";
		content += "<tr><th>예약자 닉네임</th><th>무인도 이름</th><th>운행날짜</th><th>인원수</th><th>결제 금액</th><th>예약 날짜</th></tr>";
		content += "</thead><tbody id='reserHistory'></tbody></table>";
		$("#tableDraw").empty();
		$("#tableDraw").append(content);
	}
	
	function reserHistoryDrawList(list) {
		console.log(list);
		var content = "";
		
		list.forEach(function(item, idx) {
			console.log(item, idx);
			var date = new Date(item.OP_DATE);
			content += "<tr>";
			content += "<td>"+item.U_USERNICKNAME+"</td>";
			content += "<td>"+item.I_NAME+"</td>";
			content += "<td>"+date.getFullYear() +"-"+  (date.getMonth()+1) +"-"+ date.getDate() +" "+ date.getHours() +":"+ date.getMinutes() +"</td>";
			content += "<td>"+item.RI_PEOPLE+"</td>";
			content += "<td>"+item.RI_PAY+"</td>";
			content += "<td>"+item.RI_RESERDATE+"</td></tr>";
		});
		$("#reserHistory").empty();
		$("#reserHistory").append(content);
	}


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
  
  .entire{
  		text-align: center;
		margin-top: 5%;
		margin-right: 20%;
		margin-bottom: 5%;
		margin-left: 20%;
  }
  

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
 	<div id='calendar'></div>

<div class='pop' hidden='hidden' style='width:100px; height:100px;'>
	<!-- 이 부분에 일정이 나온다. -->
	<h2> 팝업 테스트 </h2>
	<button>확인</button>
	<button>취소</button>
</div>

<div class="entire">
	<hr>
	<h3>예약 확정 히스토리</h3>
		<select id = "shipName" name = "s_num" onchange="chageShopSelect1()">
			<option>선택</option>
			<c:forEach var="name" items="${shipName}">
			<option value="${name.s_num}">${name.s_name}</option>
			</c:forEach>
		</select>
	<div id = "tableDraw">
	
	</div>
</div>



</body>
<script>


/* 
})
 */
/* $(".pop").bPopup({
	modalClose: false,
    opacity: 0.6,
    positionStyle: 'fixed', //'fixed' or 'absolute'
    folow: [false, false]
}); */


</script>
</html>