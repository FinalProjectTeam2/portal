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
									<label for="professor" class="cols-sm-2 control-label">전화번호</label>
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
									<label for="username" class="cols-sm-2 control-label">주소</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-users fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="info1" id="info1"
												placeholder="Enter your info1" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="username" class="cols-sm-2 control-label">개인정보 처리방침</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-users fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="info1" id="info1"
												placeholder="Enter your info1" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now }" var="year" pattern="yyyy" />
						설립 연도<select name="" class="date">
							<c:forEach var="j" begin="0" end="39">
								<option value="${year-j }"
									<c:if test="${year-j==param.endNo }">
									 selected="selected"
									</c:if>>${year-j }</option>
							</c:forEach>
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