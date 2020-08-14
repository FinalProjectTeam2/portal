<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<style>
#searchSelect {
	margin: 0 5px 0 3px;
}
.divRight select {
	width: 180px;
}
</style>
<script type="text/javascript">
$(function(){
$('#faculty').change(
		function() {
			$('#department').find('option').each(function() {
				$(this).remove();
			});

			var faculty = $(this).val();
			if (faculty != "") {
				$('#department').append("<option value=''>선택</option>");

				$.ajax({
					type : 'get',
					url : "/portal/common/departmentList",
					data : "facultyNo=" + $('#faculty').val(),
					dataType : "json",
					success : function(res) {
						$(res).each(
								function(i) {
									$('#department').append(
											"<option value=\""
													+ res[i].depNo + "\">"
													+ res[i].depName
													+ "</option>");
								});
					},
					error : function(xhr) {
						console.log(xhr.responseTest);
						alert("오류");
						return;
					}

				})
			} else {
				$('#department').append(
						"<option value=''>학부를 선택하세요</option>");
			}
		});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="adminMngMem">
			<h2>학부 관리</h2>
			<form name="frmList" method="post" action="<c:url value='/admin'/>">
				<div class="divRight">
					<label for="faculty">학부</label> <select name="facultyNo"
						id="faculty">
						<option value="">선택</option>
						<c:forEach var="facVo" items="${facultyList }">
							<option value="${facVo.facultyNo }">${facVo.facultyName }</option>
						</c:forEach>
					</select> <label for="depNo">학과</label> <select name="depNo" id="department">
						<option value="">학부를 선택하세요</option>
					</select>
					<button class="btCustom btn btn-primary btn-lg login-button"
						id="btSearch">수정</button>
					<div class="divList">
						<table class="box2" summary="학과 목록">
							<caption>학과 목록</caption>
							<colgroup>
								<col style="width: 25%" />
								<col style="width: 25%" />
								<col style="width: 20%" />
								<col style="width: 10%" />
								<col style="width: 10%" />
								<col style="width: 10%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">학부</th>
									<th scope="col">학과</th>
									<th scope="col">전화번호</th>
									<th scope="col">건물</th>
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
									<td>손쉬운 프론트엔드 디자인</td>
									<td>양명숙</td>
									<td>컴퓨터 공학부</td>
									<td>게임학과</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">삭제</a></td>
								</tr>
								<tr class="align_center">
									<td>어려운 프론트엔드 디자인</td>
									<td>양명숙</td>
									<td>컴퓨터 공학부</td>
									<td>폰게임학과</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">삭제</a></td>
								</tr>
								<tr class="align_center">
									<td>적당한 프론트엔드 디자인</td>
									<td>양명숙</td>
									<td>컴퓨터 공학부</td>
									<td>보드게임학과</td>
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

					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							id="btMultiDel" value="강의 추가"><br>
					</div>
					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							id="btMultiDel" value="선택한 강의 삭제"><br>
					</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>