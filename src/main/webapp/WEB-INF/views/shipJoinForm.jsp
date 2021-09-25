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
		  <link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
		<meta charset="UTF-8">
		<title>SOMEFISH</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		
	<!-- 도로명 주소 API -->	
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
				var buildingName = data.buildingName;
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
           		console.log(buildingName);
                document.getElementById("address").value = roadAddr +' '+buildingName;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

		<!-- 글꼴 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		
		<style>
		* {
 	    font-family: 'Do Hyeon', sans-serif;
	}
		table, td ,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
		.road{
		display: none;
		}
		.entire{
		text-align: center;
		margin-top: 5%;
		margin-right: 20%;
		margin-bottom: 5%;
		margin-left: 20%;
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
	<div class="head"><h2>${sessionScope.userinfo.u_usernickname} 님의 회원정보</h2></div>
	<div class="entire">
	<div class="rounded float-start">
		<img src="resources/defaultimg/defaultprofile.png" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
	<div style="margin: 20px 50px;">
 	<form id="fileUpload">
	<input type="file" hidden="hidden" name="file" id="fileinput" onchange="uploadFile()">
	<button type="button" id="fileUpdate">등록</button>
	<button type="button" id="fileDelete" onclick="shipFileDelete()">삭제</button>
	</form>
	</div>
	
	</div>
	<form action="shipJoin" name="shipJoin" method="POST">
	<table class="table table-bordered">
	<thead>
			<tr>
				<td>항목</td>
				<td>값</td>
			</tr>
	</thead>
	    <tr>
			<th>배이름</th>
			<td>
			<input style="width:300px;" type="text" name="s_name" id="s_name" value=""/>
			</td>
		</tr>

		<tr>
			<th>최소탑승인원</th>
			<td>
			<input style="width:300px;" name="s_minpassenger" id="s_minpassenger" type="number" value=""/>
			</td>
		</tr>
		<tr>
			<th>최대탑승인원</th>
			<td>
			<input style="width:300px;" name="s_maxpassenger" id="s_maxpassenger" type="number" value=""/>
			</td>
		</tr>
		<tr>
			<th>정박위치주소</th>
			<td>
			<input style="width:300px;" name="address" id="address" type="text" readonly="readonly"/>
			<input type="text" name="addressDetail" id="addressDetail" placeholder="상세주소를 입력해주세요">
			<button type="button" id="s_address" onclick="sample4_execDaumPostcode()">주소 검색</button></td>
		</tr>
		<tr>
			<th>장비현황</th>
			<td>
			안내방송<input type="checkbox" id="equipment" name="e_1" value="안내방송"/>
			플로터<input type="checkbox" id="equipment" name="e_2" value="플로터"/>
			무전기<input type="checkbox" id="equipment" name="e_3" value="무전기"/>
			레이더<input type="checkbox" id="equipment" name="e_4" value="레이더"/>
			쏘나<input type="checkbox" id="equipment" name="e_5" value="쏘나"/>
			</td>
		</tr>
		<tr>
			<th>편의시설 현황</th>
			<td>
			에어컨<input type="checkbox" name="" value="에어컨"/>
			TV<input type="checkbox" id="convenient" name="c_1" value="TV"/>
			화장실<input type="checkbox" id="convenient" name="c_2" value="화장실"/>
			주차장<input type="checkbox" id="convenient" name="c_3" value="주차장"/>
			휴게실<input type="checkbox" id="convenient" name="c_4" value="휴게실"/>
			냉장고<input type="checkbox" id="convenient" name="c_5" value="냉장고"/>
			커피포트<input type="checkbox" id="convenient" name="c_6" value="커피포트"/>
			구명조끼<input type="checkbox" id="convenient" name="c_7" value="구명조끼"/>
			난방<input type="checkbox" id="convenient" name="c_8" value="난방"/>
			구명밧줄<input type="checkbox" id="convenient" name="c_9" value="쏘나"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="submit" id="submitBtn" onclick="">저장하기</button>
			</td>
			
		</tr>
		</table>
		</form>
		
		<div class="road">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		</div>
		</div>
	</body>
	<script>
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
	
	$(function(){
	    $('#fileUpdate').on('click', function(){
	    	$("#fileinput").click();
	    });
	});
	
	function uploadFile(){
		console.log("배이미지 업데이트");
		var form = $('#fileUpload')[0];
	    var formData = new FormData(form);

		 $.ajax({
				url:'shipFileUpdate',
				type:'POST',
				data:formData,
				dataType:'JSON',
			    contentType:false,
			    processData:false,
				success:function(data){
					console.log("성공");
					console.log(data.path);
					$("#profileImg").attr("src",data.path);				
				},
				error:function(e){
					console.log("실패");
					console.log(e);
				}	
			}); 
	}
	
	$(document).on("submit", "form", function(event){
		window.onbeforeunload = null;
	});

	
	window.onbeforeunload = function() {
		console.log("실행?");
		shipFileDelete();
	}
	
	function shipFileDelete(){
		 $.ajax({
				url:'shipFileDelete',
				type:'POST',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log("shipFileDelete 실행");
					console.log(data);
					if(data){
					$("#profileImg").attr("src","resources/defaultimg/defaultprofile.png");	
					}else{
						
					}
				},
				error:function(e){
					console.log("실패");
					console.log(e);
				}	
			});
	}
	
	</script>
</html>


































