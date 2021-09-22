<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Do Hyeon', sans-serif;
}

.empty-box {
	width: 40px;
	height: 40px;
	background-color: black;
	display: inline;
}

</style>
</head>
<body>
	<!-- 헤더  -->
	<jsp:include page="header.jsp"></jsp:include>

	<!-- 선장 등록 요청 페이지 -->
	<div class='container'>
		<h2 class='text-dark font-weight-bold text-center'
			style="margin-top: 25px;">선장 등록 요청</h2>
		<hr />
	</div>
	<div class='container'>
		<h4 class='text-dark font-weight-bold text-left' style='margin-left:25px'>자격 및 면허</h4>
		<form action='captain_request' class="md-form form-inline" method="post" enctype="multipart/form-data">
			<div class="file-field col-xs-6 col-md-4">
				<div class="z-depth-1-half mb-4">
					<img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg"
						class="img-fluid" width="280px" height="350px" id="preview-image">
				</div>
				<div class="d-flex justify-content-left">
					<div class="btn btn-mdb-color btn-rounded float-left">
						<input type='text' class='form-control float-left' style='float: left' id='imgName' readonly />
						<label for='test'><span class='btn btn-primary float-left' style='display: inline' > 자격증 올리기</span> </label> 
						<input type="file" id='test'  name='filesname[]' hidden='hidden'  multiple="multiple"/>
					</div>
				</div>
			</div>
			<div id="pr_img" class='form-control col-xs-6 col-md-4'>
					<!-- 사진 이름 올라가는 공간 -->
			</div>
			
			<button class='btn btn-primary'>등록</button>
			<input type='button' class='btn btn-primary' value='뒤로가기' onclick="location.href='/fishing/myPage'">
		</form>
	</div>

</body>
<script>
function readMultiImage(input){
	if(input.files){ // 인풋 태그(file)에 파일이 있을 경우
	
		console.log(input.files[0].name);
		
		var content ="";
		for(var i =0; i<input.files.length; i++){
			content +="<span>"+input.files[i].name+"</span> <hr/>";	
		}
		$("#pr_img").append(content);
		$("#imgName").val(input.files[0].name);
	}	
}
///////사진 선택시 미리보기 변경/////////
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader();
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image");
            previewImage.src = e.target.result;
        };
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0]);
    }
};

const inputMultiImage = document.getElementById("test"); // 인풋 파일 요소 담기

// 사진이 변경 됐을 때 반응하도록
inputMultiImage.addEventListener("change", function(e){
	readMultiImage(e.target);
	readImage(e.target);
});


</script>
</html>