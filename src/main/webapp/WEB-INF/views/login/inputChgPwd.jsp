<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/inputChgPwd.css' />">
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<script>
	$(function() {
		
		$('#pwdFrm').submit(function () {
			  if($('#curPwd').val()==''){
				  alert('현재 비밀번호 입력하세요');
				  $('#curPwd').focus();
					return false;
			  }else if($('#newPwd').val()==''){
				  alert('새 비밀번호를 입력하세요');
				  $('#newPwd').focus();
				  return false;
			  }else if($('#pwdConfirm').val()==''){
				  alert('비밀번호를 확인해주세요');
				  $('#pwdConfirm').focus();
				  return false;
			  }else if($('#newPwd').val()!=$('#pwdConfirm').val()){
				  alert('입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다');
				  $('#newPwd').focus();
				  return false;
			  }
			
			$.ajax({
				url:"<c:url value='/login/changePwd' />",
				data : $(this).serialize(),
				type: "post",
				success:function(res){
					if(res){
						alert('비밀번호가 성공적으로 변경되었습니다');
						location.href="<c:url value='/index' />";
					}else{
						alert('비밀번호가 일치하지 않습니다');
						$('#curPwd').focus();
					}				
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
			});
			
			return false;
		});
		
		$('#nextChg').click(function () {
			location.href = "<c:url value='/index' />"
		});
		
		
	});
</script>

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
						<form name="pwdFrm" id="pwdFrm">
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
									<button type="submit" class="btn btn-dark" id="changeBt">비밀번호 변경</button>
									<button type="reset" class="btn btn-dark" >다시입력</button>
									<button type="button" class="btn btn-success" id="nextChg" style="background-color: #01539d; border: none;">다음에 변경하기</button>
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