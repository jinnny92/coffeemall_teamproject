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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/common.css'/>">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  



<meta charset="UTF-8">

<style type="text/css">
	#uploadFile{
		width: 100%;
		height: 250px;
		border: 1px solid 	#CDA27D;
	}
	
	
	body{
	background-color: 	#CDA27D;
	}
	
	.product-form{

    width: 800px;
	height: 1900px;
	background-color: #f8f8ff;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 30px;
	border-right: 5px;
	padding: 20px;
    margin-top: 150px;
}

.info{

font-weight: bold;
}
	
h1{
border-bottom: 5px solid 		#CDA27D;

}	

</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="product-form" style="border: 1px solid black;">
<form action="/product/insert" method = "post"><br>
<div class="form-group">
<h1 style="text-align:center;">제품 정보 입력</h1>
<br>

<label class="info" for="pName">제품명  </label>
<input  type="text" name = "pName" id = "pName" placeholder="제품명"><br>

제품 설명 <textarea rows="5" name = "pContent" id = "pContent"></textarea><br>

<label class="info" for="pPrice">가격</label>
 <input  name = "pPrice" id = "pPrice" type = "number"><br>
 
<label class="info" for="pStock" >재고</label>
<input  name = "pStock" id = "pStock" type = "number"><br>

<label class="info" for="pcategory">종류 </label>
 <select  class="form-control" name="pCategory" id="pCategory">

					<option value="원두" selected="selected">원두</option>

					<option value="콜드브루">콜드브루</option>

					<option value = "핸드드립"> 핸드드립</option>

				  </select> 

<br>
<label class="info" for="pSize">용량 </label>
<select class="form-control" name="pSize" id="pSize">

					<option value="----------" selected="selected">----------</option>

					<option value="50g">50g</option>

					<option value = "100mL"> 100mL</option>

				  </select> <br>
<label  class="info" for="pOrigin">원산지</label>
 <input  name = "pOrigin" id = "pOrigin">

</div>


</form>






<div class="form-group">
   <div id="uploadFile" class="form-control text-center"></div>
</div>


<div id="uploadedItems" class="row row-cols-3">
</div>



<div class="form-group row">
   <input id="btn_submit" class="form-control btn btn-success col-sm-2 offset-sm-5" type="submit" value="제품 등록 완료">   
</div>
</div>





<script type="text/javascript" src="/resources/js/tl.js"></script>
<jsp:include page="../footer.jsp"></jsp:include>
<script type="text/javascript">

$(document).ready(function() {
	
	let formData  = new FormData();
	let idx = 0;
	
	

	
	

	   $("#uploadFile").on("dragenter dragover", function(event) {
	      event.preventDefault();
	   });
	   
	   $("#uploadFile").on("drop", function(event) {
	      event.preventDefault();
	      
	      let files = event.originalEvent.dataTransfer.files;
	      let file = files[0];
	      
	      
	      formData.append("file"+idx, file);
	      
	       let reader = new FileReader(); 
	       
	       reader.readAsDataURL(file);
	      
	      reader.onload = function(event) {
	         let str = test2(event.target.result, file["name"], "file"+ idx++);
	         
	         $("#uploadedItems"). append(str); 
	      }
	      
	   });
	   
	

		$("#uploadedItems").on("click", ".btn_del_item", function() {
			let filename = $(this).attr("data-filename");
			
			if(filename == "new"){
				let filekey = $(this).attr("data-filekey");
				formData.delete(filekey);
			}else{
				deletFilenameArr.push(filename);
			}
			
			$(this).parent().parent().parent().remove();
		});
		
		
	
	

	$("#btn_submit").click(function(event){
		 event.preventDefault(); 
		
		let pName = $("#pName").val();
		let pContent = $("#pContent").val();
		let pPrice = $("#pPrice").val();
		let pCategory = $("#pCategory").val();
		let pStock = $("#pStock").val();
		let pSize = $("#pSize").val();
		let pOrigin = $("#pOrigin").val();
		
		formData.append("pName", pName);
		formData.append("pContent", pContent);
		formData.append("pPrice", pPrice);
		formData.append("pCategory", pCategory);
		formData.append("pStock", pStock);
		formData.append("pSize", pSize);
		formData.append("pOrigin", pOrigin);
		
		
		$.ajax({
			type : "post",
			url : "/product/insert",
			processData: false,
			contentType: false,
			data : formData,
			dataType : "text",
			success : function(pno) {
				location.assign("/product/read/"+pno);
				
		
			}	
				
		});
		
		
	});
	
});


</script>


</body>
</html>