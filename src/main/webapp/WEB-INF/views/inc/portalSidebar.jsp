<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.category{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".category").click(function() {
			var url = $(this).attr("title");
			location.href = url;
		});
	});
	
</script>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	<div class="sidebar-sticky pt-3"
		style="background: #626d80; height: 100%;">
		<div class="category" title="<c:url value='/portal/board/main'/>" 
			style="color: white; padding-left: 20px; padding-bottom: 10px; font-size: 1.5em; font-weight: bold; border-bottom: 1px solid white;">
			게시판</div>
		<ul class="nav flex-column" title="">
			<li class="nav-item"><a class="nav-link" href="<c:url value='/portal/board/list'/>"> <span
					data-feather="file"></span> 자유게시판
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="shopping-cart"></span> 분실물/습득물
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="users"></span> 벼룩시장
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="bar-chart-2"></span> 하숙자취방정보
			</a></li>
		</ul>

		<div class="category" title="<c:url value='/portal/notice/main'/>" 
			style="color: white; padding-left: 20px; padding-bottom: 10px; font-size: 1.5em; font-weight: bold; border-bottom: 1px solid white;">
			공지</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span> 포털 공지
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					data-feather="file-text"></span> 홈페이지 공지
			</a></li>
		</ul>
	<div class="category" title="<c:url value='/portal/pds/main'/>" 
		style="color: white; padding-left: 20px; padding-bottom: 10px; font-size: 1.5em; font-weight: bold; border-bottom: 1px solid white;">
		포털자료실</div>
	<ul class="nav flex-column">
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> 서식 자료실
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> 프로그램 자료실
		</a></li>
	</ul>
	<div class="category" title="<c:url value='/portal/service/main'/>" 
		style="color: white; padding-left: 20px; padding-bottom: 10px; font-size: 1.5em; font-weight: bold; border-bottom: 1px solid white;">
		서비스</div>
	<ul class="nav flex-column">
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> 학사일정
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> 질문/답변
		</a></li>
		<li class="nav-item"><a class="nav-link" href="#"> <span
				data-feather="file-text"></span> 전화번호 검색
		</a></li>
	</ul>
	</div>
</nav>
<!-- sidebar 끝 -->