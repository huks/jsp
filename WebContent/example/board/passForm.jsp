<%@ page contentType="text/html;charset=euc-kr"%>
<%@ include file="/view/color.jsp"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<html>
<head>
<title>��й�ȣ�� �Է����ּ���.</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">
<!--
	function passYes() {
		if (document.passForm.passwd.value == '') {
			alert("��й�ȣ�� �Է��Ͻʽÿ�.");
			document.passForm.passwd.focus();
			return false;
		}
	}
// -->
</script>
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�����б�</b> <br>
		<form method="POST" name="passForm" action="passPro.jsp?num=<%=num%>&pageNum=<%=pageNum%>" onsubmit="return passYes()">
			<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>"><b>��й�ȣ�� �Է��� �ּ���.</b></td>
				</tr>
				<tr height="30">
					<td align=center>
						��й�ȣ : <input type="password" name="passwd" size="8" maxlength="12">
						<input type="hidden" name="num" value="<%=num%>"></td>
				</tr>
				<tr height="30">
					<td align=center bgcolor="<%=value_c%>">
						<input type="submit" value="���б�">
						<input type="button" value="�۸��" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
