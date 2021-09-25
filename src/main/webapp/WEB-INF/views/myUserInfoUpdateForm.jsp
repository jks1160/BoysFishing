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
		<title>MyUserInfoUpdate</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
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
	<c:choose> 
		<c:when test="${dto.ui_name eq null}">
		<img src="resources/defaultimg/defaultprofile.png" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:when>
		<c:otherwise>
		<img src="/photo/${dto.ui_name}" id="profileImg" class="rounded" alt="회원 프로필 이미지" style="width: 200px;">
		</c:otherwise>
	</c:choose>
 	
	<div style="margin: 20px 50px;">
 	<form id="fileUpload">
	<input type="file" name="file" id="fileinput" onchange="uploadFile()">
	<button type="button" id="fileUpdate">수정</button>
	<button type="button" id="fileDelete">삭제</button>
	</form>
	</div>
	</div>
	<form action="userInfoUpdate" name="userInfoUpdate" method="POST">
	<table class="table table-bordered">
	<thead>
			<tr>
				<td>항목</td>
				<td>값</td>
			</tr>
	</thead>
	    <tr>
			<th>핸드폰번호</th>
			<td><input type="text" name="userphonenum" id="userphonenum" value="${dto.u_userphonenum}"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="emailname" id="emailname" value="${emailname }"/>
			<label>@</label>
			<select name="emaildomain" id="emaildomain">
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="gmail.com">gmail.com</option>
			</select></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>
			<input maxlength="20" name="nickname" id="nickname" type="text" value="${dto.u_usernickname}"/>
			<button type="button" disabled="disabled" id="overChk">중복확인</button></td>
		</tr>
		<tr>
			<th>가입날짜</th>
			<td>${dto.u_joindate}</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" id="submitBtn" onclick="checkfield()">저장하기</button>
			<button type="button" id="pwChange" onclick="PwUpdate()">비밀번호 변경</button>
			<button type="button" onclick="location.href='./myUserInfo'">회원정보</button>
			</td>
			
		</tr>
		</table>
		</form>
		</div>
	</body>
	<script>
	$("#emaildomain").val("${emaildomain}").prop("selected",true);
	if("${dto.u_kakaoYN}" == 'Y'){
		$("#pwChange").attr("hidden",true);
	}
	overChk = true;
	$(function(){
		$("#nickname").on('input',function(){
			overChk = false;
			if($("#nickname").val()==''){
				$("#overChk").attr("disabled",true);
			}else{
				$("#overChk").attr("disabled",false);
			}
			if($("#nickname").val()=='${dto.u_usernickname}'){
				$("#overChk").attr("disabled",true);
				overChk = true;
			} 
		});
	})
	
	$("#overChk").click(function(){
		var u_usernickname = $("input[id=nickname]").val();
		var space = /\s/g; 
		var hangleChk = /([^가-힣a-z\x20])/i; //모음,자음만 사용불가
		var nickChk = /[가-힣A-Za-z0-9]{1,20}/; //영문 숫자 한글만 허용
		var nickChkresult = nickChk.test(u_usernickname);
		var hangleChkresult = u_usernickname.match(hangleChk);
		console.log(u_usernickname);
	
		if(u_usernickname ==""){
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return;
		}else if(!u_usernickname.length>20){
			alert("닉네임은 20자 이하로 입력해주세요.");
			$("#nickname").focus();
			return;
		}else if(!nickChkresult){
			alert("영문,숫자,한글만 사용 가능합니다.");
			$("#nickname").focus();
			return;
		}else if(u_usernickname.match(space)){
			  alert("공백은 사용할 수 없습니다.");
			  return;
		}else if(hangleChkresult){
			 alert("모음/자음만 사용할 수 없습니다.");
			  return;
		}
	
		 $.ajax({
			url:'nickcheck',
			type:'POST',
			data:{'u_usernickname':u_usernickname},
			dataType:'JSON',
			success:function(data){
				console.log("중복여부  :"+data);
				
				if(data){
				alert("사용 가능한 닉네임 입니다.");
				overChk = true;
				$("#overChk").attr("disabled",true);
				}else{
				alert("이미 사용중인 닉네임 입니다.");
				overChk = false;
				}
			},
			error:function(e){
				console.log(e);
			}	
		}); 
	})	
	
	function checkfield(){
		var userphonenum = $("#userphonenum").val();
		var emailname = $("#emailname").val();
		var phoneChk = /^010\d{4}\d{4}$/; //핸드폰양식
		var emailChk = /^[a-zA-Z0-9]+$/; //영문 숫자만 허용
		var space = /\s/g; //공백체크
		
		var phoneChkresult = phoneChk.test($("#userphonenum").val());
		var emailChkresult = emailChk.test($("#emailname").val());
		console.log(phoneChkresult);
		console.log(emailChkresult);
		
	if(userphonenum ==""){
		alert("핸드폰번호를 입력해주세요.");
		$("#userphonenum").focus();
		return;
	}else if(emailname==""){
		alert("이메일을 입력해주세요.");
		$("#emailname").focus();
		return;
	}else if(!userphonenum.length==11){
		alert("핸드폰번호는 11자리로 입력해주세요.");
		$("#userphonenum").focus();
		return;
	}else if(emailname.length>15){
		alert("이메일은 15자 이하로 입력해주세요.");
		$("#emailname").focus();
		return;
	}else if(!phoneChkresult){
		alert("핸드폰 양식으로 입력해 주세요 ex(01012345678)");
		$("#emailname").focus();
		return;
	}else if(!emailChkresult){
		alert("영문,숫자만 사용 가능합니다.");
		$("#emailname").focus();
		return;
	}else if(emailname.match(space)){
		  alert("공백은 사용할 수 없습니다.");
		  return;
	}
	
	if(overChk){
		$("form").submit();
	  }else{
		alert("닉네임 중복체크를 해주세요");
	  }
	}
	
	function PwUpdate(){
		var url="myUserInfoPwUpdate"
		window.open(url,"","width=600,height=400,left=1000,top=100");
	}
	
	
	// 프로필 이미지 수정
	$("#fileinput").hide(); //input 버튼 숨기기
	
	$(function(){
	    $('#fileUpdate').on('click', function(){
	    	$("#fileinput").click();
	    });
	});
	
	$(function(){
	    $('#fileDelete').on('click', function(){
	    	fileDel();
	    });
	});


	function uploadFile(){
		console.log("프로필이미지 업데이트");
		var form = $('#fileUpload')[0];
	    var formData = new FormData(form);

		 $.ajax({
				url:'fileUpdate',
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
	
	function fileDel(){
		console.log("프로필이미지삭제");
		 $.ajax({
				url:'fileDel',
				type:'POST',
				data:{},
				dataType:'JSON',
				success:function(data){
					console.log("성공");
					console.log(data);
					if(data){
					$("#profileImg").attr("src","resources/defaultimg/defaultprofile.png");	
					}else{
						alert("등록된 프로필 이미지가 없습니다.");
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


































