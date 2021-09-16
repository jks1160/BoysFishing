<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" style="background-color:cornflowerblue;">
			<div class="container-fluid">
			  <a class="navbar-brand" href="./">
				<span style="color: white">SOMEFISH</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-image-alt" style="color: white"   viewBox="0 0 16 16">
  		<path d="M7 2.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0zm4.225 4.053a.5.5 0 0 0-.577.093l-3.71 4.71-2.66-2.772a.5.5 0 0 0-.63.062L.002 13v2a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-4.5l-4.777-3.947z"/>
				</svg>
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
					<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-bell" style="color: white" viewBox="0 0 16 16">
					  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
					</svg>
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
					<a class="nav-link active text-white" aria-current="page" href="test">섬정보/예약</a>
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