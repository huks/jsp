<!--
	/temp/docs/member/checkDuplicateId.jsp
	ID �ߺ��˻� �� Ȯ���մϴ�.
-->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>
<html>
<head>
<title>ID �ߺ�Ȯ��</title>
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
			<td height="39"><%=id%>�̹� ������� ���̵��Դϴ�.</td>
		</tr>
	</table>
	<form name="checkForm" method="post" action="checkDuplicateId.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">�ٸ� ���̵� �����ϼ���.
					<p>
						<input type="text" size="10" maxlength="12" name="id"> <input
							type="submit" value="ID�ߺ�Ȯ��">
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
					�Է��Ͻ�
					<%=id%>
					�� ����Ͻ� �� �ִ� ID�Դϴ�.
				</p> <input type="button" value="�ݱ�" onclick="setId()">
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

