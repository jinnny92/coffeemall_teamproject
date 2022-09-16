<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
   integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
   crossorigin="anonymous">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
   integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
   crossorigin="anonymous"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
   integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
   crossorigin="anonymous"></script>
<style>
html {
   height: 100%;
}

body {
   width: 100%;
   height: 100%;
   margin: 0;
   padding-top: 50px;
   padding-bottom: 40px;
   background-repeat: no-repeat;
}

.card {
   margin: 0 auto;
   float: none;
   margin-bottom: 10px;
   border: none;
}

#btn-Yes, #btn_cancle {
   background-color: #555555;
   border: none;
   width: 25rem;
   margin: auto;
}

.form-control {
   display: inline;
   height: 40px;
   width: 400px;
   padding: 5px;
   font-size: 16px;
   margin-left: 100px;
}

#uNickname {
   padding: 10px;
   font-size: 16px;
   width: 300px;
   margin-left: 100px;
}

#userId {
   padding: 10px;
   font-size: 16px;
   width: 300px;
   margin-left: 100px;
}

#uEmail {
   padding: 10px;
   font-size: 16px;
   width: 300px;
   margin-left: 100px;
}

.check {
   font-size: 16px;
   margin-left: 100px;
}

.card-title {
   text-align: center;
}

.text {
   margin-left: 100px;
}
</style>
</head>



<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
   width="100%" height="100%">

   <jsp:include page="../header.jsp" />

   <div class="card" style="width: 40rem;">
      <div class="card-title" style="margin-top: 30px;">

         <h2 class="card-title" style="color: #e4932b;">
            <img src="" />
         </h2>
      </div>
      <div class="card-body">
         <form action="/user/insert" class="form-signin" method="POST" name="mForm">
            <h5 align="center" class="nav-link text-uppercase font-weight-bold">
               CoffeBox 회원가입</h5>
            <br>

            <p class="text">아이디</p>
            <input type="text" name="userId" id="userId" class="form-control">
            &nbsp; &nbsp; <input type="button" id="userIdCheck"
               onclick="idCheckFn()" value="중복 체크" /><br />
            <p id="idch" class="check"></p>
            <br>

            <p class="text">비밀번호</p>
            <input type="password" name="uPassword" id="uPassword"
               class="form-control"><br>
            <p id="pw2ch" class="check"></p>
            <br />
            <p class="text">비밀번호 확인</p>
            <input type="password" id="uPassword2" class="form-control"><br>
            <p id="pwch" class="check"></p>
            <br />

            <p class="text">이름</p>
            <input type="text" name="uName" id="uName" class="form-control"><br>
            <p id="namech" class="check"></p>
            <br />

            <p class="text">닉네임</p>
            <input type="text" name="uNickname" id="uNickname"
               class="form-control"> &nbsp; &nbsp; <input type="button"
               onclick="nicknameCheckFn()" value="중복 체크" /><br />
            <p id="Nickname_check" class="check"></p>
            <br />

            <p class="text">생년월일</p>
            <input type="text" name="uBirth" id="uBirth" class="form-control"
               placeholder="19001010 형식입니다."><br>
            <p id="birth_check" class="check"></p>
            <br />

            <p class="text">주소</p>
            <input type="text" class="text" id="uPostnumber" name="uPostnumber"
               placeholder="우편번호" readonly="readonly"> <input
               type="button" onclick="findAddr()" value="우편번호 찾기"><br>
            <input type="text" class="form-control" id="uAddress"
               name="uAddress" placeholder="지번주소" readonly="readonly"> <input
               type="text" class="form-control" id="udetailAddress"
               name="udetailAddress" placeholder="상세주소"> <span id="guide"
               style="color: #999; display: none"></span> <br /> <br> <br>
            <p class="text">이메일</p>
            <input type="email" name="uEmail" id="uEmail" class="form-control">
            &nbsp; &nbsp; <input type="button" id="emoverlay"
               onclick="emailCheckFn()" value="중복 체크" /><br />
            <p id="emch" class="check"></p>
            <br />

            <p class="text">전화번호</p>
            <input type="text" name="uPhone" id="uPhone" class="form-control"
               placeholder="-없이 입력하세요."><br>
            <br>
            <p id="phonech" class="check"></p>
            <br />
            <button type="submit" id="btn-Yes"
               class="btn btn-lg btn-primary btn-block" onclick="submit()">회원가입</button>
            <br>
         </form>

         <button id="btn_cancle" class="btn btn-lg btn-primary btn-block"
            type="button" onclick="location.href = '/' ">가입취소</button>

      </div>

   </div>

   <jsp:include page="../footer.jsp" />

   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script type="text/javascript">
   
   

   function findAddr() {
      new daum.Postcode({
         
          oncomplete: function(data) {
              document.querySelector("#uPostnumber").value = data.zonecode;
              document.querySelector("#uAddress").value =  data.address;
                }
         }).open();   
      }
   
   
   function emailCheckFn() {
      let uEmail = {uEmail : $("#uEmail").val()};
      
      $.ajax({
         url : '/user/emailCheck',
         type : 'post',
         data : uEmail,
         success : function(result) {
            if (result == 1) {
               alert("이미 사용중인 이메일입니다.");
                $("#btn_submit").attr('disabled', 'disabled'); 
            
            }else if(result == -1){
               alert("이메일을 입력해주세요");
                $("#btn_submit").attr('disabled', 'disabled'); 
                return;
            } else {
               alert("사용 가능한 이메일입니다.");
               $("#btn_submit").removeAttr('disabled');
               
            }
         }
         
         
      });
      
   }
   
   
   
   
   function nicknameCheckFn() {
      
      let uNickname = {uNickname : $("#uNickname").val()};
      
      
      $.ajax({
         url : '/user/nicknameCheck',
         type : 'post',
         data : uNickname,
         success : function(result) {
            if (result == 1) {
               alert("이미 사용중인 닉네임입니다.");
                $("#btn_submit").attr('disabled', 'disabled'); 
            
            }else if(result == -1){
               alert("닉네임을 입력해주세요");
                $("#btn_submit").attr('disabled', 'disabled'); 
                return;
            } else {
               alert("사용 가능한 닉네임입니다.");
               $("#btn_submit").removeAttr('disabled');
               
            }
         }
         
         
      });
      
   }

   

   
   function idCheckFn() {

      let userId  = {userId: $("#userId").val()};
   
      
      $.ajax({
         url : '/user/userIdcheck',
         type : 'post',
         data : userId,
         success : function(result) {
            if (result == 1) {
               alert("이미 사용중인 아이디입니다.");
                $("#btn_submit").attr('disabled', 'disabled'); 
            
            }else if(result == -1){
               alert("아이디를 입력해주세요");
                $("#btn_submit").attr('disabled', 'disabled');
                return;
               
            } else {
               alert("사용 가능한 아이디입니다.");
               $("#btn_submit").removeAttr('disabled');
               
            }
         }
         
         
      });
      
   }
      
  
   $('#pw2ch').text('')
   $('#pw2ch').css('color', 'red') 
    $("#pw").focusout(function(){
        if($('#pw').val() == ""){
           
           $('#pw2ch').text('*필수 정보입니다.');
             $('#pw2ch').css('color', 'red');
          return false;
          
          }else if(!pwJ.test($(this).val())){
         $('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
         $('#pw2ch').css('color', 'red') 
         return false;
          }else{
               pwc2 = true;
               $('#pw2ch').hide();
               return true;
           }
       });

   $("#uPassword2").keyup(function(){
         
       if($(this).val()!=$("#uPassword").val()){
           $("#pwch").html("비밀번호가 다릅니다");
           $("#pwch").css("color",'red');
           pwc = false;

       }else{
           $("#pwch").html("비밀번호가 일치합니다");
           $("#pwch").css("color",'blue');
           pwc = true;
       }
   });

   $("#uPassword").keyup(function(){
           
       if($(this).val()!=$("#uPassword2").val()){
           $("#pwch").html("비밀번호가 다릅니다");
           $("#pwch").css("color",'red');
           pwc = false;

       }else{
           $("#pwch").html("비밀번호가 일치합니다");
           $("#pwch").css("color",'blue');
           pwc = true;
       }
   });
   
   function submit() {
		let userId = document.getElementById("userId");
		if (userId.value == "") {
			alert("아이디가 입력되지 않았습니다!");
			userId.focus();
			return false;
		}
		
		
		let uPassword = document.getElementById("uPassword");
		if (uPassword.value == "") {
			alert("비밀번호가 입력되지 않았습니다!");
			uPassword.focus();
			return false;
		}
		
		
		let uName = document.getElementById("uName");
		if (uName.value == "") {
			alert("이름이 입력되지 않았습니다!");
			uName.focus();
			return false;
		}
		
		
		let uNickname = document.getElementById("uNickname");
		if (uNickname.value == "") {
			alert("닉네임이 입력되지 않았습니다!");
			uNickname.focus();
			return false;
		}
		
		
		let uBirth = document.getElementById("uBirth");
		if (uBirth.value == "") {
			alert("생년월일이 입력되지 않았습니다!");
			uBirth.focus();
			return false;
		}
		
		let uPhone = document.getElementById("uPhone");
		if (uPhone.value == "") {
			alert("전화번호가 입력되지 않았습니다!");
			uPhone.focus();
			return false;
		}

		let uEmail = document.getElementById("uEmail");
		if (uEmail.value == "") {
			alert("이메일이 입력되지 않았습니다!");
			uEmail.focus();
			return false;
		}
		
		alert("축하합니다! 회원가입이 정상적으로 완료되었습니다");
		document.getElementById("mForm").submit();
	}

</script>
</body>
</html>