<%@page import="java.util.Optional"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- request : 선언을 하지 않고 사용 가능한 9가지 JSP 내장 객체 중 하나 --%>
<% 
  request.setCharacterEncoding("UTF-8"); 
  Optional<String> opt = Optional.ofNullable(request.getParameter("title"));
  String title = opt.orElse("환영합니다!");
  
  // ContextPath(/JSP)를 변수처리
  String contextPath = request.getContextPath();
%>
<title><%=title%></title> 
<!-- 스크립트 추가 순서 1.jQuery 2.스크립트 3.링크 -->
<script src="<%=contextPath%>/resource/js/lib/jquery-3.7.1.min.js"></script> <!-- jQuery 라이브러리를 추가 (jQuery기반의 코드가 많기 때문에 항상 jQuery를 먼저 포함) -->
<script src="<%=contextPath%>/resource/js/header.js?dt=<%=System.currentTimeMillis()%>"></script>  <!-- header.js 추가 -->
<link rel="stylesheet" href="<%=contextPath%>/resource/css/header.css?dt=<%=System.currentTimeMillis()%>">  <!-- 맨 뒤에 물음표(?) : 사용하진 않지만 캐싱을 회피하는 방법 / dt=타임스탬프로 자동화 (ver과 dt를 제일 많이 사용) -->
<link rel="stylesheet" href="<%=contextPath%>/resource/css/main.css?dt=<%=System.currentTimeMillis()%>">
<link rel="stylesheet" href="<%=contextPath%>/resource/css/footer.css?dt=<%=System.currentTimeMillis()%>">
</head>
<body>
  
  <nav class="gnb">  <!-- <nav> 태그 : 메뉴를 만드는 <div> -->
    <div class="logo"></div>
    <ul>
      <li><a href="main1.jsp">main1</a></li>
      <li><a href="main2.jsp">main2</a></li>
      <li><a href="main3.jsp">main3</a></li>
    </ul>
  </nav>
  
