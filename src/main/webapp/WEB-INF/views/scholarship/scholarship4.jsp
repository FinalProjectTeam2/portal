<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.scholarship {
	margin-left: 20%;
	margin-top: -20%;
	min-height: 500px;
}

hr {
	width: 45%;
}

</style>

<div class="scholarship">
<h1>장학금 관리 페이지</h1>
<hr align="left">

<!-- 학생정보 검색? 상태? -->
	<div class="divSearch">
		<table class=tableSearch">
			<thead>
				<tr>
					<th>학부</th>
					<th>학과</th>
					<th>학번</th>
					<th>이름</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>경영학부</td>				
					<td>경영학과</td>
					<td>202020222</td>
					<td>홍길동</td>
				</tr>	
			</tbody>	
		</table>
	</div>


<!-- 장학금 신청 내역  -->
	<div class="divApply">
		<table class="tableApply">
			<thead>
				<tr>
					<th>학부</th>
					<th>학과</th>
					<th>학번</th>
					<th>이름</th>
					<th>장학금분류</th>
					<th>장학금명</th>
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
					<td>교내장학금</td>
					<td>성적우수</td>
					<td>4.0</td>
					<td>100%</td>
				</tr>	
			</tbody>	
		</table>
	</div>
<!-- 장학금 지급 내역 -->
	<div class="divPayments">
		<table class=tablePayments">
			<thead>
				<tr>
					<th>장학금분류</th>
					<th>장학금명</th>
					<th>신청지급구분</th>
					<th>신청일자</th>
					<th>신청상태</th>
					<th>승인일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>교내장학금</td>				
					<td>성적우수</td>
					<td>미지급</td>
					<td>2020.7.10</td>
					<td>신청</td>
					<td>&nbsp;</td>

				</tr>	
			</tbody>	
		</table>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>