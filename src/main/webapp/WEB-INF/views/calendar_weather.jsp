<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>


<meta charset="UTF-8">
<title>SOMEFISH</title>


<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">

<style>
* {
	font-fPMily: 'Do Hyeon', sans-serif;
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
		background-color: cornflowerblue;
		border: 1px solid black;
	}
		tbody td{
		height : 60px;
		}
	
#tableone th{
	width:200px;
	font-size:20px;
	border : 1px solid black;
	background-color: cornflowerblue;
	color:white;
}
#tableone thead td{
	width:500px;

}
#tableone tbody td{
	width:500px;
	border : 1px solid black;
	font-size : 20px;
	vertical-align: middle;
}

#tableone tbody td #waveone{
	width:500px;
	border : 1px solid black;
	font-size : 10px;
	vertical-align: middle;
}

	
#tabletwo th{
	width:200px;
	font-size:20px;
	border : 1px solid black;
	background-color: cornflowerblue;
	color:white;
}
#tabletwo thead td{
	width:500px;

}
#tabletwo tbody td{
	width:500px;
	border : 1px solid black;
	font-size : 20px;
	vertical-align: middle;
}



img{
	width : 160px;
	height:160px;
}
#waveone {
	text-align: center;
	vertical-align: middle;
	font-size:10px;
}
</style>


</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
	<div class="container mt-2">
		<div class="container justify-content-center">
			<div class='container'>
		<h2 class='text-dark font-weight-bold' style="margin-top: 25px;">인천항 오늘의 날씨</h2>
		<hr />
	</div>
			<table class="m-auto" id="tableone">
				<thead id="headlist">
					<tr>
						<th></th>
						<td>${today.TW_DATE}</td>
						<td>${tomor.TW_DATE}</td>
					</tr>
				</thead>

				<tbody id="list" style="height: 20px;">
					<tr>
						<th>하늘 상태</th>						
						
						<td> 
						<c:choose>
						<c:when test="${today.TW_PTY eq '없음'}"><img src="./resources/defaultimg/sunny.png"></c:when>
						<c:when test="${today.TW_PTY eq '비'}"><img src="./resources/defaultimg/rain.png"></c:when>
						<c:when test="${today.TW_PTY eq '비/눈'}"><img src="./resources/defaultimg/snowrain.png"></c:when>
						<c:when test="${today.TW_PTY eq '눈'}"><img src="./resources/defaultimg/snow.png"></c:when>
						<c:when test="${today.TW_PTY eq '소나기'}"><img src="./resources/defaultimg/rain.png"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>						
						</td>						
						
						<td>
						<c:choose>
						<c:when test="${tomor.TW_PTY eq '없음'}"><img src="./resources/defaultimg/sunny.png"></c:when>
						<c:when test="${tomor.TW_PTY eq '비'}"><img src="./resources/defaultimg/rain.png"></c:when>
						<c:when test="${tomor.TW_PTY eq '비/눈'}"><img src="./resources/defaultimg/snowrain.png"></c:when>
						<c:when test="${tomor.TW_PTY eq '눈'}"><img src="./resources/defaultimg/snow.png"></c:when>
						<c:when test="${tomor.TW_PTY eq '소나기'}"><img src="./resources/defaultimg/rain.png"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>							
						</td>
					</tr>
					
					<tr>
						<th>현재 기온</th>
						<td>${today.TW_TEMPER }</td>						
						<td>${tomor.TW_TEMPER }</td>
					</tr>
					
					<tr>
						<th>최저/최고 기온 </th>
						<td> <span style="color:cornflowerblue">${today.TW_TEMPERL }</span> / <span style="color:red;">${today.TW_TEMPERH }</span></td>						
						<td> <span style="color:cornflowerblue">${tomor.TW_TEMPERL }</span> / <span style="color:red;">${tomor.TW_TEMPERH }</span> </td>
					</tr>
					<tr>
						<th>강수 확률</th>
						<td>${today.TW_POP }</td>						
						<td>${tomor.TW_POP }</td>
					</tr>
					
					<tr>
						<th>강수량</th>
						<td>${today.TW_PCP }</td>						
						<td>${tomor.TW_PCP }</td>
					</tr>
					
					
					<tr>
						<th>파고</th>
						<td>${today.TW_WAVE }</td>						
						<td>${tomor.TW_WAVE }</td>
					</tr>
					
					<tr id="waveone">
						<th>간조 시간 / 간조 높이</th>
						<td><p style="color:cornflowerblue"><img src="./resources/defaultimg/coldwater.png" style="width:10px; height:20px;">${today.TW_AMLOWTIME } / ${today.TW_AMLOWLEVEL }</p> <p style="color:red"><img src="./resources/defaultimg/hotwater.jpg" style="width:9px; height:13px;">${today.TW_AMHIGHTIME } / ${today.TW_AMHIGHLEVEL }</p>
						<p style="color:cornflowerblue"> <img src="./resources/defaultimg/coldwater.png" style="width:10px; height:20px;">${today.TW_PMLOWTIME } / ${today.TW_PMLOWLEVEL }</p> <p style="color:red"><img src="./resources/defaultimg/hotwater.jpg" style="width:9px; height:13px;">${today.TW_PMHIGHTIME } / ${today.TW_PMHIGHLEVEL }</p></td>						
						
						<td><p style="color:cornflowerblue"><img src="./resources/defaultimg/coldwater.png" style="width:10px; height:20px;">${tomor.TW_AMLOWTIME } / ${tomor.TW_AMLOWLEVEL }</p> <p style="color:red"><img src="./resources/defaultimg/hotwater.jpg" style="width:9px; height:13px;">${tomor.TW_AMHIGHTIME } / ${tomor.TW_AMHIGHLEVEL }</p>
						<p style="color:cornflowerblue"> <img src="./resources/defaultimg/coldwater.png" style="width:10px; height:20px;">${tomor.TW_PMLOWTIME } / ${tomor.TW_PMLOWLEVEL }</p> <p style="color:red"><img src="./resources/defaultimg/hotwater.jpg" style="width:9px; height:13px;">${tomor.TW_PMHIGHTIME } / ${tomor.TW_PMHIGHLEVEL }</p></td>
					</tr>
		
				</tbody>
					
			</table>
	
			<hr/>
			
			<h2 class='text-dark font-weight-bold' style="margin-top: 25px;">주중 날씨</h2>
			<table class="m-auto mt-4" id="tabletwo">
				<thead>
					<tr>
						<th></th>

						<td>${third.W_DATE}</td>
						<td>${fouth.W_DATE}</td>
						<td>${fifth.W_DATE}</td>
						<td>${sixth.W_DATE}</td>
						<td>${seventh.W_DATE}</td>
					
					</tr>
				</thead>		
			
				<tbody>
					<tr>
						<td>오전기상</td>
						<td>
						<c:choose>
						<c:when test="${third.W_AMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>						
						<td>
						<c:choose>
						<c:when test="${fouth.W_AMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"> </c:when>
						<c:when test="${fouth.W_AMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>
						
						<td>
						<c:choose>
						<c:when test="${fifth.W_AMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>						
						
						<td>
						<c:choose>
						<c:when test="${sixth.W_AMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>
						</td>
	
						<td>
							<c:choose>
						<c:when test="${seventh.W_AMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>
						</td>						
					</tr>
					
					
					<tr>
					<td>오후기상</td>
						<td>
						<c:choose>
						<c:when test="${third.W_PMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${third.W_PMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>						
						<td>
						<c:choose>
						<c:when test="${fouth.W_PMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"> </c:when>
						<c:when test="${fouth.W_PMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fouth.W_PMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>
						
						<td>
						<c:choose>
						<c:when test="${fifth.W_PMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${fifth.W_PMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>	
						</td>						
						
						<td>
						<c:choose>
						<c:when test="${sixth.W_PMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${sixth.W_PMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>
						</td>
	
						<td>
							<c:choose>
						<c:when test="${seventh.W_PMSKY eq '맑음'}"><img src="./resources/defaultimg/sunny.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '구름많음'}"><img src="./resources/defaultimg/manyclouds.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '구름많고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '구름많고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '구름많고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '구름많고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '흐림'}"><img src="./resources/defaultimg/cloud.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '흐리고 비'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '흐리고 눈'}"><img src="./resources/defaultimg/snow.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_PMSKY eq '흐리고 비/눈'}"><img src="./resources/defaultimg/snowrain.png" style="height:100px; width:100px;"></c:when>
						<c:when test="${seventh.W_AMSKY eq '흐리고 소나기'}"><img src="./resources/defaultimg/rain.png" style="height:100px; width:100px;"></c:when>
						<c:otherwise><img src="./resources/defaultimg/sunny.png"></c:otherwise>
						</c:choose>
						</td>					
					</tr>
					
						<tr>
						<td>강수확률(오전/오후)</td>
						<td>${third.W_AMPOP } / ${third.W_PMPOP }</td>						
						<td>${fouth.W_AMPOP } / ${fouth.W_PMPOP }</td>	
						<td>${fifth.W_AMPOP } / ${fifth.W_PMPOP }</td>	
						<td>${sixth.W_AMPOP } / ${sixth.W_PMPOP }</td>	
						<td>${seventh.W_AMPOP } / ${seventh.W_PMPOP }</td>					
					</tr>
					
						<tr>
						<td>최고/최저 기온</td>
						<td><span style="color:cornflowerblue">${third.W_TEMPERL }</span> / <span style="color:red">${third.W_TEMPERH }</span></td>						
						<td><span style="color:cornflowerblue">${fouth.W_TEMPERL }</span> / <span style="color:red">${fouth.W_TEMPERH }</span></td>
						<td><span style="color:cornflowerblue">${fifth.W_TEMPERL }</span> / <span style="color:red">${fifth.W_TEMPERH }</span></td>
						<td><span style="color:cornflowerblue">${sixth.W_TEMPERL }</span> / <span style="color:red">${sixth.W_TEMPERH }</span></td>
						<td><span style="color:cornflowerblue">${seventh.W_TEMPERL }</span> / <span style="color:red">${seventh.W_TEMPERH }</span></td>
						</tr>
					
					<tr>
						<td>오전/오후 파고</td>
						<td>${third.W_AMWAVELOW }~${third.W_AMWAVEHIGH } / ${third.W_PMWAVELOW }~${third.W_PMWAVEHIGH }</td>						
						<td>${fouth.W_AMWAVELOW }~${fouth.W_AMWAVEHIGH } / ${fouth.W_PMWAVELOW }~${fouth.W_PMWAVEHIGH }</td>
						<td>${fifth.W_AMWAVELOW }~${fifth.W_AMWAVEHIGH } / ${fifth.W_PMWAVELOW }~${fifth.W_PMWAVEHIGH }</td>
						<td>${sixth.W_AMWAVELOW }~${sixth.W_AMWAVEHIGH } / ${sixth.W_PMWAVELOW }~${sixth.W_PMWAVEHIGH }</td>
						<td>${seventh.W_AMWAVELOW }~${seventh.W_AMWAVEHIGH } / ${seventh.W_PMWAVELOW }~${seventh.W_PMWAVEHIGH }</td>				
					</tr>

				</tbody>
			</table>
			<hr/>
		</div>
			

	</div>
	
</body>
<script>

</script>
</html>