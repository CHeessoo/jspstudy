<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<style>
  .book_list table {
    border-collapse: collapse;
  }
  .book_list table td {
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
  }
</style>
</head>
<body>

  <div>
    <a href="${contextPath}/book/write.do">작성하러가기</a>
  </div>
  
  <hr>
  
  <div>
    <table>
      <thead>
        <tr>
          <td>책번호</td>
          <td>제목</td>
          <td>저자</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="book" items="${bookList}">
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  


</body>
</html>