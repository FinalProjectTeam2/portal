<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>

<div class="attendance">
<h1>출결관리 페이지</h1>
	<div>
		<label>날짜 : 2020. 8. 6. 목</label>
	</div>
	
	<div class=""><%@ include file="../board_food/dateTerm.jsp"%> </div> 
	
	<div> 
		<input type="checkbox">
	</div>
	
	<div>
		<label>학부</label>
		<select>
			<option> -- 구분 -- </option>
			<option>경영대학</option>
			<option>예체능</option>
		</select>
	</div>

	<div>
		<label>학과</label>
		<select>
			<option> -- 구분 -- </option>
			<option>경영대학</option>
			<option>예체능</option>
		</select>
	</div>
	
	<div>
		<label>학기</label>
		<select>
			<option> -- 구분 -- </option>
			<option>1학년1학기</option>
			<option>1학년2학기</option>
		</select>
	</div>
	
	
	<div>
		<label>학년</label>
		<select>
			<option> -- 구분 -- </option>
			<option>1학년</option>
			<option>2학년</option>
		</select>
	</div>
	
	<div>
		<label>이름</label>
		<input id="name" type="text" disabled>
	</div>
	
	<div>
		<label>과목</label>
		<select>
			<option> -- 구분 -- </option>
			<option>1학년</option>
			<option>2학년</option>
		</select>
	</div>
	
	<div>
		<label>교수</label>
		<input id="name" type="text" disabled>
	</div>
	
	<div>
		<label>지각</label>
		<input id="chek" type="checkbox">
	</div>
	
	<div>
		<label>조퇴<<label>
		<input id="chek" type="checkbox">
	</div>
	
	<div>
		<label>결석</label>
		<input id="chek" type="checkbox">
	</div>
	
	<div>
		<label>출석률</label>
		<label>96%</label>
	</div>

	<div>
		상세보기 - 버튼 클릭시 팝업창떠서 현재까지 지각, 조퇴, 결석 몇 번 했는지 숫자로 보여주기? 
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>