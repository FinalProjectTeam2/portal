<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminRegisterMember.css' />"
	rel="stylesheet">
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="regiMember">
			<div class="container">
				<div class="row main">
					<div id="sel">
						<div id="header">
							<h3>홈페이지 정보 관리</h3>
						</div>
						<div class="main-login main-center">
							<form class="form-horizontal" method="post" action="#">
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">회사명</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="subject" id="subject" />
										</div>
									</div>
								</div>
								<div class="form-group">
								<div class="cols-sm-10">
									학부 <select name="" style="margin-left: 5px">
										<option disabled selected>&nbsp;--</option>
										<option value="">공대</option>
										<option value="">미대</option>
									</select>&nbsp;&nbsp;&nbsp; 학과 <select name="" style="margin-left: 5px">
										<option disabled selected>&nbsp;--</option>
										<option value="">경제</option>
										<option value="">컴공</option>
									</select>
								</div>
								</div>
								<div class="form-group">
									<label for="professor" class="cols-sm-2 control-label">교수명</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="professor"
												id="professor" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="upfile" class="cols-sm-2 control-label"><br>강의계획서</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="file" name="upfile" id="upfile"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="classroom" class="cols-sm-2 control-label">강의실</label>
									<button type="button"
										class="btn btn-primary btn-lg btn-block login-button"
										id="btClassroom">강의실 조회</button>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="classroom" value="진리관, 504호"
												id="classroom" disabled/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="time" class="cols-sm-2 control-label">강의 시간</label>
									<button type="button"
										class="btn btn-primary btn-lg btn-block login-button"
										id="btClassroom">강의시간 조회</button>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="time" value="화요일 C,D교시"
												id="time" disabled/>
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