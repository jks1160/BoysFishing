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
		th{
		width: 200px;
		}
		td{
		height: 30px; 
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
 		 img {
 		 width: 200px;
 		 height: 200px;
		 object-fit: contain;
		}
		</style>

	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="head"><h2>${sessionScope.userinfo.u_usernickname} 님의 회원정보</h2></div>
	<div class="entire">
	
	<div class="rounded float-start">
		<img src="" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
	</div>	
	
	<div style="padding-top:170px; padding-left: 0px">
 	<form style="margin :0px; padding: 0px"  id="fileUpload">
	<input type="file" hidden="hidden" name="file" id="fileinput" onchange="uploadFile()">
	<button type="button" id="fileUpdate">수정</button>
	<button type="button" id="fileDelete" onclick="shipFileDelete()">삭제</button>
	</form>
	</div>
	
	
	<form action="shipUpdate" name="shipJoin" method="POST">
	<table class="table table-bordered">
	<thead>
			<tr>
				<td>항목</td>
				<td>입력 값</td>
			</tr>
	</thead>
		<tr>
			<th>배이름</th>
			<td>
			<input style="width:300px;" maxlength="20" type="text" name="s_name" id="s_name" placeholder="배 이름을 입력해주세요." value="${params.s_name }"/>
			<button type="button" disabled="disabled" id="overChk">중복확인</button>
			</td>
		</tr>

		<tr>
			<th>최소탑승인원</th>
			<td>
			<input style="width:300px;" min="1" name="s_minpassenger" id="s_minpassenger" oninput='handleOnInput(this, 3)' type="number" placeholder="최소탑승인원을 입력해주세요." value="${params.s_minpassenger }"/>
			</td>
		</tr>
		<tr>
			<th>최대탑승인원</th>
			<td>
			<input style="width:300px;" min="1"  name="s_maxpassenger" id="s_maxpassenger" oninput='handleOnInput(this, 3)' type="number" placeholder="최대탑승인원을 입력해주세요." value="${params.s_maxpassenger }"/>
			</td>
		</tr>
		<tr>
			<th>정박위치주소</th>
			<td>
			<input style="width:300px; margin-left: 75px" size="40px" name="address" id="address" type="text" readonly="readonly" placeholder="주소검색을 이용해 입력해주세요."/>
			<input type="text" style="margin-top: 5px; width:300px" maxlength="50" name="addressDetail" id="addressDetail" placeholder="상세주소를 입력해주세요">
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
			에어컨<input type="checkbox" id="convenient" name="c_1" value="에어컨"/>
			TV<input type="checkbox" id="convenient" name="c_2" value="TV"/>
			화장실<input type="checkbox" id="convenient" name="c_3" value="화장실"/>
			주차장<input type="checkbox" id="convenient" name="c_4" value="주차장"/>
			휴게실<input type="checkbox" id="convenient" name="c_5" value="휴게실"/></br>
			냉장고<input type="checkbox" id="convenient" name="c_6" value="냉장고"/>
			커피포트<input type="checkbox" id="convenient" name="c_7" value="커피포트"/>
			구명조끼<input type="checkbox" id="convenient" name="c_8" value="구명조끼"/>
			난방<input type="checkbox" id="convenient" name="c_9" value="난방"/>
			구명밧줄<input type="checkbox" id="convenient" name="c_10" value="쏘나"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" id="submitBtn" onclick="checkfield()" >저장하기</button>
			</td>
			
		</tr>
		</table>
		<input type="hidden" name="s_num" value="${params.s_num}">
		</form>
		
		<div class="road">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="sample4_extraAddress" placeholder="참고항목">
		</div>
		</div>
	</body>
	<script>
	
	var path = "${params.path}";
	var newFileName = path.substring(path.lastIndexOf("/")+1);
	
	window.onload = function(){
		if(path != ""){
			$("#profileImg").attr("src",path);
		}else{
			$("#profileImg").attr("src","resources/defaultimg/defaultprofile.png");
		}
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
		console.log("newFileName : "+newFileName);
		console.log("path : "+path);
		

		 $.ajax({
				url:'shipFileDelete',
				type:'POST',
				data:{"newFileName":newFileName},
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
	
	//===================================================================================================
	
			overChk = true;
		$(function(){
			$("#s_name").on('input',function(){
				overChk = false;
				if($("#s_name").val()==''){
					$("#overChk").attr("disabled",true);
				}else{
					$("#overChk").attr("disabled",false);
				}
				if($("#s_name").val()=='${params.s_name }'){
					$("#overChk").attr("disabled",true);
					overChk = true;
				} 
			});
		})

		$("#overChk").click(function(){
			var s_name = $("input[id=s_name]").val();
			var space = /\s/g;  //공백
			var hangleChk = /([^가-힣a-z\x20])/i; //모음,자음만 사용불가
			var Chk = /[가-힣A-Za-z0-9]{1,20}/; //영문 숫자 한글만 허용
			var Chkresult = Chk.test(s_name);
			var hangleChkresult = s_name.match(hangleChk);
			console.log(s_name);

			if(s_name ==""){
				alert("배 이름을 입력해주세요.");
				$("#s_name").focus();
				return;
			}else if(!s_name.length>20){
				alert("배 이름은 20자 이하로 입력해주세요.");
				$("#s_name").focus();
				return;
			}else if(!Chkresult){
				alert("영문,숫자,한글만 사용 가능합니다.");
				$("#s_name").focus();
				return;
			}else if(s_name.match(space)){
				  alert("공백은 사용할 수 없습니다.");
				  return;
			}else if(hangleChkresult){
				 alert("모음/자음만 사용할 수 없습니다.");
				  return;
			}

			 $.ajax({
				url:'shipNameChk',
				type:'POST',
				data:{'s_name':s_name},
				dataType:'JSON',
				success:function(data){
					console.log("중복여부  :"+data);
			
					if(data){
					alert("사용 가능한 배 이름 입니다.");
					overChk = true;
					$("#overChk").attr("disabled",true);
					}else{
					alert("이미 사용중인 배 이름 입니다.");
					overChk = false;
					}
				},
				error:function(e){
					console.log(e);
				}	
			}); 
		})	

			function checkfield(){
				//값 변수
				var s_minpassenger = $("#s_minpassenger").val();
				var s_maxpassenger = $("#s_maxpassenger").val();
				var address = $("#address").val();
				var addressDetail = $("#addressDetail").val();
	
			// 공백체크	
			if(s_minpassenger ==""){
				alert("최소 탑승인원을 입력해주세요.");
				$("#s_minpassenger").focus();
				return;
			}else if(s_maxpassenger ==""){
				alert("최대 탑승인원을 입력해주세요.");
				$("#s_maxpassenger").focus();
				return;
			}else if(address ==""){
				alert("정박지 주소를 입력해주세요.");
				$("#address").focus();
				return;
			}else if(addressDetail ==""){
				alert("정박지 상세주소를 입력해주세요.");
				$("#address").focus();
				return;	
			}

			// 체크박스 체크여부
			var eqChk = $("input:checkbox[id=equipment]").is(":checked")
			var conChk = $("input:checkbox[id=convenient]").is(":checked")
			if(eqChk == false){
				alert("보유 장비를 1개 이상 체크해 주세요.");
				return;	
			}else if(conChk == false){
				alert("보유 편의시설을 1개 이상 체크해 주세요.");
				return;	
			}
			
			if(overChk){
				$("form[id=shipJoin]").submit();
			  }else{
				alert("배 이름 중복체크를 해주세요");
			  }
			}

			// 플러스,마이너스 입력 방지
			var number = document.getElementById('s_minpassenger');

			number.onkeydown = function(e) {
 			   if(!((e.keyCode > 95 && e.keyCode < 106)
 			     || (e.keyCode > 47 && e.keyCode < 58) 
  			    || e.keyCode == 8)) {
  			      return false;
 		 	  }
			}

			//input type="number" 글자수 입력제한
			function handleOnInput(el, maxlength) {
				  if(el.value.length > maxlength)  {
				    el.value 
				      = el.value.substr(0, maxlength);
				  }
				}
	
	</script>
</html>


































