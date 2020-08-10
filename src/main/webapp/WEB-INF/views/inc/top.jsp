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

<!-- sockJs -->


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
.toast {
    top: 60px;
    position: fixed;
    left: 1200px;
    width: 260px;
    text-align: center;
}
.toast-body {
    background: #343a40;
    color: white;
}
</style>
<script type="text/javascript">
	$.ajaxSetup({
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
		var month = date.getMonth();
		var clockDate = date.getDate();
		var day = date.getDay();
		var week = [ '일', '월', '화', '수', '목', '금', '토' ];
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var seconds = date.getSeconds();

		var timer = (month + 1) + '월 ' + clockDate + '일 ' + week[day] + '요일 '
				+ (hours < 10 ? '0' + hours : hours) + ':'
				+ (minutes < 10 ? '0' + minutes : minutes) + ':'
				+ (seconds < 10 ? '0' + seconds : seconds);

		$("#timer").html(timer);
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

		$("#goMessage").click(function() {
			location.href = "<c:url value='/message/messageBox'/>";
		});
	});
</script>
<sec:authorize access="isAuthenticated()">
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
	if (sock12 != null) {
		disconnect12();
	}
	var sock12 = null;

	$(function() {
		$('.toast').toast({
		    'autohide': false
		  });
		$(".toast-body").click(function() {
			location.href = "<c:url value='/message/messageBox'/>";
		});
		$(window).bind('beforeunload', function() {
			disconnect12();
			return;
		});

		sock12 = new SockJS("<c:url value='/messageSock'/>");
		sock12.onmessage = onMessage12;
		sock12.onclose = onClose12;
		sock12.onopen = onOpen12;

	});
	function disconnect12() {
		sock12.close();
	}
	function send12(officialNo) {
		sock12.send(JSON.stringify({
			writeNote : "조회",
			officialNo : officialNo
		}));

	}
	function onOpen12() {

	}
	function onClose12() {
		disconnect12();
	}

	/* evt 는 websocket이 보내준 데이터 */
	function onMessage12(evt) {
		var data = evt.data;
		$("#messageCount").html(data);
		if(data != '0'){
			$('.toast').toast('show');
		}
	}
</script>
</sec:authorize>
<meta name="theme-color" content="#563d7c">
</head>
<body class="d-flex flex-column h-100">
	<!-- top 시작 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand"
				<sec:authorize access="isAuthenticated()">
			<c:if test="${principal.type == 'ADMIN' }">
				href="<c:url value='/admin/adminMain'/>"
			</c:if>
			<c:if test="${principal.type != 'ADMIN' }">
				href="<c:url value='/index'/>"
			</c:if>
			</sec:authorize>
				<sec:authorize access="isAnonymous()">
					href="<c:url value='/index'/>"
				</sec:authorize>
				style="border-right: 1px solid white; padding: 0 20px 0 0;"> <img
				class="logo" alt="로고"
				src="<c:url value='/resources/images/logo.png' />">
			</a>
			<div class="collapse navbar-collapse" id="navbarCollapse"
				style="max-width: 1400px;">

				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" style="color: white;">PORTAL <span
						class="sr-only">(current)</span>
					</li>
				</ul>
				<sec:authorize access="isAuthenticated()">
					<span style="color: white; margin-right: 10px;"> <sec:authentication
							property="principal.name" />님
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
							<li><a href="<c:url value='/lecture/createLecture'/>">강의 개설</a></li>
							<li><a href="<c:url value='/lecture/professorView'/>">성적입력</a></li>
							<li><a href="<c:url value='/lecture/phoneBook'/>">수강생 연락처</a></li>
							
						</ul></li>
					</c:if>
					</sec:authorize>

					<li><a class="nav-link" href="#" id="goMessage"> 쪽지함 <span
							id="messageCount"
							class="badge badge-pill bg-light align-text-bottom"></span>
					</a></li>
				</ul>
				<span id="timer"
					style="color: black; font-size: 0.8em; margin: 15px 25px; width: 100%; text-align: right;"></span>
			</nav>
			<sec:authorize access="isAuthenticated()">
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<img src="<c:url value='/resources/images/logoIcon.ico'/>" style="width: 1em;"
						class="rounded mr-2" alt="로고"> <strong class="mr-auto">척척학사</strong>
					<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body" style="cursor: pointer;">쪽지가 도착했습니다.
				</div>
			</div>
			</sec:authorize>
		</div>
	</header>
	<!-- top 끝 -->
	<div class="container-fluid">
		<div class="row">
