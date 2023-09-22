package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  private MemberService memberService = new MemberServiceImpl(); // 컨트롤러가 호출하는건 서비스

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  request.setCharacterEncoding("UTF-8");
    response.setContentType("text/plain; charset=UTF-8"); // JSON을 문자열로 반환한다.(태그반환이 아님)  일반 문자열은 text/plain
    
    String requestURI = request.getRequestURI();
    String contextPath = request.getContextPath();
    String urlMapping = requestURI.substring(contextPath.length());
    
    switch(urlMapping) {
    case "/member/list.do":
      memberService.getMemberList(response);  // 모든 서비스가 직접 ajax으로 응답하기 때문에 반환 필요 X (redirect, forward 없음)
      break; 
    }
    
	  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
