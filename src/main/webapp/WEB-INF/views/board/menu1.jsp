<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/menu1.css'/>" />
<script type="text/javascript" src="<c:url value='js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
</script>
<title>게시판</title>
</head>
<body>
<!-- 공지사항 -->
<div class="NoticeContents">
	<h1>포털공지</h1> <!-- 타이틀만만 바뀜(포털공지/ 학사ㆍ국제공지/ 장학공지/ 행사ㆍ참여 게시판/ 학사ㆍ국제공지  -->
	<br>
	<p style="line-height: 28px; font-size: 14px;">
		홈페이지 개편에 따라 공지사항이 홈페이지와 포털 공지로 구분되어 운영되오니 이용에 참고하여 주시기 바랍니다.<br>
		- <strong>홈페이지 공지</strong>&nbsp;: 대외적인 행사 등 외부인을 대상으로 하는 일반, 특강, 행사, 채용 등으로 운영<br>
		- <span style="color: rgb(255, 240, 245);">
			<strong>
				<span style="background-color: rgb(61, 121, 194);">포털 공지</span>
			</strong>
		</span>
		&nbsp;: <strong>내부 구성원을 위한 공지 영역으로&nbsp;</strong>
		포괄적인 내용의 <strong>포털 공지</strong>, 학사전용의 <strong>학사 공지</strong>, 장학전용의 <strong>장학 공지</strong>로 구분하여 운영
	</p>
</div>

<hr>
<!-- ------------------------------------------------->

<!-- 게시판 -->
<%@ include file="boardList.jsp" %> 
 
<!-- ------------------------------------------------->
<!-- 건의 -->
<%@ include file="menu1-4.jsp" %>   
</body>
</html>