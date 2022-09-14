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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@700;900&display=swap" rel="stylesheet">

<!-- <style>
@import url('https://fonts.googleapis.com/css2?family=Cute+Font&family=Stylish&display=swap');

.about{
	font-family: 'Cute Font', cursive;
	/* font-family: 'Stylish', sans-serif; */
}
</style> -->
</head>
<body>

<jsp:include page="../header.jsp"/>

<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/resources/img/coffee1.jpg"  alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/coffee2.jpg"alt="...">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/coffee3.jpg"  alt="...">
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
         
                    <a href="/product/read/${pDto.pno}">
  
                	     
                	     </a>



<div class="about" style="text-align: center ">
<img src="/resources/img/coffeeBoxMain.jpeg" width="1000" height="700"  alt="..." >                	     

<br>
<br>
<h3>커피에 진심인 사람들 'CoffeBox'입니다</h3>
<br>
<h4>"맛있는 커피는 천 번의 키스보다 황홀하다"<br>
&nbsp;&nbsp;&nbsp; - Johann Sebastian Bach</h4>

<br><br><br>
<img src="/resources/img/handdrip1.jpg" width="1000" height="700"  alt="...">

<br><br><br>
<h3>'CoffeBox'는 부담없지만 고품질의 스테디셀러부터, <br>
특별하고 개성있는 품목까지 폭넓은 이해를 바탕으로
구성한 온라인 커피쇼핑몰입니다. <br>
다른 커피 브랜드와 확실한 차별성을 두기 위해,
특별한 선별시스템을 통해서 <br> 
다른 곳에서 쉽게 다루지 않는
고품질의 메뉴들로 런칭 후 빠른 속도로 규모를 키워가는 중이며, <br>
다양한 지역에 다양한 고객분들께 'CoffeeBox'만의 맛을 전해
드리기 위해 많은 연구와 개발을 하고 있습니다.</h3>

<br><br><br>

<img src="/resources/img/coffeecherry.jpg" width="1000" height="700"  alt="...">

<br><br><br>

<h3> 'CoffeBox'는 유명 산지에서 엄선한 생두만을 취급하는 장인 업체들과 함께하며, <br>
자체적으로 운영중인 선별시스템 하에 다양한 특징의 생두를 골라냅니다. </h3>

<br><br><br>

<img src="/resources/img/roasting.jpg" width="1000" height="700"  alt="...">

<br><br><br>

 <h3> "대충 홍콩 짬뽕 장인이 커피 볶는다는 얘기" </h3>
 
 <br><br><br>
 
</div>

                	     
                	    
<jsp:include page="../footer.jsp"/>

</body>

</html>