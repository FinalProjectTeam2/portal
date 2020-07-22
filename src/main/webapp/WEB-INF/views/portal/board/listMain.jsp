<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/menu2.css'/>" />
<title>게시판</title>
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
		<button class="btn btn-outline-success bt">글쓰기</button>
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