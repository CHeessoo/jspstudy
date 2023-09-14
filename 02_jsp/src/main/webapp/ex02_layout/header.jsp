<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/jsp/resource/css/header.css?dt=<%=System.currentTimeMillis()%>">  <!-- 맨 뒤에 물음표(?) : 사용하진 않지만 캐싱을 회피하는 방법 / dt=타임스탬프로 자동화 (ver과 dt를 제일 많이 사용) -->
<script src="/jsp/resource/js/lib/jquery-3.7.1.min.js"></script> <!-- jQuery 라이브러리를 추가 -->
<script src="/jsp/resource/js/header.js?dt=<%=System.currentTimeMillis()%>"></script>  <!-- header.js 추가 -->
</head>
<body>
  
  <nav class="gnb">  <!-- <nav> 태그 : 메뉴를 만드는 <div> -->
    <ul>
      <li><a href="main1.jsp">main1</a></li>
      <li><a href="main2.jsp">main2</a></li>
      <li><a href="main3.jsp">main3</a></li>
    </ul>
  </nav>
  

</body>
</html>