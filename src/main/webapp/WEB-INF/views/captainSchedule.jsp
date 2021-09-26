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


//운항예약확정 히스토리 부분


//페이징 처리시에 페이지 변수 선언
 var p_page = 1;
 var ship_Num = 0;
//페이징 기능 뿌리는 함수
 $("#pagePerNum").change(function(){
		//페이징 초기화
		$("#pagination").twbsPagination('destroy');
		
		reserHistory(ship_Num, p_page);
	});
 
//셀렉트 선택하면 해당 옵션의 밸류값을 가져오는 함수
 function chageShopSelect1(){
		var shipSelect = document.getElementById("shipName");
		var selectValue = shipSelect.options[shipSelect.selectedIndex].value;
		console.log("배넘버: ",selectValue);
		selectValue = parseInt(selectValue);
		ship_Num = selectValue;
		//배 이름을 받아오면 출항지를 뿌리는 함수 출력
		$("#pagination").twbsPagination('destroy');
		reserHistory(selectValue,p_page);
	}

//운항예약확정 히스토리 뽑는 총괄함수
	function reserHistory(shipNum,p_page){
		console.log("여기옴?");
		var param = {};
		param.shipNum = shipNum;
		param.page = p_page;
		console.log("배번호: ",ship_Num);
		console.log("현재페이지: ",p_page);
		$.ajax({
			type : 'get',
			url : 'reserHistory',
			data : param,
			dataType : 'JSON',
			success : function(data) {
				console.log(data);
				console.log("데이터 크기?: ",Object.keys(data).length);
				console.log("데이터?: ",Object.keys(data));
				console.log("데이터?: ",Object.values(data)[2].length);
				if(Object.values(data)[2].length > 0){
					console.log("여기와라");
					reserHitoryFormDraw();
					reserHistoryDrawList(data)
					p_page = data.currPage;
					$("#pagination").twbsPagination({
						startPage: data.currPage,//시작페이지
						totalPages: data.totalPage,  //총 페이지 갯수
						visiblePages:5, //보여줄 페이지 갯수
						onPageClick: function(e,page){
							//console.log(e,page);
							reserHistory(shipNum,page);
						}
					});	
				}else{
					console.log("데이터없당");
					$("#reserHistory").empty();
					$("#tableDraw").empty();
					$("#pagination").empty();
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	}

//운항예약확정 히스토리 중 테이블 폼을 뽑는 함수
	function reserHitoryFormDraw(){
		var content = "";
		content += "<table class='table-bordered'><thead>";
		content += "<tr><th>예약자 닉네임</th><th>무인도 이름</th><th>운행날짜</th><th>인원수</th><th>결제 금액</th><th>예약 날짜</th><th>예약상태</th></tr>";
		content += "</thead><tbody id='reserHistory'></tbody></table>";
		
		$("#tableDraw").empty();
		$("#tableDraw").append(content);
	}

//운항예약확정 히스토리 중 히스토리 데이터를 갖고오는 함수
	function reserHistoryDrawList(list) {
		console.log(list);
		var content = "";
		list.list.forEach(function(item, idx) {
			console.log(item, idx);
			switch(item.RI_CODE){
			case "RI002":
				code = "예약확정";
				break;
			case "RI003":
				code = "유저예약취소";
				break;
			case "RI004":
				code = "선장예약취소";
				break;
			case "RI005":
				code = "선장예약확정취소";
				break;
			}
			var opDate = new Date(item.OP_DATE);
			var reserDate = new Date(item.RI_RESERDATE);
			content += "<tr>";
			content += "<td>"+item.U_USERNICKNAME+"</td>";
			content += "<td>"+item.I_NAME+"</td>";
			content += "<td>"+opDate.getFullYear() +"-"+  (opDate.getMonth()+1) +"-"+ opDate.getDate() +" "+ opDate.getHours() +":"+ opDate.getMinutes() +"</td>";
			content += "<td>"+item.RI_PEOPLE+"</td>";
			content += "<td>"+item.RI_PAY+"</td>";
			content += "<td>"+reserDate.getFullYear() +"-"+  (reserDate.getMonth()+1) +"-"+ reserDate.getDate() +" "+ reserDate.getHours() +":"+ reserDate.getMinutes() +"</td>";
			content += "<td>"+code+"</td></tr>";
			
							
			
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
	<h3>예약 히스토리</h3>
		<select id = "shipName" name = "s_num" onchange="chageShopSelect1()">
			<<option value='0'>선택</option>
			<c:forEach var="name" items="${shipName}">
			<option value="${name.s_num}">${name.s_name}</option>
			</c:forEach>
		</select>
	<div id = "tableDraw">
	
	</div>
	<div class="container row" >
		<nav id = "pageNav" class="container col-auto mt-3" aria-lable="Page navigation"  style="text-align: center;">
			<ul class="pagination" id="pagination"></ul>
		</nav>
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