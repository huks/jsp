<!-- /temp/docs/member/insertForm.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>계정 만들기</title>
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

.form-signin {
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

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-signin input[type="button"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.form-signin button {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.horizontal-label {
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

<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
		if (!userinput.id.value) {
			alert("ID를 입력하세요");
			return false;
		}

		if (!userinput.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		if (userinput.password.value != userinput.passcheck.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}

		if (!userinput.username.value) {
			alert("사용자 이름을 입력하세요");
			return false;
		}
	}

	// 아이디 중복 여부를 판단
	function checkDuplicateId(userinput) {
		// 아이디를 입력했는지 검사
		if (userinput.id.value == "") {
			alert("아이디를 입력하세요");
			return;
		}
		// url과 사용자 입력 id를 조합합니다.
		url = "checkDuplicateId.jsp?id=" + userinput.id.value;

		// 새로운 윈도우를 엽니다.
		open(
				url,
				"confirm",
				"toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}
</script>

<body>

	<div class="container">
		<form class="form-signin" action="insertProc.jsp" method="post"
			name="userinput" onSubmit="return checkIt()">
			<h2 class="form-signin-heading">테스트 계정 만들기</h2>
			<div class="row-fluid">
				<input type="text" class="span8" placeholder="사용자 이름" name="id"
					maxlength="12"> <input type="button" class="btn span4"
					value="중복확인" OnClick="checkDuplicateId(this.form)" />
			</div>
			<input type="password" class="input-block-level" placeholder="비밀번호"
				name="password" maxlength="12"> <input type="password"
				class="input-block-level" placeholder="비밀번호 확인" name="passcheck"
				maxlength="12">
			<div class="row-fluid">
				<input type="text" class="span4" placeholder="성" name="lastname"
					maxlength="10"> <input type="text" class="span8"
					placeholder="이름" name="firstname" maxlength="10">
			</div>
			<input type="text" class="input-block-level" placeholder="생년월일"
				name="dob" maxlength="10">
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">성별</label>
				</div>
				<div class="span7">
					<div class="btn-group row-fluid" data-toggle="buttons-radio"
						data-toggle-name="gender">
						<button type="button" class="btn span6 btn-danger" value="FEMALE">여성</button>
						<button type="button" class="btn span6 btn-primary" value="MALE">남성</button>
					</div>
					<input type="hidden" name="gender" value="NULL_GENDER" />
				</div>
			</div>
			<input type="text" class="input-block-level" placeholder="휴대전화"
				name="tel" maxlength="13"> <input type="text"
				class="input-block-level" placeholder="이메일 주소" name="email"
				maxlength="30"> <label class="checkbox"> <input
				type="checkbox" value="remember-me"> 이름 기억하기
			</label>
			<button class="btn btn-large" type="submit">가입하기</button>
			<button class="btn btn-large" type="reset" name="reset">다시
				입력</button>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='main.jsp'">취소</button>
		</form>

	</div>
	<!-- /container -->

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

		$(function() {
			$('div.btn-group[data-toggle-name]').each(function() {
				var group = $(this);
				var form = group.parents('form').eq(0);
				var name = group.attr('data-toggle-name');
				var hidden = $('input[name="' + name + '"]', form);
				$('button', group).each(function() {
					var button = $(this);
					button.on('click', function() {
						hidden.val($(this).val());
					});
					if (button.val() == hidden.val()) {
						button.addClass('active');
					}
				});
			});
		});
	</script>

</body>
</html>