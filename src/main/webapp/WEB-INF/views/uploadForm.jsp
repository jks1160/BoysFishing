<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

console.log("${fileName}");
if("${fileName}" != ""){
	var elem = opener.document.getElementById("preprofile");
	elem.setAttribute("src","/photo/${fileName}");
	opener.document.getElementById("fileName").value = "${fileName}";
	self.close();
}
function fileUpload(){
	$("form").submit();
}

</script>
</html>