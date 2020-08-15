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
<style type="text/css">
ul.pagination {
	display: inline-flex;
}

.title img {
	margin: 0 5px 0 0;
}

.delFlag {
	color: gray;
}
.reCount{
	color: #4a4747;
	font-size: 0.9em;
}
#tableList a{
	color: black;
}
#tableList a:hover{
	color: blue;
	text-decoration: none;
}
.private{
	cursor: pointer;
}
</style>
<!-- 공지사항 -->
<script type="text/javascript">
	var name = "";
	$(function() {
		$.send(1);

		$("form[name=frmSearch]").submit(function() {
			$.send(1);
			return false;
		});

		$("#boardWrite")
				.click(
						function() {
							location.href = "<c:url value='/portal/board/write?bdCode=${boardVo.bdCode}'/>";
						});

		$("#recordCountPerPage").change(function() {
			$.send($("#currentPage").val());
		});
		$("#sort").change(function() {
			$.send($("#currentPage").val());
		});
		
		
	});

	function isPrivate(offiNo,postNo) {
		if('${principal.type}' != 'ADMIN'){
			if('${principal.officialNo}' != offiNo){
				alert("비밀글 입니다.");
				return false;
			}
		}
		location.href = "<c:url value='/portal/board/detailCount?postNo='/>"+postNo;
		
	}
	
	$.send = function(curPage) {
		$("#currentPage").val(curPage);

		$
				.ajax({
					url : "<c:url value='/portal/board/ajax/list'/>",
					data : $("form[name=frmSearch]").serializeArray(),
					dataType : "json",
					type : "post",
					success : function(res) {
						makeList(res);
						pageMake(res); //페이징 처리 함수
						$('body').scrollTop(0);
						$("#recordCountPerPage").val(
								res.pagingInfo.recordCountPerPage);
						
						var sortName = res.bdSearchVo.sort;
						if (sortName == null || sortName == '') {
							sortName == 'write';
						}
						
						$("#sort").val(sortName);
						
						$("#searchCondition").val(res.bdSearchVo.searchCondition);
						$("#searchKeyword").val(res.bdSearchVo.searchKeyword);
					}
				});
	}

	function makeList(obj) {

		var str = '<table id="myTable">' + '<colgroup>' + '<col width="5%">'
				+ '<col width="60%">' + '<col width="15%">'
				+ '<col width="10%">' + '<col width="10%">' + '</colgroup>'
				+ '<thead>' + '<tr class="maTable_tr1">'
				+ '<th scope="col">번호</th>' + '<th scope="col">제목</th>'
				+ '<th scope="col">작성자</th>' + '<th scope="col">작성일</th>'
				+ '<th scope="col">조회수</th>' + '</tr>' + '</thead>';

		str += "<tbody>";

		if (obj.pagingInfo.totalRecord == 0) {
			str += "<tr>" + '<td colspan="5">게시물이 없습니다.</td>' + "</tr>";
		} else {
			$(".listinfo1").html(
					"<span>전체 " + obj.pagingInfo.totalRecord
							+ "건&ensp;&ensp;|&ensp;&ensp;페이지 "
							+ obj.pagingInfo.currentPage + "/"
							+ obj.pagingInfo.totalPage + "</span>");

			$
					.each(
							obj.list,
							function(idx, item) {

								$
										.ajax({
											url : "<c:url value='/common/ajax/member'/>",
											data : {
												officialNo : item.officialNo
											},
											dataType : "json",
											type : "get",
											success : function(res) {
												name = res.name;
												offi = "." + item.officialNo;
												$(offi)
														.html(
																name
																		+ "("
																		+ item.officialNo
																		+ ")");
											}
										});
								str += "<tr>";
								str += "<td>" + item.postNo + "</td>";
								if (item.delFlag == 'N') {
									console.log('비밀글?'+item.isPrivate);
									if(item.isPrivate == 'N'){
										str += "<td class='title'><a href=\"<c:url value='/portal/board/detailCount'/>?postNo="
											+ item.postNo
											+ "\" title=\""
											+ item.title + "\">";
									}else{
										str += "<td class='title'><a class='private' onclick=\"isPrivate("+item.officialNo+","+item.postNo+")\" title=\""
											+ item.title + "\">"
											+ "<img alt=\"file\" src=\"<c:url value='/resources/images/icon_secret.gif'/>\">";
									}
									
									var offiType = item.officialNo.substring(4, 5);
									if(offiType == '1'){
										str += "<img alt=\"file\" src=\"<c:url value='/resources/images/lbl_bbs_notice.png'/>\">";
									}
									
									str += '<span style="margin-right: 5px;">'
									if (item.title.length >= 60) {
										str += item.title.substring(0, 60)
												+ "...";
									} else {
										str += item.title
									}
									str += '</span>';
									if (item.fileCount > 0) {
										str += "<img alt=\"file\" src=\"<c:url value='/resources/images/file.gif'/>\">";
									}
									if (item.newImgTerm < 24) {
										str += "<img alt=\"newPost\" src=\"<c:url value='/resources/images/new.gif'/>\">";
									}
									str += "</a>"
									if(item.reCount > 0){
										str += '<span class="reCount">('+ item.reCount + ")</span>";
									}
									str += "</td>";
								} else {
									str += '<td class="delFlag">삭제된 게시물입니다.</td>';
								}

								str += "<td class='"+item.officialNo+"'></td>";
								str += "<td>"
										+ moment(item.regDate).format(
												'YYYY-MM-DD') + "</td>";
								str += "<td>" + item.readCount + "</td>";
								str += "</tr>";
							});

		}
		str += "</tbody>";
		str += '</table>';

		$("#tableList").html(str);
	}

	function pageMake(obj) {
		var pagingInfo = obj.pagingInfo;

		var str = "";

		str += '<nav aria-label="Page navigation example">'
				+ '<ul class="pagination">';
		//이전블록
		if (pagingInfo.firstPage > 1) {
			str += '<li class="page-item">' + '<a class="page-link" href="#" '
					+ 'aria-label="Previous" onclick="$.send('
					+ (pagingInfo.firstPage - 1) + ')">'
					+ '<span aria-hidden="true">&laquo;</span>' + '</a></li>';
		}

		//페이지 처리
		for (var i = pagingInfo.firstPage; i <= pagingInfo.lastPage; i++) {
			if (i == pagingInfo.currentPage) {
				str += '<li class="page-item"><a class="page-link" '
						+ 'style="background: skyblue; color: white;">'
						+ i + '</a></li>';
			} else {
				str += '<li class="page-item"><a class="page-link" onclick="$.send('
						+ i + ')"' + ' href="#">' + i + '</a></li>';
			}
		}

		//다음 블록
		if (pagingInfo.lastPage < pagingInfo.totalPage) {
			str += '<li class="page-item">' + '<a class="page-link" href="#" '
					+ 'aria-label="Previous" onclick="$.send('
					+ (pagingInfo.lastPage + 1) + ')">'
					+ '<span aria-hidden="true">&laquo;</span>' + '</a></li>';
		}

		str += '</ul></nav>';

		$("#divPage").html(str);
		$("#currentPage").val(pagingInfo.currentPage);
	}
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div class="NoticeContents">
			<h1>${boardVo.bdName }</h1>
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
		<form name="frmSearch" method="post" action="">
			<div id="menu1" class="tabcontent">
				<div class="listinfo1" ></div>
				<div class="listinfo2">
					<select name="sort" id="sort">
						<option value="write">작성일</option>
						<option value="edit">수정일</option>
					</select> <select name="recordCountPerPage" id="recordCountPerPage">
						<option value="10">10개</option>
						<option value="20">20개</option>
					</select>
				</div>

				<!-- 게시판 -->
				<div id="tableList"></div>

				<div class="divbt">
					<!-- 비회원은 버튼 안 보임! -->
					<button type="button" class="btn btn-outline-success bt" id="boardWrite">글쓰기</button>
				</div>
			</div>
			<!-- 페이지번호 -->
			<div class="divPage" id="divPage"></div>

			<!-- 검색 -->
			<div class="divSearch">

				<input type="hidden" name="currentPage" value="1" id="currentPage" />

				<input type="hidden" name="bdCode" id="bdCode"
					value="${boardVo.bdCode }" /> <select name="searchCondition"
					id="searchCondition">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="official_no">작성자</option>
				</select> <input type="text" name="searchKeyword" title="검색"
					id="searchKeyword"> <input type="submit" value="검색"><br>
				<br> 
			</div>
		</form>

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