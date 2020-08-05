<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>


<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">


<img alt="캠퍼스맵" src="<c:url value='/resources/images/campusMap.JPG' />">

<c:forEach var="vo" items="${list }">
	<p>${vo.buildingName }</p>
</c:forEach>
	
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>