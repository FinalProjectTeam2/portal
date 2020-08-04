<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
#chattingDiv .portlet {
    margin-bottom: 10px;
}
</style>
<sec:authorize access="isAuthenticated()">

	<script type="text/javascript">
		if(sock != null){
			disconnect();
		}
		var roomId = '${room.roomId}';
		console.log(roomId);
		var sock = null;
		

		$(function() {
			
			$(window).bind('beforeunload',function(){

				disconnect();
				return;
			});
			
			sock = new SockJS("<c:url value='/chat'/>");
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			sock.onopen = onOpen;
			
			$("#sendBtn").click(function() {
				send();
			});
			
			$("#reLoad").click(function() {
				disconnect();
				acyncMovePage('<c:url value="/chat/"/>', 'get');
			});
			
			$("#message").keydown(function(key) {
				if (key.keyCode == 13) {
					send();
				}
			});

		});
		function disconnect() {
			sock.send(JSON.stringify({
				chatRoomId : roomId,
				type : 'LEAVE',
			}));
			sock.close();
		}
		function send() {
			msg = document.getElementById("message").value;
			sock.send(JSON.stringify({
				chatRoomId : roomId,
				type : 'CHAT',
				message : msg
			}));
			document.getElementById("message").value = "";
			$("#message").focus();
		}
		function onOpen() {
			sock.send(JSON.stringify({
				chatRoomId : roomId,
				type : 'ENTER'
			}));
		}
		function onClose() {
			disconnect();
		}

		/* evt 는 websocket이 보내준 데이터 */
		function onMessage(evt) {
			var data = evt.data;
			var sessionId = null;
			var message = null;


			var currentUser_session = $("#sessionUser").val();
			console.log("current session id : " + currentUser_session);

			
			if(data.indexOf('|') == -1){
	        	data = data.replace('"','');
	        	data = data.replace('"','');
	        	var printHtml = "<div class='notice'>";
				printHtml += data;
				printHtml += "</div >";
	        	$("#chatDataIn").append(printHtml);
	        }else{
	        	data = data.replace('"','');
	        	data = data.replace('"','');
	        	
				var strArray = data.split("|");
				
	        	name = strArray[0];
				sessionId = strArray[1];
				message = strArray[2];
	        	
	        	if (sessionId == currentUser_session) {
					var printHtml = "<div class='well my'>";
					printHtml += "<div class='userInfoDiv'>";
					printHtml += name + "(" + sessionId + ")";
					printHtml += "</div>";
					printHtml += "<div class='alert alert-info'>";
					printHtml += "<strong>" + message + "</strong>";
					printHtml += "</div >";
					printHtml += "</div >";

					$("#chatDataIn").append(printHtml);
				} else {
					var printHtml = "<div class='well other'>";
					printHtml += "<div class='userInfoDiv'>";
					printHtml += name + "(" + sessionId + ")";
					printHtml += "</div>";
					printHtml += "<div class='alert alert-warning'>";
					printHtml += "<strong>" + message + "</strong>";
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
					scrollTop : scrollPosition
				}, 800);
				console.log("chatting data : " + data);
	        }
			
		}
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script type="text/javascript">
		$(function() {
			$("#data").html("로그인 후 사용 가능한 서비스입니다.");
			$("#sendBtn").attr('disabled', true);
			$("#reLoad").attr('disabled', true);
			$("#message").attr('disabled', true);
		});
	</script>
</sec:authorize>
</head>

<body>
<div id="chattingDiv">
	<div class="container1">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12"></div>
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간 채팅방 - ${room.name}
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chatData" class="panel-collapse collapse in show">
							<div id="chatDataIn"></div>
							<div id="data"></div>
						</div>

					</div>
					<div style="overflow: hidden;">
						<input type="text" id="message"> <input type="hidden"
							id="sessionUser"
							value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<input id="reLoad" type="button" value="목 록"> <input
							id="sendBtn" type="button" value="전 송">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>