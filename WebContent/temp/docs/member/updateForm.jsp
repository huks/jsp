<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>

<html>
<head>
<title>ȸ����������</title>
</head>

<!--
	Le styles
	.form-temp {
		max-width: 300px -> 600px
-->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-temp {
	max-width: 600px;
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
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../assets/ico/favicon.png">
</head>

<script language="JavaScript">
<!--
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.password.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
		if (userinput.password.value != userinput.passcheck.value) {
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���");
			return false;
		}

		if (!userinput.username.value) {
			alert("����� �̸��� �Է��ϼ���");
			return false;
		}
	}
	-->
</script>

<%
	String id = (String) session.getAttribute("memId");

	DAO manager = DAO.getInstance();
	DTO dto = manager.selectMember(id);

	try {
%>

<body>
	<div class="container">

		<form class="form-temp" action="updateProc.jsp" method="post"
			name="userinput" onsubmit="return checkIt()">
			<h2 class="form-signin-heading">ȸ����������</h2>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">����� �̸�</label>
				</div>
				<div class="span9">
					<input type="text" class="input-block-level"
						value="<%=dto.getId()%>" name="id" maxlength="12" disabled>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">��й�ȣ</label>
				</div>
				<div class="span9">
					<input type="password" class="input-block-level" name="password"
						maxlength="12">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">��й�ȣ Ȯ��</label>
				</div>
				<div class="span9">
					<input type="password" class="input-block-level" name="passcheck"
						maxlength="12">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">�̸�</label>
				</div>
				<div class="span9">
					<div class="row-fluid">
						<div class="span4">
							<input type="text" class="input-block-level" value="<%=dto.getLastname()%>" name="lastname"
								maxlength="10" disabled>
						</div>
						<div class="span8">
							<input type="text" class="input-block-level" value="<%=dto.getFirstname()%>"
								name="firstname" maxlength="10">
						</div>
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">����</label>
				</div>
				<div class="span7">
					<div class="btn-group row-fluid" data-toggle="buttons-radio"
						data-toggle-name="gender">
						<button type="button" class="btn span6 btn-danger <%=dto.getGender().equals("FEMALE")?"active":""%>" value="FEMALE">����</button>
						<button type="button" class="btn span6 btn-primary <%=dto.getGender().equals("MALE")?"active":""%>" value="MALE">����</button>
					</div>
					<input type="hidden" name="gender" value="NULL_GENDER" />
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">�޴���ȭ</label>
				</div>
				<div class="span9">
					<input type="text" class="input-block-level"
						value="<%=dto.getTel()%>" name="tel" maxlength="13">
				</div>
			</div>
			<div class="row-fluid">
				<div class="span3">
					<label class="horizontal-label">�̸��� �ּ�</label>
				</div>
				<div class="span9">
					<input type="text" class="input-block-level"
						value="<%=dto.getEmail()%>" name="email" maxlength="30">
				</div>
			</div>
			<button class="btn btn-large" type="submit">�����ϱ�</button>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='main.jsp'">���</button>
		</form>
	</div>
	
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
						button.addClass('active').siblings().removeClass('active');
					}
				});
			});
		});
	</script>

</body>
<%}catch(Exception e){}%>
</html>