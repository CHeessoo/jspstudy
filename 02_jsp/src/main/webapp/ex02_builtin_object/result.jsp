<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

  // 요청 인코딩
  request.setCharacterEncoding("UTF-8");

  // 요청 파라미터
  String dir = request.getParameter("dir");
  String filename = URLDecoder.decode(request.getParameter("filename"), "UTF-8");
  
  // dir의 realPath
  String realPath = application.getRealPath(dir);
  
  // File 객체 생성
  File file = new File(realPath, filename);
  
  // 결과 하면 만들기
  if(!file.exists()){
    out.println("<div>" + filename + "파일이 생성되지 않았습니다.</div>");  // out을 사용 시 가독성이 좋은 코드가 된다.
  } else {
    out.println("<div>" + filename + "파일이 생성되었습니다.</div>");
  }
  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>