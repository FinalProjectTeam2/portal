<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.scholarship {
	margin-left: 5%;
	margin-top: 2%;
	min-height: 500px;
}

hr {
	width: 45%;
}

.divPayments {
	width: 1400px;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}
</style>

<div class="scholarship">
<h1>장학금 확인 페이지</h1>
<!-- 학생정보 검색? 상태? -->
<!--학번/ 학과/ 학년/ 이름/ 학적상태(재학/휴학/입학)/   -->

<!-- 장학금 신청 -->
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