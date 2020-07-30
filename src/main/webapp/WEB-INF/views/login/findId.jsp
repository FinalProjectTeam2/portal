<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/findId.css'/>">


<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<p id="title"><img  id="shoutImg" src="<c:url value='/resources/images/shout.png'/>">  알림</p>
			</div>
			<div class="card-body">
				<div id="text">
					<p>직번이나 학번이 기억나지 않으신 분은
				    HelpDesk(820-0067~8)로 문의하시기 바랍니다.
				    평일(09:00~17:00)</p>
				</div>

			</div>

		</div>
	</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>