package service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
  // void : 반환하지 않는다. 직접 응답 (request X)        / 예외처리
  public void getMemberList(HttpServletResponse response) throws  IOException;  
}
