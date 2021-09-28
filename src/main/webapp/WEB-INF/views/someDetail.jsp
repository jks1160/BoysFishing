<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>SOMEFISH</title>
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
img {
	height: 100px;
	width: 100px;
}
* {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-5 h-100">
		<div class="row justify-content-md-center">
			<div class="col-10">
				<h2>제목 : ${dto.b_subject }<small class="text-muted mx-2">(
				<c:choose>
					<c:when test="${dto.b_code eq 'B001'}">자유게시판</c:when>
					<c:when test="${dto.b_code eq 'B002'}">후기게시판</c:when>
					<c:when test="${dto.b_code eq 'B003'}">정보게시판</c:when>
				</c:choose>)</small>
				</h2>
				<c:if test="${dto.b_userid eq sessionScope.userinfo.u_userid }">
					<input type="button" class="btn btn-outline-dark btn-sm float-right mr-3 ml-2" value="삭제하기" onclick="location.href='someDelete?b_num=${dto.b_num}'">
					<input type="button" class="btn btn-outline-dark btn-sm float-right mr-3 ml-2" value="수정하기" onclick="location.href='someUpdateForm?b_num=${dto.b_num}'">
				</c:if>
					<c:choose>
	                  <c:when test="${dto.ui_name eq ''}">
	                  		<img class="rounded-circle p-1 border" src="resources/defaultimg/defaultprofile.png" style="width:60px; height:60px;">
	                  </c:when>
	                  <c:otherwise>
	                  		<img class="rounded-circle p-1 border" src="/photo/${sessionScope.userinfo.ui_name }" style="width:60px; height:60px;">
	                  </c:otherwise>
	              </c:choose>
				<b class="ml-2 mr-5">작성자 : ${dto.u_usernickname }</b><b>작성일 : ${dto.b_regdate }</b>
				<b class="mx-2" style="float:right;">어종 : ${dto.fish }</b><i class="fas fa-fish" style="float:right;"></i>
			</div>
		</div>
        <hr>
        <div class="row justify-content-md-center" style="height:500px;">
            <div class="col-10 m-3 p-3 border">
                <h2>${dto.b_content }</h2>
            </div>
        </div>
        <hr>
        <input type="button" class="btn btn-outline-dark btn-sm float-right mr-5" value="리스트로 돌아가기" onclick="location.href='someTalk?selec=${dto.b_code}'">
	</div>
</body>
</html>