<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.dviTable {
	display: table;
	margin-left: 30%;	
}

.row {
	display: table-row;
}

.cell {
	display: table-cell;
}
</style>

<div class="assignment">
	<div class="divTable">
		<div class="row">
			<div class="cell">과 목 명</div>
			<div class="cell">이론</div>
		</div>
		<div class="row">
			<div class="cell">교 수 명</div>
			<div class="cell">교수</div>
		</div>
		<div class="row">
			<div class="cell">제 출 기 한</div>
			<div class="cell">2020. 08. 19. 수</div>
		</div>
	</div>
	<div>
		<div>
			<label>제출파일</label>
		</div>
		<div>
			<input type="file">
		</div>
		<div>
			<label>내용</label>
		</div>
	</div>

	<div> 
		<input type="submit" value="제출">
	</div>



</div>

<%@ include file="../inc/bottom.jsp"%>