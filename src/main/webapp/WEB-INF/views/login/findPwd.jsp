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
		$('#forPwd').hide();
	
		//아이디확인
		$('#chkIdBt').click(function() {
			$.ajax({
				url : "<c:url value='/login/chkId'/>",
				type:"post",
				data : "stuNo=" +  $('#stuNo').val(),
				success:function(res){
					alert(res);
 					if(res){
						$('#errorId').html('본인인증을 해주세요');
						$("#chkId").val("Y");
						$('#forIdnt').show();
						
					}else{
						$('#error').html('해당 아이디가 존재하지 않습니다');
						$("#chkId").val("N");	
					}  
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
				
			});
		});
		
		//본인확인
		$('#idntBt').click(function() {

			$.ajax({
				url : "<c:url value='/login/idnt'/>",
				type:"post",
				data : $('#idntF').serialize(),
				success:function(res){
					alert(res);
 					if(res){
						$('#errorIdnt').html('비밀번호를 변경해주세요');
						$("#idnt").val("Y");
						$('#forPwd').show();
						
					}else{
						$('#errorIdnt').html('해당 아이디가 존재하지 않습니다');
						$("#idnt").val("N");	
					}  
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
				
			});
		});
		
		
	});
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
			
							<div id="errorId" style="color: red; text-align: center;"></div>
						</form>
					</div>


					<!-- 아이디 확인 후 -->

						<!-- 본인인증 -->
						<div id="forIdnt">
							<form name="idntFrm" id="idntF">
								<div class="input-group form-group">
									<label for="name" class="lab">이름</label> <input type="text"
										class="form-control" placeholder="이름을 입력하세요" name="name">
								</div>
								<div class="input-group form-group">
									<label for="ssn" class="lab">주민번호</label> <input type="text"
										class="form-control" name="ssn1" maxlength="6">- <input
										type="text" class="form-control" name="ssn2" maxlength="1"
										style="width: 10px;">******
								</div>
								<div class="form-group" id="idntDiv">
									<input type="button" value="본인인증" id="idntBt">
								</div>
								<input type="hidden" id="idnt" >
								<div id="errorIdnt" style="color: red; text-align: center;"></div>
							</form>
						</div>

						<!-- pwd -->
						<div id="forPwd">
							<form name="chgPwdFrm">
								<div class="input-group form-group">
									<label for="pwd" class="lab">비밀번호</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="form-control"
										placeholder="영문, 숫자 조합하여 8자이상 " name="pwd"> 
								</div>
								<div class="input-group form-group">
									<label for="pwd" class="lab">비밀번호 확인</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="form-control" name="pwd">

								</div>
								<div class="form-group" id="pwdBtDiv">
									<input type="submit" value="비밀번호 변경" id="pwdBt">
								</div>
								
							</form>
						</div>
					<!-- block -->
				</div>
			</div>
			<!-- card -->
		</div>
		<%@ include file="../inc/bottom.jsp"%>