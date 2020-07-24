<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/inputChgPwd.css' />">
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<div id="inputChgPwd">
			<div class="card">
				<!-- 1 -->
				<div class="row">
					<div class="col">
						<p id="title">비밀번호 변경</p>
					</div>
				</div>
				<!-- 2 -->
				<div class="row">
					<div class="col" id="pwdDiv">
						<form action="">
							<div class="form-group">
								<label for="curPwd">현재 비밀번호</label>
								<input type="password" name="curPwd" id="curPwd"  class="form-control">
								<hr>
								<label for="newPwd">새 비밀번호</label>
								<input type="password" name="newPwd" id="newPwd"  class="form-control">
								<br>
								<label for="pwdConfirm">새 비밀번호 확인</label>
								<input type="password" name="pwdConfirm" id="pwdConfirm"  class="form-control">
								<hr>
								
								<div id="bt">
									<button type="button" class="btn btn-dark">비밀번호 변경</button>
									<button type="button" class="btn btn-dark">다시입력</button>
									<button type="button" class="btn btn-success" style="background-color: #01539d; border: none;">다음에 변경하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- 3 -->
				<div class="row">
					<div class="col">
						<ul id="warn">
							<li>* 영문 대소문자는 구분이 되며, 한가지 문자로만 입력은 불가능 합니다.</li>
							<li>* 사용가능한 특수문자 : !, #, $, %, ^, &, +, ( ), -, *, / </li>
							<li>* 개인정보를 담은 비밀번호는 사용하지 않는 것이 안전합니다.</li>
							<li>* 영문 대소문자는 구분되이 되며, 한가지 문자로만 입력은 불가능 합니다.</li>
							<li>* 비밀번호는 주기적으로 바꾸어 사용하는 것이 안전합니다.</li>
						
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!-- 내용 입력 끝 -->
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>