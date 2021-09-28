<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
<body>

<div class="container m-auto position-relative" style="border: 1px solid cornflowerblue; height: 550px; width:700px">
  			<div class='container ' style="text-align: center;">
				<h2 class='text-dark font-weight-bold text-center '  style="margin-top: 25px;">죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h2>
				<hr />
				<img src="./resources/defaultimg/error.png" class="container justify-content-center" style="width:50%; height:300px">
				<p class='text-dark text-center '  style="margin-top: 25px;">죄송합니다. 요청하신 페이지를 찾을 수 없습니다.
				<br/>방문하시려는 페이지의 주소가 잘못 입력되었거나,
				<br/>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
				<br/>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
				</p>
			</div>
	<div class="mt-4 position-absolute top-100 start-50 translate-middle">
   		<a href="#" onclick="location.href='/fishing/'" class="translate-middle">메인으로 돌아가기</a>
	</div>
</div>

</body>
<script type="text/javascript">
	
</script>
</html>