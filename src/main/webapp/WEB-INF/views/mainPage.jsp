<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>j-query 강좌</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
</style>
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
            <form class="d-flex m-auto">
               <input class="ms-5" type="search" placeholder="통합검색" aria-label="Search">
               <button class="btn btn-outline-light btn-sm ms-2 text-cornflowerblue" type="submit">검색</button>
            </form>
            <div class="d-flex" id="menu">

           <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
               <a class="nav-link active text-white" aria-current="page" href="#">섬보기</a>
              </li>
              <li class="nav-item">
               <a class="nav-link text-white" href="#">예약하기</a>
              </li>
              <li class="nav-item">
               <a class="nav-link active text-white" aria-current="page" href="#">섬섬톡</a>
              </li>

              <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 Dropdown
               </a>
               <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                 <li><a class="dropdown-item" href="#">Action</a></li>
                 <li><a class="dropdown-item" href="#">Another action</a></li>
                 <li><hr class="dropdown-divider"></li>
                 <li><a class="dropdown-item" href="#">Something else here</a></li>
               </ul>
              </li>
            
            </ul>            
           </div>
          </div>
         </div>
        </nav>

</body>
</html>