<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<!-- button으로 할 경우 500 애러가 떨어짐 - button은 input에 데이터가 담겨진 상태에서 바로 submit하는 것이므로. -->
		<input type="file" name="file" onchange="fileUpload()"/>
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