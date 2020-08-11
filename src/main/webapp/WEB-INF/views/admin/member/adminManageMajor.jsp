<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link
	href="<c:url value='/resources/css/admin/adminRegisterMember.css' />"
	rel="stylesheet">
<style>
#regiMember .login-button {
	width: 120px;
}

#regiMember .form-group {
	margin: 20px 0px 20px 0px;
}

h5 {
	margin-bottom: 40px;
}

.btDiv {
	display: flex;
	width: 300px;
	margin: auto;
}
#regiMember .main-center {
    padding: 100px 130px;
}
.topMargin{
	margin-top: 50px !important;
}
.h5color{
	color: #01539d;
	font-weight: bold;
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
		$('#faculty2').change(
				function() {
					$('#department2').find('option').each(function() {
						$(this).remove();
					});

					var faculty = $(this).val();
					if (faculty != "") {
						$('#department2')
								.append("<option value=''>선택</option>");

						$.ajax({
							type : 'get',
							url : "/portal/common/departmentList",
							data : "facultyNo=" + $('#faculty2').val(),
							dataType : "json",
							success : function(res) {
								$(res).each(
										function(i) {
											$('#department2').append(
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
						$('#department2').append(
								"<option value=''>학부를 선택하세요</option>");
					}
				});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="regiMember">
			<div class="container">
				<div class="row main">
					<div id="sel">
						<div id="header">
							<h3>학생 전공 관리</h3>
						</div>
						<div class="main-login main-center">
							<!--  -->
							<h5>
								<span style="font-weight: bolder">${map['NAME'] }</span> 학생의 전공
							</h5>
							전공 : <span>${map['FACULTY_NAME']} ${map['DEP_NAME']}</span><br>
							<br> 부전공 :
							<c:if test="${empty map['minor_dep_name'] }">
								<span>부전공이 없습니다.</span>
							</c:if>
							<c:if test="${!empty map['minor_dep_name']}">
								<span>${map['minor_faculty_name']}
									${map['minor_dep_name']}</span>
							</c:if>
							<form class="form-horizontal" method="post" id="form">
								<!--공통입력 항목 구분선  -->
								<hr class="selLine">
								<div class="stud faculty form-group">
									<h5 class="h5color">전공 변경</h5>
									<div>
										<label for="faculty">학부</label> <select name="facultyNo"
											id="faculty">
											<option value="0">선택</option>
											<c:forEach var="facVo" items="${facultyList}">
												<option value="${facVo.facultyNo}"
													<c:if test="${map['FACULTY_NO']==facVo.facultyNo}">
												 selected="selected"
												</c:if>>${facVo.facultyName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="stud department form-group">
									<div>
										<label for="depNo">학과</label> <select name="depNo"
											id="department">
											<c:if test="${!empty map['FACULTY_NO'] }">
												<option value="0">선택</option>
												<c:forEach var="vo" items="${departmentList }">
													<option value="${vo.depNo}"
														<c:if test="${map['DEP_NO']==vo.depNo}">
											 selected="selected"</c:if>>${vo.depName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								<hr class="selLine">
								<div class="stud faculty form-group">
									<h5 class="h5color">부전공 변경</h5>
									<div>
										<label for="faculty2">학부</label> <select name="facultyNo2"
											id="faculty2">
											<option value="0">선택</option>
											<c:forEach var="facVo" items="${facultyList}">
												<option value="${facVo.facultyNo}"
													<c:if test="${map['minor_faculty_no']==facVo.facultyNo}">
												 selected="selected"
												</c:if>>${facVo.facultyName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="stud department form-group">
									<div>
										<label for="depNo2">학과</label> <select name="depNo2"
											id="department2">
											<c:if test="${!empty map['minor_faculty_no'] }">
												<option value="0">선택</option>
												<c:forEach var="vo" items="${departmentList2 }">
													<option value="${vo.depNo}"
														<c:if test="${map['minor_dep_no']==vo.depNo}">
											 selected="selected"</c:if>>${vo.depName }</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
								</div>
								<div class="topMargin form-group ">
									<div class="btDiv">
										<button type="submit"
											class="btn btn-primary btn-lg btn-block login-button"
											id="btRegi">저장하기</button>
										<button class="btn btn-primary btn-lg btn-block login-button"
											id="btRegi">취소</button>
									</div>

								</div>
								<div class="login-register"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>