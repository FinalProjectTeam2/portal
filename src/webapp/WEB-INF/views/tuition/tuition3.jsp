<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<sec:authentication var="principal" property="principal" />
<style type="text/css">
.divTable { 
	display: table; 
	width: 800px;
	
}
	
.divTableRow { 
	display: table-row; 
}

.divTableHeading { 
 	background-color: #EEE; 
 	display: table-header-group; 
} 

.divTableCell, .divTableHead, .cellColor{ 
 	border: 1px solid #999999; 
 	display: table-cell; 
 	padding: 3px 10px; 
} 

.cellColor {
	color:white;
	background-color: gray;
}

.divTableHeading { 
	background-color: #EEE; 
	display: table-header-group; 
	font-weight: bold; 
} 
 
.divTableFoot {
	background-color: #EEE; 
	display: table-footer-group; 
	font-weight: bold; 
} 

.divTableBody { 
	display: table-row-group; 
}

<!-- 테이블 -->	
.box {
	width: 1000px;
	margin:10px 0;
	padding:10px 5px 10px 0;
	border:solid silver 1px;
}

.box tr, td {
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	
}
</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$(function() {
	$.ajax({
		url:"<c:url value=''/>",
		type:"get",
		dataType:"json",
		success:function(res){
			$("").append(res);
		},
		error:function(xhr, status, error){
			alert(error);
		}
	});
});
</script>

<div id="tuition">
	<div class="title">
		<h1>등록금 납부 상세 내역</h1>
	</div>

	<div class="divTable" > 
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
	</div>
	
<br><br><br>

<div class="divTable">
	<table class="table2">
		<colgroup>
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
		</colgroup>
		<thead>
	  		<tr>
				<th>선택</th>
				<th>수납구분</th>
				<th>납부기간</th>
				<th>가상계좌</th>
				<th>수납금액</th>
				<th>수납여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="radio"></td>
				<td>등록금 수납</td>
				<td>2020-03-10 ~ 2020-03-20</td>
				<td>국민은행111-1111</td>
				<td>1,000,000</td>
				<td>납부</td>
			</tr>
		</tbody>
	</table>
</div>

<br><br><br>

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
						${vo.deposit_state }
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>

<input type="submit" value="영수증 보기" id="bt">
</div>
<%@ include file="../inc/bottom.jsp"%>
