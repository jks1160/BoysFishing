<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initail-scale=1.0">
    <title>j-query 강좌</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <title>Insert title here</title>
</head>
<body>
	<div class="container my-5">
		<div class="row my-3">
			<div class="col">
				<h2>QNA 게시판</h2>
			</div>
		</div>
		<hr>
        <div class="row list">
            <div class="col my-1">
                <div id="accordion" class="my-1">
                    <div class="card">
                        <div class="card-header">
                            <a class="card-link" data-toggle="collapse" href="#collapseOne">
                                <b>제목 </b>
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse hide" data-parent="#accordion">
                            <div class="card-body">
                                <h1>테스트</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</body>
<script>
    $('.list:gt(4)').hide().last().after(
    $("<input type='button' class='btn btn-outline-dark float-right' />").attr({href:'#',value:'더보기'}).click(function(){
        var a = this;
        $('.list:not(:visible):lt(5)').fadeIn(function(){
         if ($('.mydata:not(:visible)').length == 0) $(a).remove();   
        }); return false;
    })
);
</script>
</html>