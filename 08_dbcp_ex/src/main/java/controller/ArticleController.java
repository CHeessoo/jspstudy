package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import service.ArticleService;
import service.ArticleServiceImpl;

/**
 * Servlet implementation class ArticleController
 */
@WebServlet("*.do")
public class ArticleController extends HttpServlet {
  private static final long serialVersionUID = 1L;
  
  private ArticleService articleService = new ArticleServiceImpl();
  
  /**
   * @see HttpServlet#HttpServlet()
   */
  public ArticleController() {
    super();
    // TODO Auto-generated constructor stub
  }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType("text/html; charset=UTF-8");
    
    String requestURI = request.getRequestURI();
    String contextPath = request.getContextPath();
    String urlMapping = requestURI.substring(contextPath.length());
    
    ActionForward af = null;
    
    switch(urlMapping) {
    case "/index.do":
      af = new ActionForward("/index.jsp", false);
      break;
    case "/writeArticle.do":
      af = new ActionForward("/article/write.jsp", false);
      break;
    case "/addArticle.do":
      af = articleService.add(request);
      break;
    case "/getArticleList.do":
      af = articleService.list(request);
      break;
    case "/getArticleDetail.do":
      af = articleService.detail(request);
      break;
    case "/editArticle.do":
      af = articleService.edit(request);
      break;
    case "/modifyArticle.do":
      af = articleService.modify(request);
      break;
    case "/plusHit.do":
      af = articleService.plusHit(request);
      break;
    case "/deleteArticle.do":
      af = articleService.delete(request);
      break;
    }
    
    // 이동
    if(af != null) {
      if(af.isRedirect()) {
        response.sendRedirect(af.getPath());
      } else {
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
