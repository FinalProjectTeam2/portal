<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<style>

	#adminLogin{
		border: 1px solid #ccc;
		width: 60%;
		margin: 0 auto;
		background: #00000013;
	}
	
	#adminLogin legend{
		font-size: 20px;
		width: 23%;
		text-align: center;
	}
	#adminLogin form{
		margin: 0 auto;
		text-align: center;
	}
	
	#adminLogin label{
		width: 20%;
		float: left;
	}
	
	#adminLogin input[type=text], input[type=password] {
		width: 70%;
	}
	

</style>

<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
<div class="container">
	<fieldset id="adminLogin">
		<legend>관리자 로그인</legend>
		<form>
			<div style="margin-top: 1%;">
				<label for="id">아이디</label>
				<input type="text" name="id">
			</div>
			<br>
			<div>
				<label for="pwd">비밀번호</label>
				<input type="password" name="pwd">
			</div>
			<br>
			<div style="margin-bottom: 0.3%;">
				<input type="submit" value="관리자 로그인" id="subBt">
			</div>
			<br>
		</form>
	</fieldset>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>