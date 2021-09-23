<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
		 rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
		 crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		  integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" 
		  crossorigin="anonymous"></script>
		<meta charset="UTF-8">
		<title>비밀번호 변경</title>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<!-- 글꼴 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<style>
		* {
 	    font-family: 'Do Hyeon', sans-serif;
	}
			table, td ,th{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		text-align: center;
	}
	    thead{
		font-weight:600;
		text-align: center;
		background-color: activecaption;
	}
	
		</style>

	</head>
	<body>
	<h2>비밀번호 재설정</h2>
	<form action="PwUpdate" method="POST" >
	<table>
		<tr>
			<th>새 비밀번호 입력</th>
			<td><input type="password" id="newPw" name="newPw" type="text" maxlength="16" placeholder="8~16자로 입력해주세요." value=""/></td>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" id="newPwChk" name="PwUpdate" type="text" maxlength="16" placeholder="8~16자로 입력해주세요." value=""/></td>
		</tr>
		<tr>
		<td colspan="2"><button type="button" onclick="PwChk()">변경</button></td>
		</tr>
	</table>
	</form>
	</body>
	<script>
		
	var msg = "${msg}";
	if(msg == "성공"){	
		alert("비밀번호 변경에 성공하였습니다.");
		window.close();
	}else if(msg == "실패"){
		alert("비밀번호 변경에 실패하였습니다. 다시 시도해 주세요.");
	}

	function PwChk(){
	var newPw = $("#newPw").val();
	var newPwChk = $("#newPwChk").val();
	var space = /\s/g; 
	console.log(newPw);
	console.log(newPwChk);
	  if(newPw.length<8||newPw.length>16){
		  alert("비밀번호는 8~16자 이내로 사용가능합니다.");
		  return;
	  }else if(newPw!=newPwChk){
		  alert("비밀번호가 다릅니다. 다시한번 확인해 주세요.");
		  return;
	  }else if(newPw.match(space)){
		  alert("공백은 사용할 수 없습니다.");
		  return;
	  }else{
		  $("form").submit();	    
	  }
	}
	  
	</script>
</html>