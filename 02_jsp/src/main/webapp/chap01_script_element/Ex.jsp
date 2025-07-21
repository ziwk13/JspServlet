<%@page import="java.util.HashMap"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 1. 화면을 새로 고침 할 때 마다 변수 count 값을 1 증가시켜서 화면에 출력 하기 --%>

	<%!int count = 0;%>
	<%
	count++;
	%>
	<div>
		현재 count =
		<%=count%></div>
	<br>
	<%-- 2. "일", ... "토" 요일 정보를 배열에 저장 하고 현재 요일 정보를 출력 하기 --%>
	<%
	String[] weeks = {"일", "월", "화", "수", "목", "금", "토"};
	%>
	<%
	/* 현재 요일 정보를 인덱스 형식으로 구하기 (일:0, 월:1, ...) */
	LocalDate today = LocalDate.now();
	int dayOfWeekNo = today.getDayOfWeek().getValue() % 7;
	%>
	<div>
		오늘은
		<%=weeks[dayOfWeekNo]%>요일 입니다
	</div>
	<script>
		const day = [ "일", "월", "화", "수", "목", "금", "토" ];
		const now = new Date().getDay();
		console.log("2. " + day[now]);
	</script>
	<br>
	<%-- 3. List<String> fruits에 과일명을 3개 저장 하고 화면에 <ul> 태그로 출력 하기. --%>
	<%!static List<String> fruits = new ArrayList<String>();
static {
  fruits.add("Apple");
  fruits.add("Banana");
  fruits.add("Water Melon");
}%>
	<ul>
		<%
		for (String fruit : fruits) {
		%>
		<li><%=fruit%></li>
		<%
		}
		%>
	</ul>
	<br>
	<%-- 4. Map<String, String> members에 nickname과 name을 Entry로 저장 하기 멤버는 3명을 만들고 각 회원 정보를 <table> 태그로 출력 하기--%>
	<%!static Map<String, String> members = new HashMap<>();
static {
  members.put("닉네임1", "이름1");
  members.put("닉네임2", "이름2");
  members.put("닉네임3", "이름3");
}%>
	<table border="1">
		<tr>
			<th>닉네임</th>
			<th>이름</th>
		</tr>
		<tbody>
			<%
			for (Map.Entry<String, String> entry : members.entrySet()) {
			%>
			<tr>
				<td><%=entry.getKey()%></td>
				<td><%=entry.getValue()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<hr>
	<%-- 5. int age에 임의의 나이를 저장 하고, 20세 기준으로 "성인입니다." 또는 "미성년자 입니다." --%>
	<%
	int age = 17;
	%>
	<%
	if (age >= 20) {
	%>
	<div>성인 입니다</div>
	<%
	} else {
	%>
	<div>미성년자 입니다.</div>
	<%
	}
	%>
</body>
</html>