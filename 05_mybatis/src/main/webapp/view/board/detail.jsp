<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f5f5f5;
	color: #333;
}

.wrap {
	max-width: 800px;
	margin: 40px auto;
	padding: 0 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
}

.header {
	border-bottom: 1px solid #ddd;
	padding-bottom: 16px;
	margin-bottom: 24px;
}

.header h1 {
	font-size: 1.8rem;
	margin: 0;
	color: #222;
}

.meta {
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
	font-size: 0.9rem;
	color: #666;
	margin-top: 8px;
}

.meta div {
	background-color: #f0f0f0;
	padding: 4px 8px;
	border-radius: 4px;
}

.content {
	white-space: pre-wrap;
	line-height: 1.6;
	font-size: 1rem;
	color: #444;
	margin-bottom: 32px;
}

.btn-group {
	display: flex;
	gap: 12px;
	margin-bottom: 24px;
}

.btn {
	padding: 10px 16px;
	font-size: 0.95rem;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.btn-primary {
	background-color: #0077cc;
	color: #fff;
}

.btn-primary:hover {
	background-color: #005fa3;
}

.btn-danger {
	background-color: #cc3300;
	color: #fff;
}

.btn-danger:hover {
	background-color: #a32900;
}

.btn-secondary {
	background-color: #888;
	color: #fff;
}

.btn-secondary:hover {
	background-color: #666;
}
</style>
</head>
<body>

	<div class="wrap">
		<div class="header">
			<h1>${board.title}</h1>
			<div class="meta">
				<div>작성자번호 : ${board.user.uid}</div>
				<div>작성자닉네임 : ${board.user.nickname}</div>
				<div>최초작성일시 : ${board.createdAt}</div>
				<div>최종수정일시 : ${board.modifiedAt}</div>
			</div>
		</div>

		<hr>

		<div class="content">${board.content}</div>

		<hr>

		<div class="btn-group">
			<button class="btn-secondary" type="button" onclick="list()">목록보기</button>
			<c:if test="${board.user.uid eq sessionScope.loginUser.uid}">
				<button class="btn btn-danger" type="button" onclick="deleteBoard()">삭제하기</button>
				<button class="btn btn-primary" type="button" onclick="modifyBoard()">수정하기</button>
			</c:if>
		</div>
	</div>

	<script type="text/javascript">
		function list() {
			location.href = "${contextPath}/board/list";
		}
		function modifyBoard() {
			location.href = "${contextPath}/board/modifyForm?bid=${board.bid}&code=modify";
		}
		function deleteBoard() {
			if (confirm("현재 게시글을 삭제 할까요?")) {
				location.href = "${contextPath}/board/remove?bid=${board.bid}";
			}
		}
	</script>

</body>
</html>