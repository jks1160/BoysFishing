<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>j-query 강좌</title>
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
</style>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<!-- button으로 할 경우 500 애러가 떨어짐 - button은 input에 데이터가 담겨진 상태에서 바로 submit하는 것이므로. -->
		<input type="file" class= "btn btn-outline-dark btn-sm" name="file" onchange="fileUpload()"/>
	</form>
</body>
<script type="text/javascript">

// 저장된 파일 목록은 어떻게??
//1. UI를 이용하여
// - input에 넣는 방법
// - ajax 일 경우 : 파일 list라는 별도의 파라메터를 사용

//2. session 을 이용하는 방법

var path = "${path}";
console.log(path);
if(path != ""){
	// 부모창을 가져오기 위하여 자바스크립트 객체로 담아옴.
	var elem = opener.document.getElementById("editable");
	var content = "";
	// del이라는 메소드를 writeForm.jsp에 선언해둠
	// a 태그를 달아 둠으로써 이벤트 발생시 함수를 실행.
	content += "<a href = '#' id = '${path}' onclick='del(this)' >";
	content += "<img src='${path}' width='250'/>";
	content += "<b>X</b></a>";
	// 태그를 적용시키기 위하여 innerHTML로 추가해줘야 한다.
	elem.innerHTML += content; // 사진을 여러개 저장하기 위하여 누적합을 해준다 elem.empty()를 안해줌
	// window는 부모창을 닫을때 주로 쓰고 self는 자식창을 닫을때 씀
	self.close();
}
function fileUpload(){
	$("form").submit();
}

</script>
</html>