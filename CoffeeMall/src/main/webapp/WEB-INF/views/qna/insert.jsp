<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CoffeeMall</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
#uploadFile {
	background-color: yellow;
}
</style>
</head>
<body>

     <jsp:include page="../header.jsp" />

	<div class="jumbotron">
		<h1 class="text-center">문의사항 작성</h1>
	</div>


	<hr>

     <form action="/qna/insert" method="post">
		<div class="form-group row">

			<label for="userid" class="col-sm-2 col-form-label col-form-label-lg">작성자</label>
			<div class="col-sm-10">
				<input name="userid" class="form-control form-control-lg"
					id="userid" value="${login.userId}" readonly>
			</div>
		</div>


		<div class="form-group row">

			<label for="qTitle" class="col-sm-2 col-form-label col-form-label-lg">제목</label>
			<div class="col-sm-10">
				<input name="qTitle" class="form-control form-control-lg"
					id="qTitle">
			</div>
		</div>


		<div class="form-group row">

			<label for="qContent"
				class="col-sm-2 col-form-label col-form-label-lg">내용</label>
			<div class="col-sm-10">
				<textarea name="qContent" class="form-control" id="qContent"
					rows="5"></textarea>
			</div>
		</div>
           
	</form>
    <hr>

	<table>
		 		
		<tr>
			<td>파일첨부</td>
			<td><input id="file" type="file" multiple></td>
		</tr>

		<tr>
			<td><input id="btn_submit" type="submit" value="문의글 작성"></td>
			<td><input type="button" onclick="location.assign('/qna/list')"
				value="목록 보기"></td>
		</tr>

	</table>

     <jsp:include page="../footer.jsp" />
  
	<script type="text/javascript" src="/resources/js/template.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			let formData = new FormData();
			let idx = 0;

			$("#btn_submit").click(function() {
				let userid = $("#userid").val();
				let qTitle = $("#qTitle").val();
				let qContent = $("#qContent").val();
				let fileNames = $("#file")[0].files;

				formData.append("userid", userid);
				formData.append("qTitle", qTitle);
				formData.append("qContent", qContent);

				for ( let i in fileNames) {
					formData.append("file" + idx++, fileNames[i]);
				}

				$.ajax({
					type : "post",
					url : "/qna/insert",
					processData : false,
					contentType : false,
					data : formData,
					dataType : "text",
					success : function(qno) {
						location.assign("/qna/read/" + qno);
					}

				});
			});

		});
	</script>
</body>
</html>