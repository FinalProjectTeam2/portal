<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style type="text/css">
.container {
	width: 1000px;
}

.indexDOM_large {
	position: relative;
	padding: 5px 10px;
}

a.more {
	display: inline-block;
	overflow: hidden;
	position: absolute;
	top: 11px;
	right: 7px;
}

.list-group-item {
	background: #ffffff00;
}

.container .indexDOM_large .title {
	margin: 10px 5px;
	font-weight: bold;
	font-size: 1.2em;
}

.list-group-item {
	font-size: 0.9em;
}
</style>
<script type="text/javascript">
	$(function() {
		var img = '<svg width="1.7em" height="1.7em" viewBox="0 0 16 16"'+
			'class="bi bi-file-plus" fill="currentColor"'+
				'xmlns="http://www.w3.org/2000/svg">'
				+ '<path fill-rule="evenodd"'+
						'd="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />'
				+ '<path fill-rule="evenodd"'+
					'd="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z" />'
				+ '</svg>';
		$(".more").append(img);
	});
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="overflow: hidden;">
			<div class="indexDOM_large">
				<p class="title">자유게시판</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">1번글</li>
					<li class="list-group-item">2번글</li>
					<li class="list-group-item">3번글</li>
					<li class="list-group-item">4번글</li>
					<li class="list-group-item">5번글</li>
					<li class="list-group-item">6번글</li>
				</ul>
				<a href="<c:url value='/portal/board/list'/>" class="more"></a>
			</div>

			<div class="indexDOM_large">
				<p class="title">분실물/습득물</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">1번글</li>
					<li class="list-group-item">2번글</li>
					<li class="list-group-item">3번글</li>
					<li class="list-group-item">4번글</li>
					<li class="list-group-item">5번글</li>
					<li class="list-group-item">6번글</li>
				</ul>
				<a href="#" class="more"></a>
			</div>
			<div class="indexDOM_large">
				<p class="title">벼룩시장</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">1번글</li>
					<li class="list-group-item">2번글</li>
					<li class="list-group-item">3번글</li>
					<li class="list-group-item">4번글</li>
					<li class="list-group-item">5번글</li>
					<li class="list-group-item">6번글</li>
				</ul>
				<a href="#" class="more"></a>
			</div>
			<div class="indexDOM_large">
				<p class="title">하숙자취방정보</p>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">1번글</li>
					<li class="list-group-item">2번글</li>
					<li class="list-group-item">3번글</li>
					<li class="list-group-item">4번글</li>
					<li class="list-group-item">5번글</li>
					<li class="list-group-item">6번글</li>
				</ul>
				<a href="#" class="more"></a>
			</div>

		</div>
		<%@ include file="search.jsp"%>
		<%@ include file="../../inc/bottom.jsp"%>