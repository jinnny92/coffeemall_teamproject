<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../resources/css/cart.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="jumbotron">

      <h1 class="text-center">장바구니</h1>


			
			<div class="clearfix"></div>			
		</div>
		<div class="navi_bar_area">
			<!-- <h1>navi area</h1> -->
		</div>
		<div class="content_area">
			<!-- <div class="content_subject"><span>장바구니</span></div> -->
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>
				
				
				<table class="subject_table">
					<caption>테이블 표 제목부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>테이블 표 내용부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="cart">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_pPrice_input" value="${cart.pPrice}">
									<input type="hidden" class="individual_cartCount_input" value="${cart.cartCount}">
									<input type="hidden" class="individual_totalPrice_input" value="${cart.cartCount*cart.pPrice}">
									<input type="hidden" class="individual_pno_input" value="${cart.pno}">
								</td>
								<td class="td_width_2"></td>
								<td class="td_width_3">
								<img src="/displayfile?filename=${cart.getAllUpload.get(0)}">
                	     		</td>
								<td class="td_width_4 price_td">
									
									가격 : <span class="cart-pPrice" data-price="${cart.pPrice}"><fmt:formatNumber value="${cart.pPrice}" pattern="#,### 원" /></span><br>

								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="number" value="${cart.cartCount}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartId="${cart.cartId}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<span class="cart_subfinal" data-cartsubfinal="${cart.cartCount*cart.pPrice}"><fmt:formatNumber value="${cart.cartCount*cart.pPrice}" pattern="#,### " />원</span>
								</td>
								<td class="td_width_4 table_text_align_center delete_btn">
									<button class="delete_btn" data-cartid="${cart.cartId}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">0</span> 원
										</td>
									</tr>
							
							
									
									<tr>
										<td>배송비</td>
										<td>
											<span class="deliveryprice_span">0</span>원
										</td>
									</tr>							
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>품목, 총 <span class="totalCount_span"></span>개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td class="">
												<span class="finalTotalPrice_span">0</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<!-- <td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td> -->
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
		</div>
		
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<form action="/cart/update" method="post" class="quantity_update_form">
	<input type="hidden" name="cartId" class="update_cartId">
	<input type="hidden" name="cartCount" class="update_cartCount">
	<input type="hidden" name="userId" value="${login.userId}">
</form>

<form action="/cart/delete" method="post" class="quantity_delete_form">
	<input type="hidden" name="cartId" class="delete_cartId">
	<input type="hidden" name="userId" value="${login.userId}">
</form>


<!-- 주문 form -->
<form action="/order/${login.userId}" method="get" class="order_form">

</form>



<script type="text/javascript" src="/resources/js/cart.js"></script>
<script>

$(document).ready(function () {
	
	
	setTotalInfo();			
	
});	

	


	$(".individual_cart_checkbox").on("change", function(){
		setTotalInfo($(".cart_info_td"));
	});
	
	
	$(".all_check_input").on("click", function(){
		if($(".all_check_input").prop("checked")){
			$(".individual_cart_checkbox").prop("checked", true);
		} else{
			$(".individual_cart_checkbox").prop("checked", false);
		}
		setTotalInfo($(".cart_info_td"));	
	});
	
	
	

	
	
	
	function setTotalInfo() {
		let totalPrice = 0;			
		let totalCount = 0;			
		let totalKind = 0;
		let deliveryPrice = 0;
		let finalTotalPrice = 0;
		
		$(".cart_info_td").each(function(index, element){
			
			if($(element).find(".individual_cart_checkbox").is(":checked") === true){
				// 총 가격
				totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
				// 총 갯수
				totalCount += parseInt($(element).find(".individual_cartCount_input").val());
				// 총 종류
				totalKind += 1;
			}
			
			if (totalPrice >= 20000) {
				deliveryPrice = 0;
			}else if (totalPrice == 0) {
				deliveryPrice = 0;
			}else {
				deliveryPrice = 3000;
			}
				finalTotalPrice = totalPrice + deliveryPrice;
				
				// 총 가격
				$(".totalPrice_span").text(totalPrice);
				// 총 갯수
				$(".totalCount_span").text(totalCount);
				// 총 종류
				$(".totalKind_span").text(totalKind);
				// 배송비
				$(".deliveryprice_span").text(deliveryPrice);
				// 총 가격
				$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
				
		})
	};
	
	$(".plus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		if(quantity > 1){
			$(this).parent("div").find("input").val(--quantity);		
		}
	});
	
	$("tbody").on("click", ".quantity_modify_btn", function(event) {
		event.preventDefault();
		let cartId = $(this).attr("data-cartId");
		
		let cartCount = $(this).parent("td").find("input").val();
		

		
		
		$.ajax({
            type : 'post',
            url : '/cart/update',
            data : {
               "cartId" : cartId,
               "cartCount" : cartCount
            },
            dataType : 'text',
            success : function(result) {
            	let count=0;
            	let sum = 0;
            	let deliveryPrice = 0;
            	let finalTotalPrice = 0;
            	let arr = $("input.quantity_input");
            	
            	let arr_pPrice = $(".cart-pPrice");
        		let arr_price = [];
        		
        		
        		
        		
        		
        		let arr_cart_subfinal = $(".cart_subfinal");
        		
        		for(let j=0;j<arr_pPrice.length;j++){
        			arr_price.push($(arr_pPrice[j]).attr("data-price"));
        		}
        		
        		
            	
            	
            	for(let i=0;i<arr.length;i++){
            		let sumpart = 0;
            		count += Number($(arr[i]).val());
            		
            		sum += Number($(arr[i]).val()) * arr_price[i];
            		sumpart = Number($(arr[i]).val())*arr_price[i];
            		$(arr_cart_subfinal[i]).text(sumpart+"원");
            		
            	}
			
				
            	
				
				if (sum >= 20000) {
					deliveryPrice = 0;
				}else if (sum == 0) {
					deliveryPrice = 0;
				}else {
					deliveryPrice = 3000;
				}
				finalTotalPrice = sum + deliveryPrice;
				$("span.totalCount_span").text(count);
				$("span.totalPrice_span").text(sum);
				$("span.deliveryprice_span").text(deliveryPrice);
				$("span.finalTotalPrice_span").text(finalTotalPrice);
				location.reload();
              }
            });
	});
	
	$(".delete_btn").on("click", function (event) {
		event.preventDefault();
		let cartId = $(this).attr("data-cartid");
		
		
		$.ajax({
			type : 'post',
			url : '/cart/delete',
			data : {
				"cartId" : cartId
				
			},
			dateType : 'text',
			success : function (result) {
				$(".delete_cartId").val(cartId);
				$(".quantity_delete_form").submit();
				location.reload();
			}
		});
	});
	
	
	
	$(".order_btn").on("click", function () {
		let form_contents = "";
		let orderNumber = 0;
		$(".cart_info_td").each(function (index, element) {
			if ($(element).find(".individual_cart_checkbox").is(":checked") === true) {
			
			let pno = $(element).find(".individual_pno_input").val();
			let cartCount = $(element).find(".individual_cartCount_input").val();
			
			let pno_input = "<input name='orders[" + orderNumber + "].pno' type='hidden' value='" + pno + "'>";
			form_contents += pno_input;
			
			let cartCount_input = "<input name='orders[" + orderNumber + "].cartCount' type='hidden' value='" + cartCount + "'>";
			form_contents += cartCount_input;
			
			orderNumber += 1;
			}
		});
		$(".order_form").html(form_contents);
		$(".order_form").submit();	
	});

</script>


<%-- ${cartInfo} --%>
</body>
</html>