<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/resources/css/chat/custom.css'/>">
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style type="text/css">

</style>
<sec:authorize access="isAuthenticated()">

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
			 location.reload();
		});
	});
	
	function sendMessage() {
		sock.send($("#message").val());
		$("#message").val("");
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
		
		if(message == 'in'){
			var printHtml = "<div class='notice'>";
			printHtml += name + "님이 입장하셨습니다.";
			printHtml += "</div >";
			$("#chatDataIn").append(printHtml);
			return;
		}
		
		if(message == 'out'){
			var printHtml = "<div class='notice' >";
			printHtml += name + "님이 퇴장하셨습니다.";
			printHtml += "</div >";
			$("#chatDataIn").append(printHtml);
			return;
		}
		
		if(sessionId == currentUser_session){
			var printHtml = "<div class='well my'>";
			printHtml += "<div class='userInfoDiv'>";
			printHtml += name + "(" + sessionId + ")";
			printHtml += "</div>";
			printHtml += "<div class='alert alert-info'>";
			printHtml += "<strong>"+ message + "</strong>";
			printHtml += "</div >";
			printHtml += "</div >";
			
			$("#chatDataIn").append(printHtml);
		}else{
			var printHtml = "<div class='well other'>";
			printHtml += "<div class='userInfoDiv'>";
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
	<div id="chattingDiv">
	<div class="container1">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
				
				</div>
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>실시간 채팅방</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chatData" class="panel-collapse collapse in show">
							<div id="chatDataIn"></div>
							<div id="data"></div>
						</div>
						
					</div>
					<div style="overflow: hidden;">
						<input type="text" id="message">
						<input type="hidden" id="sessionUser" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<input id="reLoad" type="button" value="재접속">
						<input id="sendBtn" type="button" value="전 송">
					</div>
			</div>
		</div>
	</div>
	</div>
	</div>