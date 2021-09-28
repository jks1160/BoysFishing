<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="icon.png">
<meta name="viewport" content="width=device-width, initail-scale=1.0">
<title>SOMEFISH 섬섬톡</title>
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

	<div id="reply_card">
		<section>
			<div>
			<!-- 댓글목록 -->
			<div>
				<!-- 댓글 목록이 들어가는 곳 -->
			</div>
			<!-- 댓글 작성 -> 로그인 시에만 가능 -->
			<c:if test="${not empty sessionScope.userinfo.u_userid }">
					<div>
						<div>
							<a href="">
								<img id="write_reply_profileImge" src="resources/defaultimg/defaultprofile.png"/>
							</a>
						</div>
						<div>
							<input id="input_reply" type="text" placeholder="댓글입력">
						</div>
						<div>
							<button type="button" idx="">댓글 달기</button>
						</div>
					</div>
				</c:if>
			</div>
		</section>
	</div>

</body>
<script>
	const ReplyList = function(no){
		$.ajax({
			url : 'ReplyList',
			type : 'get',
			data : {
				no : no
			},
			success : function(data){
				
				//댓글 목록을 html로 담기
				var listHtml = "";
				for(const i in data){
					var no = data[i].no;
					var 
				}
			}
		})
	}


</script>
</html>