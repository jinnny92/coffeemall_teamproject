<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고 검색 결과</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<style type="text/css">

.container-stock{

margin-top: 100px;
margin-left: 70px;
margin-right: 70px;
margin-bottom: 100px;
}

.img{

width: 100px;
height: 100px;
display: block;
margin: 0px auto;
}

.card-img-top{

width: 200px;
height: 200px;

}

.table td, .table th{
vertical-align: none;
vertical-align: middle;

}

.info{
font-size: 20px;

}

.pagination {

justify-content : center;

}

.container-search{

margin-top: 100px;

}

</style>
</head>
<body>

<h1>재고 검색결과 화면입니다</h1>

<button onclick="location.href='/product/stock'">기존 재고창으로 가기</button>


<div class="container-search">
	<form action="/product/searchStock" method = "get" target="_blank">
	<div class="input-group mb-3">
	<select name = "criteria" class="form-control col-sm-2">
<option selected>검색 조건</option>
<option value= "pName">제품명</option>
<option value = "pContent">상세내용</option>
<option value = "pCategory">종류</option>
<option value = "pOrigin">원산지</option>

</select>
  <input class="form-control" name="keyword" placeholder="검색 키워드를 입력하세요" aria-label="검색 키워드를 입력하세요" aria-describedby="검색 키워드를 입력하세요">
  <div class="input-group-append">
    <button class="btn btn-info " type="submit">검색</button>
  </div>
</div>

</form>
</div>


<code> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> </code>
  <%@ include file="/WEB-INF/views/header.jsp" %>
  <div class="container-stock">
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제품명</th>
      <th scope="col">이미지</th>
      <th scope="col">재고</th>
      <th scope="col">가격</th>
      
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="pDto">




    <tr>
      <th scope="row">${pDto.pno}</th>
      <td class="info">${pDto.pName}</td>
      <td><img src="/displayfile?filename=${pDto.filenameList.get(0)}" class="card-img-top"></td>
      <td class="info">${pDto.pStock}</td>
      <td class="info"><fmt:formatNumber value="${pDto.pPrice}" pattern="#,###"/></td>
       
    </tr>
    </c:forEach>
  </tbody>
</table>
</div>



  <%@ include file="/WEB-INF/views/footer.jsp" %>

<script type="text/javascript" src="/resources/js/tl.js"></script>


</body>
</html>