<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "temp.member.*" %>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="member" class="temp.member.DTO">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>
 
<%
    String id = (String)session.getAttribute("memId");
	member.setId(id);

	DAO dao = DAO.getInstance();
    dao.updateMember(member);
 %>

<meta http-equiv="Refresh" content="5;url=main.jsp" >
 
<!--
	Le styles
	.form-temp-p {} 추가
-->
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

.form-temp .form-temp-heading,.form-temp .checkbox .form-temp-p {
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

<body>
	<div class="container">
		<form class="form-temp">
			<h4 class="form-temp-heading">회원정보가 수정되었습니다.</h4>
			<p class="form-temp-p">5초후에 메인으로 이동합니다.</p>
			<button class="btn btn-large" type="button"
				onClick="javascript:window.location='main.jsp'">메인으로</button>
		</form>
	</div>

</body>