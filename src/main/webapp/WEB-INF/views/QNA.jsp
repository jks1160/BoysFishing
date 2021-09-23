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
	<div class="container">
		<div class="row">
			<div class="col-5 mt-4">
				<h2>QNA 게시판</h2>
			</div>
			<div class="col-7 mt-5">
				<c:if test="${sessionScope.userinfo ne null }">
					<button class="btn btn-outline-dark float-right" onclick="location.href='QNAForm'">글작성</button>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="col-md-12 mt-5">
			<div class="panel panel-default">
				<div class="panel-body">
					<table class="table table-condensed table-striped">
						<thead>
							<tr data-toggle="collapse" data-target="#demo1"class="accordion-toggle">
								<td>
									<button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>
								</td>
								<th>작성자</th>
								<th>제목</th>
								<th>내용</th>
							</tr>
						</thead>
						<c:forEach var="dto" items="${QNAList}">
							<tbody class="list">
								<tr data-toggle="collapse" data-target="#demo2${dto.Q_NUM }" class="accordion-toggle">
									<td>
										<button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>
									</td>
									<td>${dto.U_USERNICKNAME}</td>
									<td>${dto.Q_SUBJECT}</td>
									<td>${dto.Q_REGDATE}</td>
								</tr>
								<tr>
									<td colspan="6" class="hiddenRow"><div id="demo2${dto.Q_NUM }" class="accordian-body collapse">${dto.Q_CONTENT}</div></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$('.list:gt(4)').hide().last().after(
		$("<input type='button' class='btn btn-outline-dark float-left my-3' />").attr({href : '#',value : '더보기'
			}).click(function() {var a = this;
				$('.list:not(:visible):lt(5)').fadeIn(function() {
				if ($('.mydata:not(:visible)').length == 0)
					$(a).remove();});
				return false;}));
	if("${msg}" != ""){
		alert("${msg}");
	}
</script>
</html>