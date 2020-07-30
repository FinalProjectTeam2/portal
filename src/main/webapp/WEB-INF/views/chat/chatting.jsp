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
<style type="text/css">
.well {
    width: 45%;
    border: 0;
    background: none;
    box-shadow: none;
}
.well.my {
    float: right;
    clear: both;
}
.well.other {
    float: left;
    clear: both;
}
div#chatData {
   overflow: auto;
   height: 560px;
}
div#chatDataIn {
    height: max-content;
    overflow: auto;
}
.alert-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
    word-break: break-all;
}
</style>
<script type="text/javascript">
	var sock = new SockJS("<c:url value='/echo'/>");
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	$(function() {
		$("#sendBtn").click(function() {
			console.log("send message...");
			sendMessage();
		});
		$("#reLoad").click(function() {
			 sock = new SockJS("<c:url value='/echo'/>");
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
		
		var currentUser_session = $("#sessionUser").val();
		console.log("current session id : "+currentUser_session);
		
		name = strArray[0];
		sessionId = strArray[1];
		message = strArray[2];
		
		if(sessionId == currentUser_session){
			var printHtml = "<div class='well my'>";
			printHtml += "<div>";
			printHtml += name + "(" + sessionId + ")";
			printHtml += "</div>";
			printHtml += "<div class='alert alert-info'>";
			printHtml += "<strong>"+ message + "</strong>";
			printHtml += "</div >";
			printHtml += "</div >";
			
			$("#chatDataIn").append(printHtml);
		}else{
			var printHtml = "<div class='well other'>";
			printHtml += "<div>";
			printHtml += name + "(" + sessionId + ")";
			printHtml += "</div>";
			printHtml += "<div class='alert alert-warning'>";
			printHtml += "<strong>"+ message + "</strong>";
			printHtml += "</div >";
			printHtml += "</div >";
			
			$("#chatDataIn").append(printHtml);
		}
		/* $("#chatData").animate({
			scrollTop: $("#chatData").height()
		},800); */
		/* $("#chatData").scrollTop($("#chatData").height()); */
		var scrollPosition = $("#chatDataIn").height();
		console.log("hegiht : " + scrollPosition);
		$("#chatData").animate({
			scrollTop: scrollPosition
		}, 800);
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
							<div id="chatDataIn"></div>
						</div>
						<div id="data"></div>
					</div>
					<div>
						<input type="text" id="message">
						<input type="text" id="sessionUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<input id="sendBtn" type="button" value="전송">
						<input id="reLoad" type="button" value="재접속">
					</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>