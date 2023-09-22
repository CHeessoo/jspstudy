package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberService {
  // void : 반환하지 않는다.                              / 예외처리
  public void getMemberList(HttpServletResponse response) throws  IOException;    // 직접 응답 (request X)
  public void memberAdd(HttpServletRequest request, HttpServletResponse response) throws IOException;
  public void memberEmailCheck(HttpServletRequest request, HttpServletResponse response) throws IOException;
  public void memberDetail(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
