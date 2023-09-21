package service;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import common.ActionForward;
import domain.ArticleDto;
import repository.ArticleDao;
import util.PageVo;

public class ArticleServiceImpl implements ArticleService {
  
  // 모든 서비스가 공동으로 사용하는 ArticleDao, PageVo 객체 가져오기
  private ArticleDao dao = ArticleDao.getDao();
  private PageVo pageVo = new PageVo();
  

  @Override
  public ActionForward addArticle(HttpServletRequest request) {
    // 등록할 제목, 내용, 작성자
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String editor = request.getParameter("editor");
    
    // 제목 + 내용 + 작성자 -> ArticleDto 객체
    // builder 패턴 이용 시 입력이 조금 더 빨라진다.
    ArticleDto dto = ArticleDto.builder()
                          .title(title)
                          .content(content)
                          .editor(editor)
                          .build();
    
    // ArticleDto의 addArticle 메소드 호출
    int addArticle = dao.addArticle(dto);
    
    // 등록 성공(addArticle == 1), 등록 실패(addArticle == 0)
    String path = null;
    if(addArticle == 1) {
      path = request.getContextPath() + "/article/getArticleList.do";
    } else if (addArticle == 0) {
      path = request.getContextPath() + "/index.do";
    }
    
    // 어디로 어떻게 이동하는지 반환 (insert 수행 후에는 반드시 redirect로 이동한다.)
    return new ActionForward(path, true);
  }

  @Override
  public ActionForward getArticleList(HttpServletRequest request) {
    
    /* page, total, display 정보가 있어야 목록을 가져올 수 있다. */
    
    // 전달된 페이지 번호 (페이지 번호의 전달이 없으면 1페이지를 연다.)
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    int total = dao.getArticleCount(); // 전체 게시글 수
    int display = 10;
    
    // PageVo의 모든 정보 계산하기
    pageVo.setPaging(page, total, display);
    
    // 게시글 목록을 가져올 때 사용할 변수들을 Map으로 만듬
    ㅡ
    
    
    return null;
  }

  @Override
  public ActionForward getArticleDetail(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public ActionForward plusHit(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public ActionForward edit(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public ActionForward modify(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public ActionForward delete(HttpServletRequest request) {
    // TODO Auto-generated method stub
    return null;
  }

}
