<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="test.db.*" %>
<%@ page import="java.util.ArrayList" %>

<%
//	DAO dao = new DAO();	// DAO�� ���������ڰ� private
	DAO dao = DAO.getInstance();
	ArrayList<DTO> list = dao.select();
	for(DTO dto : list){
%>
	<%=dto.getId() %>
	<%=dto.getPw() %>
	<%=dto.getReg() %> <br />
<%		
	}
%>