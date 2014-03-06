<!-- /temp/docs/member/main.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>메인</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-login {
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

.form-login .form-login-heading,.form-login .checkbox {
	margin-bottom: 10px;
}

.form-login input[type="text"],.form-login input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.error {
	border: 1px solid #b94a48 !important;
	background-color: #fee !important;
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
<link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
</head>

<%
	try {
		if (session.getAttribute("memId") == null) {
%>

<body>

	<div class="container">
		<form class="form-login" action="loginProc.jsp" method="post">
			<h2 class="form-login-heading">테스트 계정 로그인</h2>
			<label>사용자 이름</label> <input
				data-msg-required="The ID field is required."
				data-rule-required="true" type="text" class="input-block-level"
				name="id" autofocus> <label>비밀번호</label> <input
				data-msg-required="The Password field is required."
				data-rule-required="true" type="password" class="input-block-level"
				name="password">
			<button class="btn btn-large" type="submit">로그인</button>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='insertForm.jsp'">회원가입</button>

		</form>
	</div>
	<!-- /container -->

	<%
		} else {
	%>

	<div class="container">
		<form class="form-temp" action="logout.jsp" method="post">
			<h2 class="form-temp-heading">환영합니다. <%=session.getAttribute("memId")%>님</h2>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='memberInfo.jsp'">회원정보</button>
			<button class="btn btn-large" type="submit">로그아웃</button>
		</form>
	</div>
	
	<%
		}
		} catch (NullPointerException e) {
		}
	%>
	
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../assets/js/jquery.js"></script>
	<script src="../assets/js/bootstrap-transition.js"></script>
	<script src="../assets/js/bootstrap-alert.js"></script>
	<script src="../assets/js/bootstrap-modal.js"></script>
	<script src="../assets/js/bootstrap-dropdown.js"></script>
	<script src="../assets/js/bootstrap-scrollspy.js"></script>
	<script src="../assets/js/bootstrap-tab.js"></script>
	<script src="../assets/js/bootstrap-tooltip.js"></script>
	<script src="../assets/js/bootstrap-popover.js"></script>
	<script src="../assets/js/bootstrap-button.js"></script>
	<script src="../assets/js/bootstrap-collapse.js"></script>
	<script src="../assets/js/bootstrap-carousel.js"></script>
	<script src="../assets/js/bootstrap-typeahead.js"></script>
	<script src="//ajax.aspnetcdn.com/ajax/jQuery/jquery-1.9.1.js"
		type="text/javascript"></script>
	<script
		src="//ajax.aspnetcdn.com/ajax/jQuery.validate/1.11.1/jquery.validate.js"
		type="text/javascript"></script>
	<script
		src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$("form").validate({

			showErrors : function(errorMap, errorList) {

				// Clean up any tooltips for valid elements
				$.each(this.validElements(), function(index, element) {
					var $element = $(element);

					$element.data("title", "") // Clear the title - there is no error associated anymore
					.removeClass("error").tooltip("destroy");
				});

				// Create new tooltips for invalid elements
				$.each(errorList, function(index, error) {
					var $element = $(error.element);

					$element.tooltip("destroy") // Destroy any pre-existing tooltip so we can repopulate with new tooltip content
					.data("title", error.message).addClass("error").tooltip({
						'placement' : 'right'
					}); // Create a new tooltip based on the error messsage we just set in the title
				});
			}
		});
	</script>
</body>
</html>