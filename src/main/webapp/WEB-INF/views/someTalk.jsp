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
<jsp:include page="header.jsp"></jsp:include>
<div class="container my-5">
	<div class="row">
		<div class="col">
			<h2 >섬섬톡 <small class="text-muted">(${selec })</small></h2>
		</div>
		<form action = "someTalk" method="get" id="form">
        <div class="form-inline text-right">
            <label for="selec">카테고리 : &nbsp;</label>
            <select class="form-control" id="selec" name="selec">
              <option value="B001" <c:if test="${selec eq '자유게시판'}">selected</c:if>>자유게시판</option>
              <option value="B002" <c:if test="${selec eq '후기게시판'}">selected</c:if>>후기게시판</option>
              <option value="B003" <c:if test="${selec eq '정보게시판'}">selected</c:if>>정보게시판</option>
            </select>
            <c:if test="${sessionScope.userinfo ne null }">
            	<i class="fas fa-edit mx-1 ml-3"></i><a class="btn btn-sm btn-outline-dark"  name="write" href="someWriteForm">글쓰기</a>
        	</c:if>
        </div>
        </form>
	</div>
    <hr>
    <c:forEach var="dto" items="${list }">
    <div class="row justify-content-md-center rounded list m-5">
        <div class="col-8  p-3 border rounded">
            <div class="card">
                <img class="card-img-top p-5 border" 
                	<c:choose>
                		<c:when test="${dto.bi_name ne null }">src="/photo/${dto.bi_name }"</c:when>
                		<c:otherwise>src="resources/defaultimg/sumsumdefault.jpg"</c:otherwise>
                	</c:choose> alt="이미지 불러오기에 실패했습니다.">
                <div class="card-body">
                  <h4 class="col -8 card-title text-truncate my-3"><b>${dto.b_subject }</b></h4>
                  <p class="col-8 card-text text-truncate my-3">${dto.b_content }</p>
                  <c:choose>
	                  <c:when test="${dto.ui_name eq null}">
	                  		<img class="rounded-circle" src="resources/defaultimg/defaultprofile.png" style="width:60px; height:60px;">
	                  </c:when>
	                  <c:otherwise>
	                  		<img class="rounded-circle p-1 border" src="/photo/${sessionScope.userinfo.ui_name }" style="width:60px; height:60px;">
	                  </c:otherwise>
	              </c:choose>
                  <b class="mx-2">작성자 : ${dto.u_usernickname }</b>
                  <i class="fas fa-fish"></i><b class="mx-2" >대상어종 : ${dto.fish }</b>
                  <a class="float-right" href="someDetail?b_num=${dto.b_num }">상세보기</a>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
    <hr>
</div>
</body>
<script>
	$("#selec").change(function(){
		$("#form").submit();
	});
	$('.list:gt(4)').hide().last().after(
			$("<input type='button' class='btn btn-outline-dark float-right my-4'/>").attr({href : '#',value : '더보기'
				}).click(function() {var a = this;
					$('.list:not(:visible):lt(5)').fadeIn(function() {
					if ($('.mydata:not(:visible)').length == 0)
						$(a).remove();});
					return false;}));
	$(".card-body").find(".img").remove();
</script>
</html>