<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/menu1.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/board.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/menu2.css'/>" />
<!-- 공지사항 -->
<script type="text/javascript">
	$(function() {
		$("#boardWrite").click(function() {
			location.href = "<c:url value='/portal/board/write'/>";
		});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div class="NoticeContents">
			<h1>게시판</h1>
			<!-- 타이틀만만 바뀜(포털공지/ 학사ㆍ국제공지/ 장학공지/ 행사ㆍ참여 게시판/ 학사ㆍ국제공지  -->
			<br>
			<p style="line-height: 28px; font-size: 14px;">
				홈페이지 개편에 따라 공지사항이 홈페이지와 포털 공지로 구분되어 운영되오니 이용에 참고하여 주시기 바랍니다.<br>
				- <strong>홈페이지 공지</strong>&nbsp;: 대외적인 행사 등 외부인을 대상으로 하는 일반, 특강, 행사,
				채용 등으로 운영<br> - <span style="color: rgb(255, 240, 245);">
					<strong> <span
						style="background-color: rgb(61, 121, 194);">포털 공지</span>
				</strong>
				</span> &nbsp;: <strong>내부 구성원을 위한 공지 영역으로&nbsp;</strong> 포괄적인 내용의 <strong>포털
					공지</strong>, 학사전용의 <strong>학사 공지</strong>, 장학전용의 <strong>장학 공지</strong>로
				구분하여 운영
			</p>
		</div>

		<hr>
		<!-- ------------------------------------------------->

		<!-- 게시판 -->
		<div id="menu1" class="tabcontent">
	<div class="listinfo1">
		<span>전체 1248 | 페이지 1/84 </span>
	</div>
	<div class="listinfo2">
		<span>정렬:</span> <a href="#">수정일</a> <a href="#">작성일</a>
	</div>

	<!-- 게시판 -->
	<table id="myTable">
		<colgroup>
			<col width="35%">
			<col width="6%">
			<col width="6%">
			<col width="30%">
			<col width="15%">
			<col width="8%">
		</colgroup>
		<thead>
			<tr class="maTable_tr1">
				<th scope="col">제목</th>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="">
					<a href="<c:url value='/portal/board/detail'/>" >
					[교수학습개발센터] 슬기로운 방학생활 - CTL Letter 7월호
					</a>
				</td>
				<td class="">NO.1</td>
				<td class="">공통</td>
				<td class="">미래교육혁신원 교수학습개발센터 홍길동</td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>

			<tr>
				<td class="">[교수학습개발센터] 슬기로운 방학생활 - CTL Letter 7월호</td>
				<td class="">NO.1</td>
				<td class="">공통</td>
				<td class="">미래교육혁신원 교수학습개발센터 홍길동</td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>

			<tr>
				<td class="">[교수학습개발센터] 슬기로운 방학생활 - CTL Letter 7월호</td>
				<td class="">NO.1</td>
				<td class="">공통</td>
				<td class="">미래교육혁신원 교수학습개발센터 홍길동</td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>

			<tr>
				<td class="">[교수학습개발센터] 슬기로운 방학생활 - CTL Letter 7월호</td>
				<td class="">NO.1</td>
				<td class="">공통</td>
				<td class="">미래교육혁신원 교수학습개발센터 홍길동</td>
				<td class="">2020-07-11</td>
				<td class="">452</td>
			</tr>
		</tbody>
	</table>
	<div class="divbt">
		<!-- 비회원은 버튼 안 보임! -->
		<button class="btn btn-outline-success bt" id="boardWrite">글쓰기</button>
	</div>
</div>
<br>
<br>
<!-- 페이지번호 -->
<div class="divPage"><< < 1 2 3 4 5 > >></div>

<br>
<br>
<!-- 검색 -->
<div class="divSearch">
	<form name="frmSearch" method="post" action="">
		<select name="search">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="name">작성자</option>
		</select> <input type="text" name="searchKeyword" title="검색"> <input
			type="submit" value="검색"><br>
		<br> <strong>인기검색어 :</strong> 교직 , 토익 , 토익 , 단소리
	</form>
</div>

<script>
	function myFunction() {
		var filter, table, tr, td, i, txtValue;
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

		<!-- ------------------------------------------------->
		<!-- 건의 -->
		<div id="search">
			<%@ include file="search.jsp"%>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>