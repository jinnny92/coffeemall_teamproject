<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Welcome! CoffeeMall</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
<style type="text/css">


    .carousel-inner{
    
    margin-top: 5%; 
    width: 100%; 
    height: 60%; 
    
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
    } 
    
	img { 
	display: block; margin: 0px auto; 
	height: 100%;
	width: 100%;
	}
	
html, body {
  margin: 0;
  padding: 0;
  min-height: 130vh;
  background-color:#fff;
}

</style>

</head>
<body>
<jsp:include page="header.jsp"/>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/cccc.webp"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/cdcd.jpg"alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/cdd.webp"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/ccc.webp"  alt="...">
    </div>
  </div>
 <button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>
<hr>
<br><br>

<jsp:include page="card.jsp"/>

<jsp:include page="footer.jsp"/>
</body>
</html>
