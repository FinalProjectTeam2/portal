<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.attendance {
	margin-left: 20%;
	margin-top: -18%;
	width: 80%;
	min-width: 500px;
}

hr {
	width: 45%;
	min-width: 15%;	
}

.table {
	width: 90%;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}

.table th {
	background: #e6f3ff;
}
.divpage {
	text-align: center;
}
</style>
<div class="attendance">
<h1>과제관리 페이지</h1>
<hr align="left">
<br>
	<div class="divTable">
		<div class="btn">
			<input type="text">
			<input type="button" value="검색">
		</div>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>강의명</th>
					<th>교수명</th>
					<th>과제명</th>
					<th>제출자</th>
					<th>제출여부</th>
					<th>채점</th>
					<th>&nbsp;</th>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"></td>
					<td>경영이론1</td>	
					<td>변사또</td>	
					<td>시장조사분석</td>	
					<td><input type="text"></td>	
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>제출</option>
							<option>미제출</option>
						</select> 
					
					</td>
					<td><input type="text"></td>	
					<td>
						<input type="button" value="수정">
						<input type="button" value="확인">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
<!-- 페이징처리 -->	
	<div class="divpage">
		<div> [1]</div>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>