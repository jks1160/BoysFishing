<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style type="text/css">
* {
	font-family: 'Do Hyeon', sans-serif;
}
div.card{
    height: 35vh;
}
.card-img-top{
    height: 20vh;
}
.card-text{
    height: 9vh; 
    overflow: hidden;
    text-overflow: ellipsis;
}
.card-title{
	height:5vh;
	overflow: hidden;
    text-overflow: ellipsis;
}
a.content{
    display: block;
    color:black;
}
.table{
    text-align: center;
}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class="container my-5">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>인기 게시글</h2>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>인기 섬 리스트</h2>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
            <div class="col mx-1 border">
                <div class="card">
                    <img src="resources/default.png" class="card-img-top border" alt="...">
	                    <div class="card-body">
                    	<a class="content" href="/">
		                      <b class="card-title border">Card title</b>
		                      <p class="card-text border">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                    </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col mt-5 mb-2">
                <h2>공지사항</h2>
            </div>
        </div>
        <hr>
        <div class="row my-3">
            <div class="col">
                <table class="table">
                    <thead>
                      <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                      </tr>
                    </thead>
                    <tbody>
                        <tr onClick="location.href='#'" style="cursor:pointer;">
                            <td>John</td>
                            <td>Doe</td>
                            <td>john@example.com</td>
                        </tr>
                      <tr onClick="location.href='#'" style="cursor:pointer;">
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                      </tr>
                      <tr onClick="location.href='#'" style="cursor:pointer;">
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
                      </tr>
                    </tbody>
                  </table>
            </div>
        </div>
        <div class="row my-3 justify-content-md-center">
            <div class="col-md-auto">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">이전</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                  </ul>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	var currPage = 1;

listCall(currPage);

function listCall(page) {
    //{pagePerNum}/{page}
    //이젠 param으로 값을 넘기는 것이 아닌 url로 처리할 것(restful 방식)
    //select 가 변경 되었을 때 변경되어 반영되어야함

    var reqUrl = 'list/' + $("#pagePerNum").val() + '/' + page;
    console.log('request url:' + reqUrl);
    console.log(page + "page가져오기");

    $.ajax({
        url : reqUrl,
        type : 'get',
        data : {},
        dataType : 'json',
        success : function(data) {
            console.log(data);
            listPrint(data.list); // 리스트 그리기
            currPage = data.currPage;
            // 페이징 처리
            $("#pagination").twbsPagination({
                startPage:data.currPage, // 시작페이지
                totalPages:data.pages, // 총 페이지 갯수
                visiblePages:5, //보여줄 페이지 갯수
                onPageClick:function(e,page){
                    console.log(e,page);
                    listCall(page);
                }
                
            });
        },
        error : function(error) {
            console.log(error);
        }
    });
}

function listPrint(list){
    var content = "";
    
    for(var i = 0; i<list.length; i++){
        content += "<tr>";
        content += "<td>"+list[i].idx+"</td>";
        content += "<td>"+list[i].subject+"</td>";
        content += "<td>"+list[i].user_name+"</td>";
        
        // miliscondes 로 표현됨 그래서 Date() 를 통해서 바꿔야 함
        var date = new Date(list[i].reg_date);
        content += "<td>"+date.toLocaleDateString("ko-KR")+"</td>";
        
        content += "<td>"+list[i].bHit+"</td>";
        content += "</tr>";
        $("#list").empty();
        $("#list").append(content);
    }
}

</script>
</html>