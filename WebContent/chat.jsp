<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>PlusFriend Chat Button Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<div id="plusfriend-chat-button"></div>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('421ef65f051ad3badd2314b50a343d37');
    // 플러스친구 1:1채팅 버튼을 생성합니다.
    Kakao.PlusFriend.createChatButton({
      container: '#plusfriend-chat-button',
      plusFriendId: '_xhxdZxnT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
    });
  //]]>
  
  
</script>

</body>
</html>