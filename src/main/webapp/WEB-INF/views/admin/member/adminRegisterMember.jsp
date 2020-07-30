<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link
	href="<c:url value='/resources/css/admin/adminRegisterMember.css' />"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/admin/adminRegisterMember.js'/>"></script>

<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="regiMember">
			<div class="container">
				<div class="row main">
					<div id="sel">
						<div id="header">
							<h3>회원 등록</h3>
						</div>
						<div class="main-login main-center">
							<!--  -->
							<form class="form-horizontal" method="post" id="form">
								<div class="form-group">
									<div>
										<label for="sort">회원 구분</label> <select name="sort" id="sort">
											<option value="3">학생</option>
											<option value="2">교수</option>
											<option value="1">임직원</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">이름</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="name" id="name"
												placeholder="이름을 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="ssn" class="cols-sm-2 control-label">주민번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="ssn" id="SSN"
												placeholder="-는 빼고 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="hp2" class="cols-sm-2 control-label">전화번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="hp1" id="hp1"
												value="010" /> <input type="text" class="form-control"
												name="hp2" id="hp2" /> <input type="text"
												class="form-control" name="hp3" id="hp3" />
										</div>
									</div>
								</div>
								<div class="form-group">


									<label for="email1" class="cols-sm-2 control-label">이메일</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<input type="text" class="form-control" name="email1"
												id="email1" />@ <select name="email2" id="email2">
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="etc">직접입력</option>
											</select> <input type="text" class="form-control" name="email3"
												id="email3" style="visibility: hidden;" />
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
										<label for="positionNo">교수직급</label> <select name="positionNo">
											<option value="">선택</option>
											<c:forEach var="positionVo" items="${profPositionList }">
												<option value="${positionVo.positionNo }">${positionVo.positionName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-primary btn-lg btn-block login-button"
										id="btRegi">등록</button>
								</div>
								<div class="login-register"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>