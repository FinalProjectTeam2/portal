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

.text-left {
	text-align: left;
	padding-left: 10%;
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
				<td>
					<c:forEach var="vo" items="${stuList}">
						${vo.facultyName}
					</c:forEach>
				</td>
				<th>학과</th>
				<td>
					<c:forEach var="vo" items="${stuList}">
						${vo.depName}
					</c:forEach>
				</td> 
			</tr>
			<tr>
				<th>학번</th>
				<td>
					<c:forEach var="vo" items="${stuList}">
					${vo.stuNo}
				</c:forEach>
				</td>
				<th>학기</th>
				<td colspan="3">
					<c:forEach var="vo" items="${stuList}">
						${vo.semester}
					</c:forEach>
				</td> 
			</tr>	
			<tr>
				<th>이름</th>
				<td colspan="3" class="text-left">
					<c:forEach var="vo" items="${stuList}">
						${vo.name}
					</c:forEach>
				</td> 
			</tr>
		</table>
		</form>
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
			</tr>
			<tr>
				<td><input type="radio"></td>
				<td>
					<c:forEach var="vo" items="${tList}">
						${vo.depositState}
					</c:forEach>
				</td>
				<td>
					<c:forEach var="vo" items="${tList}">
						${vo.depositDate}
					</c:forEach>
				</td>
				<td>
					<c:forEach var="vo" items="${tList}">
						${vo.bankName} ${vo.account_no}
					</c:forEach>
				</td>
				<td>
					<c:forEach var="vo" items="${tList}">
						${total}
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	
	<div>
		<input type="submit" value="확인" id="bt">
		<input type="button" value="취소" id="bt">
	</div>
</div>


<%@ include file="../inc/bottom.jsp"%>
