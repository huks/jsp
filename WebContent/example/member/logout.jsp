
<%
	System.out.println("START logout.jsp!"); // 로그

	Cookie[] cookies = request.getCookies(); // 요청에서 쿠키를 가져온다.
	
	if(cookies!=null){ // ID,PASSWD 쿠키가 있을 때
		for(int i=0; i<cookies.length; i++){                        
			if(cookies[i].getName().equals("cooId")){  //cooId를 받아온뒤 id에 저장.
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}else if(cookies[i].getName().equals("cooPasswd")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}	
	session.invalidate();	
	response.sendRedirect("main.jsp");
%>