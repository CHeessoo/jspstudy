<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<style>
  .article span {
    margin-right: 20px;
  }
</style>
<script>

  $(function(){
    fnCheckbox();
  })

  function fnCheckbox(){
    $('#chk_all').click(function(){
      $('.chk_each').prop('checked', $(this).prop('checked'));
    })
    $('.chk_each').click(function(){
      let total = 0;
      $.each($('.chk_each'), function(i, elem){
        total += elem.checked;
      })
      $('#chk_all').prop('checked', total === $('.chk_each').length);
    })
  }
  
  function fnArticleDelete() {
    
    if(!confirm('선택한 기사를 삭제할까요?')){
      return;  // 취소 버튼 누를 시 아래 코드 실행 안 함
    }
    
    let array = [];  // 비어있는 배열 생성
    
    // $.each(배열, function(인덱스, 요소){})    
    $.each($('.chk_each'), function(i, elem) {
      if($(elem).is(':checked')){
        array.push($(elem).val()); // 체크된 요소의 번호(value)만 배열(array)에 모음 (push : 배열에 추가하는 자바스크립트 함수)
      }
    })
    
    location.href = '${contextPath}/deleteArticle.do?articles=' + array.join(',');   
    // join을 사용해서 배열안에 요소를 꺼내서 컴마(,)로 연결
    // array           === ['1', '2', '3']
    // array.join(',') === '1,2,3' 
  }

</script>
</head>
<body>

  <div>
    <a href="${contextPath}/writeArticle.do">기사작성하러가기</a>
    <a href="javascript:fnArticleDelete()">선택기사삭제하기</a> <!-- javascript: , 해당 a링크를 클릭하면 함수를 호출 (클릭이벤트 없이 직접 연결) -->
  </div>

  <hr>
  
  <div>
    <input type="checkbox" id="chk_all">
    <label for="chk_all">전체선택</label>
  </div>

  <hr>
  
  <div>
  <c:if test="${empty articleList}">
    <div>작성된 기사가 없습니다.</div>
  </c:if>
  <c:if test="${not empty articleList}">
    <c:forEach items="${articleList}" var="article">
      <div class="article">
        <input type="checkbox" class="chk_each" value="${article.article_no}">
        <span>${article.article_no}</span>
        <span><a href="${contextPath}/plusHit.do?article_no=${article.article_no}">${article.title}</a></span>
        <span>${article.hit}</span>
        <span>${article.created}</span>
      </div>
    </c:forEach>
  </c:if>
  </div>
  
  <div>${paging}</div>

</body>
</html>