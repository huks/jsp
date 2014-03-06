<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="example.board.BoardDBBean"%>
<%@ page import="example.board.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="/view/color.jsp"%>

<%!
	int pageSize = 10; // �� �������� �� ��� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // ��¥ ���� "2014-02-26 09:34"%>

<%
	String pageNum = request.getParameter("pageNum"); // "������ �ѹ�"�� �ҷ��´�.
	if (pageNum == null) { // �Ѿ���� ������ �ѹ��� ���ٸ�
		pageNum = "1"; // ������ �ѹ��� 1
	}

	int currentPage = Integer.parseInt(pageNum); // "������ �ѹ�"�� ���� ������ �ѹ���.
	int startRow = (currentPage - 1) * pageSize + 1; // currentPage�� 1�̸� 1���ۿ��� ����, 2�̸� 11���ۿ��� ����. pageSize�� ���� ���� �ٲ��.
	int endRow = currentPage * pageSize; // currentPage�� 1�̸� 10������ ��. 2�̸� 20������ ��.
	int count = 0; // ���� �� ����
	int number = 0; // 

	List articleList = null; // �� ���� �ε�Ǵ� �� ���
	BoardDBBean dbPro = BoardDBBean.getInstance(); // BoardDBBean(DAO)�� �ν��Ͻ��� �ҷ��´�.
	count = dbPro.getArticleCount(); // getArticleCount()�� ���� �� ������ ��ȯ�Ѵ�.
	if (count > 0) { // ���� �ִٸ�(count > 0 �̶��)
		articleList = dbPro.getArticles(startRow, endRow); // articleList List�� getArticle()�� ArrayList�� �߰��Ѵ�.
	}

	number = count - (currentPage - 1) * pageSize; // �� ��ȣ. �� ������ 11 : ������ 1�϶� 10, ������2�϶� 1
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�۸��(��ü ��:<%=count%>)</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a href="writeForm.jsp">�۾���</a>
				<!-- "�۾���" ��ũ : writeForm.jsp -->
			</td>				
		</table>

		<%
			if (count == 0) { // ���� ���ٸ�
		%>
		
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
			</tr>
		</table>

		<%
			} else { // ���� �ִٸ�
		%>
		
		<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">�� ȣ</td>
				<td align="center" width="250">�� ��</td>
				<td align="center" width="100">�ۼ���</td>
				<td align="center" width="150">�ۼ���</td>
				<td align="center" width="50">�� ȸ</td>
				<td align="center" width="100">IP</td>
			</tr>
			
			<%			
				/* arcticleList�� �� ���� �ε�Ǵ� �� ���  */
				for (int i = 0; i < articleList.size(); i++) {
						BoardDataBean article = (BoardDataBean)articleList.get(i);
			%>
			
			<tr height="30">
				<td align="center" width="50"><%=number--%></td><!-- number : �� ��ȣ -->
				<td width="250">
					<%
						int wid = 0;
						if (article.getRe_level() > 0) {
							wid = 5 * (article.getRe_level());
					%>	<img src="images/level.gif" width="<%=wid%>" height="16">
						<img src="images/re.gif">
					<%
						} else {
					%>	<img src="images/level.gif" width="<%=wid%>" height="16">
					<%	}
					%>	<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject()%></a>
					<%
						if (article.getReadcount() >= 20) {
					%>	<img src="images/hot.gif" border="0" height="16">
					<%	}
					%>
				</td>
				<td align="center" width="100"><a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<%
			}
		%>

		<%
			/*
				int count : ���� �� ����
				int pageSize : �� �������� �� ��� ����
				int currentPage : �� ������ �ѹ�
			*/
			if (count > 0) {
				/*	
					int pageCount : 
					���� �� ������ pageSize�� ������������ �״�� pageCount �ƴϸ� +1. 101���� ���� 11���� �������� �ʿ��ϴ�.
				*/
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				/*
					int startPage :
					
				*/
				int startPage = (int) (currentPage / 10) * 10 + 1;
				int pageBlock = 10;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 10) {
		%>
		<a href="list.jsp?pageNum=<%=startPage - 10%>">[����]</a>
		<%
			}
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
			}
				if (endPage < pageCount) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + 10%>">[����]</a>
		<%
			}
			}
		%>
	</center>
</body>
</html>