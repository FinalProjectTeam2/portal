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
<link rel="stylesheet" href="<c:url value='resources/css/reset.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>index.jsp</title>

<link href="<c:url value='/resources/css/offcanvas.css' />" rel="stylesheet">
<link href="<c:url value='/resources/css/layout.css' />" rel="stylesheet">

<!-- ckeditor 사용하기 위함 -->
<script src = "<c:url value='/ckeditor/ckeditor.js'/>"></script>



<style type="text/css">

</style>
<meta name="theme-color" content="#563d7c">
</head>
<body class="d-flex flex-column h-100">
	<!-- top 시작 -->
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="<c:url value='/index.do'/>"
				style="border-right: 1px solid white; padding: 0 20px 0 0;">로고</a>
			<div class="collapse navbar-collapse" id="navbarCollapse" style="max-width: 1400px;">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" style="color: white;">PORTAL <span
						class="sr-only">(current)</span>
					</li>
				</ul>
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">로그인</button>
				<select class="custom-select" style="margin: 0 0 0 15px; font-size: 0.7em; width: 100px;">
					<option>한국어</option>
					<option>영어</option>
				</select>
			</div>
		</nav>
		<div class="nav-scroller bg-white shadow-sm">
			<nav class="nav nav-underline" style="font-size: 1.2em;">
				<a class="nav-link active" href="#">포털</a> 
				<a class="nav-link" href="#"> 학사서비스 
					<span class="badge badge-pill bg-light align-text-bottom">27</span>
				</a> 
				<a class="nav-link" href="#">웹메일</a> 
				<a class="nav-link" href="#">그룹웨어</a> 
				<a class="nav-link" href="#">이러닝</a>
			</nav>
		</div>
	</header>
	<!-- top 끝 -->
	<div class="container-fluid">
  <div class="row">
  <!-- sidebar 시작 -->
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" 
    	style="padding: 0;">
      <div class="sidebar-sticky pt-3" style="background: #626d80; height: 100%;">
        <div style="color: white; padding-left: 20px; padding-bottom:10px; font-size: 1.5em; font-weight: bold; border-bottom: 1px solid white;">
        	LOGIN</div>
         <div id="login" >
         	<form action="">
	          	<input class="form-control" type="text" id="userid" name="userid" placeholder="아이디">
				<input class="form-control" type="password" id="pwd" name="pwd" placeholder="비밀번호" >  
				<button type="submit" class="btn btn-outline-success">로그인</button>         	
         	</form>
         	<div id="findUser" style="color: #7a8394;">
	         	<span><a href="<c:url value='#'/>">아이디 찾기</a></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
	         	<span><a href="<c:url value='#'/>">비밀번호 찾기</a></span>
         	</div>
         </div>
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file"></span>
              Orders
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart"></span>
              Products
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users"></span>
              Customers
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2"></span>
              Reports
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers"></span>
              Integrations
            </a>
          </li>
        </ul>

        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
          <span>Saved reports</span>
          <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
            <span data-feather="plus-circle"></span>
          </a>
        </h6>
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Current month
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Last quarter
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Social engagement
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file-text"></span>
              Year-end sale
            </a>
          </li>
        </ul>
      </div>
    </nav>
    <!-- sidebar 끝 -->
	<!-- main 시작 -->
	<main role="main" class="flex-shrink-0">
		<div class="container">
