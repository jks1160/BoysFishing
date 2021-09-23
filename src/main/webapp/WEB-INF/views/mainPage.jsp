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
                    	<a href="/" style="{display:block;{color:black}">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col mx-1">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col mx-1">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col mx-1">
                <div class="card">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                      <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	
</script>
</html>