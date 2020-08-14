<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.tuition {
	margin-left: 3%;
	margin-top: 2%;
}
</style>
<div class="tuition">
	<h1>등록금 관리 </h1>
	<hr width="70%" align="left"><br>
<!-- 등록,수정, 삭제 버튼 -->
	<div class="divBtn">
		<input type="button" value="등록">
		<input type="button" value="수정">
		<input type="button" value="삭제">
	</div>
	
<!-- 조회 -->	
	<div>
		<div class="divDate">입금일자 </div>
			<div class=""><%@ include file="../board_food/dateTerm.jsp"%> </div>
		<div class="divState">수납여부 </div>
			<div class="selectState">
				<select>
					<option> -- 구분 -- </option>
					<option><font color="red">미납</font></option>
					<option> 완료</option>
				</select>
			</div>
		<div class="">학부 </div>
			<div class="divFaculty">
				<select>
					<option> -- 구분 -- </option>
					<option>경영대</font></option>
					<option>미술대</option>
				</select>
			</div>
		<div class="">학과 </div>
			<div class="divDepartment">
				<select>
					<option> -- 구분 -- </option>
					<option>경영학과</font></option>
					<option>경제학과</option>
				</select>
			</div>
		<div>이름</div>
			<div><input id="name" type="text" disabled></div>			
	</div> // 조회
	

<!-- 조회 내역 -->	
	<div class="divtable">
		<table>
			<tr>
				<th><input id="chkbox" type="checkbox"></th>
				<th>학부</th>
				<th>학과</th>
				<th>이름</th>
				<th>은행명</th>
				<th>계좌명</th>
				<th>예금주</th>
				<th>등록금</th>
				<th>학생명</th>
				<th>계좌명</th>
				<th>계좌명</th>
				<th>계좌명</th>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>

</div>

<!-- 페이징처리 -->
<div>
</div>
</div>



















<%@ include file="../inc/bottom.jsp"%>