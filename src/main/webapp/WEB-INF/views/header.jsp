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
<script src="../resources/js/jquery.twbsPagination.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
</style>
<div>
	<nav class="navbar navbar-expand-lg navbar-light "
		style="background-color: cornflowerblue;">
		<div class="container-fluid">
			<a class="navbar-brand" href="/fishing/"> <span
				style="color: white">SOMEFISH</span> <svg
					xmlns="http://www.w3.org/2000/svg" width="36" height="36"
					fill="currentColor" class="bi bi-image-alt" style="color: white"
					viewBox="0 0 16 16">
  		<path
						d="M7 2.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0zm4.225 4.053a.5.5 0 0 0-.577.093l-3.71 4.71-2.66-2.772a.5.5 0 0 0-.63.062L.002 13v2a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-4.5l-4.777-3.947z" />
				</svg>
			</a>

			<form
				class="d-flex m-auto  top-50 start-50">
				<input class="ms-5" type="search" placeholder="통합검색"
					aria-label="Search">
				<button
					class="btn btn-outline-light btn-sm ms-2 text-cornflowerblue"
					type="submit">검색</button>
			</form>
			<div class="d-flex" id="menu">

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

						<li class="nav-item d-flex"><c:choose>
								<c:when test="${empty sessionScope.userinfo }">
									<a class="nav-link active text-white" aria-current="page"
										href="loginPage">로그인/회원가입</a>
								</c:when>
								<c:otherwise>
									<b class="nav-link active text-white">"${sessionScope.userinfo.u_userid }"
										님</b>
									<a class="nav-link active text-white" href="/fishing/logOut">로그아웃</a>
								</c:otherwise>
							</c:choose></li>
					</ul>
					<a class="navbar-brand" href="#"> <svg	xmlns="http://www.w3.org/2000/svg" width="36" height="36"
							fill="currentColor" class="bi bi-bell" style="color: white"
							viewBox="0 0 16 16">
					  <path
								d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z" />
					</svg>
					</a>

				</div>
			</div>
		</div>
	</nav>
	<nav class="navbar navbar-expand-sm container-row" 
		style="background-color: cornflowerblue; height: 30px;">
		<div class="mx-auto"
			id="menu">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/fishing/islandsReservation">섬정보/예약</a>
					</li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/fishing/someTalk">섬섬톡</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/fishing/qna">Q&A</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/fishing/myPage">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="#">공지사항</a></li>
					<li class="nav-item"><a class="nav-link active text-white"
						aria-current="page" href="/fishing/calendar">조재현(달력 작업중)</a></li>
					<li class="nav-item"><c:choose>

							<c:when test="${empty sessionScope.userinfo}"></c:when>
							<c:when test="${sessionScope.userinfo.u_manageryn eq 'N' }"></c:when>

							<c:when test="${sessionScope.userinfo.u_manageryn eq 'Y' }">
<a class="nav-link active text-white" type="button"	data-bs-toggle="collapse"
data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent"
	aria-expanded="false" aria-label="Toggle navigation"> 
	<span>관리자 메뉴</span></a>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</div>

	</nav>



	<div class="collapse opacity-50" id="navbarToggleExternalContent">
		<div class="bg-primary p-2">
			<div class="container">
				<div class="row">
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">회원정보</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page"
							href="/fishing/manage/captainlist">선장관리</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">신고관리</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">블랙리스트관리</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">Q&A관리</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">배편관리</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page" href="#">공지사항</a>
					</div>
					<div class="col-6 lg-6">
						<a class="nav-link active text-white" aria-current="page"
							href="/fishing/insertisland">섬 관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
