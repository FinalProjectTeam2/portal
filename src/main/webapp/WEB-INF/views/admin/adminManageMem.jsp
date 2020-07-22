<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMem.css'/>" rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$('#btMultiDel').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제하려는 회원을 먼저 체크하세요');
				return;
			}
			
			$('form[name=frmList]')
	.prop("action","<c:url value='/admin/product/deleteMulti.do'/>");
			$('form[name=frmList]').submit();
		});	
		
		$("input[name=chkAll]").click(function(){
			$('tbody input[type=checkbox]')
				.prop('checked', this.checked);	
		});
		
		$('#btMultiAdd').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('상태를 변경하려는 회원을 먼저 체크하세요');
				return;
			}
			
			$('form[name=frmList]')
	.prop("action","<c:url value='/admin/product/eventMulti.do'/>");
			$('form[name=frmList]').submit();
		});	
	});//document.ready
	
	function boardList(curPage){
		$("input[name=currentPage]").val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="adminMngMem">
			<h2>회원 관리</h2>
			<p>조회결과 : {}건</p>


			<!-- 페이징 처리를 위한 form 시작-->
			<form name="frmPage" method="post" action="<c:url value='/admin'/>">
				<input type="hidden" name="" value="${param.eventName }"> <input
					type="hidden" name="">
			</form>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post" action="<c:url value='/admin'/>">
				<div class="divRight">
					조회조건 <select name="">
						<option disabled selected>---</option>
						<option value="">학생</option>
						<option value="">교수</option>
						<option value="">임직원</option>
					</select>
					학부 <select name="">
						<option disabled selected>---</option>
						<option value="">공대</option>
						<option value="">미대</option>
					</select>
					학과 <select name="">
						<option disabled selected>---</option>
						<option value="">경제</option>
						<option value="">컴공</option>
					</select>
					이름 <input type="text" size="8" name="searchKeyword">
					<button class="btn btn-primary btn-lg login-button" id="btSearch">검색</button>
				<div class="divList">
					<table class="box2"
						summary="회원 목록">
						<caption>회원 목록</caption>
						<colgroup>
							<col style="width: 5%" />
							<col style="width: 10%" />
							<col style="width: 15%" />
							<col style="width: 14%" />
							<col style="width: 20%" />
							<col style="width: 20%" />
							<col style="width: 8%" />
							<col style="width: 8%" />
						</colgroup>
						<thead>
							<tr>
								<th><input type="checkbox" name="chkAll"></th>
								<th scope="col">이름</th>
								<th scope="col">(if)번호</th>
								<th scope="col">직책(if)</th>
								<th scope="col">학부</th>
								<th scope="col">학과</th>
								<th scope="col">수정</th>
								<th scope="col">삭제</th>
							</tr>
						</thead>
						<tbody>
							<%-- <c:if test="${empty list }">
								<tr>
									<td colspan="8">결과가 없습니다.</td>
								</tr>
							</c:if> --%>
							<%-- <c:if test="${!empty list }">
								<!-- 반복 시작 -->
								<c:set var="idx" value="0" />
								<c:forEach var="vo" items="${list }"> --%>
									<tr class="align_center">
										<td><input type="checkbox"
											name="" value="vo.no">
										<td>우등생</td>
										<td>007</td>
										<td>일짱</td>
										<td>관현학부</td>
										<td>리코더</td>
										<td><a href="#">수정</a></td>
										<td><a href="#">삭제</a></td>
									</tr>
									<tr class="align_center">
										<td><input type="checkbox"
											name="" value="vo.no">
										<td>최교수</td>
										<td>007</td>
										<td>이짱</td>
										<td>관현학부</td>
										<td>피콜로</td>
										<td><a href="#">수정</a></td>
										<td><a href="#">삭제</a></td>
									</tr>
									<tr class="align_center">
										<td><input type="checkbox"
											name="" value="vo.no">
										<td>일개직원</td>
										<td>007</td>
										<td>삼짱</td>
										<td>관현학부</td>
										<td>손오반</td>
										<td><a href="#">수정</a></td>
										<td><a href="#">삭제</a></td>
									</tr>

							<%-- 		<c:set var="idx" value="${idx+1 }" />
								</c:forEach>
								<!-- 반복 끝 -->
							</c:if> --%>
						</tbody>
					</table>
				</div>
				<div class="divPage">
					<!-- 페이지 번호 추가 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="boardList(${pagingInfo.firstPage-1})"> <img
							src='<c:url value="/resources/images/first.JPG" />' border="0">
						</a>
					</c:if>

					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-weight: bold">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="boardList(${i})"> [${i }] </a>
						</c:if>
					</c:forEach>

					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="boardList(${pagingInfo.lastPage+1})"> <img
							src="<c:url value="/resources/images/last.JPG" />" border="0">
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>

				<div class="divRight">
					<input type="button" class="btn btn-primary btn-lg login-button" id="btMultiDel" value="선택한 회원 삭제"><br>
				</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>