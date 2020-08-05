<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
<script type="text/javascript">
$(document).ready(function() {
$('#tabs').tabs(); // 탭
});

</script>
<!-- <div id="tabs">
<ul>
	<li><a id="tab1" href="#tabContent_1">탭 제목1</a></li>
	<li><a id="tab2" href="#tabContent_2">탭 제목2</a></li>
	<li><a id="tab3" href="#tabContent_3">탭 제목3</a></li>
</ul>
	<div id="tabContent_1"><p>첫번째 영역의 내용</p></div>
	<div id="tabContent_2"><p>두번째 영역의 내용</p></div>
	<div id="tabContent_3"><p>세번째 영역의 내용</p></div>
</div> -->
<%-- <img alt="캠퍼스맵" src="<c:url value='/resources/images/campusMap.JPG' />"> --%>
<p>1.인문사회동 2.공과대학동 3.본관 4.예술대학동 5.의과대학동 6.자연과학동</p>
<div id="tabs">
<ul>	
	<li><a id="tab1" href="#tabContent_1">본문</a></li>
	<li><a id="tab2" href="#tabContent_2">인문사회동</a></li>
	<li><a id="tab3" href="#tabContent_3">공과대학동</a></li>
	<li><a id="tab4" href="#tabContent_4">예술대학동</a></li>
	<li><a id="tab5" href="#tabContent_5">의과대학동</a></li>
	<li><a id="tab6" href="#tabContent_6">자연과학동</a></li>
</ul>
	
</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>