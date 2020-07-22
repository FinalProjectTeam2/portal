<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- top -->
<%@ include file="../../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/detail.css'/>" />
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

			<div class="row1">
				<div class="col-25">
					<label for="l_no">번호</label>
				</div>
				<div class="col-75">
					<div class="div2">1</div>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category">분류</label>
				</div>
				<div class="col-75">공통</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_name">작성자</label>
				</div>
				<div class="col-75">
					<div class="div2">대학생활상담센터 홍길동</div>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_date">작성일</label>
				</div>
				<div class="col-75">
					<div class="div3">2020.7.13</div>
				</div>
			</div>

			<div class="row1">
				<label for="l_subject">내용</label>
			</div>
			<div class="row1 content">
				2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회 의무교육] <br> 2020년 인터넷 스마트폰
				과의존 예방 교육 안내 [학부생, 연1회 의무교육]<br>2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회
				의무교육] 2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회 의무교육] <br>2020년 인터넷 스마트폰 과의존
				예방 교육 안내 [학부생, 연1회 의무교육] <br>2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회 의무교육]
				<br>2020년 인터넷 스마트폰 과의존 예방 교육 안내 [학부생, 연1회 의무교육] <br>2020년 인터넷 스마트폰 과의존 예방 교육
				안내 [학부생, 연1회 의무교육]
			</div>

			<div class="bts">
				<input type="button" id="edit" value="수정"> <input type="button" id="delete"
					value="삭제"> <input type="button" value="목록" id="list">
			</div>
		</div>
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>