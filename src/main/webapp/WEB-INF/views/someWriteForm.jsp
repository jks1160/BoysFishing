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
</style>
</head>
<body>
<div class="container m-5 h-100">
	<form action="" method="POST">
	<div class="row justify-content-md-center">
		<div class="col-10">
			<h2>글쓰기<small class="text-muted"></small></h2>
			<div class="text-right">
			<i class="fas fa-fish m-1"></i>
	            <label for="fishes">어종 : &nbsp;</label>
	            <select class="form-contro form-inlinel" id="fishes" name="fish">
	            <c:forEach var="fish" items="${fishList}">
	              <option value="${fish }">${fish }</option>
	            </c:forEach>
	            </select>
	        </div>
		</div>
	</div>
	<hr>
	<div class="row justify-content-md-center">
		<div class="col-2">
			<label for="usr"><b>제목 : </b></label>
		</div>
		<div class="col-5">
			<div class="form-group">
				<input type="text" class="form-control" id="usr" name="b_subject">
			</div>
		</div>
		<div class="col-3">
			<div class="form-group form-inline">
				<label for="selec">카테고리 :</label>
            	<select class="form-control form-inline mx-2" id="selec" name="b_code">
              		<option value="B001" selected>자유게시판</option>
              		<option value="B002">후기게시판</option>
              		<option value="B003">정보게시판</option>
            	</select>
            </div>
		</div>
	</div>
	<div class="row justify-content-md-center my-3">
		<div class="col-10">
		<hr>
			<div class="form-group">
		  		<div id="editable" contenteditable="true" style="height:450px;"></div> <!-- div 내용을 서버에 보낼 수 있도록 input을 추가 -->
				<input id="content" type="hidden" name="b_content" value="" />
			</div>
		</div>
	</div>
	<div class="row justify-content-end">
		<div class="col-1">
			<input type="button" class= "btn btn-outline-dark btn-sm" value="사진올리기" onclick="fileUp()" />
		</div>
		<div class="col-2">
			<button type="button" class= "btn btn-outline-dark btn-sm">글 작성</button>
		</div>
	</div>
	</form>
</div>
<hr>
</body>
<script>
function fileUp() {
	// 2번째 매개변수 창의 이름
	window.open('uploadForm', 'file upload', 'width=400, height=100');
}
$("#editable").keyup(function(){
	$("input[type='hidden']").val($("#editable").html());
});
</script>
</body>
</html>