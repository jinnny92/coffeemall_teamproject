<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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

#btn-Yes, #btn-change, #btn-exit {
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

.links {
   text-align: center;
   margin-bottom: 10px;
}

a {
   color: #555555;
   text-decoration: none;
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
         <form action="/user/update" method="post" class="form-signin">
            <h5 align="center" class="nav-link text-uppercase font-weight-bold">MY
               PAGE</h5>
            <br>
            <p class="text">아이디</p>
            <input name="userId" value="${uDto.userId}" class="form-control"
               readonly> &nbsp; &nbsp; <br> <br>

            <p class="text">이름</p>
            <input type="text" name="uName" value="${uDto.uName}"
               class="form-control"><br> <br />

            <p class="text">닉네임</p>
            <input type="text" name="uNickname" id="uNickname"
               value="${uDto.uNickname}" class="form-control"> &nbsp;
            &nbsp; <input type="button" onclick="nicknameCheckFn()"
               value="중복 체크" /><br />
            <p id="Nickname_check" class="check"></p>
            <br />

            <p class="text">생년월일</p>
            <input type="text" name="uBirth" id="uBirth" class="form-control"
               value="${uDto.uBirth}" placeholder="19001010 형식입니다."><br>
            <p id="birth_check" class="check"></p>
            <br />

            <p class="text">주소</p>
            <input type="text" class="text" id="uPostnumber" name="uPostnumber"
               placeholder="우편번호" value="${uDto.uPostnumber}" readonly> <input
               type="button" onclick="findAddr()" value="우편번호 찾기"><br>
            <input type="text" class="form-control" id="uAddress"
               name="uAddress" placeholder="지번주소" value="${uDto.uAddress}"
               readonly="readonly"> <input type="text"
               class="form-control" id="udetailAddress" name="udetailAddress"
               value="${uDto.udetailAddress}" placeholder="상세주소"> <span
               id="guide" style="color: #999; display: none"></span> <br /> <br>
            <br>
            <p class="text">이메일</p>
            <input type="email" name="uEmail" id="uEmail" value="${uDto.uEmail}"
               class="form-control"> &nbsp; &nbsp; <input type="button"
               id="emoverlay" onclick="emailCheckFn()" value="중복 체크" /><br />
            <p id="emch" class="check"></p>
            <br />

            <p class="text">전화번호</p>
            <input type="text" name="uPhone" id="uPhone" value="${uDto.uPhone}"
               class="form-control" placeholder="-없이 입력하세요."><br> <br>
            <br />

            <p class="text">등급</p>
            <input type="text" value="${uDto.uGrade}" class="form-control"
               readonly><br> <br />

            <p class="text">포인트</p>
            <input type="text" value="${uDto.uPoint}" class="form-control"
               readonly><br> <br /> <br>
            <button type="submit" id="btn-Yes"
               class="btn btn-lg btn-primary btn-block">나의정보 수정</button>
            <br>
         </form>
         <hr>
         <br>
         <form action="/user/modifyPw" method="post">
         <h5 align="center" class="nav-link text-uppercase font-weight-bold">
         비밀번호 수정</h5>
            <input type="hidden" name="userId" value="${uDto.userId}">
            <p class="text">비밀번호 변경</p>
            <input type="password" name="uPassword" id="uPassword"
               class="form-control"><br>
            <p id="pw2ch" class="check"></p>
            <br />
            <p class="text">비밀번호 변경 확인</p>
            <input type="password" id="uPassword2" class="form-control"><br>
            <p id="pwch" class="check"></p>
            <br />
            <button type="submit" id="btn-Yes"
               class="btn btn-lg btn-primary btn-block">비밀번호 수정</button>
            <br>
         </form>
         
            <form action=""></form>
            <div class="links">
            <input type="hidden" name="userId" value="${uDto.userId}">
            <c:choose>
            	<c:when test="${not empty adminLogin.adminId}">
            	 <a id="btn-exit" class="btn btn-lg btn-primary btn-block" href="#">강퇴하기</a>
            	</c:when>
            	<c:otherwise>
            	  <a id="btn-exit" class="btn btn-lg btn-primary btn-block" href="#">탈퇴하기</a>
            	</c:otherwise>
            </c:choose>
         </div>
      </div>
   </div>



   <jsp:include page="../footer.jsp" />
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script type="text/javascript">
      function findAddr() {
         new daum.Postcode(
               {

                  oncomplete : function(data) {
                     document.querySelector("#uPostnumber").value = data.zonecode;
                     document.querySelector("#uAddress").value = data.address;
                  }
               }).open();
      }

      function nicknameCheckFn() {
         let uNickname = {
            uNickname : $("#uNickname").val()
         };

         $.ajax({
            url : '/user/nicknameCheck',
            type : 'post',
            data : uNickname,
            success : function(result) {
               if (result == 1) {
                  alert("이미 사용중인 닉네임입니다.");
                  $("#submit").attr('disabled', 'disabled');

               } else {
                  alert("사용 가능한 닉네임입니다.");
                  $("#submit").removeAttr('disabled');
               }
            }

         });

      }
       $("#btn-exit").on("click", function() {
            $("form").attr("action", "/user/delete/${uDto.userId}");
            $("form").attr("method", "post");
            $("form").submit();
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
      
      
   </script>
</body>
</html>