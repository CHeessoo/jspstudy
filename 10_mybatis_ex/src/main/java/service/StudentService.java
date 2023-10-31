package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;

public interface StudentService {
  public void studentAdd(HttpServletRequest request, HttpServletResponse response) throws IOException;
  public ActionForward studentDetail(HttpServletRequest request);
  public ActionForward studentQuery(HttpServletRequest request);
  public ActionForward studentList(HttpServletRequest request);
  public void studentModify(HttpServletRequest request, HttpServletResponse response) throws IOException;
  public void studentDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
