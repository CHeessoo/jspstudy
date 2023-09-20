package service;

import javax.servlet.http.HttpServletRequest;

import common.ActionForward;

public interface ArticleService {
  public ActionForward addArticle(HttpServletRequest request);
  public ActionForward getArticleList(HttpServletRequest request);
  public ActionForward getArticleDetail(HttpServletRequest request);
  public ActionForward plusHit(HttpServletRequest request);
  public ActionForward edit(HttpServletRequest request);
  public ActionForward modify(HttpServletRequest request);
  public ActionForward delete(HttpServletRequest request);  
}
