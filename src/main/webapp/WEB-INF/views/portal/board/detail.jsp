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

}
</style>
<script type="text/javascript">
	$(function() {
		$("#edit").click(function() {
			location.href = "<c:url value='/portal/board/edit?postNo=${vo.postsVo.postNo }'/>";
		});
		$("#delete").click(function() {
			location.href = "<c:url value='/portal/board/delete?postNo=${vo.postsVo.postNo }'/>";
		});
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list?bdCode=${vo.postsVo.bdCode }'/>";
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
				<div id="readCount">조회수 : ${vo.postsVo.readCount }</div>
			</div>
			<hr>
			<div class="info">
				<div style="float: left;">${vo.userName }(${vo.postsVo.officialNo })</div>
				<div style="float: right;">${vo.postsVo.regDate }</div>
			</div>
			<div class="col fileInfo">
				<div>
					<c:forEach items="${vo.fileList }" var="pds">
						<div style="">
							<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cloud-download" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd" d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z"/>
							  <path fill-rule="evenodd" d="M7.646 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V5.5a.5.5 0 0 0-1 0v8.793l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z"/>
							</svg>
							<a style="" href="<c:url value='/portal/board/download?no=${pds.no }&fileName=${pds.fileName }'/>">${pds.originalFileName }</a>
							 <span style="margin-left: 5px;">
							 	<c:if test="${pds.fileSize/1000 >= 1000}">
							 		(<fmt:formatNumber value="${pds.fileSize/1000/1000 }" pattern="#,###.00"/> MB)
							 	</c:if>
							 	<c:if test="${pds.fileSize/1000 < 1000}">
							 		(<fmt:formatNumber value="${pds.fileSize/1000 }" pattern="#,###.00"/> KB)
							 	</c:if>
							 </span> 
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="row1 content">
			${vo.postsVo.contents }
			</div>

			<div class="bts">
				<input type="button" value="목록" id="list">
				<c:if test="${vo.postsVo.officialNo == principal.officialNo or principal.type == 'ADMIN'}">
					<input type="button" id="edit" value="수정"> <input type="button" id="delete"
						value="삭제"> 
				</c:if>
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>