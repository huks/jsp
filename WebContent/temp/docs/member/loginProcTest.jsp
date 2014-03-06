<!-- /temp/docs/member/loginProcTest.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	session.setAttribute("medId", id);
	session.setAttribute("id", id);
	session.setAttribute("password", password);

	response.sendRedirect("main.jsp");
%>


