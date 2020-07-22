<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
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
<title>index.jsp</title>

<link href="<c:url value='/resources/css/offcanvas.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/layout.css' />"
	rel="stylesheet">

<!-- ckeditor 사용하기 위함 -->
<script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>


<style type="text/css">

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
<script type="text/javascript">
	$(function() {

		$('.zeta-menu li ul').hide();

		$(".zeta-menu li").click(function() {
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
			}else if(e.target.className == "nav-link"){
				return false
			}
			$(".zeta-menu li ul").slideUp();
		});
	});
</script>
<meta name="theme-color" content="#563d7c">
</head>
<body class="d-flex flex-column h-100">
	<!-- top 시작 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="<c:url value='/index.do'/>"
				style="border-right: 1px solid white; padding: 0 20px 0 0;">로고</a>
			<div class="collapse navbar-collapse" id="navbarCollapse"
				style="max-width: 1400px;">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" style="color: white;">PORTAL <span
						class="sr-only">(current)</span>
					</li>
				</ul>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그인</button>
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
							<li><a href="<c:url value='/portal/board/main'/>">게시판</a></li>
							<li><a href="#">공지</a></li>
							<li><a href="#">자료실</a></li>
							<li><a href="#">서비스</a></li>
						</ul></li>
					<li><a class="nav-link" href="#"> 학사서비스 </a>
						<ul>
							<li><a href="#">학사정보</a></li>
							<li><a href="#">수강신청</a></li>
						</ul></li>
					<li><a class="nav-link" href="#">웹메일</a></li>
					<li><a class="nav-link" href="#"> 쪽지함 <span
							class="badge badge-pill bg-light align-text-bottom">27</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<!-- top 끝 -->
	<div class="container-fluid">
		<div class="row">
