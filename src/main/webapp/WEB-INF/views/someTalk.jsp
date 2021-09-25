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
<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
.card-img-top{
    height:200px;
}
</style>
</head>
<body>
<div class="container my-5 justify-content-between">
	<div class="row">
		<div class="col">
			<h2>섬섬톡</h2> 
		</div>
        <div class="form-group">
            <label for="sel1">카테고리 :</label>
            <select class="form-control" id="sel1">
              <option checked>자유게시판</option>
              <option>후기게시판</option>
              <option>정보게시판</option>
            </select>
        </div>
	</div>
    <hr>
    <c:forEach var="" items="">
    <div class="row justify-content-md-center">
        <div class="col-10">
            <div class="card">
                <img class="card-img-top" src="" alt="Card image">
                <div class="card-body">
                  <h4 class="card-title">John Doe</h4>
                  <p class="card-text">Some example text.</p>
                  <a href="#">상세보기</a>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
</body>
<script>
console.log($("#sel1").val());
/* $.ajax({
    url:'overCheck',
    type:'POST',
    data:{ "category": $("#sel1").val()},
    dataType:'JSON',
    success:function(data){
    	
    },
    error:function(e){
		console.log(e);
    }
}); */
</script>
</html>