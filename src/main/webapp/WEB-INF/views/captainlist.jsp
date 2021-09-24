<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
	<head>


		<meta charset="UTF-8">
		<title>SOMEFISH</title>
		
		
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
	    thead td{
	    width:300px;
		font-weight:600;
		text-align: center;
		background-color: activecaption;
		border: 1px solid black;
	}
		
		</style>


	</head>
	<body>
	<jsp:include page="header.jsp"></jsp:include>

<div class="container mt-4">
	<div class="container justify-content-center">
	<p class="text-center" style="font-size:40px;">선장 신청내역</p>
	<table class="mt-4">
	<thead>
			<tr>
				<td>아이디</td>
				<td>신청시간</td>
				
				<td>신청 날짜</td>
				<td>담당자</td>
			</tr>
	</thead>
		
			<tbody id="list" >


			</tbody>	
			<tr>
				<td colspan="6">
					<!-- 페이징이 표시될 부분 
					class="container position-relative top-50 start-50 translate-middle mx-auto" 
					-->
					<div class="container row" >
						<nav class="container col-auto mt-3" aria-lable="Page navigation"  style="text-align: center;">
							<ul class="pagination" id="pagination"></ul>
						</nav>
					</div>
				</td>
			</tr>			
		</table>
		</div>
		<input type="hidden" value="5" id="pagePerNum"/>
</div>
	</body>
	<script>
	var currPage = 1;
	listCall(currPage);
	
	$("#pagePerNum").change(function(){
		//페이징 초기화
		$("#pagination").twbsPagination('destroy');
		listCall(currPage);
	});
	
	function listCall(page){		
		//{pagePerNum}/{page}
		var reqUrl = '/fishing/manage/captainlist/'+$("#pagePerNum").val()+'/'+page;
		console.log('request url : '+reqUrl);
		console.log(page+" page 가져오기");		
		$.ajax({
			url:reqUrl,
			type:'get',
			dataType:'json',
			success:function(data){
				console.log(data);
				listPrint(data.list);//리스트 그리기
				currPage = data.currPage;
				//페이징 처리
				$("#pagination").twbsPagination({
					startPage: data.currPage,//시작페이지
					totalPages: data.pages,  //총 페이지 갯수
					visiblePages:5, //보여줄 페이지 갯수
					onPageClick: function(e,page){
						//console.log(e,page);
						listCall(page);
					}
				});				
			},
			error:function(error){
				console.log(error);
			}			
		});		
	}
	function listPrint(list){
		var content = "";
		
		for(var i=0; i<list.length; i++){
			content +="<tr>";
			content += "<td><a href='/fishing/manage/capreq_detail?u_userid="+list[i].u_userid+"'>"+list[i].u_userid+"</a></td>";			
			content += "<td>"+list[i].cap_idYSN+"</td>";			
			content += "<td>"+list[i].cap_requestTime+"</td>";
			content += "<td>"+list[i].cap_manager+"</td>";
			content +="</tr>";
		}
		$("#list").empty();
		$("#list").append(content);
		
	}
	
	
	
	</script>
</html>


































