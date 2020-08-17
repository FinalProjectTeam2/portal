<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<style>
#searchSelect {
	margin: 0 5px 0 3px;
}

.divRight select {
	width: 180px;
}

.box2 td {
	border: solid 1px;
}

.colNone {
	border-left: none !important;
	border-right: none !important;
}

#btEdit {
	width: 50px;
	height: 31px;
	font-size: 1em;
	padding: 0;
	margin: -6px -16px 0 0;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#faculty')
				.change(
						function() {
							$('#department').find('option').each(function() {
								$(this).remove();
							});

							var faculty = $(this).val();
							if (faculty != "") {
								$('#department').append(
										"<option value=''>선택</option>");

								$
										.ajax({
											type : 'get',
											url : "/portal/common/departmentList",
											data : "facultyNo="
													+ $('#faculty').val(),
											dataType : "json",
											success : function(res) {
												$(res)
														.each(
																function(i) {
																	$(
																			'#department')
																			.append(
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
		$('#btSearch')
				.click(
						function() {
							if ($('select[name=major]').val() == 0) {
								alert("학과를 선택해 주세요");
								event.preventDefault();
							} else {

								location.href = "/portal/admin/member/adminFacultySelectStudent?facultyNo="
										+ $('#faculty').val()
										+ "&major="
										+ $('#department').val();
							}
						});
		$('#btEdit').click(
				function() {
					var facultyNo = $("#faculty").val();
					if (facultyNo.length == 0) {
						alert('학부를 선택해 주세요');
						return false;
					}
					var department = $("#department").val();
					if (department.length == 0) {
						alert('학과를 선택해 주세요');
						return false;
					}
					var win = window.open(
							"/portal/admin/faculty/adminEditFaculty?facultyNo="
									+ $('#faculty').val() + "&depNo="
									+ $('#department').val(), "학과정보 수정",
							"top=250,left=500,width=500,height=650");
					return false;
				});
		
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<h2>학부 관리</h2>
			<input type="button" class="btTop btCustom btn btn-primary" id="bt1"
				value="학부생성"
				onclick="window.open('/portal/admin/faculty/adminCreateFaculty','학부생성','top=250,left=500,width=500,height=255');return false;">
			<input type="button" class="btTop btCustom btn btn-primary" id="bt2"
				onclick="window.open('/portal/admin/faculty/adminCreateDep','학과생성','top=250,left=500,width=500,height=650');return false;"
				value="학과생성">
			<form name="frmList" method="post" action="<c:url value='/admin'/>">
				<div class="divRight">
					<label for="faculty">학부</label> <select name="facultyNo"
						id="faculty">
						<option value="">선택</option>
						<c:forEach var="facVo" items="${facultyList }">
							<option value="${facVo.facultyNo }">${facVo.facultyName }</option>
						</c:forEach>
					</select> <label for="depNo">학과</label> <select name="major" id="department">
						<option value="">학부를 선택하세요</option>
					</select>
					<button type="button"
						class="btCustom btn btn-primary btn-lg login-button" id="btEdit">수정</button>
					<button type="button"
						class="btCustom btn btn-primary btn-lg login-button" id="btSearch">조회</button>
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
									<th scope="col">학생조회</th>
								</tr>
							</thead>
							<tbody>
								<tr class="align_center">
									<td rowspan="${flist[0]['DEP_COUNT'] }" class="colNone">${flist[0]['FACULTY_NAME'] }<br>
										(<a
										href="/portal/admin/faculty/adminEditFacultyName?facultyNo=${flist[0]['FACULTY_NO']}"
										onclick="window.open(this.href,'학부정보 수정','top=250,left=500,width=500,height=255');return false;">수정</a>)
									</td>
									<td style="border-left: 1px solid #e5e5e5">${flist[0]['DEP_NAME'] }</td>
									<td>${flist[0]['TEL'] }</td>
									<td>${flist[0]['BUILDING_NAME'] }</td>
									<td><a
										href="/portal/admin/faculty/adminEditFaculty?facultyNo=${flist[0]['FACULTY_NO']}&depNo=${flist[0]['DEP_NO']}"
										onclick="window.open(this.href,'학과정보 수정','top=250,left=500,width=500,height=650');return false;">수정</a></td>
									<td class="colNone"><a
										href="/portal/admin/member/adminFacultySelectStudent?facultyNo=${flist[0]['FACULTY_NO']}&major=${flist[0]['DEP_NO']}">조회</a></td>
								</tr>
								<c:forEach var="i" begin="1" end="${fn:length(flist)-1}"
									step="1">
									<tr class="align_center">
										<c:if
											test="${flist[i]['FACULTY_NO']!=flist[i-1]['FACULTY_NO']}">
											<td rowspan="${flist[i]['DEP_COUNT'] }" class="colNone">${flist[i]['FACULTY_NAME'] }
												<br> (<a
												href="/portal/admin/faculty/adminEditFacultyName?facultyNo=${flist[i]['FACULTY_NO']}"
												onclick="window.open(this.href,'학부정보 수정','top=250,left=500,width=500,height=255');return false;">수정</a>)
											</td>
										</c:if>
										<td style="border-left: 1px solid #e5e5e5">${flist[i]['DEP_NAME'] }</td>
										<td>${flist[i]['TEL'] }</td>
										<td>${flist[i]['BUILDING_NAME'] }</td>
										<td><a
											href="/portal/admin/faculty/adminEditFaculty?facultyNo=${flist[i]['FACULTY_NO']}&depNo=${flist[i]['DEP_NO']}"
											onclick="window.open(this.href,'학과정보 수정','top=250,left=500,width=500,height=650');return false;">수정</a></td>
										<td class="colNone"><a
											href="/portal/admin/member/adminFacultySelectStudent?facultyNo=${flist[i]['FACULTY_NO']}&major=${flist[i]['DEP_NO']}">조회</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>