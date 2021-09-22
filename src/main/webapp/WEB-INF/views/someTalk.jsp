<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<h1>섬토크</h1>
<div class="someList">
	<div class="someCard">
	
	</div>
</div>

<button>더보기</button>
</body>
<script>
someListCall();
function someListCall(){
	$.ajax({
		type : 'get',
		url : 'someList',
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			drawList(data);
		},
		error : function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	
}

function infoListCall(){
	$.ajax({
		type : 'get',
		url : 'infoList',
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			drawList(data);
		},
		error : function(e){
			console.log(e);
		}
	});
	
function revListCall(){
	$.ajax({
		type : 'get',
		url : 'revList',
		dataType : 'JSON',
		success : function(data){
			console.log(data);
			drawList(data);
		},
		error : function(e){
			console.log(e);
		}
	});
}
}

</script>
</html>