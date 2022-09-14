<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 목록</title>
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
</head>
<body>
	<jsp:include page="../header.jsp" />
	<br>
	<br>
	<br>
    <br>


	<h1 class="text-center">검색 목록</h1>
	<br>
	<br>


	<table class="table table-striped">
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.qno}</td>
					<td><a href="/qna/read/${dto.qno}">${dto.qTitle}</a></td>
					<td>${dto.userid}</td>
					<td>${dto.qWriteDay}</td>
					<td>${dto.readCnt}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" aria-label="Previous"
				href="/qna/list?curpage=${pt.curPage <= 1? 1 :  pt.curPage-1}">
					<span aria-hidden="true">&laquo;</span>
			</a></li>


			<c:forEach begin="${pt.beginPageNum}" end="${pt.finishPageNum}"
				var="page">
				<c:if test="${page == pt.curPage}">
					<li class="page-item" aria-current="page"><a class="page-link"
						href="/qna/list?curpage=${pt.curPage}">${page}</a></li>
				</c:if>

				<c:if test="${page != pt.curPage}">
					<li class="page-item"><a class="page-link"
						href="/qna/list?curpage=${page}">${page}</a></li>
				</c:if>
			</c:forEach>


			<li class="page-item"><a class="page-link"
				href="/qna/list?curpage=${pt.curPage >= pt.totalPage? pt.totalPage : pt.curPage+1}">
					<span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		<div align="right">
			<a class="btn btn-secondary" href="/qna/insert">글쓰기</a>
		</div>




	</nav>

<jsp:include page="../footer.jsp" />



</body>
</html>