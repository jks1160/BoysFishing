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
<input type="button" onclick="shownm()" value="show">
			<ul id="list">
		
			</ul>
			
</body>
<script>
function shownm(){

	$.ajax({
		url:'apiCall',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			console.log(data.features[0]);	
			console.log(data.features[0].attributes);				
			var content = "";
		
			data.features.forEach(function(item) {
				 	content +="<li>";
					content +="<div class ='b2'>"+item.attributes.isln_nm+"</div>";
					content +="</li>";	
		
			}); 
			$("#list").empty();
			$("#list").append(content);

			 
		},
				error:function(e){
					console.log(e)
				}
	})
}
	
</script>
</html>