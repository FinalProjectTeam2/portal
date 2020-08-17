<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.scholarship {
	margin-left: 5%;
	margin-top: 2%;
	min-height: 500px;
	min-width: 500px;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
}

hr {
	width: 45%;
}

.tablePayments {
	width: 1400px;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
   	border-top: 1px solid #ccc;
    margin: 20px 10px;
}

th {
	border-bottom: 1px solid #ccc;
	padding: 10px;
}

td {
	padding: 6px;
}
</style>

<div class="scholarship">
<h1>장학금 확인 페이지</h1>
<hr align="left" width="55%">
<br>
<!-- 장학금 신청 -->
	<div class="divPayments">
		<table class="tablePayments">
			<thead>
				<tr>
					<th>장학금분류</th>
					<th>장학금명</th>
					<th>승인여부</th>
					<th>승인일자</th>
					<th>지급여부</th>
					<th>지급일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.scholarshipType}
						</c:forEach>				
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.scholarshipName}
						</c:forEach>				
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.approval}
						</c:forEach>				
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.approvalDate}
						</c:forEach>				
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.aymentOrNot}
						</c:forEach>				
					</td>
					<td>
						<c:forEach var="vo" items="${list}">
							${vo.awardingDate}
						</c:forEach>				
					</td>
				</tr>	
			</tbody>	
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>