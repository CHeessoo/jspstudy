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
    fnMemberAdd();
    fnEamilCheck();
    fnMemberDetail();
  })
  
  function fnMemberList() {  // 목록
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
            str += '<td><button class="btn_detail" data-email="' + elem.email + '">조회</button></td>';
            str += '</tr>';
            memberList.append(str);
          })
        }
      }
    })
  }
  
  function fnInit() {  // 클릭시 입력내용 초기화
    $('#btn_init').click(fnInitDetail);
  }
  function fnInitDetail() {  // 입력란 초기화  
    $('#email').val('');
    $('#name').val('');
    $('#none').prop('checked', true);
    $('#address').val('');      
  }
  
  
  function fnMemberAdd() {
    $('#btn_add').click(function() {
      if(!ableEmail){
        alert('등록할 수 없는 이메일입니다.');
        $('#email').focus();
        return;
      }
      $.ajax({
        type: 'post',
        url: '${contextPath}/member/add.do',
        data: $('#frm_member').serialize(),  // 폼의 모든 입력 요소를 파라미터로 전송함(입력 요소는 name 속성이 필요함)
        dataType: 'text',
        success: function(resData) {     // resData === '{"addResult": 1}'   String
          var obj = JSON.parse(resData)  //     obj === {"addResult": 1}     object
          if(obj.addResult === 1){
            alert('회원 정보가 등록되었습니다.');
            fnMemberList();  // 목록 초기화
            fnInitDetail();  // 입력란 초기화
          } else {
            alert('회원 정보 등록이 실패했습니다.');
          }
        }
      })
    })
  }
  
  var ableEmail = false;
  
  function fnEamilCheck() {  
    $('#email').keyup(function() {  // 이메일 입력란에 입력할 때 마다 중복검사
      $.ajax({
        type: 'get',
        url: '${contextPath}/member/emailCheck.do',
        data: 'email=' + $(this).val(),
        dataType: 'text',
        success: function(resData) {     // resData === '{"ableEmail":true}'
          var obj = JSON.parse(resData); //     obj === {"ableEmail":true}
          ableEmail = obj.ableEmail;
          if(obj.ableEmail){
            $('#msg_email').text('');
          } else {
            $('#msg_email').text('이미 등록된 이메일입니다.');
          }
        }
      })
    })
  }
  
  function fnMemberDetail() {
    $(document).on('click', '.btn_detail', function() { // 등록이벤트로 만들어진 상세조회 버튼들은 바로 이벤트 적용이 되지 않으므로 클릭이벤트를 적용하는 방법
      $.ajax({
        type: 'get',
        url: '${contextPath}/member/detail.do',
        data: 'email=' + $(this).data('email'),
        dataType: 'text',
        success: function(resData) {
          var obj = JSON.parse(resData);
          $('#email').val(obj.member.email);
          $('#name').val(obj.member.name);
          $(':radio[name=gender][value=' + obj.member.gender + ']').prop('checked', true); // value가 일치하는 radio를 찾아서 checked 속성을 true로 함
          $('#address').val(obj.member.address);
        }
      })
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
        <input type="radio" name="gender" id="woman" value="woman">
        <label for="woman">여자</label>
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