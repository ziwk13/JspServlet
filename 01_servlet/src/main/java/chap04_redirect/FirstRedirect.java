package chap04_redirect;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FirstRedirect")
public class FirstRedirect extends HttpServlet {
  
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  /*
	   * redirect
	   * 
 	   * 1. 서버가 클라이언트에게 "새로운 주소로 다시 요청하세요"라고 지시하는 방식 이다. (응답의 일종)
	   * 2. redirect 지시를 받은 클라이언트는 다시 새로운 주소로 이동 하므로 URL 변경을 확인 할 수 있다.
	   * 3. 최초 요청 시 사용한 request와 response는 전달 되지 않는다 (redirect는 별개의 새로운 요청이기 때문에)
	   * 4. redirect 다른 서버로 이동 할 수 있다.
	   * 5. DB의 데이터 변경 작업(UPDATE, INSERT, DELETE) 이후 redirect 이동으로 새로 고침으로 인한 중복 제출(서브밋) 등을 방지 할 수 있다.
	   *    PRG(Post-Redirect-Get) 패턴에 필수적인 역할을 수행한다.
	   */
	  
	  // redirect (새로운 주소로 다시 요청 하라는 응답)
	  response.sendRedirect("/01_servlet/SecondRedirect?p=" + URLEncoder.encode(request.getParameter("p"), "UTF-8"));  // context path와 servlet path 모두 작성
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		doGet(request, response);
	}

}
