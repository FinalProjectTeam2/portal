<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/messageSidebar.jsp"%>
<style type="text/css">
#messgaeInfo .form-control {
	display: inline;
	width: 10%;
}
#messgaeInfo .input-group.mb-2.mr-sm-2 {
    width: 20%;
    display: inline-flex;
}
#messgaeInfo .input-group-text {
    padding: 3px;
}
input#inlineFormInputGroupUsername2 {
    font-size: 0.9em;
    padding: 0 10px;
    height: 32px;
}
#messgaeInfo .input-group-text {
	width: 35px;
    padding: 0px 8px;
}
#messageSearch, #messageTop{
	border-bottom: 1px solid gray;
	padding: 10px;
	overflow: hidden;
}
button#delMessage, #KeepMessage {
    padding: 0 5px;
    border: 1px solid #6c757d;
    margin-right: 5px;
}
#messageTable {
	font-size: 0.9em;
}
#messageTable td{
	padding: .5em .75em;
}
#messageTable .nonRead td a{
	color: black;
}
#messageTable tbody tr{
	cursor: pointer;
}
#messgaeInfo svg{
	cursor: pointer;
}
#messgaeInfo svg:hover{
	color: lightcoral;
}
div#messagePaging nav {
    display: table;
    margin: 0 auto;
}
.read td, .read td a{
	color: gray;
}
input.chBox {
    margin-left: 0.1em;
}
</style>
<script type="text/javascript">
function sendTwo(cur) {
	$.send(cur);
}
$(function() {
	$("select[name=type]").val('${type}');
	$.send(1);

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
	
	$("#reList").click(function() {
		$.send(1);
	});
	$("#searchList").click(function() {
		$("form[name=messageForm]").submit();
	});
	
	//전체선택 체크박스 클릭 
	$("#checkAll").click(function(){ 
		//만약 전체 선택 체크박스가 체크된상태일경우 
		if($("#checkAll").prop("checked")) { 
			//해당화면에 전체 checkbox들을 체크해준다 
			$("input[type=checkbox]").prop("checked",true); 
			// 전체선택 체크박스가 해제된 경우 
		} else { 
			//해당화면에 모든 checkbox들의 체크를해제시킨다. 
			$("input[type=checkbox]").prop("checked",false); 
		} 
	});
	
	$("#delMessage").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var checkArr = new Array();
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-cartNum"));
		   });
		    
		   $.ajax({
		    url : "<c:url value='/message/messageDeleteNo'/>",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(){
		    	$.send(1);
		    }
		   });
		  } 
	});
	$("#KeepMessage").click(function() {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("data-cartNum"));
	   });
	    
	   $.ajax({
	    url : "<c:url value='/message/messageKeep'/>",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(){
	    	$.send(1);
	    }
	   });
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
			
			$("#checkAll").prop("checked",false); 
			$("#type").val(res.vo.type);
			$("intput[name=searchKeyword]").val(res.vo.searchKeyword);
			$("select[name=searchCondition]").val(res.vo.searchCondition);
			if(res.vo.type != 'in' && res.vo.type != 'save'){
				$("#messageTop button").each(function() {
					$(this).css("display","none");
					$("input[type=checkbox]").prop("disabled","disabled");
				});
			}else{
				$("#messageTop button").each(function() {
					$(this).css("display","inline-block");
					$("input[type=checkbox]").prop("disabled",false);
				});
			}
		}
	});
}

function makeList(obj) {

	var str = '';
	var text = '';
	if(obj.vo.type == 'in' || obj.vo.type == 'save'){
		text = '받은 쪽지';
	}else if(obj.vo.type == 'out' || obj.vo.type == 'self'){
		text = '보낸 쪽지';
	}else{
		text = '쪽지';
	}
	if (obj.pagingInfo.totalRecord == 0) {
		str += "<tr>" + '<td colspan="5">'+text+'가 없습니다.</td>' + "</tr>";
	} else {
		
		$.each(obj.list,function(idx, item) {
			if(item.readDate != null){
				str += '<tr class="read" onclick="detail('+item.no+')">'
				    + '<td onclick="event.cancelBubble=true" scope="row"><input class="chBox" type="checkbox" value="'+item.no+'" data-cartNum="'+item.no+'"></td>'
				    + '<td onclick="event.cancelBubble=true"><a href="#" onclick="reMessage('+item.officialNo+')">'+item.officialName
				    +'('+item.officialNo+')</a></td>'
				    + '<td>'+item.inOffi+'</td>'
				    + '<td><a href="#">'+item.contents+'</a></td>'
				    + '<td>'+ moment(item.sendDate).format('YYYY-MM-DD HH:m')+'</td>'
				   	+ '</tr>';
			}else{
				str += '<tr class="nonRead" onclick="detail('+item.no+')">'
				    + '<td onclick="event.cancelBubble=true" scope="row"><input class="chBox" type="checkbox" value="'+item.no+'" data-cartNum="'+item.no+'"></td>'
				    + '<td onclick="event.cancelBubble=true"><a href="#" onclick="reMessage('+item.officialNo+')">'+item.officialName
				    +'('+item.officialNo+')</a></td>'
				    + '<td>'+item.inOffi+'</td>'
				    + '<td><a href="#" >'+item.contents+'</a></td>'
				    + '<td>'+ moment(item.sendDate).format('YYYY-MM-DD HH:m')+'</td>'
				   	+ '</tr>';
			}
			    
		});

	}

	$("#messageTable").find("tbody").html(str);
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

function detail(no) {
	var win = window.open("<c:url value='/message/messageDetail?no='/>"+no, "_blank",
	"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=500,height=390");
	return false;
}
function reMessage(officialNo) {
	var win = window.open("<c:url value='/message/sendMessage?type=re&officialNo='/>"+officialNo, "_blank",
	"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=500,height=390");
	return false;
}
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<div id="messgaeInfo">
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
						<option value="official_name">이름</option>
						<option value="o.official_no">아이디</option>
						<option value="contents">내용</option>
					</select>
					<div class="input-group mb-2 mr-sm-2">
						<input type="text" class="form-control" name="searchKeyword"
							id="inlineFormInputGroupUsername2" placeholder="쪽지검색">
						<div class="input-group-append">
							<div class="input-group-text">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" 
									xmlns="http://www.w3.org/2000/svg" id="searchList">
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
				<button type="button" id="KeepMessage" class="btn btn-secondary" style="font-size: 0.9em; float: left;">
					<svg width="1.7em" height="1.7em" viewBox="0 0 16 16" class="bi bi-clipboard-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: white; vertical-align:middle;">
					  <path fill-rule="evenodd" d="M4 1.5H3a2 2 0 0 0-2 2V14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V3.5a2 2 0 0 0-2-2h-1v1h1a1 1 0 0 1 1 1V14a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V3.5a1 1 0 0 1 1-1h1v-1z"/>
					  <path fill-rule="evenodd" d="M9.5 1h-3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-3-1A1.5 1.5 0 0 0 5 1.5v1A1.5 1.5 0 0 0 6.5 4h3A1.5 1.5 0 0 0 11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3zM8 7a.5.5 0 0 1 .5.5V9H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V10H6a.5.5 0 0 1 0-1h1.5V7.5A.5.5 0 0 1 8 7z"/>
					</svg> 보관
				</button>
				<svg width="1.6em" height="1.6em" viewBox="0 0 16 16" style="float: right;" id="reList"
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
					<col width="10%">
					<col width="55%">
					<col width="15%">
				</colgroup>
			  <thead>
			    <tr>
			      <th scope="col"><input type="checkbox" id="checkAll"></th>
			      <th scope="col" id="thSender">보낸사람</th>
			      <th scope="col" id="thSender">받는사람</th>
			      <th scope="col">내용</th>
			      <th scope="col">날짜</th>
			    </tr>
			  </thead>
			  <tbody>
			  </tbody>
			</table>
			</div>
			<div id="messagePaging"></div>
		</div>

		<!-- 내용 입력 끝 -->
		<!-- bottom -->
		<%@ include file="../inc/bottom.jsp"%>