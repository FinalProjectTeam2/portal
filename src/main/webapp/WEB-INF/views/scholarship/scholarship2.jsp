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
<h1>장학금 신청 페이지</h1>
<br>

<!-- 학생정보 검색? 상태? -->
	<div class="">
	학번/ 학과/ 학년/ 이름/ 학적상태(재학/휴학/입학)/ 
	</div>

<!-- 장학금 신청 -->
	<div class="">
		<table class="divTable">
			<thead>
				<tr>
					<th>장학금명</th>
					<th>신청지급구분</th>
					<th>신청일자</th>
					<th>신청상태</th>
					<th>승인일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
장학금명/ 신청지급구분(미지급/ 지급완료)/ 신청일자/ 신청상태(신청/ 최종승인)/ 승인일자
년도
학기
장학금명
장학금
지급일자 
기준평점
		</table>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>