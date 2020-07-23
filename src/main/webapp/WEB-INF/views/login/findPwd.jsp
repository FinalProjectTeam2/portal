<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/findPwd.css'/>">

<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<p id="title">비밀번호 찾기(재설정)</p>
					</div>
					<div class="card-body">
						<form name="finPwdfrm" method="post" action="<c:url value='/login/findPwd'/>">
							<!-- id -->
							<div id="forId">
								<div class="input-group form-group">
									<label for="stuNo" class="lab">아이디</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user" style="color: white;"></i></span>
									</div>
									<input type="text" class="form-control" placeholder="아이디를 입력하세요"
										name="stuNo"> <span class="input-group-btn">
										<button class="btn btn-primary btn"
											style="background: #01539d; border: none; height: 39.5px">아이디 확인</button>
									</span>
								</div>
								<div class="error">
									<span style="color: #c34242">아이디를 입력하여 주세요</span>
								</div>
							</div>
							<!-- pwd -->
							<div id="block">
								<div id="forPwd">
									<div class="input-group form-group">
										<label for="pwd" class="lab">비밀번호</label>
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key" style="color: white;"></i></span>
										</div>
										<input type="password" class="form-control" placeholder="영문, 숫자 조합하여 8자이상 "
											name="pwd"> <span class="input-group-text"
											id="keyboard"><a href="#"><i class="fas fa-keyboard"
												style="color: gray;"></i></a></span>
									</div>
									<div class="input-group form-group">
										<label for="pwd" class="lab">비밀번호 확인</label>
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fas fa-key" style="color: white;"></i></span>
										</div>
										<input type="password" class="form-control"
											name="pwd"> <span class="input-group-text"
											id="keyboard"><a href="#"><i class="fas fa-keyboard"
												style="color: gray;"></i></a></span>
									</div>
									</div>
									<div class="form-group" id="pwdBtDiv">
										<input type="submit" value="비밀번호 변경"
											id="pwdBt">
									</div>
								</div>
						</form>
					</div>
					
				</div>
				<!-- card -->
			</div>
	