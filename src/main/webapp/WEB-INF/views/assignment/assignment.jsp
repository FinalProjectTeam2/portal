<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.attendance {
	margin-left: 20%;
	margin-top: -20%;
	width: 80%;
	min-width: 500px;
}

hr {
	width: 45%;
	min-width: 15%;	
}

.table {
	width: 100%;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}

</style>
<div class="attendance">
<h1>과제관리 페이지</h1>
<hr align="left">
<br>
	<div class="divTable">
		<table class="table">
			<thead>
				<tr>
					<th>강의명</th>
					<th>교수명</th>
					<th>파일명</th>
					<th>과제명</th>
					<th>제출여부</th>
					<th>채점상황</th>
					<th>마감까지 남은 시간</th>
			</thead>
			<tbody>
				<tr>
					<td>경영이론1</td>	
					<td>변사또</td>	
					<td>시장조사분석</td>	
					<td>홍길동</td>	
					<td>미제출</td>
					<td>X</td>	
					<td>1일 1:00:00</td>	
				</tr>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>