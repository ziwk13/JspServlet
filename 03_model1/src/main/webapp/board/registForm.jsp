<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
.title{
text-align: center;
}
.form{
border: 1px solid black;
margin: 0 auto;
width: auto;
display: block;
}
</style>

	<h1 class="title">신규 게시글 등록 화면</h1>
	<form action="${contextPath}/board/regist.jsp" method="post" class="form">
		<label for="uid">작성자</label> 
		<select name="uid" id="uid">
			<option>1</option>
			<option>2</option>
			<option>3</option>
		</select>
		<br>
		<label for="title">제목</label>
		<input type="text" name="title" id="title">
		<br>
		<label for="content">내용</label>
		<br>
		<textarea name="content" id="content" rows="5" cols="30"></textarea>
		<br>
		<button type="submit">작성하기</button>
		<button type="button" onclick="list()">목록보기</button>
	</form>
	<script type="text/javascript">
		function list() {
			location.href = "${contextPath}/board/list.jsp";
		}
	</script>

</body>
</html>