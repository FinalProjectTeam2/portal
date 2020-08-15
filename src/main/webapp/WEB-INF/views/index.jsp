<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<%@ include file="inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">


<!-- main 시작 -->
<main role="main" class="flex-shrink-0">

	<div class="container">

		<div style="overflow: hidden;">
			<div class="indexDOM_large">
				<%@include file="chat/chatRooms.jsp" %>
			</div>
			
		</div>
		<%@ include file="inc/bottom.jsp"%>
