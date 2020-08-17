<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.tuition {
	margin-left: 3%;
	margin-top: 1%;
}

.table1,  .table2, .table3{
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
	
	<div class="">
		<input type="button" value="영수증 보기" id="bt" onclick="location.href='http://localhost:9090/portal/tuition/tuition3'">
	</div>
	
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
				<th>수납구분</th>
				<th>납부기간</th>
				<th>가상계좌</th>
				<th>수납금액</th>
			</tr>
			<tr>
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
						${vo.bankName} ${vo.accountNo}
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
<br><br><br>

<!-- 내역 -->	
	
	<div class="divTable">
		<table class="table3">
			<tr>
				<th>구분</th>
				<th>금액</th>
			</tr>
			<tr>
				<th>입학금</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.admissionfee}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>수업료</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.tuition}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>실습비</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.practicecost}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>학생회비</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.studentfee}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>등록금계</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.total}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>장학금</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.scholarship}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>감면금액</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.reduction}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>납부할 금액</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.total}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th>납부현황</th>
				<td>
					<c:forEach var="vo" items="${tDList }">
						${vo.depositState }
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>