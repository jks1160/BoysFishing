<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="icon.png">
      	<meta name="viewport" content="width=device-width, initail-scale=1.0">
        <title>j-query 강좌</title>
      	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container my-5">
            <form class="validation-form" action="join" method="POST" novalidate>
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
                        <input type="text" id="id" class="form-control" name="U_userid" maxlength="20" placeholder = "특수문자를 제외한 20자로 입력해주세요." required>
                        <div class="invalid-feedback"> 아이디를 입력해주세요. </div>
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-outline-dark overCheck" id="test">중복확인</button>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="pw">비밀번호 : </label>
                    </div>
                    <div class="col-5">
                        <input type="password" class="form-control" name="U_userpw" minlength="8" maxlength="16" placeholder="8~16자로 입력해주세요." required>
                        <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="pwck">비밀번호 확인 : </label>
                    </div>
                    <div class="col-5">
                        <input type="password" name= "pwck" class="form-control" minlength="8" maxlength="16" placeholder="8~16자로 입력해주세요." required>
                        <div class="invalid-feedback"> 비밀번호를 한번 더 입력해주세요. </div>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="nick">닉네임 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" id="nick" class="form-control" name="U_usernickname" maxlength="20" placeholder="특수문자를 제외한 20자로 입력해주세요." required>
                        <div class="invalid-feedback"> 닉네임을 입력해주세요. </div>
                    </div>
                    <div class="col-2">
                        <button type="button" class="btn btn-outline-dark overCheck">중복확인</button>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="email">이메일 : </label>
                    </div>
                    <div class="col-3">
                        <input type="text" id="eamil" name= "U_useremail" class="form-control" required>
                        <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    </div>
                    <div class="col-3">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                              <label class="input-group-text" for="inputGroupSelect01">@</label>
                            </div>
                            <select class="custom-select" id="inputGroupSelect01">
                              <option value="naver.com">naver.com</option>
                              <option value="hanmail.net">hanmail.net</option>
                              <option value="gamil.com">gamil.com</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class ="row my-3">
                    <div class="col-2 offset-2">
                        <label for="phone">전화번호 : </label>
                    </div>
                    <div class="col-5">
                        <input type="text" id="phone" name= "U_userphonenum" class="form-control" placeholder="'-'를 제외한 숫자로 입력해 주세요." required>
                        <div class="invalid-feedback"> 전화번호를 입력해주세요. </div>
                    </div>
                </div>
                <hr>
                <div class="row my-3">
                    <div class="col-2 offset-9">
                        <button class="btn btn-outline-dark">회원가입 신청</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
    
    var pwChvar = false;
    var idChvar = false;
    var nickChvar = false;
	$(".overCheck").click(function(){
		var name = $(this).parent().prev().children().first().attr('name');
		var val = $(this).parent().prev().children().first().val();
        $.ajax({
            url:'overCheck',
            type:'POST',
            data:{ [name] : val},
            dataType:'JSON',
            success:function(data){
               	console.log(data);
               	idChvar = data.idChvar;
               	nickChvar = data.nickChvar;
               	if(data.msg != ""){
               		alert(data.msg);
               	}
            },
            error:function(e){
				console.log(e);
            }
        });
	});
	
	$("input[name=pwck]").focusout(function(){
		if($("input[name=U_userpw]").val() != $("input[name=pwck]").val()){
			console.log($("input[name=pwck]").val());
			console.log($("input[name=U_userpw]").val());
			console.log(document.querySelector("select").value);
            alert("비밀번호가 일치 하지 않습니다.");
        }else{
            pwChvar = true;
        }
	});
	
    window.addEventListener('load', () => { 
        const forms = document.getElementsByClassName('validation-form'); 
        Array.prototype.filter.call(forms, (form) => { 
            form.addEventListener('submit', function (event) {
                if(idChvar || nickChvar || pwChvar) {
                    alert("아이디, 닉네임 중복체크를 진행해주세요");
                    event.preventDefault(); event.stopPropagation(); 
                }
                if (form.checkValidity() === false) { 
                    event.preventDefault(); event.stopPropagation(); 
                } else{
                    document.getElementById("email").value = document.getElementById("email").value + "@" + document.querySelector("select").value;
                    console.log(document.getElementById("email").value);
                }
                form.classList.add('was-validated'); 
            }, false); 
        }); 
    }, false);
    
    $("#id").keyup(function (){
		chk_input_filter("non_spec", $("#id"));
	});
    
    $("#nick").keyup(function (){
		chk_input_filter("non_spec", $("#nick"));
	});
    
    $("#phone").keyup(function (){
		chk_input_filter("number", $("#phone"));
	});
    
	function chk_input_filter(type, obj){

		var str = $(obj).val();

		if(type == 'alphabet'){
			//영문만 허용
			$(obj).val(str.replace(/[^a-z]/gi,""));
		}else if(type == 'number'){
			//숫자만 허용
			$(obj).val(str.replace(/[^0-9]/gi,""));
		}else if(type == 'alphabet_number'){
			//영문 , 숫자만 허용
			$(obj).val(str.replace(/[^a-z0-9]/gi,""));
		}else if(type == 'non_spec'){
			//특수문자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/]/gi,""));
		}else if(type == 'name'){
			//특수문자, 숫자 비허용
			$(obj).val(str.replace(/[~!@#$%^&*()_+|<>?:;{}`\-\=\\\,.'"\[\]/0-9]/gi,""));
		}
	}    
    </script>
</html>