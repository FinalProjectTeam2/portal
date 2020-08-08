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
<h1>장학금 신청, 지급 안내</h1>
<hr align="left">
<br>
	<div class="divTable">
		<table class="table">
			<colgroup>
				<col style="width:%">
				<col style="width:%">
				<col style="width:%">
				<col style="width:%">
				<col style="width:">		
				<col style="width:">		
				<col style="width:">		
			</colgroup>
			<thead>
				<tr>
					<th scope="col"> 장학금 구분 </th>
					<th scope="col"> 항목  </th>
					<th scope="col"> 대상 </th>
					<th scope="col"> 요건 </th>
					<th scope="col"> 지급액 </th>
					<th scope="col"> 지급방법 </th>
					<th scope="col"> 제출서류 </th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>교내장학금</td>
					<td>성적우수장학금</td>
					<td>과별 1명</td>
					<td>평균4.0이상, 출결 100%</td>
					<td>다음 한 학기 수업료 70% 지원</td>
					<td>등록금 환불</td>
					<td>성적</td>
				</tr>
				<tr>
					<td>교내장학금</td>
					<td>특별장학금</td>
					<td>과별 1명</td>
					<td>학장(학과장) 추천을 받은 학생</td>
					<td>평균4.0이상, 출결 100%</td>
					<td>다음 한 학기 수업료의 15% 지원</td>
					<td>등록금 환불</td>
				</tr>
				<tr>
					<td>교내장학금</td>
					<td>대학봉사 장학금 </td>
					<td>과별 1명</td>
					<td>학생자치활동 부서에서 근로봉사를 제공하는 학생 중 선발</td>
					<td>다음 한 학기 수업료의 15% 지원</td>
					<td>등록금 환불</td>
					<td>봉사활동서, 담당 교수 확인증</td>
				</tr>
				
				<tr>
					<td>교외장학금</td>
					<td>소득연계형 국가장학금</td>
					<td>과별 1명</td>
					<td>학생 중 선발</td>
					<td>한 학기 수업료 전액 지원</td>
					<td>등록금 환불</td>
					<td>건강보험료, 기초생활</td>
				</tr>
				<tr>
					<td>교외장학금</td>
					<td>국가우수장학금(우수학생지원사업)</td>
					<td>과별 1명</td>
					<td>학생자치활동 부서에서 근로봉사를 제공하는 학생 중 선발</td>
					<td>다음 한 학기 수업료의 15% 지원</td>
					<td>등록금 환불</td>
					<td>봉사활동서, 담당 교수 확인증</td>
					
				</tr>
				<tr>
					<td>교외장학금</td>
					<td>희망사다리장학금</td>
					<td>과별 1명</td>
					<td>&nbsp;</td>
					<td>다음 한 학기 수업료의 15% 지원</td>
					<td>등록금 환불</td>
					<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>