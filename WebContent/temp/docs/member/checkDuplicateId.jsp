<!--
	/temp/docs/member/checkDuplicateId.jsp
	ID 중복검사 후 확인합니다.
-->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>
<html>
<head>
<title>ID 중복확인</title>
<link href="../assets/css/bootstrap.css" rel="stylesheet">
</head>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("id");
	DAO manager = DAO.getInstance();
	int check = manager.checkDuplicateId(id);
%>

<body>
	<%
		if (check == 1) {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td height="39"><%=id%>이미 사용중인 아이디입니다.</td>
		</tr>
	</table>
	<form name="checkForm" method="post" action="checkDuplicateId.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">다른 아이디를 선택하세요.
					<p>
						<input type="text" size="10" maxlength="12" name="id"> <input
							type="submit" value="ID중복확인">
				</td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center">
				<p>
					입력하신
					<%=id%>
					는 사용하실 수 있는 ID입니다.
				</p> <input type="button" value="닫기" onclick="setId()">
			</td>
		</tr>
	</table>
	<%
		}
	%>
</body>
<script language="javascript">
<!--
  function setId()
    {		
    	opener.document.userinput.id.value="<%=id%>";
		self.close();
	}
	-->
</script>
</html>

