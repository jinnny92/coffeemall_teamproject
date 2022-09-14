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

<style>
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
	background: black;
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

.notice-wrap {
	width: 100%;
	margin: 70px auto;
	position: relative;
}

.notice-wrap img {
	width: 100%;
	height: 600px;
	object-fit: cover;
}

.notice-text {
	padding: 10px 20px;
	position: absolute;
	top: 240px;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
}

th {
    margin-left: 30%;
    margin-right: 30%;
	background-color: #F7F7F7;
}

.pagination {

justify-content : center;

}


</style>
</head>
<body>

	<jsp:include page="../header.jsp" />

	<div class="notice-wrap">
		<div class="notice-text">
			<h1>공지사항</h1>
		</div>
		<div class="notice-image">
			<img src="/resources/img/커피_1.jpg">
		</div>
	</div>


	<br>
	<br>
	<div class="body-wrap" align="center">
		<table class="table table-hover">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">글제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.nno}</td>
							<td><a href="/notice/read/${list.nno}">${list.nTitle}</a></td>
							<td>${list.userId}</td>
							<td>${list.nWritedate}</td>
							<td>${list.readCnt}</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" aria-label="Previous"
				href="/notice/list?curpage=${pt.curPage <= 1? 1 :  pt.curPage-1}">
					<span aria-hidden="true">&laquo;</span>
			</a></li>


			<c:forEach begin="${pt.beginPageNum}" end="${pt.finishPageNum}"
				var="page">
				<c:if test="${page == pt.curPage}">
					<li class="page-item" aria-current="page"><a class="page-link"
						href="/notice/list?curpage=${pt.curPage}">${page}</a></li>
				</c:if>

				<c:if test="${page != pt.curPage}">
					<li class="page-item"><a class="page-link"
						href="/notice/list?curpage=${page}">${page}</a></li>
				</c:if>
			</c:forEach>


			<li class="page-item"><a class="page-link"
				href="/notice/list?curpage=${pt.curPage >= pt.totalPage? pt.totalPage : pt.curPage+1}">
					<span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	
		<c:if test="${not empty adminLogin.adminId}">
		<div align="right">
			<a class="btn btn-secondary" href="/notice/insert">글쓰기</a>
		</div>
	</c:if>
	
<br><br>

	<form action="/notice/search" method="get" target="_blank">
		<div class="input-group">
			<select name="criteria" class="form-control">
				<option selected>선택</option>
				<option value="userId">작성자</option>
				<option value="nTitle">제목</option> 
				<option value="nContent">내용</option>
			</select> <input class="form-control" name="keyword">
			<div class="input-group-append">
				<button type="submit" class="btn btn-secondary">검색</button>
			</div>
		</div>
	</form>

	<jsp:include page="../footer.jsp" />


	<script type="text/javascript">
		
	</script>
</body>
</html>