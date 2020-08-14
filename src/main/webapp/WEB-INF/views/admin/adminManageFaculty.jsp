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
.box2 td{
	border: solid 1px;
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
									<th scope="col" style="border-left: solid 1px #e5e5e5">학부</th>
									<th scope="col">학과</th>
									<th scope="col">전화번호</th>
									<th scope="col">건물</th>
									<th scope="col">수정</th>
									<th scope="col" style="border-right: solid 1px #e5e5e5">학생조회</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="i" begin="0" end="${fn:length(flist)-1}" step="1">
								<tr class="align_center">
								<c:if test="${i ==0 }">
									<td rowspan="${flist[i]['DEP_COUNT'] }">${flist[i]['FACULTY_NAME'] }</td>
								</c:if>
								<c:if test="${i!=0 && (flist[i]['FACULTY_NO']!=flist[i-1]['FACULTY_NO'])}">
									<td rowspan="${flist[i]['DEP_COUNT'] }">${flist[i]['FACULTY_NAME'] }</td>
								</c:if>
									<td style="border-left: 1px solid #e5e5e5">${flist[i]['DEP_NAME'] }</td>
									<td>${flist[i]['TEL'] }</td>
									<td>${flist[i]['BUILDING_NAME'] }</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">조회</a></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>