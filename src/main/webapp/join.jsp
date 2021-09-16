<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="icon.png">
      	<meta name="viewport" content="width=device-width, initail-scale=1.0">
        <title>j-query 강좌</title>
      	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container my-5">
            <form>
                <div class ="row my-3">
                    <div class="col">
                        <h2>
                            회원가입
                            <small class="text-muted">(일반 회원)</small>
                        </h2>
                    </div>
                </div>
                <hr>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="id">아이디 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" name= "id" class="form-control">
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-outline-dark" onclick="">중복확인</button>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="pw">비밀번호 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" name= "pw" class="form-control">
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="pwck">비밀번호 확인 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" name= "pwck" class="form-control">
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="nick">닉네임 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" id="nick" name= "nick" class="form-control">
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-outline-dark" onclick="">중복확인</button>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="email">이메일 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" id="eamil" name= "nick" class="form-control">
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="phone">전화번호 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" id="phone" name= "nick" class="form-control">
                    </div>
                </div>
                <hr>
                <div class="row my-3">
                    <div class="col-2 offset-9">
                        <button type="button" class="btn btn-outline-dark" onclick="">회원가입 신청</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>