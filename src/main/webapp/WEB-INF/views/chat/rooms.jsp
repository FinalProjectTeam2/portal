<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
<title>채팅 서비스</title>

<style type="text/css">
#chatRooms td {
	padding: 5px 10px;
	padding-bottom: 0;
	text-align: left;
}

.table thead th {
	padding: 0.55rem;
	background: #626d80;
	color: white;
}
</style>
</head>
<body>

	<div class="container" id="chatRooms">
		<table class="table table-striped">
			<colgroup>
				<col width="80%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th colspan="2">실시간 채팅방</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="room" items="${rooms }">
					<tr>
						<td>${room.name}</td>
						<td><a class="btn btn-primary" href="#"
							onclick="acyncMovePage('<c:url value="/chat/rooms?roomId=${room.roomId}"/>', 'get')">입장</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a class="btn btn-primary pull-right" href="#"
			onclick="acyncMovePage('<c:url value="/chat/new"/>', 'get')">방 생성</a>
	</div>


</body>
</html>