<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.certificate {
	width: 793.7007874px;
	height: 1122px;
	margin: 10px 0;
}

.certificate .num {
	margin-left: 2%;
	margin: 5% 0 0 2%;
	padding: 20px 0 0 0;
}

.certificate .title {
	text-align: center;
	margin-top: 60px;
	letter-spacing: 1em;
}

.certificate .table {
	font-size:18px;
	margin-left: 20%;
	margin-top:10%;
	line-height: 65px;
	display: table;
}

.certificate .row {
	display: table-row;
}

.certificate .cell, .certificate .cell2 {
	display: table-cell;
}

.certificate .cell {
	width: 180px;
}

.certificate .cell2{
	width: 400px;
}

.certificate .div1 {
	font-size: 24px;
	margin-top: 13%;
	text-align: center;
}

.certificate .div2 {
	font-size: 20px;
	margin-left: 45%;
	text-align: center;
}

.certificate .div3 {
	margin-top: 10%;
    text-align: center;
}

.certificate img {
	width: 500px;
}
</style>

<body style="margin: 0">
<div class="certificate" >
	<div class="num">
		<h6>제2020 - 10101010호</h6>
	</div>
	
	<div class="title">
		<h1>${vo.certName }</h1>
	</div>
	
	<div class="table">
		<div class="row">
			<div class="cell">성 명</div>
			<div class="cell2">${map['NAME']}</div>		
		</div>
		
		<div class="row">
			<div class="cell">생 년 월 일</div>
			<div class="cell2">
			<c:set value="${fn:substring(map['SSN'],6,7)}" var="type"></c:set>
			<p>
			<c:if test="${type == 1 or type == 2}">19</c:if><!--
			--><c:if test="${type == 3 or type == 4}">20</c:if><!--
			-->${fn:substring(map['SSN'],0,2) }년 ${fn:substring(map['SSN'],2,4) }월 
			${fn:substring(map['SSN'],4,6) }일
			<p>
			</div>
		</div>
		
		<div class="row">
			<div class="cell">대 학</div>
			<div class="cell2">척척학사</div>
		</div>
		
		<div class="row">
			<div class="cell">학 과</div>
			<div class="cell2">${map['DEP_NAME'] }</div>
		</div>
		
		<div class="row">
			<div class="cell">학 년</div>
			<div class="cell2">${(map['SEMESTER'] / 2)}</div>
		</div>
		
		<div class="row">
			<div class="cell">입 학 년 월 일</div>
			<div class="cell2"><fmt:formatDate value="${map['ADMISSION_DATE'] }" pattern="yyyy년 MM월 dd일"/></div>
		</div>
	</div>	

	<div class="div1">
		<h4>위의 사실을 증명합니다.</h4>
	</div>
	<div class="div2">
		<h5><fmt:formatDate value='${vo.regDate}' pattern='yyyy년 MM월 dd일'/></h5>
	</div>
	<div class="div3">
		<img alt="직인" src="<c:url value='/resources/images/stamp1.png'/>">
	</div>
</div>
</body>
</html>