<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 정보</title>

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
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">   
   <style type="text/css">
   
   .container{
 	text-align:center;
   
   
   }
   #uploadedItems{
   margin-top: 150px;

   display: inline-block;
   vertical-align: top;
   
   }
   
   .description{
  
    display: inline-block;
   vertical-align: top;
   margin-top : 150px;
   
   }
   .class{
    display: inline-block;
   }
   
   .option{
   text-align: center;
   }
   
   a:hover{
   color: black;
   }
   
.jumbotron{

background-color: #e8e8fc; 
}


.returnbutton {
  align-items: center;
  background-color: #f8f8ff;
  border-radius: 12px;
  box-shadow: transparent 0 0 0 3px,rgba(18, 18, 18, .1) 0 6px 20px;
  box-sizing: border-box;
  color: gray;
  cursor: pointer;
  display: inline-flex;
  flex: 1 1 auto;
  font-family: Inter,sans-serif;
  font-size: 1.1rem;
  font-weight: 700;
  justify-content: center;
  line-height: 1;
  margin: 0;
  outline: none;
  padding: 1rem 1.2rem;
  text-align: center;
  text-decoration: none;
  transition: box-shadow .2s,-webkit-box-shadow .2s;
  white-space: nowrap;
  border: 0;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.returnbutton:hover {
  box-shadow: #121212 0 0 0 3px, transparent 0 0 0 0;
}


.name{
border-bottom: #e8e8fc solid;
}

 .starlist{
 
 float: left;
 }
.star{
   font-size: 30px !important;
   color: gray;
   cursor: pointer;
}


.bright {
   
   color: orange;
}

.btn-primary{

background-color: #e8e8fc;
color: black;
border-color: #e8e8fc;

}
  

   </style>
</head>
<body>


<code> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> </code>
<%@ include file="/WEB-INF/views/header.jsp" %>
   <div class="jumbotron">

      <h1 class="text-center">제품 정보</h1>
      
   </div>
   
   
<div class="container">
   <div id="uploadedItems"></div>

<div class="description">
    <input type="hidden" value="${pDto.pno}">
   <br>
   <p style="font-size:1.3em;"  class="name">${pDto.pName}</p>
   
   <p style="font-size: 1.1em; font-weight: bold;">제품정보 </p>
   <a> ${pDto.pContent}</a>
   <p style ="font-size: 1.1em; font-weight: bold;">제품가격</p> <p><fmt:formatNumber value="${pDto.pPrice}" pattern="#,###"/></p><br>
   <br>
   <p>종류 : ${pDto.pCategory}</p>
   <p> 용량 : ${pDto.pSize}</p>
   <p> 원산지 : ${pDto.pOrigin}</p>
   <br>
   <br> 
   <div> 
        <div class="btn_quantity">
         수량
         <input type="hidden" name="sell_price" value="${pDto.pStock}">
         <input type="number" class="amount quantity_input" name="amount" value="1" size="3"   
            max="" min="1">
            <span>
                  <button class="plus">▲</button>
               <button class="minus">▼</button>
            </span>
         <br>
         <br> 금액
         <input type="text" id="sum" name="sum" size="11" value="${pDto.pPrice}"
         readonly>원
         </div>
   </div>


   <br>
   <br>
   <div class="button_set">
  	
  	<c:if test="${not empty login.userId or empty adminLogin or bossLogin}">
   	<a class="btn_cart" ><input type="button" value="장바구니에 담기" ></a>
   	&nbsp;&nbsp;&nbsp;
   	<a class="btn_buy" ><input type="button" value="바로 구매"></a>
   	<br>
   	<br>
   	<a href="/cart/${login.userId}"><input type="button" value="장바구니 확인"></a>
   	</c:if>
   </div>
   <br>
</div>
</div>




   <form action="">
   <input name="pCategory" value="${pDto.pCategory}" type="hidden">
   </form>

<br>
<div class="option">
<button class="returnbutton"onclick="history.back()">목록으로 돌아가기</button>
<br><br>
   <span style="background: linear-gradient(to top, #CDA27D 50%, transparent 60%"><a href="/product/list/원두">원두 목록</a>&nbsp;&nbsp;</span>
    <span style="background: linear-gradient(to top, #BEEFFF 50%, transparent 60%"><a href="/product/list/콜드브루">콜드브루 목록</a>&nbsp;</span>
     <span style="background: linear-gradient(to top, #F4B4B4 50%, transparent 60%"><a href="/product/list/핸드드립">핸드드립 목록</a></span>
     <br>
     
   <c:if test="${not empty bossLogin.bossId}">   
   <a href="/product/update/${pDto.pno}">수정</a>
   <a href="#" id = "deletebtn">삭제</a>
   </c:if>

</div>


<p>
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    리뷰작성
  </a>
</p>

<div class="collapse" id="collapseExample">
  <div class="card card-body">
  <span class="rate">&nbsp;&nbsp;&nbsp;별점</span>

    <div class="starList" data-val="">
     <i data-idx="0" data-val="1" class="bi bi-star-fill star"></i>
<i data-idx="1" data-val="2" class="bi bi-star-fill star"></i>
<i data-idx="2" data-val="3" class="bi bi-star-fill star"></i>
<i data-idx="3" data-val="4" class="bi bi-star-fill star"></i>
<i data-idx="4" data-val="5" class="bi bi-star-fill star"></i> 
</div>
 

<label for="rComment" >후기</label>				
<textarea  id="rComment" rows="7" cols=""></textarea><br><br>	

	<div class="form-group row">
    	<input id="review_btn_submit" class="form-control btn btn-primary col-sm-2 offset-sm-5" type="submit" value="후기 작성 완료">	
    </div>    
    

  </div>
</div>

<!-- 주문 form -->
<form action="/order/${login.userId}" method="get" class="order_form">
	<input type="hidden" name="orders[0].pno" value="${pDto.pno}">
	<input type="hidden" name="orders[0].cartCount" value="">
</form>

<%@ include file="/WEB-INF/views/footer.jsp" %>
   <script type="text/javascript" src="/resources/js/tl.js"></script>
   <script type="text/javascript">
   let pno = ${pDto.pno};
   let orderId = "${oDto.orderId}";
   let userId = "${login.userId}";
   
   $(document).ready(function() {
	  getAllUpload(pno, $("#uploadedItems"));
      let amount = $(".amount").val();
      
      $("#sum").val((amount*${pDto.pPrice}).toLocaleString());

  
      
      $("#deletebtn").on("click", function() {
          $("form").attr("action", "/product/delete/${pDto.pno}");
          $("form").attr("method", "post");
          $("form").submit();
       });
    
   
   
   $(".amount").on("input", function () {
       amount = $(this).val();
      
      $("#sum").val((amount*${pDto.pPrice}).toLocaleString());
      
   });   
   
   
   $(".amountInc").on("click", function () {   
       amount = Number(($(".amount").val())) + 1;
       $(".amount").val(amount);
      
      $("#sum").val((amount*${pDto.pPrice}).toLocaleString());

   });
   
   $(".amountDec").on("click", function () {
       amount = Number(($(".amount").val())) - 1;
       if(amount = 1){
          amount = 1;
       }
       
       $(".amount").val(amount);
      
      $("#sum").val((amount*${pDto.pPrice}).toLocaleString());
      
     
   });
   
   $("#review_btn_submit").on("click", function(){
		  let rRating = $(".starList").attr("data-val");
		  let rComment = $("#rComment").val();
		  
		  $.ajax({
			  type: 'post',
		      url: "/reviews",
		      headers : {
		    	  "Content-Type" : "application/json",
		    	  "X-HTTP-Method-Override" : "POST"
		      },
		      data : JSON.stringify({
		    	  userId : userId,
		    	  orderId : orderId,
		    	  rComment : rComment,
		    	  rRating : rRating,
		    	  pno : pno
		    	 
		      }),
		      
		      dataType : 'text',
		      success : function(result){
		    	  if(result=='SUCCESS'){
		    		  star($(".starList")); 
		    		  $("#rComment").val("");	  
		    	  }else{
		    		  alert("입력 실패");
		    		  
		    	  }
		    	  
		      }
		      
		  });
		   
		   
		   
	   }); 
	   
	   
	   
	   star($(".starList")); 
	   

	   $(".star").click(function() {
	      
	      let idx = $(this).attr("data-idx");
	      let data_val = $(this).attr("data-val");
	   
	      if($(this).hasClass("bi-star-fill")){
	         if($(this).hasClass("bright")){
	            $(this).addClass("bi-star-half");
	            $(this).removeClass("bi-star-fill");
	            data_val = parseInt($(this).attr("data-idx"))+0.5;
	         }else{
	            $(this).removeClass("bi-star-half");
	            $(this).addClass("bi-star-fill");
	            data_val = parseInt($(this).attr("data-idx"))+1;
	         }   
	      }else if($(this).hasClass("bi-star-half")){
	         $(this).removeClass("bi-star-half");
	         $(this).addClass("bi-star-fill");
	         data_val = parseInt($(this).attr("data-idx"))+1;
	      }
	      
	      $(this).attr("data-val", data_val);

	      

	   


	      $(".star").each(function(index) {

	         if (index < idx) {
	            $(this).removeClass("bi-star-half");
	            $(this).addClass("bi-star-fill");
	            $(this).addClass("bright");

	         }else if(index==idx){
	            $(this).addClass("bright");
	         }else {

	            $(this).removeClass("bright");
	            $(this).removeClass("bi-star-half");
	            $(this).addClass("bi-star-fill");
	         }



	      });

	      
	      $(".starList").attr("data-val", data_val);


	   });
	   
   
});

   /* 장바구니 */
 let quantity = $(".quantity_input").val();
       $(".plus").on("click", function () {
         $(".quantity_input").val(++quantity);
             let amoun = $(".quantity_input").val();
             $("#sum").val((amoun*${pDto.pPrice}).toLocaleString());
         });
        $(".minus").on("click", function () {
         if (quantity>1) {
            $(".quantity_input").val(--quantity);
            let amoun = $(".quantity_input").val();
            $("#sum").val((amoun*${pDto.pPrice}).toLocaleString());
        }
      });
		
		const form = {
				userId : '${login.userId}', 
				pno : '${pDto.pno}',
				cartCount : ''
		 }
		 
		 
		 $(".btn_cart").on("click", function() {
			cartCount = $(".quantity_input").val();
			form.cartCount = cartCount;
			if(!userId){
				alert("로그인이 필요한 서비스입니다");
				location.href = '/user/logout';
			}
			$.ajax({
				url: '/cart/add',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
					
				}
			})
		});
		
		
		 function cartAlert(result) {
			if(result == '0'){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == '1'){
				alert("장바구니에 추가되었습니다.");
			} else if(result == '2'){
				alert("장바구니에 이미 추가되어있습니다.");
			} else if(result == '5'){
				alert("로그인이 필요합니다.");
			} 
			
		};
   
   
   
   
		$(".btn_buy").on("click", function () {
			let cartCount = $(".quantity_input").val();
			$(".order_form").find("input[name='orders[0].cartCount']").val(cartCount);
			$(".order_form").submit();
		});       

      
      

      
   
     
      
   </script>






</body>
</html>