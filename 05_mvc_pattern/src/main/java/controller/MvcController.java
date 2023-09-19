package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import service.MvcService;
import service.MvcServiceImpl;

/**
 * Servlet implementation class MvcController
 */
@WebServlet("*.do")
public class MvcController extends HttpServlet {
	private static final long serialVersionUID = 1L;

  /**
   * @see HttpServlet#HttpServlet()
   */
  public MvcController() {
    super();
    // TODO Auto-generated constructor stub
  }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	  // 요청 인코딩 + 응답 타입과 인코딩
	  request.setCharacterEncoding("UTF-8");
	  response.setContentType("text/html; charset=UTF-8");
	  
	  // 요청 확인(URLMapping 확인) (요청이 달라지면 주소가 달라지는 방식)
	  String requestURI = request.getRequestURI();                     /*  /mvc/getDate.do  */
	  String contextPath = request.getContextPath();                   /*  /mvc             */
	  String urlMapping = requestURI.substring(contextPath.length());  /*  /getDate.do      */
	  
	  // 서비스 객체 생성(MVC Pattern에서 Model에 해당함)
	  MvcService mvcService = new MvcServiceImpl();
	  
	  // 서비스 실행 결과(어디로 어떻게 이동할 것인가에 관한 정보가 저장) (path와 property에 따른 redirect유무)
	  ActionForward af = null;
	  
	  // 요청에 따른 서비스 실행
	  switch (urlMapping) {
    case "/getDate.do":
      af = mvcService.getDate(request);
      break;
    case "/getTime.do":
      af = mvcService.getTime(request);
      break;
    case "/getDateTime.do":
      // 이동이 서비스 안에 들어있음(서비스 실행 결과에 저장되는게 없을 시 이동할 경로를 반드시 지정해줘야함)
      mvcService.getDateTime(request, response); // 반환타입이 없기 때문에 af로 반환시킬게 없음
      break;
    }
	  
	  // 서비스 실행 결과에 의한 이동 (redirect와 forward의 선택은 서비스에서 결정함)
	  if(af != null) {         // null 처리  
	    if(af.isRedirect()) {  // true 반환(redirect)
	      response.sendRedirect(af.getPath());        // 아직 구현 안 한 상태(준비만 해놓음)
	    } else {               // flase 반환(forward)
	      request.getRequestDispatcher(af.getPath()).forward(request, response);	      
	    }
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
