<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
	
id 변수값 설정
request.setAttribute("id","admin");
<c:set var="id" value="admin"/><br>
<c:out value="${id}"/><p>

browser 변수값 제거 후
<c:remove var="id"/>
<c:out value="${id}"/>
