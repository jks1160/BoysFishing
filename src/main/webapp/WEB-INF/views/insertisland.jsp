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
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container mt-4" style="border:1px solid blue; width:100%">
 		<div class="row justify-content-md-center">
			<input class="col-3 justify-content-md-center m-auto" type="button" onclick="islandinsert()" value="섬 db 업데이트">
			<input class="col-3 justify-content-md-center m-auto" type="button" onclick="islanddelete()" value="섬 db 삭제">
			<input class="col-3 justify-content-md-center m-auto" type="button" onclick="todayweatherinsert()" value="날씨 정보 업데이트">
			<input class="col-3 justify-content-md-center m-auto" type="button" onclick="weekendweatherinsert()" value="일주일날씨 정보 업데이트">
		</div>
	</div>
</body>
<script>
function islandinsert(){
	$.ajax({
		url: "apiCalls",
		type:'get',
		data:{		
		},
		dataType:'json',
				success:function(data){
					alert(data.island);	
					
				},
				error:function(e){
					console.log(e);
				}
	})
}
	
function islanddelete(){
	$.ajax({
		url:"islanddel",
		type:'get',
		datatype:'json',
		success:function(data){
			alert("삭제에 성공하였습니다.");
		},
		error:function(e){
			console.log(e);
		}
	})
}

function todayweatherinsert(){
	$.ajax({
		url:"todayweatherinsert",
		type:'get',
		datatype:'json',
		success:function(data){
			alert(data.suc);
		},
		error:function(e){
			console.log(e);
		}
	})
}

function weekendweatherinsert(){
	$.ajax({
		url:"weekendweatherinsert",
		type:'get',
		datatype:'json',
		success:function(data){
			console.log(data);
		},
		error:function(e){
			console.log(e);
		}
	})
}
</script>
</html>