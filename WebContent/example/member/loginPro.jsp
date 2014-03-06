<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "example.member.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
	System.out.println("START loginPro.jsp!"); // 로그

	String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	String login_auto = request.getParameter("login_auto");
	
	String sId = (String)session.getAttribute("sessionId");
	String sPasswd = (String)session.getAttribute("sessionPasswd");
	
	if(sId!=null){
		System.out.println("자동로그인!");
		id = sId;
		passwd = sPasswd;
	}
	
	LogonDBBean manager = LogonDBBean.getInstance();
    int check= manager.userCheck(id,passwd);    

	if(check==1){ // 로그인 성공시	    
		if(login_auto!=null){ // "로그인 상태 유지" 체크박스 null?
			System.out.println("login_auto is not null"); // 로그 : 체크박스 값이 널이 아니다.
			if(login_auto.equals("yes")){
				System.out.println("login_auto is yes");
				Cookie cooId = new Cookie("cooId", id);
				Cookie cooPasswd = new Cookie("cooPasswd", passwd);
				cooId.setMaxAge(60*60*24); // 초단위
				cooPasswd.setMaxAge(60*60*24);
				response.addCookie(cooId);
				response.addCookie(cooPasswd);
				System.out.println("Cookie " + cooId + " is added.");
				System.out.println("Cookie " + cooPasswd + " is added.");
			} else {
				System.out.println("login_auto is not null and not yes"); // 로그
			}			
	    } else {            
            System.out.println("login_auto is 널"); // 로그
	    }
		// 속성 설정
		session.setAttribute("memId",id);
		response.sendRedirect("main.jsp");
	}else if(check==0){
		System.out.print(id);
		System.out.print(passwd);
%>
	<script> 
		alert("비밀번호가 맞지 않습니다.");
    	history.go(-1);
	</script>
<%	}else{		
		System.out.println(id); // 로그
		System.out.println(passwd); // 로그
%>
	<script>
	 	alert("아이디가 맞지 않습니다..");
	 	history.go(-1);
	</script>
<%	}
%>	