<%@ page contentType="text/html; charset=euc-kr"%>
<%@ include file="/view/color.jsp"%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>

<%
	int num = 0, ref = 1, re_step = 0, re_level = 0; // ���� �ʱ�ȭ
	try {
		if (request.getParameter("num") != null) { // �Ķ���� ���� ���� ��
			num = Integer.parseInt(request.getParameter("num")); // ���� ������ȣ
			ref = Integer.parseInt(request.getParameter("ref")); // ���� �׷� �̸�(��ȣ)
			re_step = Integer.parseInt(request.getParameter("re_step")); // ���� �׷� �������� �ۼ��Է¼�����
			re_level = Integer.parseInt(request
					.getParameter("re_level")); // ���� ���� : 0�� �� ��, 1��  �亯, 2�� �亯�� �亯
		}
		
	String writer = (String)session.getAttribute("memId");
%>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�۾���</b> <br>
		<!-- post to writePro.jsp -->
		<form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
			<!-- �� �ۼ��ÿ� �����Ǵ� ���� �� : ���� ������ȣ, �׷��̸�, �ۼ��Է¼�����, ���� ���� -->
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="ref" value="<%=ref%>">
			<input type="hidden" name="re_step" value="<%=re_step%>">
			<input type="hidden" name="re_level" value="<%=re_level%>">

			<table width="400" border="1" cellspacing="0" cellpadding="0" bgcolor="<%=bodyback_c%>" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="<%=value_c%>">
						<a href="list.jsp"> �۸��</a>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td width="330">
						<input type="text" size="10" maxlength="10" value="<%=writer%>" disabled>
						<input type="hidden" name="writer" value="<%=writer%>"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td width="330">
					<%
						// num(���� ������ȣ) �Ķ���� ���� ���� �� : �� ���϶�
						if (request.getParameter("num") == null) {
					%>
						<input type="text" size="40" maxlength="50" name="subject">
					</td>
					<%
						// num(���� ������ȣ) �Ķ���� ���� ���� �� : ����϶� -> �� ���� [�亯]�� �ڵ� ���Եȴ�.
						} else {
					%>
						<input type="text" size="40" maxlength="50" name="subject" value="[�亯]">
					<%
						}
					%>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
					<td width="330"><input type="text" size="40" maxlength="30" name="email"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">�� ��</td>
					<td width="330">
						<textarea name="content" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="<%=value_c%>" align="center">��й�ȣ</td>
					<td width="330"><input type="password" size="8" maxlength="12" name="passwd"></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="<%=value_c%>" align="center">
						<input type="submit" value="�۾���">
						<input type="reset" value="�ٽ��ۼ�">
						<input type="button" value="��Ϻ���" OnClick="window.location='list.jsp'"><!-- ��Ϻ��� Ŭ�� �� list.jsp -->
					</td>
				</tr>
			</table>
			<%
				} catch (Exception e) {}
			%>
		</form>
</body>
</html>
