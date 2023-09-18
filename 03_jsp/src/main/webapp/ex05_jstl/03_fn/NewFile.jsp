<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <c:set var="str" value="Hello World"/>   <%-- scope="page", scope는 생략하면 page --%>
  
  <h4>${fn:length(str)}</h4>               <%-- fn : 값을 처리하는 함수를 사용함으로 EL문법 안에서 사용함 --%>
  <h4>${fn:substring(str, 0, 5)}</h4>      <%-- str의 인덱스 0부터 5이전까지 --%>
  <h4>${fn:substringBefore(str, ' ')}</h4> <%-- 공백 이전 --%>
  <h4>${fn:substringAfter(str, ' ')}</h4>  <%-- 공백 이후 --%>
  <h4>${fn:indexOf(str, ' ')}</h4>         <%-- 공백의 인덱스 --%>
  <h4>${fn:replace(str, ' ', '_')}</h4>    <%-- 공백을 문자열로 바꿈 --%>

  <c:if test="${fn:startsWith(str, 'H')}">
    <h4>H로 시작한다.</h4>
  </c:if>
  <c:if test="${fn:endsWith(str, 'H')}">
    <h4>H로 끝난다.</h4>
  </c:if>
  <c:if test="${fn:contains(str, 'H')}">
    <h4>H를 포함한다.</h4>
  </c:if>
  <c:if test="${fn:containsIgnoreCase(str, 'h')}">
    <h4>H, h를 포함한다.</h4>
  </c:if>
  
  <c:set var="words" value="${fn:split(str, ' ')}"/>  <%-- split:문자열 나누기, str을 공백으로 나눔(쪼갬), 배열이 생김 --%>
  <c:forEach var="word" items="${words}">
    <h4>${word}</h4>
  </c:forEach>
  <h4>${fn:join(words, ' ')}</h4> <%-- join:문자 연결, Hello 와 World를 다시 공백으로 연결 --%> <%-- split과 join을 사용하면 replace를 대체할 수 있다. --%>

  <c:set var="str2" value="<script>alert('hahaha')</script>"/>  <%-- 태그를 저장 --%>
  ${fn:escapeXml(str2)}                                         <%-- 태그를 문자로 인식하게 함 --%>


</body>
</html>