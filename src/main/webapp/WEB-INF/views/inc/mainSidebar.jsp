<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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