<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/login.css'/>">
<style>
	#findTel{
		border: none;
		border-radius: 5px;
		background-color: #01539d;
		color: white;
		padding: 8px;
	}
	
	#findTel:hover{
		font-weight: bold;
	}
	
</style>

<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<p id="title">비밀번호 찾기</p>
			</div>
			<div class="card-body">
				<div>
					<p>담당 학과에 문의바랍니다</p>
				</div>
				<div style="text-align: right;">
					<button type="button" id="findTel">전화번호 찾기</button>
				</div>
			</div>

		</div>
	</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>