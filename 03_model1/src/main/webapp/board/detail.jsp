<%@page import="dao.BoardDAO"%>
<%@page import="model.dto.BoardDTO"%>
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
.title {
text-align : conter;
}
.main {
border: 1px solid red;
}
</style>

	<%
	// 파라미터로 전달된 bid 받기
	request.setCharacterEncoding("UTF-8");
	int bid = 0;
	
	try {
	  bid = Integer.parseInt(request.getParameter("bid"));
	}
	catch(Exception e) {
	  bid = 0;
	}
	
		// bid 값을 가진 Board 가져오기
		BoardDTO board = BoardDAO.getInstance().getBoardById(bid);
		pageContext.setAttribute("board", board);


	%>

	<h1 class="title">${board.title}</h1>
	<div calss="main">
		<div>작성자번호 : ${board.user.uid}</div>
		<div>작성자닉네임 : ${board.user.nickname}</div>
		<div>최초작성일시 : ${board.createdAt}</div>
		<div>최송수정일시 : ${board.modifiedAt}</div>
	</div>

	<hr>

	<pre>${board.content}</pre>

	<hr>

	<button type="button" onclick="list()">목록보기</button>
	<c:if test="${board ne null}">
		<button type="button" onclick="deleteBoard()">삭제하기</button>
	</c:if>

	<script type="text/javascript">
		function list() {
			location.href = "${contextPath}/board/list.jsp";
		}
		function deleteBoard() {
			if (confirm("현재 게시글을 삭제 할까요?")) {
				location.href = "${contextPath}/board/remove.jsp?bid=${board.bid}";
			}
		}
	</script>

</body>
</html>