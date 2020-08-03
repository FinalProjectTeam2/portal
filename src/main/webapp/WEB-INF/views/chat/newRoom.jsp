<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title>채팅 서비스</title>

</head>
<script type="text/javascript">
$(function() {
	$("#newRoomForm").submit(function() {
		$.ajax({
			url : "<c:url value='/chat/room/new'/>",
			data : {name: $("#title").val()},
			type : 'post',
			dataType : "text",
			success: function(res) {
				acyncMovePage('<c:url value="/chat/"/>', 'get');
			}
		});
		return false;
	});
});
</script>
<body>

<div class="container">

    <form id="newRoomForm" class="form-signing" action="<c:url value='/chat/room/new'/>" method= "post">
 
        <h2 class="form-signing-heading">새로운 채팅방 생성</h2>
        <label for="title" class="sr-only">채팅방 이름</label>
        <input type="text" name="name" id="title" class="form-control" placeholder="채팅방 이름을 입력해주세요" required autofocus>
        <br>
        <button class="btn btn-primary" type="submit">생성하기</button>
        <button class="btn btn-danger" onclick = 'acyncMovePage("<c:url value='/chat/'/>", "get")'>돌아가기</button>
    </form>

</div> <!-- /container -->


</body>
</html>