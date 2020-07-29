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
<script>
	$(function() {
		$('#forIdnt').hide();
		$('#sendInfo').hide();
	
		//아이디확인
		$('#chkIdBt').click(function() {
			if($('#stuNo').val()==''){
				alert('학번을 입력해주세요');
				$('#stuNo').focus();
				event.preventDefault();
			}else{
				$.ajax({
					url : "<c:url value='/login/chkId'/>",
					type:"post",
					data : "stuNo=" +  $('#stuNo').val(),
					success:function(res){
						alert(res);
	 					if(res){
							$('#errorId').html('본인인증을 완료해주세요');
							$("#chkId").val("Y");
							$('#forIdnt').show();
							
							
						}else{
							$('#error').html('※해당 아이디가 존재하지 않습니다');
							$("#chkId").val("N");	
						}  
					},
					error:function(xhr,status,error){
						alert(status + ", " + error);
					}
					
				});
				
			}
			
		});
		
		//본인확인
		$('#idntBt').click(function() {
			if($('#name').val() == ''){
				alert('이름을 입력해주세요');
				$('#name').focus();
				event.preventDefault();
			}else if($('#ssn1').val() == '' || $('#ssn2').val() == '' ){
				alert('주민번호를 입력해주세요');
				$('#ssn1').focus();
				event.preventDefault();
			}else if(!validate_number($('#ssn1').val()) || !validate_number($('#ssn2').val())){
				alert('주민번호는 숫자만 입력가능합니다');
				$('#ssn1').focus();
				event.preventDefault();
			}else{
				$.ajax({
					url : "<c:url value='/login/idnt'/>",
					type:"post",
					data : $('#idntF').serialize(),
					success:function(res){
						alert(res);
	 					if(res){
							$("#idnt").val("Y");
							$('#forId').hide();
							$('#forIdnt').hide();
							$('#sendInfo').show();
							$('#msg').html('본인인증성공! 가입한 이메일로 비밀번호가 전송되었습니다. 확인바랍니다.');
							
						}else{
							$('#errorIdnt').html('※본인인증 실패');
							$("#idnt").val("N");	
						}  
					},
					error:function(xhr,status,error){
						alert(status + ", " + error);
					}
					
				});
				
			}
			
		});
		
		$('#toLogin').click(function() {
			location.href="<c:url value='/login/login' />";
		});
		
		/* $('form[name=chgPwdFrm]').submit(function() {
			if($('#pwd1').val()!= $('#pwd2').val()){
				$('#errorPwd').html('※비밀번호가 일치하지 않습니다.');					
				$('#pwd1').focus();
				event.preventDefault();
			}else if($('#pwd1').val()==''){
				alert('비밀번호를 입력해주세요');
				$('#pwd1').focus();
				event.preventDefault();
			}else if($('#pwd2').val()==''){
				alert('비밀번호를 확인해주세요');
				$('#pwd2').focus();
				event.preventDefault();
				
			}
		}); */

		
	});

	//숫자만 입력가능
	function validate_number(number) {
		var pattern = new RegExp(/^[0-9]*$/);
		return pattern.test(number);
	}
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<p id="title">비밀번호 찾기(재설정)</p>
				</div>
				<div class="card-body">
					<!-- 아이디 확인 -->
						<!-- id -->
					<div id="forId">
						<form name="chkIdFrm" method="post" >
							<div class="input-group form-group">
								<label for="stuNo" class="lab">아이디</label>
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"
										style="color: white;"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="아이디를 입력하세요"
									name="stuNo" id="stuNo"> <span class="input-group-btn">
									<button class="btn btn-primary btn" type="button"
										style="background: #01539d; border: none; height: 39.5px" id="chkIdBt">아이디
										확인</button>
								</span>
							</div>
							<input type="hidden" id="chkId" >
			
							<div id="errorId" class="error" ></div>
						</form>
					</div>

					<!-- 아이디 확인 후 -->

						<!-- 본인인증 -->
						<div id="forIdnt">
							<form name="idntFrm" id="idntF">
								<div class="input-group form-group">
									<label for="name" class="lab">이름</label> <input type="text"
										class="form-control" placeholder="이름을 입력하세요" name="name" id="name">
								</div>
								<div class="input-group form-group">
									<label for="ssn" class="lab">주민번호</label> <input type="text"
										class="form-control" name="ssn1" maxlength="6" id="ssn1">- <input
										type="text" class="form-control" name="ssn2" id="ssn2" maxlength="1"
										style="width: 10px;">******
								</div>
								<div class="form-group" id="idntDiv">
									<input type="button" value="본인인증" id="idntBt">
								</div>
								<input type="hidden" id="idnt" >
								<div id="errorIdnt" class="error" ></div>
							</form>
						</div>
						<div id="sendInfo">
							<p id="msg"></p>
							<button type="button" id="toLogin">로그인페이지로 이동</button>
						</div>
						<!-- pwd -->
						<!-- <div id="forPwd">
							<form name="chgPwdFrm">
								<div class="input-group form-group">
									<label for="pwd1" class="lab">비밀번호</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="form-control"
										placeholder="영문, 숫자 조합하여 8자이상 " name="pwd1" id="pwd1"> 
								</div>
								<div class="input-group form-group">
									<label for="pwd2" class="lab">비밀번호 확인</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="form-control" name="pwd2" id="pwd2">

								</div>
									<div id="errorPwd" class="error" ></div>
								<div class="form-group" id="pwdBtDiv">
									<input type="submit" value="비밀번호 변경" id="pwdBt">
								</div>
							</form>
						</div> -->
					<!-- block -->
				</div>
			</div>
			<!-- card -->
		</div>
		<%@ include file="../inc/bottom.jsp"%>