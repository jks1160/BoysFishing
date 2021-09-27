<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>SOMEFISH 섬섬톡 수정</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
img {
	height: 100px;
	width: 100px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container m-5 h-100">
	<form action="someWrite" method="POST">
	<div class="row justify-content-md-center">
	<input type="hidden" name="b_num" value="${dto.b_num }">
		<div class="col-10">
			<h2>수정하기</h2>
			<div class="text-right">
			<i class="fas fa-fish m-1"></i>
	            <label for="fishes">어종 : &nbsp;</label>
	            <select class="form-contro form-inlinel" id="fishes" name="fish">
	            <c:forEach var="fish" items="${fishList}">
	            	<c:if test="${fish eq dto.fish }"><option value="${fish }" selected>${fish }</option></c:if>
	              	<option value="${fish }">${fish }</option>
	            </c:forEach>
	            </select>
	        </div>
		</div>
	</div>
	<hr>
	<div class="row justify-content-md-center">
		<div class="col-2">
			<label for="usr"><b>제목 : </b></label>
		</div>
		<div class="col-5">
			<div class="form-group">
				<input type="text" class="form-control" id="usr" name="b_subject" value="${dto.b_subject }">
			</div>
		</div>
		<div class="col-3">
			<div class="form-group form-inline">
				<label for="selec">카테고리 :</label>
            	<select class="form-control form-inline mx-2" id="selec" name="b_code">
              		<option value="B001" <c:if test="${dto.b_code eq 'B001' }">selected</c:if>>자유게시판</option>
              		<option value="B002" <c:if test="${dto.b_code eq 'B002' }">selected</c:if>>후기게시판</option>
              		<option value="B003" <c:if test="${dto.b_code eq 'B003' }">selected</c:if>>정보게시판</option>
            	</select>
            </div>
		</div>
	</div>
	<div class="row justify-content-md-center my-3">
		<div class="col-10">
		<hr>
			<div class="form-group">
		  		<div class="border p-3" id="editable" contenteditable="true" style="height:450px;"></div>
				<input id="content" type="hidden" name="b_content" value="" />
			</div>
		</div>
	</div>
	<div class="row justify-content-end">
		<div class="col-1">
			<input type="button" class= "btn btn-outline-dark btn-sm" value="사진올리기" onclick="fileUp()" />
		</div>
		<div class="col-2">
			<button type="button" id="save" class= "btn btn-outline-dark btn-sm">수정하기</button>
		</div>
	</div>
	</form>
</div>
<hr>
</body>
<script>
	$("#editable").html('${dto.b_content}');
	$("a.img").attr("onclick","del(this);");
	$("a.img").append("<b>X</b>");

function fileUp() {
	// 2번째 매개변수 창의 이름
	window.open('uploadForm', 'file upload', 'width=400, height=100');
}
$("#save").click(function() {
	// content에서 a태그 하위의 b태그 삭제
	$("#editable").find("b").remove();
	// a 태그 자체를 삭제? a태그의 onclick 만 삭제 ------ 수정할 때를 생각한다면 onclick만 삭제하는 것이 좋음.
	$("#editable").find("a").removeAttr("onclick");
	//div태그 사이에 있는 내용이기에 html로 값 받아옴 
	$("#content").val($("#editable").html());
	$("form").submit();
});

function del(elem){ //(this)
	var fileName = elem.id.substring(elem.id.lastIndexOf("/")+1);
	// ajax를 쓰는 이유는 기존에 작성한 글을 지우지 않기 위하여
	// ajax를 통하여 서버에 저장된 파일을 지우고 세션의 값만 지운다 그리고 성공여부를 success로 반환하여 파일이 담긴 태그를 지울지 정한다.
	$.ajax({
		url:"fileUpdateDelete",
		type:"get",
		data:{"fileName": fileName},
		dataType:"json",
		success:function(data){
			console.log(data);
			if(data.success){
				$(elem).remove();
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}
</script>
</body>
</html>