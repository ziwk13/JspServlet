<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="chap04_el.Product"%>
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
   1) pageScope        page 영역의 객체 참조		 ${pageScope.객체}
   2) requestScope     request 영역의 객체 참조      ${requestScope.객체}
   3) sessionScope     session 영역의 객체 참조      ${sessionScope.객체}
   4) applicationScope application 영역의 객체 참조  ${applicationScopr.객체}
   5) param 		   요청 파라미터				 ${param.파라미터}
   6) header    	   요청 헤더 참조          		 ${header.헤더}
   7) cookie  	 	   쿠키 값 					     ${cookie.쿠키}
   8) pageContext      JSP의 PageContext 객체
   9) request          HttpServletRequest 객체       ${pageContext.request.객체}
   10) session		   HttpSession 객체              ${pageContext.session.객체}
   11) servletContext  ServletContext 객체           ${pageContext.servletContext.객체}
 --%>
 <%
 // 서블릿 컨테이너 영역에 데이터 저장
 pageContext.setAttribute("name", "aaa");
 request.setAttribute("name", "bbb");
 session.setAttribute("name", "ccc");
 application.setAttribute("name", "ddd");
 %>

<div>${name}</div>
<div>${requestScope.name}</div>
<div>${sessionScope.name}</div>
<div>${applicationScope.name}</div>

<%
 // 객체와 EL
 Product product = new Product();
 product.setModel("리모콘");
 product.setPrice(10000);
 request.setAttribute("product", product);
%>
<div>${product}</div>
<div>${product.model}</div>
<div>${product.price}</div>
<div>${product["model"]}</div>
<div>${product["price"]}</div>
<hr>
<%
 // Map과 EL
 Map<String, Object> map = new HashMap<>();
 map.put("model", "텀블러");
 map.put("price", 30000);
 request.setAttribute("map", map);
%>
<div>${map}</div>
<div>${map.model}</div>
<div>${map.price}</div>
<hr>
<%
  // List와 EL
  List<Product> products = new ArrayList<>();
  products.add(product);
  request.setAttribute("products", products);
%>
<div>${products}</div>
<div>${products.get(0).model}</div>
<div>${products.get(0).price}</div>
<div>${products[0].model}</div>
<div>${products[0].price}</div>
<hr>
<%
 // 연산에서 사용할 데이터
 request.setAttribute("a", 5);
 request.setAttribute("b", 2);
%>
<div>a + b = ${a + b}</div>
<div>a - b = ${a - b}</div>
<div>a * b = ${a * b}</div>
<div>a / b = ${a / b}</div>
<div>a / b = ${a div b}</div>
<div>a % b = ${a % b}</div>
<div>a % b = ${a mod b}</div>
<hr>

<div>a > b  : ${a > b},  ${a gt b}</div>
<div>a >= b : ${a >= b}, ${a ge b}</div>
<div>a < b  :  ${a < b},  ${a lt b}</div>
<div>a <= b : ${a <= b}, ${a le b}</div>
<div>a == b : ${a == b}, ${a eq b}}</div>
<hr>

<div>a == 5 && b == 5 : ${a == 5 && b == 5}, ${a eq 5 and b eq 5}</div>
<div>a == 5 || b == 5 : ${a == 5 || b == 5}, ${a eq 5 or b eq 5}</div>
<div>!(a == 5) : ${!(a == 5)}, ${not(a eq 5)} </div>
<hr>

<div>${a > 0 ? "양수" : "음수"}</div>
<hr>

<div>a 와 b 문자열 연결(+는 지원이 안되고 +=는 지원이 된다) : ${a += b}</div>
<hr>
<%
 // 비어있는 List
 request.setAttribute("list", new ArrayList<>());
%>
<div>List가 비어 있는가? ${empty list}</div>
<div>List가 비어 있지 않는가? ${not empty list}</div>
<hr>
<%-- request의 데이터 처리 방법 확인을 위한 링크 --%>
<a href=" ${pageContext.request.contextPath}/RequestDataHandle">요청</a>;
</body>
</html>