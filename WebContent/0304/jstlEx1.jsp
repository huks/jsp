<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
	
id ������ ����
request.setAttribute("id","admin");
<c:set var="id" value="admin"/><br>
<c:out value="${id}"/><p>

browser ������ ���� ��
<c:remove var="id"/>
<c:out value="${id}"/>
