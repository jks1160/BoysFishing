<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>j-query 강좌</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container my-5">
		<div class="row justify-content-between my-3">
			<div class="col-5">
				<h2>QNA 게시판</h2>
			</div>
			<div class="col-2">
				<c:if test="${sessionScope.userinfo ne null}">
					<a class='btn btn-outline-dark mt-3' href="QNAForm">글쓰기</a>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="row list">
			<div class="col-2 my-1">
				<h5><b>작성자</b></h5>
			</div>
			<div class="col-7 my-1">
				<h5><b>제목</b></h5>
			</div>
			<div class="col-3 my-1">
				<h5><b>작성일</b></h5>
			</div>
		</div>
		<hr>
		<c:forEach var="dto" items="${QNAList}">
			<div id="accordion" class="my-1 border">
				<div class="card border">
					<div class="card-header">
						<button class="card-link btn btn-outline-dark row bg-primary" data-toggle="collapse"  data-target="#collapseOne${dto.q_num }">
							<div class="col-2">${dto.q_writer}</div>
							<div class="col-7">${dto.q_subject}</div>
							<div class="col-3">${dto.q_regdate}</div>
						</button>
					</div>
					<div id="collapseOne${dto.q_num }" class="collapse hide" data-parent="#accordion">
						<div class="card-body">
							<div class="col my-1">
								<b>${dto.q_content}</b>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<hr>
	</div>
</body>
<script>
	$('.list:gt(4)')
			.hide()
			.last()
			.after(
					$(
							"<input type='button' class='btn btn-outline-dark float-right my-5' />")
							.attr({
								href : '#',
								value : '더보기'
							})
							.click(
									function() {
										var a = this;
										$('.list:not(:visible):lt(5)')
												.fadeIn(
														function() {
															if ($('.mydata:not(:visible)').length == 0)
																$(a).remove();
														});
										return false;
									}));
</script>
</html>