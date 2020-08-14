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
<div class="container">
<h1>등록금 납부 상세 내역</h1>
<div id="tuition1">
<form name="frmWrite" method="post" action="<c:url value=''/>" >
	<div class="divTable" > 
		<div class="divTableBody"> 
			<div class="divTableRow"> 
				<div class="cellColor">학부</div> 
				<div class="divTableCell">${faculty_name}</div> 			
				<div class="cellColor">학과</div>
				<div class="divTableCell">${dep_name} </div> 
			</div> 
		<div class="divTableRow"> 
			<div class="cellColor">학번</div> 
			<div class="divTableCell">{stu_no}</div> 						
			<div class="cellColor">이름</div>
			<div class="divTableCell">${name }</div> 
		</div> 
		<div class="divTableRow"> 
			<div class="cellColor">학기</div> 
			<div class="divTableCell">
				<select>
					<option> -- 구분 -- </option>
					<option> 1학기  1차</option>
					<option> 1학기  2차</option>
					<option> 2학기 1차</option>
					<option> 2학기 2차</option>
					<option> 계절학기</option>
				</select>
			</div>
			<div class="cellColor">&nbsp;</div>
			<div class="divTableCell">&nbsp;</div> 
	</div>
	</div>
</div>	
</form>		
		
<br><br><br>
<div class="divTable">
	<table class="box">
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
	<table class="box">
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
				<th>구분</th>
				<th>금액</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${!empty list }"> 
			<c:forEach var="TuitionVO" items="${list }">
			<tr>
				<td>입학금</td>
				<td>${TuitionVO.admissionfee }</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>수업료</td>
				<td>${TuitionStuVO.TuitionVO.tuition }</td>
				<td>수강신청학점:15학점</td>
			</tr>
			<tr>
				<td>실습비</td>
				<td>${TuitionStuVO.TuitionVO.practicecost }</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>학생회비</td>
				<td>${TuitionStuVO.TuitionVO.studentfee }</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>등록금계</td>
				<td>1,000,000원</td>
				<td>입학금+수업료+실습비</td>
			</tr>
			<tr>
				<td>국가장학금 감면액</td>
				<td>0원</td>
				<td>유형: 국가장학금1유형</td>
			</tr>
			<tr>
				<td>교내장학금 감면액</td>
				<td>0원</td>
				<td>유형:</td>
			</tr>
			<tr>
				<td>감면금액합계</td>
				<td>0원</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>납부할 금액</td>
				<td>${TuitionStuVO.TuitionVO.total }</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>납부현황</td>
				<td>${TuitionStuVO.TuitionVO.deposit_state }</td>
				<td>&nbsp;</td>
			</tr>
			</c:forEach>
		</c:if>
		</tbody>
</table>
</div>

<input type="submit" value="영수증 보기" id="bt">
</div>
<%@ include file="../inc/bottom.jsp"%>
