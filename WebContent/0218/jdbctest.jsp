<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>

<%
	// JDBC 1�ܰ� ����̹� �ε�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2�ܰ� DB ����
	String path = "jdbc:oracle:thin:@220.86.7.141:1521:orcl";
	Connection conn = DriverManager.getConnection(path,"java01","java01");
	// 3�ܰ� SQL �ۼ�
	PreparedStatement pstmt = conn.prepareStatement("select * from userinfo");
	// 4�ܰ� sQL ����
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){
		String username = rs.getString("username");
		String password = rs.getString("password");
		String firstname = rs.getString("firstname");
		String familyname = rs.getString("familyname");
		String dob = rs.getString("dob");
		String sex = rs.getString("sex");
		String tel = rs.getString("tel");
		String email = rs.getString("email");
		String region = rs.getString("region");
		Timestamp reg = rs.getTimestamp("reg");		
%>						
		<%=username %> <%=password %> <%=firstname %> <%=familyname %> <%=dob %> <%=sex %> <%=tel %> <%=email %> <%=region %> <%=reg %> <br />		
<%	}	
	rs.close();
	pstmt.close();
	conn.close();	
%>