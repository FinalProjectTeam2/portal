<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top -->
<%@ include file="../../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/detail.css'/>" />
<style>
.info{
	overflow: hidden;
	padding: 0 1%;
}
#boardDetail {
    width: 90%;
    margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#edit").click(function() {
			location.href = "<c:url value='/portal/board/edit'/>";
		});
		$("#delete").click(function() {
			location.href = "<c:url value='/portal/board/delete'/>";
		});
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list'/>";
		});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="boardDetail">
			<div class="row1">
				<div class="col">
					<h3>2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회 의무교육]</h3>
				</div>
			</div>
			<hr>
			<div class="info">
				<div style="float: left;">${vo.userName }</div>
				<div style="float: right;">date</div>
			</div>

			<div class="row1 content">
			${vo.contents }
			</div>

			<div class="bts">
				<input type="button" id="edit" value="수정"> <input type="button" id="delete"
					value="삭제"> <input type="button" value="목록" id="list">
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>