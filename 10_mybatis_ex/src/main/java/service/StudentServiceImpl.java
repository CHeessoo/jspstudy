package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ActionForward;
import domain.StudentDto;
import repository.StudentDao;

public class StudentServiceImpl implements StudentService {

  private StudentDao dao = StudentDao.getDao();
  
  @Override
  public void studentAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
    String name = request.getParameter("name");
    int kor = Integer.parseInt(request.getParameter("kor"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int math = Integer.parseInt(request.getParameter("math"));
    StudentDto student = StudentDto.builder()
        .name(name)
        .kor(kor)
        .eng(eng)
        .math(math)
        .build();
    int addResult = dao.studentAdd(student);
    PrintWriter out = response.getWriter();
    out.println("<script>");
    if(addResult == 1) {
      out.println("alert('학생이 등록되었습니다.')");
      out.println("location.href='" + request.getContextPath() + "/student/list.do'");
    } else {
      out.println("alert('학생 등록이 실패했습니다.')");
      out.println("history.back()");
    }
    out.println("</script>");
    out.flush();
    out.close();
  }

  @Override
  public ActionForward studentDetail(HttpServletRequest request) {
    Optional<String> opt = Optional.ofNullable(request.getParameter("stuNo"));
    int stuNo = Integer.parseInt(opt.orElse("0"));
    request.setAttribute("student", dao.studentDetail(stuNo));
    return new ActionForward("/student/detail.jsp", false);
  }

  @Override
  public ActionForward studentQuery(HttpServletRequest request) {
    double begin = Double.parseDouble(request.getParameter("begin"));
    double end = Double.parseDouble(request.getParameter("end"));
    Map<String, Double> map = Map.of("begin", begin, "end", end);
    request.setAttribute("students", dao.queryStudentList(map));
    request.setAttribute("count", dao.queryStudentCount(map));
    request.setAttribute("average", dao.queryStudentAverage(map));
    return new ActionForward("/student/list.jsp", false);
  }

  @Override
  public ActionForward studentList(HttpServletRequest request) {
    request.setAttribute("students", dao.studentList());
    request.setAttribute("count", dao.studentCount());
    request.setAttribute("average", dao.studentAverage());
    request.setAttribute("top3List", dao.top3List());
    return new ActionForward("/student/list.jsp", false);
  }

  @Override
  public void studentModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
    int stuNo = Integer.parseInt(request.getParameter("stuNo"));
    String name = request.getParameter("name");
    int kor = Integer.parseInt(request.getParameter("kor"));
    int eng = Integer.parseInt(request.getParameter("eng"));
    int math = Integer.parseInt(request.getParameter("math"));
    StudentDto student = StudentDto.builder()
        .stuNo(stuNo)
        .name(name)
        .kor(kor)
        .eng(eng)
        .math(math)
        .build();
    int modifyResult = dao.studentModify(student);
    PrintWriter out = response.getWriter();
    out.println("<script>");
    if(modifyResult == 1) {
      out.println("alert('학생 정보가 수정되었습니다.')");
      out.println("location.href='" + request.getContextPath() + "/student/detail.do?stuNo=" + stuNo + "'");
    } else {
      out.println("alert('학생 정보 수정이 실패했습니다.')");
      out.println("history.back()");
    }
    out.println("</script>");
    out.flush();
    out.close();
  }

  @Override
  public void studentDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Optional<String> opt = Optional.ofNullable(request.getParameter("stuNo"));
    int stuNo = Integer.parseInt(opt.orElse("0"));
    int deleteResult = dao.studentDelete(stuNo);
    PrintWriter out = response.getWriter();
    out.println("<script>");
    if(deleteResult == 1) {
      out.println("alert('학생 정보가 삭제되었습니다.')");
      out.println("location.href='" + request.getContextPath() + "/student/list.do'");
    } else {
      out.println("alert('학생 정보 삭제가 실패했습니다.')");
      out.println("history.back()");
    }
    out.println("</script>");
    out.flush();
    out.close();
  }

}
