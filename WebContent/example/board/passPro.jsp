<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="example.board.BoardDBBean"%>
<%@ page import="java.sql.Timestamp"%>

<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	String passwd = request.getParameter("passwd");

	BoardDBBean dbPro = BoardDBBean.getInstance();
	boolean pass = dbPro.articlePass(num, passwd);

	if (pass) {
%>
		<meta http-equiv="Refresh" content="0;url=content.jsp?num=<%=num%>&pageNum=<%=pageNum%>">
<%
	} else {
%>
		<script language="JavaScript">
		<!--
			alert("��й�ȣ�� ���� �ʽ��ϴ�");
			history.go(-1);
			-->
		</script>
<%
	}
%>