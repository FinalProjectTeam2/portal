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
#others a {
	color: black;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#edit")
				.click(
						function() {
							location.href = "<c:url value='/portal/board/edit?postNo=${vo.postsVo.postNo }'/>";
						});
		$("#delete")
				.click(
						function() {
							if (confirm('정말 삭제하시겠습니까?')) {
								location.href = "<c:url value='/portal/board/delete?postNo=${vo.postsVo.postNo }'/>";
							}
						});
		$("#list")
				.click(
						function() {
							location.href = "<c:url value='/portal/board/list?bdCode=${vo.postsVo.bdCode }'/>";
						});
		$("#btComment")
				.click(
						function() {
							location.href = "<c:url value='/portal/board/comment?postNo=${vo.postsVo.postNo}'/>";
						});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="width: 90%; margin: 0 auto;">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-end">
					<c:if test="${empty prev }">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">이전글</a></li>
					</c:if>
					<c:if test="${!empty prev }">
						<li class="page-item"><a class="page-link"
							title="${prev[0].title }"
							href="<c:url value='/portal/board/detail?postNo=${prev[0].postNo }'/>">이전글</a>
						</li>
					</c:if>
					<c:if test="${empty next }">
						<li class="page-item disabled"><a class="page-link" href="#"
							tabindex="-1" aria-disabled="true">다음글</a></li>
					</c:if>
					<c:if test="${!empty next }">
						<li class="page-item"><a class="page-link"
							title="${next[0].title }"
							href="<c:url value='/portal/board/detail?postNo=${next[0].postNo }'/>">다음글</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
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
							<svg width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-cloud-download" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
							  <path fill-rule="evenodd"
									d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383z" />
							  <path fill-rule="evenodd"
									d="M7.646 15.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 14.293V5.5a.5.5 0 0 0-1 0v8.793l-2.146-2.147a.5.5 0 0 0-.708.708l3 3z" />
							</svg>
							<a style=""
								href="<c:url value='/portal/board/download?no=${pds.no }&fileName=${pds.fileName }'/>">${pds.originalFileName }</a>
							<span style="margin-left: 5px;"> <c:if
									test="${pds.fileSize/1000 >= 1000}">
							 		(<fmt:formatNumber value="${pds.fileSize/1000/1000 }"
										pattern="#,###.00" /> MB)
							 	</c:if> <c:if test="${pds.fileSize/1000 < 1000}">
							 		(<fmt:formatNumber value="${pds.fileSize/1000 }"
										pattern="#,###.00" /> KB)
							 	</c:if>
							</span>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="row1 content">${vo.postsVo.contents }</div>

			<div class="bts">
				<c:if test="${vo.boardVo.isComment == 'Y' }">
					<input type="button" value="답글달기" id="btComment"
						style="float: left;">
				</c:if>
				<input type="button" value="목록" id="list">
				<c:if
					test="${vo.postsVo.officialNo == principal.officialNo or principal.type == 'ADMIN'}">
					<input type="button" id="edit" value="수정">
					<input type="button" id="delete" value="삭제">
				</c:if>
			</div>
			<c:if test="${vo.boardVo.isReply == 'Y' }">
				<%@include file="re.jsp"%>
			</c:if>
		</div>
		<div id="others"
			style="width: 90%; margin: 0 auto; border: 1px solid #e5e5e5; border-radius: 5px; padding: 10px 15px;">
			<label style="color: gray; font-size: 0.9em;"> <a
				href="<c:url value='/portal/board/main?categoryCode=${cateVo.categoryCode }'/>">${cateVo.categoryName }</a>
				> <a
				href="<c:url value='/portal/board/list?bdCode=${vo.boardVo.bdCode }'/>">${vo.boardVo.bdName}</a>
				카테고리의 다른글
			</label>
			<hr style="margin: 5px 0;">
			<ol style="margin: 5px; display: inline-block;">
				<c:set value="0" var="cnt"></c:set>
				<c:set value="${fn:length(prev) }" var="prevLen"></c:set>
				<c:set value="${fn:length(next) }" var="nextLen"></c:set>
				<c:if test="${nextLen >= 2 }">
					<c:if test="${prevLen >= 2 }">
						<fmt:formatDate value="${prev[1].regDate }" pattern="yyyy.MM.dd"
							var="date1" />
						<fmt:formatDate value="${prev[0].regDate }" pattern="yyyy.MM.dd"
							var="date0" />
						<c:if test="${fn:length(prev[1].postNo) > 40 }">
							<li><a
								href="<c:url value='/portal/board/detail?postNo=${prev[1].postNo }'/>">${fn:substring(prev[1].title,0,40) }...
									(${date1 })</a></li>
						</c:if>
						<c:if test="${fn:length(prev[1].postNo) <= 40 }">
							<li><a
								href="<c:url value='/portal/board/detail?postNo=${prev[1].postNo }'/>">${prev[1].title }
									(${date1 })</a></li>
						</c:if>
						<c:if test="${fn:length(prev[0].postNo) > 40 }">
							<li><a
								href="<c:url value='/portal/board/detail?postNo=${prev[0].postNo }'/>">${fn:substring(prev[0].title,0,40) }...
									(${date0 })</a></li>
						</c:if>
						<c:if test="${fn:length(prev[0].postNo) <= 40 }">
							<li><a
								href="<c:url value='/portal/board/detail?postNo=${prev[0].postNo }'/>">${prev[0].title }
									(${date0 })</a></li>
						</c:if>

						<c:set var="cnt" value="2"></c:set>
					</c:if>
					<c:if test="${prevLen < 2 }">
						<c:forEach items="${prev }" var="p">
							<fmt:formatDate value="${p.regDate }" pattern="yyyy.MM.dd"
								var="date" />
							<c:if test="${fn:length(p.title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${n.postNo }'/>">${fn:substring(p.title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(p.title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${p.postNo }'/>">${p.title }
										(${date })</a></li>
							</c:if>

							<c:set var="cnt" value="${cnt + 1 }"></c:set>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(vo.postsVo.title) > 40 }">
								<li style="color: #28a745; font-weight: bold;">${fn:substring(vo.postsVo.title,0,40) }...</li>
							</c:if>
							<c:if test="${fn:length(vo.postsVo.title) <= 40 }">
								<li style="color: #28a745; font-weight: bold;">${vo.postsVo.title }</li>
							</c:if>
					<c:if test="${nextLen < (4-cnt) }">
						<c:forEach var="n" items="${next }">
							<fmt:formatDate value="${n.regDate }" pattern="yyyy.MM.dd"
								var="date" />
							<c:if test="${fn:length(n.title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${n.postNo }'/>">${fn:substring(n.title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(n.title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${n.postNo }'/>">${n.title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
					<c:if test="${nextLen >= (4-cnt) }">
						<c:forEach begin="0" end="${4 - cnt -1 }" var="i">
							<fmt:formatDate value="${next[i].regDate }" pattern="yyyy.MM.dd"
								var="date" />
							<c:if test="${fn:length(next[i].title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${next[i].postNo }'/>">${fn:substring(next[i].title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(next[i].title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${next[i].postNo }'/>">${next[i].title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${nextLen == 1 }">
					<c:if test="${prevLen < 3 }">
						<c:forEach var="p" items="${prev }">
							<fmt:formatDate value="${p.regDate }" pattern="yyyy.MM.dd"
								var="date" />
							<c:if test="${fn:length(p.title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${p.postNo }'/>">${fn:substring(p.title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(p.title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${p.postNo }'/>">${p.title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
					<c:if test="${prevLen >= 3 }">
						<c:forEach begin="0" end="2" var="i">
							<fmt:formatDate value="${prev[2-i].regDate }"
								pattern="yyyy.MM.dd" var="date" />
							<c:if test="${fn:length(prev[2-i].title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[2-i].postNo }'/>">${fn:substring(prev[2-i].title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(prev[2-i].title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[2-i].postNo }'/>">${prev[2-i].title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
					<c:if test="${fn:length(vo.postsVo.title) > 40 }">
								<li style="color: #28a745; font-weight: bold;">${fn:substring(vo.postsVo.title,0,40) }...</li>
							</c:if>
							<c:if test="${fn:length(vo.postsVo.title) <= 40 }">
								<li style="color: #28a745; font-weight: bold;">${vo.postsVo.title }</li>
							</c:if>
					
					<c:if test="${nextLen < (4-cnt) }">
						<c:forEach var="n" items="${next }">
							<fmt:formatDate value="${n.regDate }" pattern="yyyy.MM.dd"
								var="date" />
							<c:if test="${fn:length(n.title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${n.postNo }'/>">${fn:substring(n.title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(n.title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${n.postNo }'/>">${n.title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${nextLen < 1 }">
					<c:if test="${prevLen < 4 and prevLen > 0 }">
						<c:forEach var="p" begin="0" end="${prevLen -1 }">
							<fmt:formatDate value="${prev[(prevLen - 1 - p)].regDate }"
								pattern="yyyy.MM.dd" var="date" />
							<c:if test="${fn:length(prev[(prevLen - 1 - p)].title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[(prevLen - 1 - p)].postNo }'/>">${fn:substring(prev[(prevLen - 1 - p)].title,0,40) }...
										(${date })</a></li>
							</c:if>
							<c:if test="${fn:length(prev[(prevLen - 1 - p)].title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[(prevLen - 1 - p)].postNo }'/>">${prev[(prevLen - 1 - p)].title }
										(${date })</a></li>
							</c:if>

						</c:forEach>
					</c:if>
					<c:if test="${prevLen >= 4 }">
						<c:forEach begin="0" end="3" var="i">
							<fmt:formatDate value="${prev[3-i].regDate }"
								pattern="yyyy.MM.dd" var="date" />
							<c:if test="${fn:length(prev[3-i].title) > 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[3-i].postNo }'/>">${fn:substring(prev[3-i].title,0,40) }...
										(${date})</a></li>
							</c:if>
							<c:if test="${fn:length(prev[3-i].title) <= 40 }">
								<li><a
									href="<c:url value='/portal/board/detail?postNo=${prev[3-i].postNo }'/>">${prev[3-i].title }
										(${date})</a></li>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${fn:length(vo.postsVo.title) > 40 }">
						<li style="color: #28a745; font-weight: bold;">${fn:substring(vo.postsVo.title,0,40) }...</li>
					</c:if>
					<c:if test="${fn:length(vo.postsVo.title) <= 40 }">
						<li style="color: #28a745; font-weight: bold;">${vo.postsVo.title }</li>
					</c:if>
				</c:if>
			</ol>
		</div>
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>