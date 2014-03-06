<!-- /temp/docs/member/insertProc.jsp -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="temp.member.*"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<jsp:useBean id="member" class="temp.member.DTO">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	DAO dao = DAO.getInstance();
	dao.insert(member);
	System.out.println("insert success");
	response.sendRedirect("loginForm.jsp");
%>