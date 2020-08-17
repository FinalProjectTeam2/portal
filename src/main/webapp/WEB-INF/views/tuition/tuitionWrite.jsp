<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminRegisterMember.css' />" rel="stylesheet">
<style>
#excelRegi {
	float: right;
	width: 15%;
}
</style>
<div class="container">
	<div id="regiMember">
		<div class="container">
			<div class="row main">
				<div id="sel">
					<div id="header">
						<h3>등록금 등록</h3>
					</div>
					
					<div class="main-login main-center">
						<div class="container">
							<!--  -->
							<div class="col">
								<form class="form-horizontal" method="post" id="form">
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">이름</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="ssn" class="cols-sm-2 control-label">입학금</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="ssn" id="SSN" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">등록금</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">실습비</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">학생회비</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">장학금</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">감면액</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="name" class="cols-sm-2 control-label">납부여부</label>
											<div class="cols-sm-10">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="fa fa-user fa" aria-hidden="true"></i>
													</span> 
													<input type="text" class="form-control" name="name" id="name" placeholder="금액을 입력하세요" />
												</div>
											</div>
										</div>
										
										<!--공통입력 항목 구분선  -->
										<hr id="selLine">
										<div class="hid emp form-group">
											<div>
												<label for="depCode">부서</label> <select name="depCode"
													id="depCode">
													<option value="">선택</option>
													<c:forEach var="vo" items="${empDepartList }">
														<option value="${vo.depCode }">${vo.depName }</option>
													</c:forEach>

												</select>
											</div>
										</div>
										<div class="hid emp form-group">
											<div>
												<label for="authCode">권한</label> <select name="authCode"
													id="authCode">
													<option value="">선택</option>
													<c:forEach var="vo" items="${authorityList }">
														<option value="${vo.authCode }">${vo.authName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="hid emp form-group">
											<div>
												<label for="positionCode">직책</label> <select
													name="positionCode" id="positionCode">
													<option value="">선택</option>
													<c:forEach var="vo" items="${empPositionList }">
														<option value="${vo.positionCode }">${vo.positionName}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="stud faculty form-group">
											<div>
												<label for="faculty">학부</label> <select name="facultyNo"
													id="faculty">
													<option value="">선택</option>
													<c:forEach var="facVo" items="${facultyList }">
														<option value="${facVo.facultyNo }">${facVo.facultyName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="stud department form-group">
											<div>
												<label for="depNo">학과</label> <select name="depNo"
													id="department">
													<option value="">선택</option>
												</select>
											</div>
										</div>
										<div class="hid prof department form-group">
											<div>
												<label for="positionNo">교수직급</label> <select
													name="positionNo">
													<option value="">선택</option>
													<c:forEach var="positionVo" items="${profPositionList }">
														<option value="${positionVo.positionNo }">${positionVo.positionName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group ">
											<button type="submit" class="btn btn-primary btn-lg btn-block login-button" id="btRegi">등록</button>
										</div>
										<div class="login-register"></div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<%@ include file="../inc/bottom.jsp"%>