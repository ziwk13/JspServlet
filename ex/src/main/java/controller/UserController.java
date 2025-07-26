package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDTO;

@WebServlet("*.do")
public class UserController extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
   request.setCharacterEncoding("UTF-8");
   response.setContentType("text/html; charset=UTF-8" );

   String userId    = request.getParameter("userId");
   String pw        = request.getParameter("pw");
   String userName  = request.getParameter("userName");
   String birthDate = request.getParameter("birth_date");
   String gender    = request.getParameter("gender");
   String email     = request.getParameter("email");
   String phone     = request.getParameter("phone");
   String place     = request.getParameter("place");
   
   // 콘솔에 찍어 보기
   System.out.println("=== 가입 폼 파라미터 확인 ===");
   System.out.println("userId    = " + userId);
   System.out.println("pw        = " + pw);
   System.out.println("userName  = " + userName);
   System.out.println("birth_date = " + birthDate);
   System.out.println("email     = " + email);
   System.out.println("phone     = " + phone);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  request.setCharacterEncoding("UTF-8");
	  
	  String userId    = request.getParameter("userId");
	  String pw        = request.getParameter("pw");
	  String userName  = request.getParameter("userName");
	  String birthDate = request.getParameter("birth_date");
	  String gender    = request.getParameter("gender");
	  String email     = request.getParameter("email");
	  String phone     = request.getParameter("phone");
	  String place     = request.getParameter("place");
	  
    // 콘솔에 찍어 보기
    System.out.println("=== 가입 폼 파라미터 확인 ===");
    System.out.println("userId    = " + userId);
    System.out.println("pw        = " + pw);
    System.out.println("userName  = " + userName);
    System.out.println("birt_date = " + birthDate);
    System.out.println("email     = " + email);
    System.out.println("phone     = " + phone);
    
    // DTO에 담기
    UserDTO user = new UserDTO();
    user.setUserId(userId);
    user.setPw(pw);
    user.setUserName(userName);
    user.setDate(birthDate);
    user.setEmail(email);
    user.setPhone(phone);
    user.setGender(gender);
    user.setPlace(place);
    
    // DAO 처리
    int result = UserDao.getInstance().insertUser(user);
    
    // 응답에 alert 출력
    response.setContentType("text/html; charset=UTF-8");
    PrintWriter out = response.getWriter();
    
    if (result > 0) {
        out.println("<script>alert('회원가입 성공!'); history.back();</script>");
    } else {
        out.println("<script>alert('회원가입 실패. 다시 시도해 주세요.'); history.back();</script>");
    }
	  out.close();
	}
}
