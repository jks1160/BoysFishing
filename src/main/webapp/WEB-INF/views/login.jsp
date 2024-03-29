<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>SOMEFISH 로그인</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<style>
body, html {
	height: 100%;
}

* {
	font-family: 'Do Hyeon', sans-serif;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container my-5" >
		<div class="row align-items-center">
			<div class="col-md-6 mb-3">
				<img src="./resources/defaultimg/logo.png" class="img-fluid" alt="image">
			</div>
			<div class="col-md-6">
				<h3 class="signin-text mb-3">로그인</h3>
				<form action="login" method="POST">
					<div class="form-group">
						<label for="id">아이디 : </label> <input type="text" name="id"
							class="form-control">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호 : </label> <input type="password" name="pw"
							class="form-control">
					</div>
					<button class="btn btn-class">로그인</button>
				</form>
				<input class="btn btn-class" type="button" value="카카오로 시작하기"
					onclick="kakaoLogin();"> <input class="btn btn-class"
					type="button" value="회원가입" onclick="location.href = 'joinForm'">
			</div>
		</div>
	</div>
</body>
<script>
	function kakaoLogin() {
		$.ajax({
			url : './login/getKakaoAuthUrl',
			type : 'GET',
			data : {},
			dataType : 'text',
			success : function(res) {
				location.href = res;
			},
			error : function(e) {
				console.log("에러발생 : ", e);
			}
		});
	}

	if ("${msg}" != "") {
		alert("${msg}");
	}
	console.log("${msg}");
</script>

</html>