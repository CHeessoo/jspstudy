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

  // 함수 호출
  $(function() {
    fnMemberList();
    fnInit();
  })
  
  function fnMemberList() {
    $.ajax({
      type: 'get',
      url: '${contextPath}/member/list.do',
      dataType: 'text',
      success: function(resData) {
        var obj = JSON.parse(resData);  // String으로 보내서 String으로 받은 다음에 자바스크립트 객체로 다시 바꾼 작업.
        $('#member_count').text(obj.memberCount);
        var memberList = $('#member_list');
        memberList.empty();  // 기존의 회원 목록을 지운다.(초기화)
        if(obj.memberCount === 0){
          memberList.append('<tr><td colspan="6">등록된 회원이 없습니다.</td></tr>');
        } else {
          // $.each(배열, function(인덱스, 요소){})
          $.each(obj.memberList, function(i, elem) {
            var str = '<tr>';
            str += '<td>' + elem.memberNo + '</td>';
            str += '<td>' + elem.email + '</td>';
            str += '<td>' + elem.name + '</td>';
            str += '<td>' + (elem.gender === 'man' ? '남자' : (elem.gender === 'woman' ? '여자' : '선택안함')) + '</td>';
            str += '<td>' + elem.address + '</td>';
            str += '<td><button>조회</button></td>';
            str += '</tr>';
            memberList.append(str);
          })
        }
      }
    })
  }
  
  function fnInit() {  // 초기화
    $('#btn_init').click(function() { // 입력 초기화
      $('#email').val('');
      $('#name').val('');
      $('#none').prop('checked', true);
      $('#address').val('');      
    })
  }
  
  
  
</script>
</head>
<body>

  <div>
    
    <form id="frm_member">
      <div>
        <label for="email">이메일</label>
        <input type="text" name="email" id="email">
        <span id="msg_email"></span>  <!-- 중복체크 -->
      </div>
      <div>
        <label for="name">이름</label>
        <input type="text" name="name" id="name">
      </div>
      <div>
        <input type="radio" name="gender" id="man" value="man">
        <label for="man">남자</label>
      </div>
      <div>
        <input type="radio" name="gender" id="woman" value="woman">
        <label for="woman">여자</label>
      </div>
      <div>
        <input type="radio" name="gender" id="none" value="none" checked>
        <label for="none">선택안함</label>
      </div>
      <div>
        <label for="address">주소</label>
        <input type="text" name="address" id="address">
      </div>
      <div>
        <button type="button" id="btn_init">입력초기화</button>  <!-- 서브밋은 ajax에서 사용X -->
        <button type="button" id="btn_add">회원신규등록</button>
        <button type="button" id="btn_modify">회원정보수정</button>
        <button type="button" id="btn_delete">회원정보삭제</button>
      </div>
    </form>
    
    <hr>
    
    <table border="1">
      <caption>전체 회원수 <span id="member_count"></span>명</caption>  <!-- caption : 제목 -->
      <thead>
        <tr>
          <td>회원번호</td>
          <td>이메일</td>
          <td>이름</td>
          <td>성별</td>
          <td>주소</td>
          <td></td>
        </tr>
      </thead>
      <tbody id="member_list"></tbody>
    </table>
    
  </div>


</body>
</html>