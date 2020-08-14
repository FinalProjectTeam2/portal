<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- main 시작 -->
<script type="text/javascript">
$(document).ready(function() {
$('#tabs').tabs(); // 탭
});
</script>
<style>

	#tabs table, th, td{
		text-align: center;
	}
	
	#tabs td, th{
		padding: 10px;
	}
	
	#tabs table{
		margin: 0 auto;
		width: 100%;
		font-size: 1.1em;
	}
</style>
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
<div id="cmap">
	<div style="margin-bottom: 2%">
		<img alt="" src="<c:url value='/resources/images/mapLogo.png' />" width="60px;">
		<span style="font-size: 2em; font-weight: bold">CAMPUS MAP</span>
	</div>
	<img alt="캠퍼스맵" src="<c:url value='/resources/images/campusMap2.jpg' />" width="100%" height="650px;"> 

<div id="tabs">
	<ul>
		<c:set var="idx" value="1"></c:set>
		<c:forEach var="name" items="${buildingName }">
			<li><a id="tab${idx }" href="#tabContent_${idx }">${name.buildingName }</a></li>	
			<c:set var="idx" value="${idx+1 }"></c:set>
		</c:forEach>
	</ul>
		<div id="tabContent_1" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${mainList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>				
		</div>
		
		<div id="tabContent_2" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${gongList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>			
		</div>
		
		<div id="tabContent_3" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${scienceList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		
		<div id="tabContent_4" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${mediList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		<div id="tabContent_5" class="tabs"> 
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${artList }">
				<tr class="table-light">  
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		<div id="tabContent_6" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${inmoonList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
</div>
</div>

<!-- bottom -->		
<%@ include file="inc/bottom.jsp"%>