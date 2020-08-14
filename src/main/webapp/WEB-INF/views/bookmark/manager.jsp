<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/login.css'/>">
<style type="text/css">
#bookmarkManager #loginBt{
	width: 100px;
}
#bookmarkManager .btn{
	margin: 5px 0px 20px 10px;
	border: 1px solid #01539d;
	width: 100px;
}
#bookmarkManager .btn:hover{
	color: #01539d;
}
</style>
<script type="text/javascript">
	$(function() {
		getList();
		
		$("#insertBt").click(function() {
			$("#bookmarkUrl").val('');
		});
		
		$("#editBookmark").submit(function() {
			$.ajax({
				url : "<c:url value='/bookmark/edit'/>",
				data : {
					url : $("#editUrl").val(),
					name : $("#editName").val(),
					no : $("#editBookmarkNo").val()
				},
				type : "post",
				success : function() {
					alert("수정완료!");
					$('#editModal').modal('toggle');
					if( typeof(getList) == 'function' ) {
						getList();
					}
					if( typeof(sideBookmark) == 'function' ) {
						sideBookmark();
					}
				}
			});
			return false;
		});
		
		$("#delBt").click(function() {
		 	var checkArr = new Array();
		   
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartNum"));
			});
			
			if(checkArr.length < 1){
				alert("체크하세요");
				   return;
			   }
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			  
			if(confirm_val) {
			   
				$.ajax({
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
				});
			}
		});
	});
	
	function getList() {
		$.ajax({
			url : "<c:url value='/bookmark/ajax/list'/>",
			type : "get",
			dataType : "json",
			success : function(res) {
				var data = '';
				if(res.length >0){
					$.each(res, function(idx, item) {
						data += '<tr>'
							+ '<th scope="row">'
							+ '<input class="chBox" type="checkbox" value="'+ item.no
							+ '" data-cartNum="'+item.no+'">'
							+ '</th><td class="markName">'+ item.name+'</td>'
							+ '<td class="markURL">'+ item.url +'</td>'
							+ '<td><a href="#" data-toggle="modal" class="editBt"'
						 	+ ' data-target="#editModal" data-whatever="@getbootstrap">수정</a></td>'
							+ '</tr>';
					});
				}else{
					data = '<tr><td colspan="3">등록된 즐겨찾기가 없습니다.<td></tr>';
				}
				
				$("#bookmarkTable tbody").html(data);
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
				
				$(".editBt").click(function() {
					$("#editBookmarkNo").val($(this).parent().parent().find(".chBox").val());
					$("#editUrl").val($(this).parent().parent().find(".markURL").html());
					$("#editName").val($(this).parent().parent().find(".markName").html());
				});
			}
		});
	};
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<div id="bookmarkManager">
		<div id="bts">
			<input type="button" value="삭제" class="btn login_btn" id="delBt">
			<input class="btn login_btn" type="button" data-toggle="modal" id="insertBt"
			 	data-target="#exampleModal" data-whatever="@getbootstrap" value="등록">
		</div>
		<table class="table" id="bookmarkTable">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" id="checkAll"></th>
					<th scope="col">이름</th>
					<th scope="col">URL</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		</div>
		<!-- 내용 입력 끝 -->
		<!-- bottom -->
		<%@ include file="../inc/bottom.jsp"%>