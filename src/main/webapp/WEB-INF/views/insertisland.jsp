<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
			ul{
				list-style: none;
			}
			li{
				line-height: 30px;
				border: 1px solid lightgray;
				padding: 10px;
				margin: 5px;
				cursor: pointer;
			}
			.centerName{
				font-weight: 600;
			}
			.address{
				font-size: 15px;
				color: lightgray;
			}
			a{
				text-decoration: none;
				color: black;
			}
			a:visited{
				color:coral;
				text-decoration: none;
			}
		</style>
</head>
<body>
<input type="button" onclick="islandinsert()" value="db 업데이트">
<input type="button" onclick="islanddelete()" value="db 삭제">

			<ul id="list">
		
			</ul>
			
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
					console.log(data);				
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
			console.log(data,"성공");
			
		},
		error:function(e){
			console.log(e);
		}
	})
}
</script>
</html>