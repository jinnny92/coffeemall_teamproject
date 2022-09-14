<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 상세내용</title>
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

table, th, td {
	border: 1px solid #F7F7F7;
	align: center;
}

table {
	width: 100px;
	margin-left: auto;
	margin-right: auto;
}

td {
	width: 100px;
	height: 200px;
}

.th1 {
	background-color: #F7F7F7;
}
</style>

</head>
<body>
	<jsp:include page="../header.jsp" />
	<h1 class="text-center">QnA</h1>
	<br>

	<input type="hidden" name="qno" value="${qDto.qno}">

	<table class="table table-bordered">
		<thead>
			<tr>
				<th class="th1" colspan="4">${qDto.qTitle}</th>
			</tr>
			<tr>
				<th scope="col">${qDto.userid}</th>
				<th scope="col">${qDto.qWriteDay}</th>
				<th scope="col">${qDto.readCnt}</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<td colspan="4">${qDto.qContent}<br>
					<div id="uploadedItems"></div></td>
			</tr>
		</tbody>
	</table>

	<br>
	<br>

	
	<div align="right">
		<c:if test="${qDto.userid eq login.userId or not empty adminLogin.adminId}">
			<a class="btn btn-secondary" href="/qna/update/${qDto.qno}">수정</a> 
			<a class="btn btn-secondary delete" href="#">삭제</a> 
		</c:if>		
			<a class="btn btn-secondary" href="/qna/list">목록</a>
	</div>
	
	
	<hr>
	<h4>Comment</h4>
	<hr>

	<br>
	<div class="card card-body">
		<div class="form-group row">
			<div class="col-sm-10">
				<input type="hidden" class="form-control form-control-lg"
					id="replyer" value="관리자" readonly>
			</div>
		</div>

		<div class="form-group row">
		
			<label for="replyText"
				class="col-sm-1 col-form-label col-form-label-lg">댓글</label>
				
			<div class="col-sm-10">
				<input class="form-control form-control-lg" id="replyText">
			</div>
		</div>

		<div class="form-group row">
			<input id="reply_btn_submit"
				class="form-control btn btn-secondary col-sm-2 offset-sm-5"
				type="submit" value="댓글 작성 완료">
		</div>
	</div>

	<form action=""></form>


	<div id="replies"></div>

	<div class="modal fade" id="exampleModal" data-backdrop="static"
		tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						No.<span id="modal_rno">댓글 수정</span>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" value="${item.replyText}">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			
						<div class="form-group">
							<input type="hidden" id="item_input_update_replyer"
								class="form-control" value="${item.replyer}" readonly>
						</div>
						<div class="form-group">
							<input id="item_input_update_replyText" class="form-control"
								value="${item.replyText}">
						</div>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button"
						class="btn btn-primary" data-dismiss="modal" id="item_btn_update_submit">수정 완료</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<jsp:include page="../footer.jsp" />
	<script type="text/javascript" src="/resources/js/qna.js"></script>
	<script type="text/javascript">
		let qno = ${qDto.qno};

		$(function() {

			getAllUpload(qno, $("#uploadedItems"));

			$(".goback").click(function() {
				history.go(-1);
			});

			$("#item_btn_update_submit").click(function() {
				let replyer = $("#item_input_update_replyer").val();
				let replyText = $("#item_input_update_replyText").val();
				let rno = $("#modal_rno").text();

				$.ajax({
					type : "put",
					url : "/replies",
					headers : {
						"Content-Type" : "application/json; charset=UTF-8",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						replyer : replyer,
						replyText : replyText,
						rno : rno
					}),
					dataType : "text",
					success : function(result) {
						getAllReply(qno, $("#replies"));
					}
				});
			});

			$("#replies").on("click", ".item_btn_update", function() {
				$('#exampleModal').on('show.bs.modal', function (event) {
					  var button = $(event.relatedTarget) 
					  var replyer = button.data('whatever') 
					  var modal = $(this)
					  modal.find('.modal-title').text('댓글 수정')
					  modal.find('.modal-body input').val(replyer)
					});
				
				
					let replyer = $(this).prev().prev().text();
					let replyText = $(this).prev().text();
					let rno = $(this).attr("data-rno");
			
					$("#modal_rno").text(rno);
					$("#item_input_update_replyer").val(replyer);
					$("#item_input_update_replyText").val(replyText);

				
			});

			$("#replies").on("click", ".item_btn_delete", function() {
				let rno = $(this).attr("data-rno");
				$.ajax({
					type : 'delete',
					url : '/replies',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					data : JSON.stringify({
						rno : rno
					}),
					dataType : 'text',
					success : function(result) {
						getAllReply(qno, $("#replies"));
					}

				});
			});

			$("#reply_btn_submit").on("click", function() {
				let replyer = $("#replyer").val();
				let replyText = $("#replyText").val();

				$.ajax({
					type : 'post',
					url : '/replies',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data : JSON.stringify({
						replyer : replyer,
						replyText : replyText,
						qno : qno
					}),
					dataType : 'text',
					success : function(result) {
						if (result == 'SUCCESS') {
							$("#replyer").val("");
							$("#replyText").val("");
						} else {
							alert("입력 실패했습니다.");
						}
					}

				});

			});

			$(".delete").on(
					"click",
					function() {
						$("form").attr("action", "/qna/delete/${qDto.qno}")
								.attr("method", "post").submit();
					});

			getAllReply(qno, $("#replies"));
			getPagingReply(qno, $("#replies"), 2);

		});
	</script>
</body>
</html>