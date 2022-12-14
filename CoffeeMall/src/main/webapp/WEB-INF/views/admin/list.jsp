<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</head>
<body>
<h1>관리자 목록</h1>
 
 
 <table border="1px">
	<thead>
		<tr>
			<th>관리자 아이디</th>
			<th>관리자 닉네임</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${aList}" var="aList">
			<tr>
				<td>${aList.adminId}</td>
				<td><a href="/admin/read/${aList.adminId}">${aList.aNickname}</a></td>
			</tr>
		</c:forEach>
	</tbody>
	
</table>
<a href="/admin/orderList">주문 현황</a>

<script type="text/javascript">
	$(document).ready(function() {
		
	});


</script>
</body>
</html>