<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>" rel="stylesheet">
<style>
#searchSelect{
	margin: 0 5px 0 3px;
}

</style>
<script type="text/javascript">
	$(function(){
		subjList(1);
		$('#btMultiDel').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제하려는 강의를 먼저 체크하세요');
				return;
			}
			$('form[name=frmList]')
	.prop("action","<c:url value='/admin/product/deleteMulti.do'/>");
			$('form[name=frmList]').submit();
		});	
		
		$("input[name=chkAll]").click(function(){
			$('tbody input[type=checkbox]')
				.prop('checked', this.checked);	
		});
		
		$('#btMultiAdd').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('상태를 변경하려는 강의를 먼저 체크하세요');
				return;
			}
			
			$('form[name=frmList]')
	.prop("action","<c:url value='/admin/product/eventMulti.do'/>");
			$('form[name=frmList]').submit();
		});	
	});//document.ready
	
	function boardList(curPage){
		$("input[name=currentPage]").val(curPage);
		$('form[name=frmPage]').submit();
	}
	
	
	function subjList(curPage){
		$.ajax({
			url:"<c:url value='/registration/openSubjList'/>",
			data:{
				"facultyNo":"0",
				"depNo":"111"
			},
			dataType:"json",
			type:"post",
			success:function(res){
				var str = "";
				var count=res.count;
				var checkNull=res.checkNull;
				var num=1;
				console.log(checkNull);
					if(checkNull=='Y'){
						str+="<table class='box2' summary='강의 목록'>";
						str+="<caption>강의 목록</caption>";
						str+="<colgroup>";
						str+="<col style='width: 5%'/>";	
						str+="<col style='width: 10%'/>";
						str+="<col style='width: 23%'/>";
						str+="<col style='width: 16%'/>";
						str+="<col style='width: 15%'/>";
						str+="<col style='width: 15%'/>";
						str+="<col style='width: 8%'/>";
						str+="<col style='width: 8%'/>";
						str+="</colgroup>";
						str+="<thead>";
						str+="<tr>";
						str+="<th><input type='checkbox' name='chkAll'></th>";
						str+="<th scope='col'>강의 번호</th>";
						str+="<th scope='col'>과목명</th>";
						str+="<th scope='col'>교수명</th>";
						str+="<th scope='col'>학부</th>";
						str+="<th scope='col'>학과</th>";
						str+="<th scope='col'>수정</th>";
						str+="<th scope='col'>삭제</th>";
						str+="</tr>";
						str+="</thead>";
						str+="<tbody><tr>";
						str+="<td colspan='8'>개설된 강의가 없습니다..</td></tr>";
						str+="</tbody></table>"

					}else if(checkNull=='N'){
						$.each(res.list, function(idx, item){
							str+="<table class='box2' summary='강의 목록'>";
							str+="<caption>강의 목록</caption>";
							str+="<colgroup>";
							str+="<col style='width: 5%'/>";	
							str+="<col style='width: 10%'/>";
							str+="<col style='width: 23%'/>";
							str+="<col style='width: 16%'/>";
							str+="<col style='width: 15%'/>";
							str+="<col style='width: 15%'/>";
							str+="<col style='width: 8%'/>";
							str+="<col style='width: 8%'/>";
							str+="</colgroup>";
							str+="<thead>";
							str+="<tr>";
							str+="<th><input type='checkbox' name='chkAll'></th>";
							str+="<th scope='col'>강의 번호</th>";
							str+="<th scope='col'>과목명</th>";
							str+="<th scope='col'>교수명</th>";
							str+="<th scope='col'>학부</th>";
							str+="<th scope='col'>학과</th>";
							str+="<th scope='col'>수정</th>";
							str+="<th scope='col'>삭제</th>";
							str+="</tr>";
							str+="</thead>";
							str+="<tbody>";
							str+="<tr class='align_center'>";
							str+="<td><input type='checkbox' name='' value='"+num+"'>";
							str+="<td>"+item.openSubCode+"</td>";
							str+="<td>"+item.subjName+"</td>";
							str+="<td>"+item.profName+"</td>";
							str+="<td></td>";
							str+="<td></td>";
							str+="<td><a href='#''>수정</a></td>";
							str+="<td><a href='#''>삭제</a></td>";
							str+="</tr>";
							str+="</tbody>";
							str+="</table>"
						});
					}

				$('#divList').html(str);

				$('#meta_1').find('em').text(res.count);




			}



		});
		
	}
	
	
	
	
	
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="adminMngMem">
			<h2>강의 관리</h2>
			<p>조회결과 : {}건</p>


			<!-- 페이징 처리를 위한 form 시작-->
			<form name="frmPage" method="post" action="<c:url value='/admin'/>">
				<input type="hidden" name="" value="${param.eventName }"> <input
					type="hidden" name="">
			</form>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post" action="<c:url value='/admin'/>">
				<div class="divRight">
					과목 <select name="">
						<option disabled selected>&nbsp;--</option>
						<option value="">전공</option>
						<option value="">교양</option>
					</select>
					학부 <select name="">
						<option disabled selected>&nbsp;--</option>
						<option value="">공대</option>
						<option value="">미대</option>
					</select>
					학과 <select name="">
						<option disabled selected>&nbsp;--</option>
						<option value="">경제</option>
						<option value="">컴공</option>
					</select>
					<select name="" id="searchSelect">
						<option value="">과목명</option>
						<option value="">교수명</option>
						<option value="">강의번호</option>
					</select>
					<input type="text" size="8" name="searchKeyword">
					<button class="btCustom btn btn-primary btn-lg login-button" id="btSearch">검색</button>
				
				<div id="divList">
					
				</div>
				<div class="divPage">
					<!-- 페이지 번호 추가 -->
					<c:if test="${pagingInfo.firstPage>1 }">
						<a href="#" onclick="boardList(${pagingInfo.firstPage-1})"> <img
							src='<c:url value="/resources/images/first.JPG" />' border="0">
						</a>
					</c:if>

					<!-- [1][2][3][4][5][6][7][8][9][10] -->
					<c:forEach var="i" begin="${pagingInfo.firstPage }"
						end="${pagingInfo.lastPage }">
						<c:if test="${i==pagingInfo.currentPage }">
							<span style="color: blue; font-weight: bold">${i }</span>
						</c:if>
						<c:if test="${i!=pagingInfo.currentPage }">
							<a href="#" onclick="boardList(${i})"> [${i }] </a>
						</c:if>
					</c:forEach>

					<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
						<a href="#" onclick="boardList(${pagingInfo.lastPage+1})"> <img
							src="<c:url value="/resources/images/last.JPG" />" border="0">
						</a>
					</c:if>
					<!--  페이지 번호 끝 -->
				</div>

				<div class="btdiv">
					<input type="button" class="btCustom btn btn-primary btn-lg login-button" id="btMultiDel" value="강의 추가"><br>
				</div>
				<div class="btdiv">
					<input type="button" class="btCustom btn btn-primary btn-lg login-button" id="btMultiDel" value="선택한 강의 삭제"><br>
				</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>