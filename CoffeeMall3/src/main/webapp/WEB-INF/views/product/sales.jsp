<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/sales.css" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" 
integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" 
crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
<jsp:include page="../header.jsp" /><br><br><br><br><br>
	<main>
		<section>
  			<div class="today">
  				<span>
  					<span>오늘 매출</span>
  					<span id="today"></span>
  				</span>
  				
  				<button>상세보기</button>
  				
  			</div>
  			
  		</section>
  		
		<section class="detail today_detail">
  			<div>
				<h3 class="sales_today_detail_title">
					<span>매출 상세</span>
					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
				</h3>
				
  				<div class="sales_today_detail">
  					<div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div>
  				</div>
  			</div>
  		</section>
	
	
		<section class="graph_section" onselectstart="return false;" > 
			<div class="box">
				<button class="year_btn">연 매출</button>
				<button class="month_btn">이번 달 매출</button>
				<button class="week_btn">이번 주 매출</button>
				<input type="month"name="date" id="date">
				<button class="other_month_search">검색</button>
			
				<h1>1월 총 합계</h1>
				
				<div>(단위 : 만원)</div>
				<div class="graph_box">
					<ul>
					<!-- 
						<li>
							<span class="sales"></span>
							<div class="graph"></div>
							<span class="graph_date"></span>
						</li>
						 -->
					</ul>
				
					<div class="graph_background">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
			
			</div>
		</section>
		
		<section class="detail other_detail">
  			<div>
  				<h3 class="sales_today_detail_title">
  					<span id="other_detail_date"></span>
  					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
  				</h3>
  				<div class="sales_today_detail">
  					<!-- <div>가라비</div>
  					<div>수량</div>
  					<div>가격</div> -->
  				</div>
  			</div>
  		</section>
  		
	</main>
 <%@ include file="/WEB-INF/views/footer.jsp" %>
<script src="/js/util/util.js"></script>
<script src="/resources/js/sales.js"></script> 
</body>
</html>