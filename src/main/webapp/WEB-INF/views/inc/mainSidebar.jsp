<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$(".bullets")
				.html(
						'<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
								+ '<path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
								+ '</svg>');
	})
</script>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	<div class="sidebar-sticky pt-3"
		style="background: #626d80; height: 100%;">
		<div class="category">LOGIN</div>
		<div id="login">
			<form action="">
				<input type="hidden" name="url"
					value="${requestScope['javax.servlet.forward.servlet_path']}">
				<input class="form-control" type="text" id="userid" name="userid"
					placeholder="아이디"> <input class="form-control"
					type="password" id="pwd" name="pwd" placeholder="비밀번호">
				<button type="submit" class="btn btn-outline-success">로그인</button>
			</form>
			<div id="findUser" style="color: #7a8394;">
				<span><a href="<c:url value='/login/findId'/>">아이디 찾기</a></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
				<span><a href="<c:url value='/login/findPwd'/>">비밀번호 찾기</a></span>
			</div>
		</div>
		<div class="category">즐겨찾기</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 자유게시판
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 수강신청 내역
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 포털공지
			</a></li>
		</ul>
	</div>
</nav>
<!-- sidebar 끝 -->