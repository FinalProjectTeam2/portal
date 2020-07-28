<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/chat/bootstrap.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/chat/custom.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/chat/bootstrap.js'/>"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	var sock = new SockJS("<c:url value='/echo'/>")
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	$(function() {
		$("#sendBtn").click(function() {
			console.log("send message...");
			sendMessage();
		});
	});
	
	function sendMessage() {
		sock.send($("#message").val());
	}
	
	/* evt 는 websocket이 보내준 데이터 */
	function onMessage(evt) {
		var data = evt.data;
		var sessionId = null;
		var message = null;
		
		var strArray = data.split("|");
		
		for (var i = 0; i < strArray.length; i++) {
			console.log("str["+i+"]:"+strArray[i]);
		}
		
		var currentUser_session = $("#sessionUser").val();
		console.log("current session id : "+currentUser_session);
		
		sessionId = strArray[0];
		message = strArray[1];
		
		if(sessionId == currentUser_session){
			var printHtml = "<div class='well'>";
			printHtml += "<div class='alert alert-info'>";
			printHtml += "<strong>["+sessionId+"] => " + message + "</strong>";
			printHtml += "</div >";
			printHtml += "</div >";
			
			$("#chatData").append(printHtml);
		}else{
			var printHtml = "<div class='well'>";
			printHtml += "<div class='alert alert-warning'>";
			printHtml += "<strong>["+sessionId+"] => " + message + "</strong>";
			printHtml += "</div >";
			printHtml += "</div >";
			
			$("#chatData").append(printHtml);
		}
		
		console.log("chatting data : " + data);
	}
	
	function onClose(evt) {
		$("#data").append("연결끊김");
	}
</script>

<title>WEB SOCKET 실시간 익명 채팅 사이트</title>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chatData" class="panel-collapse collapse in">
							
						</div>
						<div id="data"></div>
					</div>
					<div>
						<input type="text" id="message">
						<input id="sendBtn" type="button" value="전송">
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>