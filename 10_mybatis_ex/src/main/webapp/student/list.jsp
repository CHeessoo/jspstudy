<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

  $(function(){
    fnStudentWrite();
    fnStudentQuery();
    fnStudentList();
    fnStudentDetail();
    fnStudentDelete();
  });

  function fnStudentWrite(){
    $('#btn_write').click(function(){
      location.href = '${contextPath}/student/write.do';
    });
  }
  
  function fnStudentQuery(){
    $('#btn_query').click(function(){
      var begin = $('#begin').val();
      var end = $('#end').val();
      if(begin == '' || isNaN(begin) || begin < 0 || begin > 100){
        alert('begin값을 확인하세요.');
        return;
      }
      else if(end == '' || isNaN(end) || end < 0 || end > 100){
        alert('end값을 확인하세요.');
        return;
      }
      location.href = '${contextPath}/student/query.do?begin=' + begin + '&end=' + end;
    });
  }
  
  function fnStudentList(){
    $('#btn_list').click(function(){
      location.href = '${contextPath}/student/list.do';
    });
  }
  
  function fnStudentDetail(){
    $('.btn_detail').click(function(){
      location.href = '${contextPath}/student/detail.do?stuNo=' + $(this).parent().data('stu_no');
    })
  }
  
  function fnStudentDelete(){
    $('.btn_delete').click(function(){      
      if(confirm('학생 정보를 삭제할까요?')){
        location.href = '${contextPath}/student/delete.do?stuNo=' + $(this).parent().data('stu_no');
      }
    })
  }
  
</script>
</head>
<body>

  <div>
  
    <h1>학생 관리</h1>
    
    <div>
      <button type="button" id="btn_write">신규학생등록</button>
    </div>
    
    <hr>
    
    <div>
      <span>평균</span>
      <input type="number" name="begin" id="begin" min="0" max="100" placeholder="begin">
      ~
      <input type="number" name="end" id="end" min="0" max="100" placeholder="end">
      <input type="button" value="조회" id="btn_query">
      <input type="button" value="전체조회" id="btn_list">
    </div>
    
    <hr>
    
    <c:forEach var="s" items="${top3List}" varStatus="vs">
      <div>${vs.index + 1}위 ${s.name}님 <fmt:formatNumber value="${s.ave}" pattern="0.00" />점</div>
    </c:forEach>
    
    <hr>
    
    <div>
      <table border="1">
        <caption>전체 학생 ${count}명</caption>
        <thead>
          <tr>
            <td>학번</td>
            <td>성명</td>
            <td>국어</td>
            <td>영어</td>
            <td>수학</td>
            <td>평균</td>
            <td>학점</td>
            <td>버튼</td>
          </tr>
        </thead>
        <tbody>
          <c:if test="${count == 0}">
            <tr>
              <td colspan="8">등록된 학생이 없습니다.</td>
            </tr>
          </c:if>
          <c:if test="${count != 0}">
            <c:forEach var="s" items="${students}">
              <tr>
                <td>${s.stuNo}</td>
                <td>${s.name}</td>
                <td>${s.kor}</td>
                <td>${s.eng}</td>
                <td>${s.math}</td>
                <td><fmt:formatNumber value="${s.ave}" pattern="0.00" /></td>
                <td>${s.grade}</td>
                <td data-stu_no="${s.stuNo}">
                  <button type="button" class="btn_detail">상세</button>
                  <button type="button" class="btn_delete">삭제</button>
                </td>
              </tr>
            </c:forEach>
          </c:if>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="5">전체평균</td>
            <td><fmt:formatNumber value="${average}" pattern="0.00" /></td>
            <td colspan="2"></td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>

</body>
</html>