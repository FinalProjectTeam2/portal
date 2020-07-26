<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminRegisterMember.css' />" rel="stylesheet">
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
							<form class="form-horizontal" method="post" action="<c:url value='/admin/adminRegisterEmployee'/>">
								<div class="form-group">
									<div>
										<label for="sort">회원 구분</label> <select name="sort">
											<option disabled selected>선택</option>
											<option value="3">학생</option>
											<option value="2">교수</option>
											<option value="1">임직원</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="empName" class="cols-sm-2 control-label">이름</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="empName" id="empName"
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
												type="text" class="form-control" name="ssn" id="ssn" placeholder="-는 빼고 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="hp2" class="cols-sm-2 control-label">전화번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope fa" aria-hidden="true"></i></span> 
												<input type="text" class="form-control" name="hp1" id="hp1" value="010"/>
												<input type="text" class="form-control" name="hp2" id="hp2" />
												<input type="text" class="form-control" name="hp3" id="hp3" />
										</div>
									</div>
								</div>				
								<hr id="selLine">
								<div class="form-group">
									<div>
										<label for="depCode">부서</label> <select name="depCode">
											<option disabled selected>선택</option>
											<option value="1">교학처</option>
											<option value="2">기획처</option>
											<option value="3">학생처</option>
											<option value="4">입학홍보처</option>
											<option value="5">사무처</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div>
										<label for="authCode">권한</label> <select name="authCode">
											<option disabled selected>선택</option>
											<option value="1">admin</option>
											<option value="2">manager</option>
											<option value="3">staff</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div>
										<label for="positionCode">직책</label> <select name="positionCode">
											<option disabled selected>선택</option>
											<option value="1">부장</option>
											<option value="2">주임</option>
											<option value="3">사원</option>
										</select>
									</div>
								</div>
								 <!-- <div class="form-group">
									<label for="" class="cols-sm-2 control-label"></label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="" id=""
												placeholder="-는 빼고 입력하세요" />
										</div>
									</div>
								</div> -->
								
								<div class="form-group ">
								<input type="submit"
										class="btn btn-primary btn-lg btn-block login-button"
										id="btRegi">
								</div>
								<div class="login-register"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../inc/bottom.jsp"%>