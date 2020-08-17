<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/portalSidebar.jsp"%>
<link href="<c:url value='/resources/css/searchTel.css'/>"
	rel="stylesheet">
<script type="text/javascript">	
	function pageProc(curPage){
		$('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
	
</script>
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
<div id="title"><h3 style="font-weight: bold;">교내 전화번호 검색</h3></div>
<div id="searchTel">
	<div id="form">
		<form action="<c:url value='/search/searchTel' />" method="post">
			<div style="text-align: left; display: inline-block;">
				<label>검색하고자 하는 키워드를 입력 하여 주세요. 
				<br>예) 전화번호 뒷자리 - 0113 /학과명 - 경영학과 /학부명 - 공학부</label>
			</div>
			<div style="float: right;">
				<div>
					<input type="text" name="searchKeyword" value="${param.searchKeyword }">
					<input type="submit" value="검색" id="btSearch">
				</div>
			</div>
		</form>
	</div>
	<div class="divList">
		<table class="box2" summary="학과 목록">
			<thead>
				<tr>
					<th scope="col">학과명</th>
					<th scope="col">학과실</th>
					<th scope="col">학부명</th>
					<th scope="col">학과실 번호</th>
					<th scope="col">건물이름</th>
					<th scope="col">건물 전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty mapList }">
					<tr>
						<td colspan="6">현재 조회된 데이터가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty mapList }">
				<!--반복시작-->
					<c:forEach var="map" items="${mapList }">
						<tr>
							<td>${map['DEP_NAME']}</td>
							<td>${map['BUILDING_CODE']}</td>
							<td>${map['FACULTY_NAME']}</td>
							<td>${map['TEL']}</td>
							<td>${map['BUILDING_NAME']}</td>
							<td>${map['BUILDING_TEL']}</td>
						</tr>
					</c:forEach>
					<!-- 반복 끝 -->
				</c:if>
			</tbody>
		</table>
			<div class="divPage" style="text-align: center;">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 ◀ -->
			<c:if test="${!empty mapList }">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" style="color: #3333339c" onclick="pageProc(${pagingInfo.firstPage-1})">
					<img src="<c:url value='/resources/images/first.JPG'/>" 
						alt="이전 블럭으로 이동">
				</a>
			</c:if> 
			
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage }" 
				end="${pagingInfo.lastPage }">
				
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" style="color: #3333339c" onclick="pageProc(${i})">${i}</a>	
				</c:if>
				<c:if test="${i==pagingInfo.currentPage }">
					<span class="pageA">${i}</span>			
				</c:if>			
					
			</c:forEach>
				
			<!-- 다음 블럭으로 이동 ▶ -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
				<a href="#" style="color: #3333339c" onclick="pageProc(${pagingInfo.lastPage+1})">
					<img src="<c:url value='/resources/images/last.JPG'/>" 
						alt="다음 블럭으로 이동">
				</a>
			</c:if>
			</c:if>
			<!--  페이지 번호 끝 -->
			</div>
		<form action="<c:url value='/search/searchTel'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchKeyword" 
				value="${param.searchKeyword}">	
		</form>
	</div>

</div>

<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>