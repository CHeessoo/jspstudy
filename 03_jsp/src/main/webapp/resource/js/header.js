/**
 * 본문을 모두 읽은 뒤 JavaScript를 수행할 수 있도록 load 이벤트 처리한다.
 * 방법1. window.onload = function(){}
 * 방법2. $(document).ready(function(){})
 * 방법3. $(function(){})
 */

$(function(){
  
  $('.gnb a').mouseover(function(){
    $(this).css('background-color', 'silver');
  })
  $('.gnb a').mouseout(function(){
    $(this).css('background-color', '');
  })  
  
  
  // 이미지 추가
  var img = new Image(); 
  $(img).attr('src', getContextPath() + '/resource/image/naver.png');  // 변수 처리
  $(img).css('width', '250px');
  $('.logo').html(img);
})

// 컨택스트패스를 반환하는 함수
function getContextPath(){
  // location.href === httpL//localhost:8080/jsp/ex03_layout/main1.jsp
  // loaction.host === localhost:8080
  var begin = location.href.indexOf(location.host) + location.host.length;  // 컨텍스트패스의 시작 인덱스 계산
  var end = location.href.indexOf('/', begin + 1)  // begin 다음 글자부터 슬래쉬(/)를 찾으라는 의미
  return location.href.substring(begin, end)
  
}