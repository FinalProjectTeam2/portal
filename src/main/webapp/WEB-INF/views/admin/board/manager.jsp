<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../../inc/mainSidebar.jsp"%>
<style>
#boardTop {
	overflow: hidden;
}

#boardTop * {
	float: left;
}

#boardTop .input-group.mb-3 {
	width: 30%;
}

#boardTop button {
	margin-left: 10px;
}
#boardTable {
	font-size: 0.9em;
}

#boardTable tbody tr {
	cursor: pointer;
}

#boardTable td{
	text-align: center;
}
#boardBtn button {
    float: right;
    margin-right: 10px;
}
#boardBtn{
	overflow: hidden;
}
</style>
<script>
	$(function() {
		getList();
		
		$("#boardDel").click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			if(confirm_val) {
			 	var checkArr = new Array();
			   
				$("input[class='chBox']:checked").each(function(){
					checkArr.push($(this).attr("data-cartNum"));
				});
			   
				if(checkArr.length < 1){
					alert('체크하셔야 합니다.');
					return false;
				}
				/* $.ajax({
					url : "<c:url value='/bookmark/delete'/>",
					data : { chbox : checkArr },
					type : "get",
					success : function(res) {
						if( typeof(getList) == 'function' ) {
							getList();
						}
						if( typeof(sideBookmark) == 'function' ) {
							sideBookmark();
						}
						
					}
				}); */
			}
		});
		
		$("#cateIn").click(function() {
			var win = window.open("<c:url value='/admin/board/cateIn'/>", "_blank",
			"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=560,height=390");
			return false;
		});
	});

	function getList() {
		$.ajax({
			url : "<c:url value='/admin/board/getList'/>",
			type : "get",
			dataType : "json",
			success : function(res) {
				var data = '<div class="input-group mb-3">'
						+ '<div class="input-group-prepend">'
						+ '<label class="input-group-text" for="cateSelect">카테고리</label>'
						+ '</div>'
						+ '<select class="custom-select" id="cateSelect">'
						+'<option selected>Choose...</option>';
						
				$.each(res, function(idx, item) {
					data += '<option value="'+item.categoryVo.categoryCode+'">'
							+ item.categoryVo.categoryName
							+ '</option>';
				});

				data += '</select>' + '</div>';
				$("#boardTop").prepend(data);
				
				$("#cateSelect").change(function() {
					getBoardList($("#cateSelect").val());
				});
			}
		});
	}

	function getBoardList(cateCode) {
		$.ajax({
			url : "<c:url value='/admin/board/getBoardList'/>",
			type : "get",
			dataType : "json",
			data : {
				cateCode : cateCode
			},
			success : function(res) {
				var data = '';
				if(res.length > 0){
					$.each(res, function(idx, item) {
						data += '<tr class="listData">'
							+ '<th scope="row"  onclick="event.cancelBubble=true">'
							+ '<input class="chBox" type="checkbox" value="'+ item.bdCode
							+ '" data-cartNum="'+item.bdCode+'">'
							+ '</th>'
							+'<th scope="row">'+ item.bdName +'</th>'
							+'<td>'+ item.usage +'</td>'
							+'<td>'+ item.isReply +'</td>'
							+'<td>'+ item.isComment +'</td>'
							+'<td>'+ item.isPrivate +'</td>'
							+'<td>'+ item.isUpload +'</td>'
							+'<td>'+ item.maxUpfile +'</td>'
							+'<td>'+ item.maxFilesize +'</td>'
							+'<td>'+ moment(item.regDate).format('YYYY-MM-DD') +'</td>'						
							+'<td>'+ moment(item.editDate).format('YYYY-MM-DD') +'</td>'
							+'</tr>';
					});
				}else{
					data = '<tr>'
						 + '<td colspan="11" style="text-align: center;">데이터가 없습니다.</td>'
						 + '</tr>';
				}
				
				$("#boardTable tbody").html(data);
				
				$("#checkAll").prop("checked",false); 
				$("#checkAll").click(function(){ 
					//만약 전체 선택 체크박스가 체크된상태일경우 
					if($("#checkAll").prop("checked")) { 
						//해당화면에 전체 checkbox들을 체크해준다 
						$(".chBox").prop("checked",true); 
						// 전체선택 체크박스가 해제된 경우 
					} else { 
						//해당화면에 모든 checkbox들의 체크를해제시킨다. 
						$(".chBox").prop("checked",false); 
					} 
				});
				
				$("#boardTable tbody .listData").click(function() {
					var bdCode = $(this).find("input").val();
					location.href = "<c:url value='/admin/board/boardEdit?bdCode='/>" + bdCode;
				});
			}
		});
	}
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<div id="boardTop">
			<button type="button" class="btn btn-primary" id="cateEdit">수정</button>
			<button type="button" class="btn btn-primary" id="cateDel">삭제</button>
			<button type="button" class="btn btn-primary" id="cateIn">등록</button>
		</div>
		<div id="boardList">
			<table class="table table-hover" id="boardTable">
				<colgroup>
					<col width="2%">
					<col width="16%">
					<col width="7%">
					<col width="7%">
					<col width="7%">
					<col width="8%">
					<col width="8%">
					<col width="8%">
					<col width="7%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr style="text-align: center;">
						<th scope="col"><input type="checkbox" id="checkAll"></th>
						<th scope="col">게시판이름</th>
						<th scope="col">사용여부</th>
						<th scope="col">댓글여부</th>
						<th scope="col">답변여부</th>
						<th scope="col">비밀글여부</th>
						<th scope="col">자료실여부</th>
						<th scope="col">업로드개수</th>
						<th scope="col">파일크기</th>
						<th scope="col">만든날짜</th>
						<th scope="col">수정날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="11" style="text-align: center;">데이터가 없습니다.</td>
					</tr>
				</tbody>
			</table>
			<div id="boardBtn">
				<button type="button" class="btn btn-primary" id="boardDel">삭제</button>
				<button type="button" class="btn btn-primary" id="boardIn">등록</button>
			</div>
		</div>

		<!-- 내용 입력 끝 -->
		<!-- bottom -->
		<%@ include file="../../inc/bottom.jsp"%>