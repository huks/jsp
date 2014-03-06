<!-- 
	"로그인 상태 유지" 기능 추가하기
-->
<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="example.member.*"%>
<%@ include file="/view/color.jsp"%>
<html>
<head>
<title>메인입니다..</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
	System.out.println("START main.jsp!"); // 로그	

	LogonDBBean manager = LogonDBBean.getInstance();

	try {
		if (session.getAttribute("memId") == null) { // 세션이 없을 때

			String cooId = "";
			String cooPasswd = "";
			boolean cooOk = false;

			try {
				Cookie[] cookies = request.getCookies(); // 요청에서 쿠키를 가져온다.				
				if (cookies != null) { // 쿠키가 있을 때					
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("cooId")) {
							cooId = cookies[i].getValue();
							cooOk = true;
						} else if (cookies[i].getName().equals("cooPasswd")) {
							cooPasswd = cookies[i].getValue();
							cooOk = true;
						}
					}
					if (cooOk){
						System.out.println("cooOk is " + cooOk + "!");  // 로그
						System.out.println("cooId : " + cooId); // 로그
						System.out.println("cooPasswd : " + cooPasswd); // 로그							
						session.setAttribute("sessionId", cooId);
						session.setAttribute("sessionPasswd", cooPasswd);
						System.out.println("reponse.sendRedirect(loginPro.jsp)"); // 로그
						response.sendRedirect("loginPro.jsp");
					}
				} else {
					System.out.println("no cookies");
				}
			} catch (Exception e) {}
		// 세션이 없을 때 {
%>
<script language="javascript">
<!--
	function focusIt() {
		document.inform.id.focus();
	}

	function checkIt() {
		inputForm = eval("document.inform");
		if (!inputForm.id.value) {
			alert("아이디를 입력하세요..");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.passwd.value) {
			alert("아이디를 입력하세요..");
			inputForm.passwd.focus();
			return false;
		}
	}
//-->
</script>

<body onLoad="focusIt();" bgcolor="<%=bodyback_c%>">
	<table width=500 cellpadding="0" cellspacing="0" align="center" border="1">
		<tr>
			<td width="300" bgcolor="<%=bodyback_c%>" height="20">&nbsp;</td>
			<form name="inform" method="post" action="loginPro.jsp" onSubmit="return checkIt();">
				<td bgcolor="<%=title_c%>" width="100" align="right">아이디</td>
				<td width="100" bgcolor="<%=value_c%>">
					<!-- id -->
					<input type="text" name="id" size="15" maxlength="10"></td>
		</tr>
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300">
				<!-- 메인입니다. : 로그인 전 -->
				<input type="button" value="게시판" onclick="javascript:window.location='../board/list.jsp'">	</td>
			<td bgcolor="<%=title_c%>" width="100" align="right">패스워드</td>
			<td width="100" bgcolor="<%=value_c%>">
				<!-- passwd -->
				<input type="password" name="passwd" size="15" maxlength="10"></td>
		</tr>
		<tr>
			<td colspan="3" bgcolor="<%=title_c%>" align="center">
				<input type="submit" name="Submit" value="로그인">
				<input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'">
				<br />
				<input type="checkbox" name="login_auto" value="yes">로그인 상태 유지</td>
			</form>
		</tr>
	</table>

<%
		} else { // session.getAttribute("memId") != null : 세션이 있을 때 = 로그인 후

			String id = (String) session.getAttribute("memId");

			//관리자 여부 체크		
			boolean isAdmin = manager.isAdmin(id);
%>
	<table width=500 cellpadding="0" cellspacing="0" align="center" border="1">
		<tr>
			<td width="300" bgcolor="<%=bodyback_c%>" height="20">하하하</td>
			<td rowspan="3" bgcolor="<%=value_c%>" align="center"><%=session.getAttribute("memId")%>님이<br>방문하셨습니다.
				<form method="post" action="logout.jsp">
					<input type="submit" value="로그아웃">
					<input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'">
				</form></td>
		</tr>
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c%>" width="300">
				<!-- 메인입니다. : 로그인 후 -->
				<input type="button" value="게시판" onclick="javascript:window.location='../board/list.jsp'">
				<% if (isAdmin) {
				%>
					<input type="button" value="가입된 회원 검색" onclick="javascript:window.location='../board/readMemberAll.jsp'">
				<% } else {
				%>
					<!-- 공백 -->
				<% } %>
			</td>
		</tr>
	</table>
	<br>
<%
		}
	} catch (NullPointerException e) {}
%>
</body>
</html>
