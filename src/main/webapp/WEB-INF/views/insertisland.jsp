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
			<ul id="list">
		
			</ul>
</body>
<script>
var page=1;
var perPage=5;
var serviceKey="aRrhNJkloo/8IhvjldPa3sCw8ndEp0rL3DEbV0q5DlQu4w+FHu2u/wOWaDcC8/s5hsyxhQaP6bgNp/dEl7OCVQ==";

		$.ajax({
			url:'https://api.odcloud.kr/api/15072401/v1/uddi:aab44eac-714e-4da1-a2fc-ec295c657189?',
			type:'get',
			data:{
				'page':1,
				'perPage':10,
				'serviceKey':serviceKey
			},
			dataType:'json',
			success:function(data){
				console.log(data);				
				var content = "";
				data.data.replaceAll("\\s", "");
				console.log(data);
				data.data.forEach(function(item) {
				
						content +="<li>";
						content +="<div class ='a2'>"+item.지번+"</div>";
						content +="<div class ='b2'>"+item.무인도서명+"</div>";
						content +="<div class ='b2'>"+item.지목+"</div>";
						content +="<div class ='b2'>"+"</div>";
						content +="</a>"
						content +="</li>";
			
				});
				$("#list").empty();
				$("#list").append(content);
				
			},
					error:function(e){
						console.log(e)
					}
		})
	
</script>
</html>