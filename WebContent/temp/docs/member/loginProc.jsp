<!-- /temp/docs/member/loginProc.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	DAO dao = DAO.getInstance();
	boolean result = dao.passProc(id, password);

	if (result) {
		session.setAttribute("memId", id);
		response.sendRedirect("main.jsp");
	} else {
%>
<script>
	alert("���̵�� ��й�ȣ�� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%
	}
%>
