<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
div.card{
    height: 35vh;
}
.card-img-top{
    height: 20vh;
}
.card-text{
    height: 9vh; 
    overflow: hidden;
    text-overflow: ellipsis;
}
.card-title{
	height:5vh;
	overflow: hidden;
    text-overflow: ellipsis;
}
a.content{
    display: block;
    color:black;
}
.table{
    text-align: center;
}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container my-5">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>인기 게시글</h2>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>인기 섬 리스트</h2>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>공지사항</h2>
            </div>
        </div>
        <hr>
        <div class="row my-3">
            <div class="col">
                <table class="table">
                    <thead>
                      <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                      </tr>
                      <tr>
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                      </tr>
                      <tr>
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        <div class="row">
            <div class=col>
                
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	
</script>
</html>