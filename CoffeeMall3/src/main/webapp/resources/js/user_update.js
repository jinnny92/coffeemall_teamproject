function findAddr() {
	new daum.Postcode(
		{

			oncomplete: function(data) {
				document.querySelector("#uPostnumber").value = data.zonecode;
				document.querySelector("#uAddress").value = data.address;
			}
		}).open();
}




function phoneCheckFn() {
	let uPhone = { uPhone: $("#uPhone").val() };

	$.ajax({
		url: '/user/phoneCheck',
		type: 'post',
		data: uPhone,
		success: function(result) {
			if (result == 1) {
				alert("이미 사용중인 전화번호 입니다.");
				$("#btn_submit").attr('disabled', 'disabled');

			} else if (result == -1) {
				alert("전화번호를 입력해주세요");
				$("#btn_submit").attr('disabled', 'disabled');
				return;
			} else {
				alert("사용 가능한 전화번호입니다.");
				$("#btn_submit").removeAttr('disabled');

			}
		}


	});

}

function emailCheckFn() {
	let uEmail = { uEmail: $("#uEmail").val() };

	$.ajax({
		url: '/user/emailCheck',
		type: 'post',
		data: uEmail,
		success: function(result) {
			if (result == 1) {
				alert("이미 사용중인 이메일입니다.");
				$("#btn_submit").attr('disabled', 'disabled');

			} else if (result == -1) {
				alert("이메일을 입력해주세요");
				$("#btn_submit").attr('disabled', 'disabled');
				return;
			} else {
				alert("사용 가능한 이메일입니다.");
				$("#btn_submit").removeAttr('disabled');

			}
		}


	});

}


function nicknameCheckFn() {
	let uNickname = {
		uNickname: $("#uNickname").val()
	};

	$.ajax({
		url: '/user/nicknameCheck',
		type: 'post',
		data: uNickname,
		success: function(result) {
			if (result == 1) {
				alert("이미 사용중인 닉네임입니다.");
				$("#submit").attr('disabled', 'disabled');

			} else {
				alert("사용 가능한 닉네임입니다.");
				$("#submit").removeAttr('disabled');
			}
		}

	});

}


function modifyPw() {

	if ($("#uPassword").val() == "") {
		alert("변경할 비밀번호를 입력해 주세요");
		$("#uPassword").focus();
		return false;
		} 
	
	if ($("#uPassword").val() != $("#uPassword2").val()) {
		alert("비밀번호가 다릅니다. 다시 확인해 주세요");

		$("#uPassword").val("");
		$("#uPassword2").val("");
		$("#uPassword").focus();
		return false;
	};
	alert("비밀번호가 변경되었습니다. 다시 로그인해 주세요");
}

$("#uPassword2").keyup(function() {

	if ($(this).val() != $("#uPassword").val()) {
		$("#pwch").html("비밀번호가 다릅니다");
		$("#pwch").css("color", 'red');
		pwc = false;

	} else {
		$("#pwch").html("비밀번호가 일치합니다");
		$("#pwch").css("color", 'blue');
		pwc = true;
	}
});


$("#uPassword").keyup(function() {

	if ($(this).val() != $("#uPassword2").val()) {
		$("#pwch").html("비밀번호가 다릅니다");
		$("#pwch").css("color", 'red');
		pwc = false;

	} else {
		$("#pwch").html("비밀번호가 일치합니다");
		$("#pwch").css("color", 'blue');
		pwc = true;
	}
});