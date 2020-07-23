<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminRegisterMem.css' />" rel="stylesheet">
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
							<form class="form-horizontal" method="post" action="#">
								<div class="form-group">
									<div>
										<label for="sort">회원 구분</label> <select name="sort">
											<option disabled selected>선택</option>
											<option value="student">학생</option>
											<option value="professor">교수</option>
											<option value="staff">임직원</option>
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
									<label for="password" class="cols-sm-2 control-label">비밀번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
												type="password" class="form-control" name="password"
												id="password" placeholder="비밀번호를 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="confirm" class="cols-sm-2 control-label">비밀번호
										확인 </label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
												type="password" class="form-control" name="confirm"
												id="confirm" placeholder="비밀번호 확인" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="email" class="cols-sm-2 control-label">전화번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="tel" id="tel"
												placeholder="-는 빼고 입력해주세요" />
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="username" class="cols-sm-2 control-label">info1</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-users fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="info1" id="info1"
												placeholder="Enter your info1" />
										</div>
									</div>
								</div>
								<div class="form-group ">
									<button type="button"
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
		<%@ include file="../inc/bottom.jsp"%>