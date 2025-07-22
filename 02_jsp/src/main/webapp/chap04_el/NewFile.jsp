<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
EL (Expression Language)

1. JSP 페이지에서 자바 코드를 사용하지 않고 간결하게 데이터를 출력 할 수 있게 해주는 새로운 표현 언어 이다.
   ( <%= %> 또는 out.print() )
2. HTML과 JSP코드의 혼재로 인한 코드 가독성 문제를 해결 한다.
3. 서블릿 컨테이너(page, request, session, application)에 저장된 값을 쉽게 접근 할 수 있도록 설계되어있다.
4. 일반 자바 변수는 EL 문법을 사용 할 수 없고 서블릿 컨테이너에 저장 된 값만 EL 문법을 사용 할 수 있다.
5. 기본 문법
   ${값}
6. EL은 서블릿 컨테이너의 작은 영역부터 큰 영역으로 이동하면서 값을 찾는다.
   page -> requese -> session -> application
7. EL 내장 객체를 활용 할 수 있다
   1) pageScope        page 영역의 객체 참조
   2) requestScope     request 영역의 객체 참조
   3) sessionScope     session 영역의 객체 참조
   4) applicationScope application 영역의 객체 참조
   5) param 		   요청 파라미터
 --%>

</body>
</html>