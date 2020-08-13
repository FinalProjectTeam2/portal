<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<sec:authentication var="principal" property="principal" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0 auto;
	padding: 0;
	border: 1px solid gray;
	width: 95%;
	border-radius: 3px;
	color: #4a4a4a;
}
h2{
	margin: 0 0 0 10px;
}
#main{
	margin: 5px 10px;
	border: 1px solid gray;
	text-align: center;
	border-radius: 5px;
	padding: 10px;
}
#title{
	background: #c4eeff82;
	padding: 10px 0;
	font-size: 1.3em;
	font-weight: bold;
}
</style>
</head>
<body>
<div style="margin: 10px auto; background: #e8f5f7; padding: 5px;"><h2>결제 완료</h2></div>
<div id="main">
<p>증명서 발급 시스템을 이용해 주셔서 감사합니다.</p>
<p id="title">${vo.certName } 발급이 완료되었습니다.</p>
<p>
<span style="font-weight: bold; font-size: 1.1em;">${principal.name }</span>님이 결제하신 총 결제 금액은<br>
<span style="font-weight: bold; font-size: 1.1em;"><fmt:formatNumber value="${vo.qty * 1000 }" pattern="#,###"></fmt:formatNumber>원</span> 입니다.
</p>
<p>증명서 출력은 증명서 발급페이지의<br>발급 증명서 현황에서 받으실 수 있습니다.</p>
</div>
</body>
</html>