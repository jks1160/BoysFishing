<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOMEFISH</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
</head>
<style>
	.boox1{
		display: inline-block;
	}
	.entire{
		
		text-align: center;
	}
</style>
<body>
	<div class="entire">
	<form action="someWrite" method="GET">
		<!-- 제목 -->
		<div class="boox1">
			<input type="text" name="b_subject" placeholder="제목을 입력해주세요" required>
		</div>
		<div class="boox1">
			<select name='b_code'>
				  <option value='' selected>카테고리 선택</option>
				  <option value='B001'>자유게시판</option>
				  <option value='B002'>후기게시판</option>
				  <option value='B003'>정보게시판</option>
				</select>
		</div>
		<hr>
		<div class="container">
		  <textarea class="summernote" name="b_content"></textarea>    
		</div>
		<button>등록하기</button>
	</form>
</div>
	<script>
	$('.summernote').summernote({
		  height: 150,
		  lang: "ko-KR"
		});
	</script>
</body>
<!-- 
<body>
	<form action="someWrite" method="GET">
		<div>
			<input type="text"/>
		</div>
		<div>
			
		</div>
	</form>
</body>
 -->
</html>