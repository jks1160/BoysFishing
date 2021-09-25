<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>j-query 강좌</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
.card-img-top{
    height:500px;
}
</style>
</head>
<body>
	<div class="entire">
	<form action="someWrite" method="GET">
		<!-- 제목 -->
		<div class="boox1">
			<input type="text" name="b_subject" placeholder="제목을 입력해주세요" required>
		</div>
		<div class="boox1">
			<select name='b_code'>
				  <option value='' selected>카테고리 선택</option>
				  <option value='B001'>자유게시판</option>
				  <option value='B002'>후기게시판</option>
				  <option value='B003'>정보게시판</option>
				</select>
		</div>
		<hr>
		<div class="container">
		  <textarea class="summernote" name="b_content"></textarea>    
		</div>
		<button>등록하기</button>
	</form>
</div>
	<script>
	$('.summernote').summernote({
		  height: 150,
		  lang: "ko-KR"
		});
	</script>
</body>
</html>