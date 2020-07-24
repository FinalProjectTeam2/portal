<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/write.css'/>" />
<script type="text/javascript">
	$(function () {
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list'/>";
		});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="margin: 10px 20px;">
			<form action="/action_page.php" id="boardFrm">
				<div class="row1">
					<div class="col-25">
						<label for="l_title">제목</label>
					</div>
					<div class="col-75">
						<input type="text" id="title" name="title">
					</div>
				</div>

				<div class="row1">
					<div class="col-25">
						<label for="l_no">번호</label>
					</div>
					<div class="col-75">
						<input type="text" id="no" name="no">
					</div>
				</div>
				<div class="row1">
					<div class="col-25">
						<label for="l_category">분류</label>
					</div>
					<div class="col-75">
						<select id="category" name="category">
							<option value="">공통</option>
							<option value="">죽전</option>
							<option value="">천안</option>
						</select>
					</div>
				</div>
				<div class="row1">
					<div class="col-25">
						<label for="l_name">작성자</label>
					</div>
					<div class="col-75">
						<input type="text" id="name" name="name">
					</div>
				</div>
				<div class="row1">
					<div class="col-25">
						<label for="l_date">작성일</label>
					</div>
					<div class="col-75">
						<input type="text" id="date" name="date">
					</div>
				</div>

				<div class="row1">
					<div class="col-25">
						<label for="l_subject">내용</label>
					</div>
					<div class="col-75">
						<textarea id="subject" name="subject" placeholder="내용을 입력하세요."
							style="height: 200px"></textarea>
					</div>
				</div>
				<div class="bts">
					<input type="submit" value="수정" > <input type="button"
						value="목록" id="list">
				</div>
			</form>
		</div>

		<%@ include file="../../inc/bottom.jsp"%>