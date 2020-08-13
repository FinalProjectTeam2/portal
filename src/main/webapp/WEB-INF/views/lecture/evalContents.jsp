<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center;">
		<span style="font-weight: bold; font-size: 20px;">${param.subjName }</span>
	</div>
	<div style="align-content: center;">
	<c:if test="${!empty contentsList }">
		<ul style="list-style: none;">
		<c:forEach var="contents" items="${contentsList }">
			<li>${contents }</li>
			<hr>
		</c:forEach>
		</ul>
	</c:if>
	</div>
</body>
</html>