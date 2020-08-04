<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

<head>
    <meta charset="UTF-8">
    <title>채팅 서비스</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

</head>
<body>
<input type="text" id="nickname" class="form-inline" placeholder="닉네임을 입력해주세요" required autofocus>
<button class = "btn btn-primary" id = "name">확인</button>
<label for="roomId" class="label label-default">방 번호</label>
<label id="roomId" class="form-inline">${room.roomId}</label>
<br>
<label for="roomName" class="label label-default">방 이름</label>
<label id="roomName" class="form-inline">${room.name}</label>
<div id = "chatroom" style = "width:400px; height: 600px; border:1px solid; background-color : gray"></div>
<input type = "text" id = "message" style = "height : 30px; width : 340px" placeholder="내용을 입력하세요" autofocus>
<button class = "btn btn-primary" id = "send">전송</button>
<script>

</script>
</body>
<script th:inline = "javascript">
	var sock;
    var nickname;
    /* <![CDATA[*/
    var roomId = '${room.roomId}';
    /* ]]> */
    document.getElementById("name").addEventListener("click",function(){
        nickname = document.getElementById("nickname").value;
        document.getElementById("nickname").style.display = "none";
        document.getElementById("name").style.display = "none";
        connect();
    });
    document.getElementById("send").addEventListener("click",function(){
        send();
    });
    function connect(){
    	sock = new SockJS("<c:url value='/chat'/>");
    	sock.onmessage = onMessage;
    	sock.onclose = onClose;
    	sock.onopen = onOpen;
    }
    function disconnect(){
    	sock.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:nickname}));
    	sock.close();
    }
    function send(){
        msg = document.getElementById("message").value;
        sock.send(JSON.stringify({chatRoomId : roomId,type:'CHAT',writer:nickname,message : msg}));
        document.getElementById("message").value = "";
    }
    function onOpen(){
    	sock.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:nickname}));
    }
    function onMessage(e){
        data = e.data;
        chatroom = document.getElementById("chatroom");
        if(data.indexOf(':') == -1){
        	data = data.replace('"','');
        	data = data.replace('"','');
	        chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
        }else{
        	data = data.replace('"','');
        	data = data.replace('"','');
        	var strArray = data.split(":");
        	var htmlVal = strArray[0] + "<br>" + strArray[1];
        	chatroom.innerHTML = chatroom.innerHTML + "<br>" + htmlVal;
        }
    }
    function onClose(){
        disconnect();
    }

</script>
</html>