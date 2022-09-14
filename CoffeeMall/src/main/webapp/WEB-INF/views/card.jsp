<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>



.card-body {
	position: relative;
	height: 400px;
	cursor: pointer;
	overflow: hidden;
	box-shadow: 1px 1px 3px rgba(0,0,0,0.5);
}
.card {
height:400px;
margin:auto;


}
.card-body img {
	width: 100%;
	transition: all 0.3s ease-in-out;
}
.card-body:before {
	content: '';
	background: #000;
	width: 0px; height: 3px;
	position: absolute; right: 20px; top: 20px;
	transition: all 0.35s ease;
}
.card-body:after {
	content: '';
	background: #000;
	width: 3px; height: 0px;
	position: absolute; right: 20px; top: 20px;
	transition: all 0.35s ease;
}

.card-body .info {
	position: absolute; left: 0; bottom: 0;
	color: #000;
	width: 100%;
	padding: 15px;
	box-sizing: border-box;
	opacity: 0;
	transition: all 0.3s ease-in-out;
	pointer-events: none;
}
.card-body .info h3 {
	font-size: 24px;
	line-height: 40px;
	overflow: hidden; 
	white-space: nowrap;
	text-overflow: ellipsis;
	padding-bottom: 3px;
	
}
.card-body .info p {
	font-size: 16px;
	overflow: hidden; 
	white-space: nowrap;
	text-overflow: ellipsis;
}
.card-body:hover .info {
	opacity: 1;
	
}
.card-body:hover img {
	opacity: 0.2;
	
}
.card-body:hover:before {
	width: 60px;
	
	
}
.card-body:hover:after {
	height: 60px;
	
	
}

h1{
pointer-events: none;
}
</style>
    <div class="container">
    <h1>추천상품</h1><hr><br>
        <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                    <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶2.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>에티오피아 예가체프</h3>
                    		<p>#싱그러운 #안락한 #허브</p>
                    	</div>
                    </div>
                    
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                              <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶1.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>스타블랜드</h3>
                    		<p>#달달한 #고소한 #카라멜</p>
                    	</div>

                    </div>
                </div>
            </div>
            <div class="col-4">
                   <div class="card">
                    <div class="card-body">
                	     <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶3.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>베트남 로부스타</h3>
                    		<p>#묵직한 #구수한 #달달한</p>
                    	</div>
                    </div>
                </div>
            </div>
            
        </div><br><br>
        
        <h1>신규상품</h1><hr><br>
  <div class="row">
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                    <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶4.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>과테말라 디카페인</h3>
                    		<p>#건자두 #옥수수 #황설탕</p>
                    	</div>
                    </div>
                    
                </div>
            </div>
            <div class="col-4">
                <div class="card">
                    <div class="card-body">
                              <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶5.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>콜롬비아 디카페인</h3>
                    		<p>#카라멜 #초콜렛 #아몬드</p>
                    	</div>

                    </div>
                </div>
            </div>
            <div class="col-4">
                   <div class="card">
                    <div class="card-body">
                	     <a href="https://www.naver.com">
                	     <img src="/resources/img/product/콩볶6.PNG" class="card-img-top">
                	     </a>
                	    <div class="info">
                    		<h3>브라질 디카페인</h3>
                    		<p>#살구 #카라멜 #카카오</p>
                    	</div>
                    </div>
                </div>
            </div>
         </div>
    </div>




    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>

</html>