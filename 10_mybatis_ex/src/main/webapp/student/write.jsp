<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

  $(function(){
    fnStudentAdd();
    fnStudentList();
  });
  
  function fnStudentAdd(){
    $('#frm_add').submit(function(event){
      var korValue = $('#kor').val();
      var engValue = $('#eng').val();
      var mathValue = $('#math').val();
      if(korValue === '' || isNaN(korValue) || korValue < 0 || korValue > 100){
        alert('국어 점수를 확인하세요.');
        $('#kor').focus();
        event.preventDefault();
        return;
      }
      else if(engValue == '' || isNaN(engValue) || engValue < 0 || engValue > 100){
        alert('영어 점수를 확인하세요.');
        $('#eng').focus();
        event.preventDefault();
        return;
      }
      else if(mathValue == '' || isNaN(mathValue) || mathValue < 0 || mathValue > 100){
        alert('수학 점수를 확인하세요.');
        $('#math').focus();
        event.preventDefault();
        return;
      }
    });
  }
  
  function fnStudentList(){
    $('#btn_list').click(function(){
      location.href = '${contextPath}/student/list.do';
    });
  }

</script>
</head>
<body>

  <h1>신규학생등록 화면</h1>
  <div>
    <form id="frm_add" method="post" action="${contextPath}/student/add.do">
      <div>
        <label for="name">이름</label>
        <input type="text" id="name" name="name">
      </div>
      <div>
        <label for="kor">국어</label>
        <input type="text" id="kor" name="kor">
      </div>
      <div>
        <label for="eng">영어</label>
        <input type="text" id="eng" name="eng">
      </div>
      <div>
        <label for="math">수학</label>
        <input type="text" id="math" name="math">
      </div>
      <hr>
      <div>
        <button type="submit">작성완료</button>
        <button type="reset">다시작성</button>
        <button type="button" id="btn_list">목록보기</button>
      </div>
    </form>
  </div>

</body>
</html>