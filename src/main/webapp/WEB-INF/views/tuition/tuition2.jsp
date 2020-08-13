<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.tuition {
	margin-left: 3%;
	margin-top: 1%;
}

.table1,  .table2 {
	width: 1400px;
	border: 1px solid gray;
	border-collapse: collapse;
	text-align: center;
}

.table1 th {
	border: 1px solid gray;
}

.table2 th {
	background: #e6f3ff;
}
</style>
<div class="tuition">
	<div class="title">
		<h1>등록금 납부 내역 조회 </h1>
		<hr align="left" width="600px">
	</div>
	<br>
	
	<div class="divTable">
		<form name="frmWrite" method="post" action="<c:url value='tuition/tuition3'/>" >
		<table class="table1">
			<tr>
				<th>학부</th>
				<td><c:if test="${map.FACULTY_NO}" /></td>
				<th>학과</th>
				<td><c:if test="${map.DEP_NAME}" /></td>
			
			</tr>
			<tr>
			
				<th>학번</th>
				<td>${principal.officialNo }</td>
				<th>이름</th>
				<td>${principal.name }</td>
			</tr>	
			<tr>
				<th>학기</th>
				<td colspan="2"><c:if test="${map.SEMESTER}" /></td> 
				
			</tr>
		</table>
	</div>

<br><br><br>

	<div class="divTable">
		<table class="table2">
	  		<tr>
				<th>선택</th>
				<th>수납구분</th>
				<th>납부기간</th>
				<th>가상계좌</th>
				<th>수납금액</th>
				<th>수납여부</th>
			</tr>
			<tr>
				<td><input type="radio"></td>
				<td>등록금 수납</td>
				<td>2020-03-10 ~ 2020-03-20</td>
				
				<td><c:if test="${map.BANK_NAME}" /><c:if test="${map.ACCOUNT_NO }" /> </td>
				
				<td>1,000,000</td>
				<td>납부</td>
			</tr>
		</table>
	</div>
	
	<div>
		<input type="submit" value="확인" id="bt">
		<input type="button" value="취소" id="bt">
	</div>
</form>
</div>


<%@ include file="../inc/bottom.jsp"%>
