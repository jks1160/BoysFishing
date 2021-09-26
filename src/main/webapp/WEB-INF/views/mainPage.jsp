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
<title>SOMEFISH</title>
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
	
	<!-- 상단 슬라이드 배너 -->
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="resources/defaultimg/mainpage1.jpg" class="d-block w-100"
						style="height: 500px" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/defaultimg/mainpage2.jpg" class="d-block w-100"
						style="height: 500px" alt="...">
				</div>
				<div class="carousel-item">
					<img src="resources/defaultimg/mainpage3.jpg" class="d-block w-100"
						style="height: 500px" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
			<div class="container px-3">
			<div class="container my-3">
				<div class="pt-4">
					<h2 class="fw-bold">About</h2>
					<hr />
				</div>
				<div class="row text-center">
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i class="bi bi-check-lg"></i>
						</span>
						<h4 class="my-2 fw-bold">섬을 예약해보세요!</h4>
						<p class="text-muted mt-2">평소에 어떻게 가야 할지 몰랐던 그 섬! <br>저희가 
						단 한번의 클릭으로 해결해 드립니다!</p>
						<input class="btn btn-primary" value="자세히 보기" onclick="location.href='/fishing/islandsReservation'"/>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i
							class="bi bi-chat-square-dots"></i>
						</span>
						<h4 class="my-2 fw-bold">경험을 공유하세요</h4>
						<p class="text-muted">섬을 좋아하는 모두가 이용할수 있는 커뮤니티입니다!<br>
						섬섬톡을 확인해보세요!</p>
						<input class="btn btn-primary" value="자세히 보기" onclick="location.href='/fishing/someTalk'"/>
					</div>
					<div class="col-md-4">
						<span class="fa-stack fa-4x"> <i
							class="bi bi-emoji-heart-eyes"></i>
						</span>
						<h4 class="my-2 fw-bold">이번주 날씨를 확인하세요!</h4>
						<p class="text-muted">간편하게 날씨를 확인하여 예약에 등록!<br>한눈에 날씨를 확인할수 있습니다~</p>
						<input class="btn btn-primary" value="자세히 보기" onclick="location.href='/fishing/weekendweather'"/>
					</div>
				</div>
			</div>

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
                    <img src="./resources/defaultimg/default.png" class="card-img-top border" alt="...">
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