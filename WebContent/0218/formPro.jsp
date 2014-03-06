<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%
	String username = request.getParameter("username");
	// int num = Integer.parseInt(request.getParameter("num"));
	String password = request.getParameter("password");
	String firstname = request.getParameter("firstname");
	String familyname = request.getParameter("familyname");
	String dob = request.getParameter("dob");
	String sex = request.getParameter("sex");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String region = request.getParameter("region");

	// JDBC 1단계 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	// 2단계 DB 연결
	String path = "jdbc:oracle:thin:@220.86.7.141:1521:orcl";
	Connection conn = DriverManager.getConnection(path,"java01","java01");
	// 3단계 SQL 작성
	String sql = "insert into userinfo values(?,?,?,?,?,?,?,?,?,sysdate)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,username);
		pstmt.setString(2,password);
		pstmt.setString(3,firstname);
		pstmt.setString(4,familyname);
		pstmt.setString(5,dob);
		pstmt.setString(6,sex);
		pstmt.setString(7,tel);
		pstmt.setString(8,email);
		pstmt.setString(9,region);
	// 4단계 sQL 실행
	pstmt.executeUpdate();
	out.println("insert success");
%>