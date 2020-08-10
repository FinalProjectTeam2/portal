<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/messageSidebar.jsp"%>
<style type="text/css">
.form-control {
	display: inline;
	width: 10%;
}
.input-group.mb-2.mr-sm-2 {
    width: 20%;
    display: inline-flex;
}
.input-group-text {
    padding: 3px;
}
input#inlineFormInputGroupUsername2 {
    font-size: 0.9em;
    padding: 0 10px;
    height: 32px;
}
.input-group-text {
	width: 35px;
    padding: 0px 8px;
}
#messageSearch, #messageTop{
	border-bottom: 1px solid gray;
	padding: 10px 20px;
	overflow: hidden;
}
button#delMessage {
    padding: 0 5px;
}
#messageTable {
	font-size: 0.9em;
}
#messageTable td{
	padding: .5em .75em;
}
#messageTable td a{
	color: black;
}
#messageTable tbody tr{
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	//$.send(1);

	$("form[name=messageForm]").submit(function() {
		$.send(1);
		return false;
	});

	$("#boardWrite")
			.click(
					function() {
						location.href = "<c:url value='/message/'/>";
					});

	$("#recordCountPerPage").change(function() {
		$.send($("#currentPage").val());
	});
	$("#sort").change(function() {
		$.send($("#currentPage").val());
	});
});

$.send = function(curPage) {
	$("#currentPage").val(curPage);

	$.ajax({
		url : "<c:url value='/message/ajax/list'/>",
		data : $("form[name=messageForm]").serializeArray(),
		dataType : "json",
		type : "post",
		success : function(res) {
			makeList(res);
			pageMake(res); //페이징 처리 함수
			$('body').scrollTop(0);
			$("#recordCountPerPage").val(
					res.pagingInfo.recordCountPerPage);
			
			
			$("#type").val(res.bdSearchVo.type);
			$("intput[name=searchKeyword]").val(res.bdSearchVo.searchKeyword);
		}
	});
}

function makeList(obj) {

	var str = '';

	if (obj.pagingInfo.totalRecord == 0) {
		str += "<tr>" + '<td colspan="5">게시물이 없습니다.</td>' + "</tr>";
	} else {
		
		$.each(obj.list,function(idx, item) {
			
		});

	}

	$("#messageContents").html(str);
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

	$("#messagePaging").html(str);
	$("#currentPage").val(pagingInfo.currentPage);
}
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<div>
			<div id="messageSearch">
				<form action="" method="post" name="messageForm" >
				<input type="hidden" name="currentPage" value="1" id="currentPage" />
					<select class="form-control form-control-sm" name="type">
						<option value="all">전체쪽지</option>
						<option value="in">받은쪽지</option>
						<option value="out">보낸쪽지</option>
						<option value="save">보관쪽지</option>
						<option value="self">내게쓴쪽지</option>
					</select> 
					<select class="form-control form-control-sm" name="searchCondition">
						<option value="">이름</option>
						<option>아이디</option>
						<option>내용</option>
					</select>
					<div class="input-group mb-2 mr-sm-2">
						<input type="text" class="form-control" name="searchKeyword"
							id="inlineFormInputGroupUsername2" placeholder="쪽지검색">
						<div class="input-group-append">
							<div class="input-group-text">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
								  <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
								</svg>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div id="messageTop">
				<button type="button" id="delMessage" class="btn btn-secondary" style="font-size: 0.9em; float: left;">
					<svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-x" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: white; vertical-align:middle;">
					  <path fill-rule="evenodd" d="M11.854 4.146a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708-.708l7-7a.5.5 0 0 1 .708 0z"/>
					  <path fill-rule="evenodd" d="M4.146 4.146a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7a.5.5 0 0 0-.708 0z"/>
					</svg>삭제
				</button>
				<svg width="1.6em" height="1.6em" viewBox="0 0 16 16" style="float: right;"
					class="bi bi-arrow-clockwise" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd"
						d="M3.17 6.706a5 5 0 0 1 7.103-3.16.5.5 0 1 0 .454-.892A6 6 0 1 0 13.455 5.5a.5.5 0 0 0-.91.417 5 5 0 1 1-9.375.789z" />
				  <path fill-rule="evenodd"
						d="M8.147.146a.5.5 0 0 1 .707 0l2.5 2.5a.5.5 0 0 1 0 .708l-2.5 2.5a.5.5 0 1 1-.707-.708L10.293 3 8.147.854a.5.5 0 0 1 0-.708z" />
				</svg>
			</div>
			<div id="messageContents">
			<table id="messageTable" class="table table-hover">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="65%">
					<col width="15%">
				</colgroup>
			  <thead>
			    <tr>
			      <th scope="col"><input type="checkbox"></th>
			      <th scope="col">보낸사람</th>
			      <th scope="col">내용</th>
			      <th scope="col">날짜</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td scope="row"><input type="checkbox"></td>
			      <td><a href="#">Mark</a></td>
			      <td><a href="#">Otto</a></td>
			      <td>@mdo</td>
			    </tr>
			    <tr>
			      <td scope="row"><input type="checkbox"></td>
			      <td>Jacob</td>
			      <td>Thornton</td>
			      <td>@fat</td>
			    </tr>
			    <tr>
			      <td scope="row"><input type="checkbox"></td>
			      <td colspan="2">Larry the Bird</td>
			      <td>@twitter</td>
			    </tr>
			  </tbody>
			</table>
			</div>
			<div id="messagePaging"></div>
		</div>

		<!-- 내용 입력 끝 -->
		<!-- bottom -->
		<%@ include file="../inc/bottom.jsp"%>