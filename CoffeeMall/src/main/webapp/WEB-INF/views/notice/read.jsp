<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>

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
.navbar {
	transition: all 0.4s;
}

.navbar .nav-link {
	color: #555;
}

.navbar .nav-link:hover, .navbar .nav-link:focus {
	color: #555;
	text-decoration: none;
}

.navbar .navbar-brand {
	color: #555;
}

/* Change navbar styling on scroll */
.navbar.active {
	background: #F5F5F5;
	box-shadow: 1px 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar.active .nav-link {
	color: #555;
}

.navbar.active .nav-link:hover, .navbar.active .nav-link:focus {
	color: #fff;
	text-decoration: none;
}

.navbar.active .navbar-brand {
	color: #555;
}

@media ( max-width : 991.98px) {
	.navbar {
		background: #fff;
	}
	.navbar .navbar-brand, .navbar .nav-link {
		color: #555;
	}
}

.text-small {
	font-size: 0.9rem !important;
}

body {
	min-height: 110vh;
	background-color: #fff;
}

table, th, td {
	border: 1px solid #F7F7F7;
	align: center;
}

table {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

td {
	width: 100px;
	height: 200px;
}

.th1 {
	background-color: #F7F7F7;
}
</style>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<h1 class="text-center">공지사항</h1>
	<br>


	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="th1" colspan="4">${nDto.nTitle}</th>
			</tr>
			<tr>
				<th scope="col">${nDto.userId}</th>
				<th scope="col">${nDto.nWritedate}</th>
				<th scope="col">${nDto.readCnt}</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td colspan="4">${nDto.nContent}<br>
					<div id="uploadedItems"></div></td>
			</tr>
		</tbody>
	</table>


	<br>
	<br>






	<div align="right">
		<c:if test="${not empty adminLogin.adminId}">
			<a class="btn btn-secondary" href="/notice/update/${nDto.nno}">수정</a>
			<a class="btn btn-secondary delete" href="#">삭제</a>
		</c:if>
		<a class="btn btn-secondary" href="/notice/list">목록</a>
	</div>
	<form action=""></form>
	<script type="text/javascript" src="/resources/js/notice.js"></script>

	<script type="text/javascript">
   let nno = ${nDto.nno};
   $(function() {
	   
	   getAllUpload(nno, $("#uploadedItems"));
	   
	   
	      $(".delete").on("click", function() {
	         $("form")
	         .attr("action", "/notice/delete/${nDto.nno}")
	         .attr("method", "post")
	         .submit();
	      });
	      
	   
   
      
   });
</script>







</body>
</html>