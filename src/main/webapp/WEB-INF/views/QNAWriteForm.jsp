<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>j-query 강좌</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
* {
   font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container my-5">
		<div class="row justify-content-between my-3">
			<div class="col-5">
				<h2>QNA 작성</h2>
			</div>
		</div>
		<hr>
		<form action="QNAwrite" method="post">
			<div class="row">
				<div class="col-2">
					<label for="usr"><b>QNA 제목 : </b></label>
				</div>
				<div class="col-7">
					<div class="form-group">
						<input type="text" class="form-control" id="usr" name="q_subject">
					</div>
				</div>
				<div class="col-3">
					<div class="form-group">
						<select class="custom-select" name="q_blindYN">
							<option selected value="N">공개</option>
							<option value="Y">비공개</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-flout">
				<div class="form-group">
					<label for="comment">QNA 내용 :</label>
					<textarea class="form-control border" rows="8" id="comment" name="q_content" style="resize: none"></textarea>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col">
					<button class="btn btn-outline-dark float-right">작성하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>