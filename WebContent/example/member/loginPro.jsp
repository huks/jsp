<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "example.member.LogonDBBean" %>

<% request.setCharacterEncoding("euc-kr");%>

<%
	System.out.println("START loginPro.jsp!"); // �α�

	String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	String login_auto = request.getParameter("login_auto");
	
	String sId = (String)session.getAttribute("sessionId");
	String sPasswd = (String)session.getAttribute("sessionPasswd");
	
	if(sId!=null){
		System.out.println("�ڵ��α���!");
		id = sId;
		passwd = sPasswd;
	}
	
	LogonDBBean manager = LogonDBBean.getInstance();
    int check= manager.userCheck(id,passwd);    

	if(check==1){ // �α��� ������	    
		if(login_auto!=null){ // "�α��� ���� ����" üũ�ڽ� null?
			System.out.println("login_auto is not null"); // �α� : üũ�ڽ� ���� ���� �ƴϴ�.
			if(login_auto.equals("yes")){
				System.out.println("login_auto is yes");
				Cookie cooId = new Cookie("cooId", id);
				Cookie cooPasswd = new Cookie("cooPasswd", passwd);
				cooId.setMaxAge(60*60*24); // �ʴ���
				cooPasswd.setMaxAge(60*60*24);
				response.addCookie(cooId);
				response.addCookie(cooPasswd);
				System.out.println("Cookie " + cooId + " is added.");
				System.out.println("Cookie " + cooPasswd + " is added.");
			} else {
				System.out.println("login_auto is not null and not yes"); // �α�
			}			
	    } else {            
            System.out.println("login_auto is ��"); // �α�
	    }
		// �Ӽ� ����
		session.setAttribute("memId",id);
		response.sendRedirect("main.jsp");
	}else if(check==0){
		System.out.print(id);
		System.out.print(passwd);
%>
	<script> 
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
    	history.go(-1);
	</script>
<%	}else{		
		System.out.println(id); // �α�
		System.out.println(passwd); // �α�
%>
	<script>
	 	alert("���̵� ���� �ʽ��ϴ�..");
	 	history.go(-1);
	</script>
<%	}
%>	