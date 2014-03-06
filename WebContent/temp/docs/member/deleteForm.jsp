<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>회원탈퇴</title>
<!-- Le styles -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-temp {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-temp .form-temp-heading,.form-temp .checkbox {
	margin-bottom: 10px;
}

.form-temp input[type="text"],.form-temp input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-temp input[type="button"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-temp button {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>
<script language="javascript">
<!--
	function begin() {
		document.myform.passwd.focus();
	}

	function checkIt() {
		if (!document.myform.passwd.value) {
			alert("비밀번호를 입력하지 않으셨습니다.");
			document.myform.passwd.focus();
			return false;
		}
	}
	-->
</script>
</head>
<body onload="begin()">
	<div class="container">
		<form name="myform" class="form-temp" action="deleteProc.jsp"
			method="post" onSubmit="return checkIt()">

			<h2 class="form-login-heading">탈퇴하시겠습니까?</h2>
			<label>비밀번호를 입력해주세요.</label> <input
				data-msg-required="The Password field is required."
				data-rule-required="true" type="password" class="input-block-level"
				name="password" autofocus>
			<button class="btn btn-large" type="submit">회원탈퇴</button>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='main.jsp'">취소</button>
		</form>
	</div>
	<!-- /container -->
</body>
</html>