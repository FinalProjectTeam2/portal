<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div id="profSubjEval"><!-- lectureController -->
			<table>
				<tr>
					<td>${evalList }</td>
				</tr>
			</table>	
		</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>