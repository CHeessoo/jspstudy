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
<script>

  $(function() {
    fnMemberList();
  })
  
  function fnMemberList() {
    $.ajax({
      type: 'get',
      url: '${contextPath}/member/list.do',
      dataType: 'text',
      success: function(resData) {
        console.log(resData);
      }
    })
  }
  
</script>
</head>
<body>

</body>
</html>