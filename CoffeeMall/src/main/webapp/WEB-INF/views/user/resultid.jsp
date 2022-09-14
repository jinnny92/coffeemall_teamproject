<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
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
<style type="text/css">
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");

html {
   height: 100%;
}

body {
   width: 100%;
   height: 100%;
   margin: 0;
   padding-top: 200px;
   padding-bottom: 40px;
   font-family: "Nanum Gothic", arial, helvetica, sans-serif;
   background-repeat: no-repeat;
}

.card {
   margin: 0 auto; /* Added */
   float: none; /* Added */
   margin-bottom: 10px; /* Added */
}

.card-title {
   margin-left: 30px;
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
   width="100%" height="100%" align="center">
   <jsp:include page="../header.jsp" />
   <div class="card align-middle" style="width: 25rem;">
      <div class="card-title" style="margin-top: 30px;"></div>
      <h4 align="center" class="nav-link text-uppercase font-weight-bold">아이디찾기결과</h4>
      <div class="card-body">
         <div align="center">
            <br> 회원님의 아이디는 <br> ${findId}입니다 <br> <br>
         </div>
      </div>
      <div class="links" align="center">
         <a href="/user/findpw">비밀번호 찾기</a> | <a href="/user/loginget">로그인
            하기</a>
      </div>
      <br>
   </div>


   <jsp:include page="../footer.jsp" />

   <script type="text/javascript">
      
   </script>
</body>
</html>