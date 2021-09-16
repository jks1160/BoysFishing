<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:cornflowerblue;">
			<div class="container-fluid">
			  <a class="navbar-brand" href="#">
				<img src="fishing.png" alt="" width="50" height="40">
			  </a>
			  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			  </button>
				<form class="d-flex m-auto position-absolute top-50 start-50 translate-middle">
					<input class="ms-5" type="search" placeholder="통합검색" aria-label="Search">
					<button class="btn btn-outline-light btn-sm ms-2 text-cornflowerblue" type="submit">검색</button>
				</form>
				<div class="d-flex" id="menu">

			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="loginPage">로그인/회원가입</a>
				  </li>
				  <a class="navbar-brand" href="#">
					<img src="bell.jpg" alt="" width="50" height="40">
				  </a>
				
				
			  </div>
			 </div>
			</div>
		  </nav>
		  <nav class="navbar navbar-expand-lg navbar-light" style="background-color:cornflowerblue;">
			<div class="container-fluid ">
			
			<div class="d-flex position-absolute top-0 start-50 translate-middle" id="menu">
			  <div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="test">섬정보 / 예약</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="#">섬섬톡</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="#">Q&A</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="#">마이페이지</a>
				  </li>
				  <li class="nav-item">
					<a class="nav-link active text-white" aria-current="page" href="#">공지사항</a>
				  </li>
											
			  </div>
			 </div>
			</div>
		  </nav>
</body>
</html>