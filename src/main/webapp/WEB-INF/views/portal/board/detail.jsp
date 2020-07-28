<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top -->
<%@ include file="../../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/detail.css'/>" />
<style>
.info{
	overflow: hidden;
	padding: 0 1%;
}
#boardDetail {
    width: 90%;
    margin: 0 auto;
}
.content{
	margin: 40px auto 20px auto;
}

.fileInfo{
	margin: 10px 0;
}
.fileInfo > div{
	float: right;
}
.fileInfo > div > div{
	font-size: 0.8em;
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
					<h3>${vo.postsVo.title }</h3>
				</div>
			</div>
			<hr>
			<div class="info">
				<div style="float: left;">${vo.userName }(${vo.postsVo.officialNo })</div>
				<div style="float: right;">${vo.postsVo.regDate }</div>
			</div>
			<div class="col fileInfo">
				<div>
					<div>1.aefaef</div>
					<div>2.aefaef</div>
				</div>
			</div>

			<div class="row1 content">
			${vo.postsVo.contents }
			</div>

			<div class="bts">
				<input type="button" id="edit" value="수정"> <input type="button" id="delete"
					value="삭제"> <input type="button" value="목록" id="list">
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>