<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
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
}

.empty-box {
	width: 40px;
	height: 40px;
	background-color: black;
	display: inline;
}
</style>
</head>
<body>
	<!-- 헤더  -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 선장 등록 요청 페이지 -->
	<div class='container'>
		<h2 class='text-dark font-weight-bold text-center'
			style="margin-top: 25px;">선장 등록 요청</h2>
		<hr />
	</div>
	<div class='container'>
		<form>
			<div class="form-group">
				<h4 class='text-dark font-weight-bold text-left'>배 정보 입력</h4>
				<img src="/photo/1632279716197.png" width="280px" height="350px"
					style="display: block" />
				<label for ="InputSubject1">파일 첨부</label>
				<input id='fileInput' filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control"
				data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1"/>
				<div class="bootstrap-filestyle input-group">
					<input type='text' id='userfile' class='form-control' name='userfile' disabled="">
					<span class='group-span-filestyle input-group-btn' tabindex="0"></span>
				</div>
				



			</div>
		</form>
	</div>

</body>
<script>

</script>
</html>