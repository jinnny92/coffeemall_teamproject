
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../resources/css/order.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
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
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-{SDK-1.1.8}.js"></script>


</head>
<body>
	<jsp:include page="../header.jsp" />

	<div class="jumbotron">

		<h1 class="text-center">장바구니</h1>



		<div class="clearfix"></div>
	</div>
	<div class="navi_bar_area">
		<!-- <h1>navi area</h1> -->
	</div>
	<div class="content_area">
		<div class="content_subject">
			<span>주문</span>
		</div>
		<div class="content_main">
			<!-- 회원 정보 -->
			<div class="user_info_div">
				<table class="table_text_align_center userInfo_table">
					<tbody>
						<tr>
							<th style="width: 25%;">주문자</th>
							<td style="width: *">${userInfo.uName}|${userInfo.uEmail}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 배송지 정보 -->
			<div class="addressInfo_div">
				<div class="addressInfo_button_div">
					<button class="address_btn address_btn_1" onclick="showAdress('1')"
						style="background-color: #3c3838;">기본 주소지</button>
					<button class="address_btn address_btn_2" onclick="showAdress('2')">직접
						입력</button>
				</div>
				<div class="addressInfo_input_div_wrap">
					<div class="addressInfo_input_div addressInfo_input_div_1"
						style="display: block">
						<!-- div 1 영역 -->
						<table>
							<colgroup>
								<col width="25%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>수령인</th>
									<td>${userInfo.uName}</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${userInfo.uPostnumber}${userInfo.uAddress}<br>
										${userInfo.udetailAddress} <input class="selectAddress"
										value="T" type="hidden"> <input class="receiver_input"
										value="${userInfo.uName}" type="hidden"> <input
										class="address1_input" type="hidden"
										value="${userInfo.uPostnumber}"> <input
										class="address2_input" type="hidden"
										value="${userInfo.uAddress}"> <input
										class="address3_input" type="hidden"
										value="${userInfo.udetailAddress}">
									</td>
									
								</tr>
								<tr>
									<th>연락처</th>
									<td>${userInfo.uPhone}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="addressInfo_input_div addressInfo_input_div_2">
						<!-- div 2 영역 -->
						<table>
							<colgroup>
								<col width="25%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>수령인</th>
									<td><input class="receiver_input"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input class="selectAddress" value="F" type="hidden">
										<input type="text" class="text" id="uPostnumber"
										name="uPostnumber" placeholder="우편번호" readonly="readonly">
										<input type="button" onclick="findAddr()" value="우편번호 찾기"><br>
										<input type="text" class="form-control" id="uAddress"
										name="uAddress" placeholder="지번주소" readonly="readonly">
										<input type="text" class="form-control" id="udetailAddress"
										name="udetailAddress" placeholder="상세주소"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input class="uPhone_input"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br> <br> <br>
			<!-- 상품 정보 -->
			<div class="orderproduct_div">
				<!-- 상품 종류 -->
				<div class="product_kind_div">
					총 주문상품 <span class="product_kind_div_kind"></span>종 <span
						class="product_kind_div_count"></span>개
				</div>
				<!-- 상품 테이블 -->
				<table class="product_subject_table">
					<colgroup>
						<col width="15%">
						<col width="45%">
						<col width="40%">
					</colgroup>
					<tbody>
						<tr>
							<th>이미지</th>
							<th>상품 정보</th>
							<th>판매가</th>
						</tr>
					</tbody>
				</table>
				<table class="product_table">
					<colgroup>
						<col width="15%">
						<col width="45%">
						<col width="40%">
					</colgroup>
					<tbody>
						<c:forEach items="${orderList}" var="ol">
							<tr>
								<td>
									<!-- 이미지 <td>-->
								</td>
								<td>${ol.pName}</td>
								<td class="product_table_price_td"><fmt:formatNumber
										value="${ol.pPrice}" pattern="#,### 원" /> &nbsp; | &nbsp; 수량
									${ol.cartCount}개 <br> <fmt:formatNumber
										value="${ol.totalPrice}" pattern="#,### 원" /> <br> <input
									type="hidden" class="individual_pPrice_input"
									value="${ol.pPrice}"> <input type="hidden"
									class="individual_cartCount_input" value="${ol.cartCount}">
									<input type="hidden" class="individual_totalPrice_input"
									value="${ol.pPrice * ol.cartCount}"> <input
									type="hidden" class="individual_pno_input" value="${ol.pno}">
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>


			<!-- 주문 종합 정보 -->
			<div class="total_info_div">
				<div class="total_info_price_div">
					<ul>
						<li><span class="price_span_label">상품 금액</span> <span
							class="totalPrice_span">100000</span>원</li>
						<li><span class="price_span_label">배송비</span> <span
							class="delivery_price_span">3000</span>원</li>

						<li class="price_total_li"><strong
							class="price_span_label finaltotal_price_label">최종 결제 금액</strong>
							<strong class="strong_red"> <span
								class="total_price_red finalTotalPrice_span"> 150000 </span>원
						</strong></li>
					</ul>
				</div>
				<!-- 버튼 영역 -->
				<div class="total_info_btn_div">

					<button class="order_btn">결제하기</button>
						<!-- onclick="request_pay()" --> 




				</div>
			</div>
		</div>

	</div>


	</div>
	<!-- class="wrap" -->
	</div>
	<!-- class="wrapper" -->


	<form action="/cart/update" method="post" class="quantity_update_form">
		<input type="hidden" name="cartId" class="update_cartId"> <input
			type="hidden" name="cartCount" class="update_cartCount"> <input
			type="hidden" name="userId" value="${login.userId}">
	</form>

	<form action="/cart/delete" method="post" class="quantity_delete_form">
		<input type="hidden" name="cartId" class="delete_cartId"> <input
			type="hidden" name="userId" value="${login.userId}">
	</form>

	<!-- 주문 form -->
	<form action="/order/${login.userId}" method="get" class="order_form">

	</form>


	<!-- 주문 요청 form -->
	<form class="order_form" action="/order" method="post">
		<!-- 주문자 회원번호 -->
		<input name="userId" value="${userInfo.userId}" type="hidden">
		<!-- 주소록 & 받는이-->
		<input name="receiver" type="hidden"> <input
			name="uPostnumber" type="hidden"> <input name="uAddress"
			type="hidden"> <input name="udetailAddress" type="hidden">
		<!-- 상품 정보 -->
	</form>


	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<script type="text/javascript" src="/resources/js/tl.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		   
	
	
		   $(document).ready(function () {
		         
		         setTotalInfo();
		         
		         
		         let createSeq = function() {
		        	 let num = 0;
		        	 return function() {
		        		 return ++num;
		        	}
		        };
		        let seq = createSeq();
		         
		      });
		   
		   
		   
		   
		   
		     
		  
		   function showAdress(className){
		   /* 컨텐츠 동작 */
		      /* 모두 숨기기 */
		      $(".addressInfo_input_div").css('display', 'none');
		      /* 컨텐츠 보이기 */
		      $(".addressInfo_input_div_" + className).css('display', 'block');      
		   
		   /* 버튼 색상 변경 */
		      /* 모든 색상 동일 */
		         $(".address_btn").css('backgroundColor', '#555');
		      /* 지정 색상 변경 */
		         $(".address_btn_"+className).css('backgroundColor', '#3c3838');
		      
		      
		         /* selectAddress T/F */
		         /* 모든 selectAddress F만들기 */
		            $(".addressInfo_input_div").each(function(i, obj){
		               $(obj).find(".selectAddress").val("F");
		            });
		         /* 선택한 selectAdress T만들기 */
		            $(".addressInfo_input_div_" + className).find(".selectAddress").val("T");
		   }
		   
		   
		   
		   function findAddr() {
		         new daum.Postcode({
		            
		             oncomplete: function(data) {
		                 document.querySelector("#uPostnumber").value = data.zonecode;
		                 document.querySelector("#uAddress").value =  data.address;
		                   }
		            }).open();   
		         }
		   
		   
		   function setTotalInfo(){

		      let totalPrice = 0;            // 총 가격
		      let totalCount = 0;            // 총 갯수
		      let totalKind = 0;            // 총 종류
		      let deliveryPrice = 0;         // 배송비
		      let finalTotalPrice = 0;       // 최종 가격(총 가격)   
		      
		      $(".product_table_price_td").each(function(index, element){
		         // 총 가격
		         totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		         // 총 갯수
		         totalCount += parseInt($(element).find(".individual_cartCount_input").val());
		         // 총 종류
		         totalKind += 1;
		      });   
		   
		      /* if(totalPrice >= 20000){
		         deliveryPrice = 0;
		      } else if(totalPrice == 0){
		         deliveryPrice = 0;
		      } else {
		         deliveryPrice = 3000;   
		      }
		      
		      finalTotalPrice = totalPrice + deliveryPrice; */
		      
		      
		      if(totalPrice <= 100000){
			         deliveryPrice = 0;
			      } else if(totalPrice == 0){
			         deliveryPrice = 0;
			      } else {
			         deliveryPrice = 3000;   
			      }
			      
			      finalTotalPrice = totalPrice + deliveryPrice;
		      
		      
		      /* 값 삽입 */
		      // 총 가격
		      $(".totalPrice_span").text(totalPrice.toLocaleString());
		      // 총 갯수
		      $(".product_kind_div_count").text(totalCount);
		      // 총 종류
		      $(".product_kind_div_kind").text(totalKind);
		      // 배송비
		      $(".delivery_price_span").text(deliveryPrice.toLocaleString());      
		      // 최종 가격(총 가격 + 배송비)
		      $(".finalTotalPrice_span").text(finalTotalPrice/* .toLocaleString() */);
		      
		      
		   }
		   
		   
		
		   
		   
		   /* 주문 요청 */
		   $(".order_btn").on("click", function(){
			   setTotalInfo();
			   let price = 0;
			   price = $(".finalTotalPrice_span").text();
			   let uid = "${userInfo.userId}";
			   
		       let ran = Math.random()
			   alert(uid+ran);
			 
		       IMP.init("imp14115604");
			   IMP.request_pay({
			       pg : 'html5_inicis',
			       pay_method : 'card',
			       merchant_uid: uid+ran, // 상점에서 관리하는 주문 번호
			       name : '(주)커피박스',
			       amount : price,
			       buyer_email : "${userInfo.uEmail}",
			       buyer_name : "${userInfo.uName}",
			       buyer_tel : "${userInfo.uPhone}",
			       buyer_addr : "${userInfo.uAddress}${userInfo.udetailAddress}",
			       buyer_postcode : "${userInfo.uPostnumber}"
			   }, function(rsp) {
			       if ( rsp.success ) {
			          //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			           alert("결제가 완료되었습니다.");
			           $(".addressInfo_input_div").each(function(i, obj){
			  		         if($(obj).find(".selectAddress").val() === 'T'){
			  		            $("input[name='receiver']").val($(obj).find(".receiver_input").val());
			  		            $("input[name='uPostnumber']").val($(obj).find(".address1_input").val());
			  		            $("input[name='uAddress']").val($(obj).find(".address2_input").val());
			  		            $("input[name='udetailAddress']").val($(obj).find(".address3_input").val());
			  		         }
			  		      });   
			  		      
			  		     
			  		      
			  		      
			  		      /* 상품정보 */
			  		      let form_contents = ''; 
			  		      $(".product_table_price_td").each(function(index, element){
			  		         let pno = $(element).find(".individual_pno_input").val();
			  		         let cartCount = $(element).find(".individual_cartCount_input").val();
			  		         let pno_input = "<input name='orders[" + index + "].pno' type='hidden' value='" + pno + "'>";
			  		         form_contents += pno_input;
			  		         let cartCount_input = "<input name='orders[" + index + "].cartCount' type='hidden' value='" + cartCount + "'>";
			  		         form_contents += cartCount_input;
			  		      });   
			  		      $(".order_form").append(form_contents);   
			  		      
			  		      
			  		      
			  		      /* 서버 전송 */
			  		      $(".order_form").submit();
                   		
			          jQuery.ajax({
			             url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
			             type: 'POST',
			             dataType: 'json',
			             data: {
			                imp_uid : rsp.imp_uid
			                //기타 필요한 데이터가 있으면 추가 전달
			             }
			          }).done(function(data) {
			             //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
			             if ( everythings_fine ) {
			                var msg = '결제가 완료되었습니다.';
			                msg += '\n고유ID : ' + rsp.imp_uid;
			                msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			                msg += '\결제 금액 : ' + rsp.paid_amount;
			                msg += '카드 승인번호 : ' + rsp.apply_num;
			                
			                alert(msg);
			                
			                
			                /* 주소 정보 & 받는이*/
			  		      
			  		    /* location.href = "/order/finishTest" */
			             } else {
			                //[3] 아직 제대로 결제가 되지 않았습니다.
			                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
			             }
			          });
			       } else {
			           var msg = '결제에 실패하였습니다.';
			           msg += '에러내용 : ' + rsp.error_msg;
			           
			           alert(msg);
			       }
			   });
			   
			   
			   
		      
		      
		      
		      
		   });   
		      
		</script>
	<br>
	<br>
	<br>
</body>
</html>
