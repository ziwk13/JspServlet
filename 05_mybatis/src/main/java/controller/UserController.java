package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import service.UserService;
import service.UserServiceImpl;

/*
 * @WebFilter 애너테이션은 web.xml의 <filter-mapping> 태그로 대신 할 수 있다.
 * @WebFilter 애너테이션과 web.xml의 <filter-mapping> 태그가 둘 다 존재하는 경우에는
 * web.xml의 <filter-mapping> 태그가 우선적으로 고려되지만, 실행 순서가 보장되어 있지 않는다.
 */

 @WebServlet("/user/*")

public class UserController extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  UserService userService = new UserServiceImpl();
	  
	  String requestURI = request.getRequestURI();
	  String contextPath = request.getContextPath();
	  String path = requestURI.substring(contextPath.length());
	  
	  ActionForward af = null;
	  
	  switch(path) {
	  case "/user/loginForm":
	    af = new ActionForward("/view/user/login.jsp", false);
	    break;
	  case "/user/login":
	    af = userService.login(request);
	    break;
	  case "/user/logout":
	    af = userService.logout(request);
	    break;
	  default:
	      System.out.println(">>> path: " + path);
	  }
	  if(af != null) {
	    if(af.isRedirect()) {
	      response.sendRedirect(af.getView());
	    } else {
	      request.getRequestDispatcher(af.getView()).forward(request, response);
	    }
	  }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
