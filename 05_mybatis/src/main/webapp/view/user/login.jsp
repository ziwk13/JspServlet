<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="${contextPath}/user/login"
	      method="post">
	
	<label>이메일 <input type="text" name="email"></label>
	<br>
	
	<label>비밀번호 <input type="password" name="password"></label>
	<br>
	
	<button type="submit">로그인</button>
	
	<c:if test="${not empty error}">      
		<div style="font-size: 12px; color: red;">${error}</div>
	</c:if>
	</form>

</body>
</html>