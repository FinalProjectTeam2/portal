<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.scholarship {
	margin-left: 20%;
	margin-top: -20%;
	width: 100%;
}

.tableSearch {
	width: 1400px;
	min-width: 500px;
	border-collapse:collapse;
 	border-spacing: 1px;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	margin: 20px 10px;
	line-height: 1.5;
}

.tableSearch tr, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}


#search:hover {
	background: #0b7dda;
}	

</style>

<div class="scholarship">
<h1>장학금 관리 페이지</h1>
<hr align="left" width="55%">
<br>	
<!-- 학생 상세 정보 -->
	<div class="divSearch">
		<table class="tableSearch">
			<thead>
				<tr>
					<th>학부</th>
					<th>학과</th>
					<th>학번</th>
					<th>이름</th>
					<th>학점</th>
					<th>출석률</th>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>경영학부</td>				
					<td>경영학과</td>
					<td>202020222</td>
					<td>홍길동</td>
					<td>4.0</td>
					<td>100%</td>
				</tr>	
			</tbody>	
		</table>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>