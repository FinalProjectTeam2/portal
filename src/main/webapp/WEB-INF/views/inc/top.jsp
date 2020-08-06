<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html>
<html class="h-100">
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- date formating -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<title>척척학사</title>

<link href="<c:url value='/resources/css/offcanvas.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/layout.css' />"
	rel="stylesheet">
<link rel="shortcut icon"
	href="<c:url value='/resources/images/logoIcon.ico' />">
<!-- ckeditor 사용하기 위함 -->
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>

<style type="text/css">
.logo {
	height: 35px;
}

.zeta-menu {
	margin: 0;
	padding: 0;
	position: absolute;
}

.zeta-menu li {
	float: left;
	list-style: none;
	position: relative;
	width: 120px;
	text-align: center;
}

.zeta-menu a {
	color: white;
	display: block;
	padding: 10px 10px;
	text-decoration: none;
	font-size: 0.9em;
}

.zeta-menu ul {
	background: #f5f5f5;
	padding: 0;
	position: absolute;
	left: 0;
	width: 120px;
	border-radius: 0 0 10px 10px;
}

.zeta-menu ul li {
	float: none;
	font-size: 0.8em;
}

.zeta-menu ul li:hover {
	background: #28a74594;
}

.zeta-menu ul li:last-of-type:hover {
	background: #28a74594;
	border-radius: 0 0 10px 10px;
}

.zeta-menu ul li:hover a {
	color: white;
}

.zeta-menu ul a {
	color: black;
}

.zeta-menu ul ul {
	left: 100%;
	top: 0;
}

.zeta-menu ul ul li {
	float: left;
	margin-right: 10px;
}
</style>
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
		//$\{sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.(vo에해당하는 멤버변수명)}
		/* if('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.type}' == 'STUDENT'){
		 console.log('${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.officialNo}');
		 } */
	</script>
</sec:authorize>
<script type="text/javascript">
	$
			.ajaxSetup({
				error : function(jqXHR, exception) {
					if (jqXHR.status === 0) {
						alert('Not connect.\n Verify Network.');
					} else if (jqXHR.status == 400) {
						alert('Server understood the request, but request content was invalid. [400]');
					} else if (jqXHR.status == 401) {
						alert('Unauthorized access. [401]');
					} else if (jqXHR.status == 403) {
						alert('Forbidden resource can not be accessed. [403]');
					} else if (jqXHR.status == 404) {
						alert('Requested page not found. [404]');
					} else if (jqXHR.status == 500) {
						alert('Internal server error. [500]');
					} else if (jqXHR.status == 503) {
						alert('Service unavailable. [503]');
					} else if (exception === 'parsererror') {
						alert('Requested JSON parse failed. [Failed]');
					} else if (exception === 'timeout') {
						alert('Time out error. [Timeout]');
					} else if (exception === 'abort') {
						alert('Ajax request aborted. [Aborted]');
					} else {
						alert('Uncaught Error.n' + jqXHR.responseText);
					}
				}
			});
	function clock() {
		var date = new Date();

		// date Object를 받아오고
		var month = date.getMonth();

		// 달을 받아옵니다
		var clockDate = date.getDate();

		// 몇일인지 받아옵니다
		var day = date.getDay();

		// 요일을 받아옵니다.
		var week = [ '일', '월', '화', '수', '목', '금', '토' ];

		// 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다.
		var hours = date.getHours();

		// 시간을 받아오고
		var minutes = date.getMinutes();

		// 분도 받아옵니다.
		var seconds = date.getSeconds();

		// 초까지 받아온후
		var timer = (month + 1) + '월 ' + clockDate + '일 ' + week[day] + '요일 '
				+ (hours < 10 ? '0' + hours : hours) + ':'
				+ (minutes < 10 ? '0' + minutes : minutes) + ':'
				+ (seconds < 10 ? '0' + seconds : seconds);

		// 월은 0부터 1월이기때문에 +1일을 해주고

		// 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 했습니다.
		$("#timer").html(timer)
	}
	$(function() {
		clock();
		setInterval(clock, 1000);

		$('.zeta-menu li ul').hide();

		$(".zeta-menu > li").click(function() {
			$(".zeta-menu li").not($(this)).find("ul").slideUp();
			$('ul:first', this).slideToggle();
		});

		$(".zeta-menu>li:has(ul)>a").each(function() {
			$(this).html($(this).html() + ' &or;');
		});

		$(".zeta-menu ul li:has(ul)").find("a:first").append(
				"<p style='float:right;margin:-3px'>&#9656;</p>");

		$(document).click(function(e) {
			if (e.target.className == "zeta-menu") {
				return false
			} else if (e.target.className == "nav-link") {
				return false
			}
			$(".zeta-menu li ul").slideUp();
		});

		$("#btLogin").click(function() {
			location.href = "<c:url value='/login' />";
		});
	});
</script>
<meta name="theme-color" content="#563d7c">
</head>
<body class="d-flex flex-column h-100">
	<!-- top 시작 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="<c:url value='/index'/>"
				style="border-right: 1px solid white; padding: 0 20px 0 0;"> <img
				class="logo" alt="로고"
				src="<c:url value='/resources/images/logo.png' />">
			</a>
			<div class="collapse navbar-collapse" id="navbarCollapse"
				style="max-width: 1400px;">

				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" style="color: white;">PORTAL  <span class="sr-only">(current)</span>
					</li>
				</ul>
				<sec:authorize access="isAuthenticated()">
					<span style="color: white; margin-right: 10px;">
						<sec:authentication property="principal.name" />님
					</span>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<button class="btn btn-outline-success my-2 my-sm-0" type="button"
						id="btLogin">로그인</button>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form action="<c:url value='/logout'/>" method="POST">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
							id="logoutBtn">로그아웃</button>
					</form>
				</sec:authorize>
				<select class="custom-select"
					style="margin: 0 0 0 15px; font-size: 0.7em; width: 100px;">
					<option>한국어</option>
					<option>영어</option>
				</select>
			</div>
		</nav>
		<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline" style="font-size: 1em;">
				<ul class="zeta-menu">
					<li><a class="nav-link" href="#">포털</a>
						<ul>
							<li><a
								href="<c:url value='/portal/board/main?categoryCode=B'/>">게시판</a></li>
							<li><a
								href="<c:url value='/portal/board/main?categoryCode=N'/>">공지</a></li>
							<li><a
								href="<c:url value='/portal/board/main?categoryCode=P'/>">자료실</a></li>
							<li><a
								href="<c:url value='/board_calender/calendarDetail'/>">서비스</a></li>
						</ul></li>
					<sec:authorize access="isAuthenticated()">
					<c:if test="${principal.type=='STUDENT' }">
					<li><a class="nav-link" href="#"> 학사서비스 </a>
						<ul>
							<li><a href="#">학사정보</a></li>
							<li><a href="<c:url value='/registration/main'/>">수강신청</a></li>
						</ul></li>
					</c:if>
					<c:if test="${principal.type=='PROFESSOR' }">
					<li><a class="nav-link" href="#"> 강의 관리 </a>
						<ul>
							<li><a href="<c:url value='/lecture/openLecture'/>">시간표 관리</a></li>
							<li><a href="#">강의 개설 신청</a></li>
							<li><a href="<c:url value='/lecture/professorView'/>">성적입력</a></li>
							
						</ul></li>
					</c:if>
					</sec:authorize>

					<li><a class="nav-link" href="#">웹메일</a></li>
					<li><a class="nav-link" href="#"> 쪽지함 <span
							class="badge badge-pill bg-light align-text-bottom">27</span>
					</a></li>
				</ul>
				<span id="timer"
					style="color: black; font-size: 0.8em; margin: 15px 25px;
					width: 100%; text-align: right;"></span>
			</nav>
		</div>
	</header>
	<!-- top 끝 -->
	<div class="container-fluid">
		<div class="row">
