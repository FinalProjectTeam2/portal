<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$(".category").click(function() {
			var url = $(this).attr("title");
			location.href = url;
		});
		$(".bullets")
				.html(
						'<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
								+ '<path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
								+ '</svg>');
	});
</script>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	<div class="sidebar-sticky pt-3"
		style="background: #626d80; height: 100%;">
		<div class="category" title="<c:url value='/portal/board/main'/>">
			게시판</div>
		<ul class="nav flex-column" title="">
			<li class="nav-item"><a class="nav-link"
				href="<c:url value='/portal/board/list'/>"><span class="bullets"></span>자유게시판
			</a></li>
			<li class="nav-item"><a class="nav-link" href="<c:url value='/portal/board/list'/>"> <span
					class="bullets"></span>분실물/습득물
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span>벼룩시장
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span>하숙자취방정보
			</a></li>
		</ul>

		<div class="category" title="<c:url value='/portal/notice/main'/>">공지</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>포털 공지 </a></li>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>홈페이지 공지 </a></li>
		</ul>
		<div class="category" title="<c:url value='/portal/pds/main'/>">포털자료실</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>서식 자료실 </a></li>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>프로그램 자료실 </a></li>
		</ul>
		<div class="category" title="<c:url value='/portal/service/main'/>">서비스</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>학사일정 </a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span>질문/답변
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"><span
					class="bullets"></span>전화번호 검색 </a></li>
		</ul>
	</div>
</nav>
<!-- sidebar 끝 -->