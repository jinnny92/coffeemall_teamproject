<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style type="text/css">
.navbar {
	transition: all 0.4s;
}

.navbar .nav-link {
	color: #555;
}

.navbar .nav-link:hover, .navbar .nav-link:focus {
	color: #555;
	text-decoration: none;
}

.navbar .navbar-brand {
	color: #555;
}

/* Change navbar styling on scroll */
.navbar.active {
	background: #F5F5F5;
	box-shadow: 1px 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar.active .nav-link {
	color: #555;
}

.navbar.active .nav-link:hover, .navbar.active .nav-link:focus {
	color: #fff;
	text-decoration: none;
}

.navbar.active .navbar-brand {
	color: #555;
}

@media ( max-width : 991.98px) {
	.navbar {
		background: #fff;
	}
	.navbar .navbar-brand, .navbar .nav-link {
		color: #555;
	}
}

.text-small {
	font-size: 0.9rem !important;
}

body {
	min-height: 110vh;
	background-color: #fff;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<h1 class="text-center">공지사항 수정</h1>
	<br>
	<form action="/notice/update" method="post">
		<input type="hidden" name="nno" value="${nDto.nno}"> <label
			for="userId" class="col-sm-2 col-form-label col-form-label-lg">작성자</label>
		<div class="col-sm-10">
			<input readonly name="userId" class="form-control form-control-lg"
				id="userId" value="${nDto.userId}">
		</div>

		<label for="nTitle" class="col-sm-2 col-form-label col-form-label-lg">글제목</label>
		<div class="col-sm-10">
			<input name="nTitle" class="form-control form-control-lg" id="nTitle"
				value="${nDto.nTitle}">
		</div>

		<br> <label for="nContent"
			class="col-sm-2 col-form-label col-form-label-lg">내용</label>
		<div class="col-sm-10">
			<input name="nContent" class="form-control form-control-lg"
				id="nContent" value="${nDto.nContent}">
		</div>

		<br> <br> <br>
	</form>

	<div class="form-group">
		<div id="uploadFile" class="form-control text-center"></div>
	</div>

	<!--업로드한 파일의 썸네일  -->
	<div id="uploadedItems" class="row row-cols-1 row-cols-3"></div>
     
	<div class="form-group row">
		<input id="btn_submit" type="submit"
			class="form-control btn btn-secondary col-sm-4 offset-sm-4"
			value="수정 완료">
	</div>
	
	<div class="form-group row">
		<input id="btn_reset" type="reset"
			class="form-control btn btn-secondary col-sm-4 offset-sm-4"
			value="취소" onclick="history.back()">
	</div>

	<script type="text/javascript" src="/resources/js/notice.js"></script>
	<script type="text/javascript">


 	$(function() {
 		let nno = ${nDto.nno};  
 		let formData = new FormData(); 
 		let idx = 0; 
 		let deleteFilenameArr = [];
 		
 		getAllUploadForUpdateUI(nno, $("#uploadedItems")); 
 		
 	   $("#uploadFile").on("dragenter dragover", function(event) { 

		      event.preventDefault();  
		   });

		   $("#uploadFile").on("drop", function(event) {
		      event.preventDefault();
		      
		      let files = event.originalEvent.dataTransfer.files; 
		      
		      let file = files[0]; 
		      
		      
		      formData.append("file" + idx, file);
	
		     
		      let reader = new FileReader(); 

		      reader.readAsDataURL(file); 
		    
		      reader.onload = function(event){
		       
		          let str  = test2(event.target.result, file["name"], "file"+ idx++);
		    		
		          $("#uploadedItems").append(str);
		     
			}
		      
				
	   });

 		$("#uploadedItems").on("click", ".btn_del_item", function() {  
			let filename =	$(this).attr("data-filename"); 

 		if (filename == "new") { 
					let filekey =	$(this).attr("data-filekey"); 
					formData.delete(filekey); 
			}else {
				deleteFilenameArr.push(filename);
			}
 			$(this).parent().parent().parent().remove(); 
 		});
 	
 	
 	
 		
 		$("#btn_submit").click(function() {
 			
 			
 			formData.append("nno", nno); 
 			
 			
 			let nTitle = $("#nTitle").val(); 
 			formData.append("nTitle", nTitle);
 			
 			
 			 
 			let userId = $("#userId").val();
 			formData.append("userId", userId); 
 			
 			let nContent = $("#nContent").val(); 
 			formData.append("nContent", nContent); 
 			
 			
 			
 			formData.append("deleteFilenameArr", deleteFilenameArr);
 			
 			
 		   $.ajax({
 		        type : "post",
 		         url : "/notice/update", 
 		          processData : false,   
 		            contentType: false, 
 		             data : formData,  
 		             dataType : "text",
 		             success : function(result){ 
 		            	 
 		            	 if (result == "SUCCESS") {
							location.assign("/notice/read/"+nno); 

						} else { 
							alert("수정실패");
						}
 		              
 	                }
 	
 		    });
		
		});
 		
	});

</script>
</body>
</html>