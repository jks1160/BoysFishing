<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>SOMEFISH</title>
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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>SOMEFISH</title>
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
									<td colspan="6" class="hiddenRow">
										<div id="demo2${dto.Q_NUM }" class="accordian-body collapse px-5 ml-5 py-1">
										<b>Q : ${dto.Q_CONTENT}</b>
										<hr/>
										<div id="demo2${dto.Q_NUM }" class="accordian-body collapse px-5 ml-5 py-1" <c:if test="${dto.Q_ANSWERCON eq null}">hidden</c:if>>관리자 : ${dto.Q_ANSWERCON }</div>
											
										
										
										<c:if test="${sessionScope.userinfo.u_manageryn eq 'Y'}">
										<c:if test="${dto.Q_ANSWERCON eq null}">
										<form action="/fishing/qnaanswer" method="get">
										 <input type="text" id="answervalue" name="answervalue" placeholder="답변을 입력해 주세요" style="width:300px"> &nbsp;&nbsp;&nbsp; <button>입력</button>
										 <input type="hidden" id="qnum" name="qnum" value="${dto.Q_NUM}">
										 </form>
										 
										</c:if>
										</c:if>
															
										</div>
										<hr>
									</td>
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
	/*
	function qnaanswer(){
		var answervalue = $("#answervalue").val();
		var qnum = $("#qnum").val();
		
			if(answervalue.length>0){
				$.ajax({
					url:"qnaanswer",
					type:'get',
					data:{
						answervalue : answervalue,
						qnum : qnum
					},
					dataType:'JSON',
					success:function(data){
						console.log(data);
					},
					error:function(error){
						console.log(error);
					}			
				});	
		}else{
			alert("내용을 입력해주세요.");
		}
		
		
	}
	*/
</script>
</html>