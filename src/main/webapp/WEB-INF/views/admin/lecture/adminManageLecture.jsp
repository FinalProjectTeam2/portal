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
		subjList();
		//학부 선택시 해당되는 학과만 나오도록 함
		$('#faculty').change(function(){
			var facultyNo=$('#faculty option:selected').val();
			console.log(facultyNo);
			$.ajax({
				url:"<c:url value='/admin/lecture/adminManageLecture'/>",
				type:"post",
				data:{"facultyNo":facultyNo},
				success:function(res){
					var str="<option value='0'>---All---</option>";
					$.each(res.dList, function(index, item){
						str+="<option value='"+item.depNo+"'>"+item.depName+"</option>";
					});
						
						$('#major').html(str);
				}

			});
		});
		
		$('#btSearch').click(function(){
			subjList();
		});
		$('form[name=frmList]').submit(function(){
			subjList();
		});
		
		$('#btMultiDel').click(function(){
			var len=$('tbody input[type=checkbox]:checked').length;
			if(len==0){
				alert('삭제하려는 강의를 먼저 체크하세요');
				return;
			}
			$('form[name=frmList]').prop("action","<c:url value='/admin/lecture/deleteMultiLecture'/>");
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
	
	
	function subjList(){
		var typeCode=$('#subjType').val();
		var facultyNo=$('#faculty').val();
		var depNo=$('major').val();
		var subjName='';
		var profName='';
		var openSubCode='';
		if($('#searchSelect').val()=='subjName'){
			subjName=$('#searchKeyword').val();
		}else if($('#searchSelect').val()=='profName'){
			profName=$('#searchKeyword').val();
		}else if($('searchSelect').val()=='openSubCode'){
			openSubCode=$('#searchKeyword').val();
		}
		$.ajax({
			url:"<c:url value='/admin/lecture/openSubjList'/>",
			data:{
				"typeCode":typeCode,
				"facultyNo":facultyNo,
				"depNo":depNo,
				"subjName":subjName,
				"profName":profName,
				"openSubCode":openSubCode
			},
			dataType:"json",
			type:"post",
			success:function(res){
				var str = "";
				var count=res.count;
				var checkNull=res.checkNull;
				
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
						str+="</tr>";
						str+="</thead>";
						str+="<tbody><tr>";
						str+="<td colspan='8'>개설된 강의가 없습니다..</td></tr>";
						str+="</tbody></table>"

					}else if(checkNull=='N'){
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
							str+="</tr>";
							str+="</thead>";
							str+="<tbody>";
						var num=0;
						$.each(res.mList, function(idx, item){
							str+="<tr class='align_center'>";
							str+="<td><input type='checkbox' name='openSubList["+num+"].openSubCode' value='"+item.openSubCode+"'>";
							str+="<td>"+item.openSubCode+"</td>";
							str+="<td>"+item.subjName+"</td>";
							str+="<td>"+item.profName+"</td>";
							str+="<td>"+item.facultyName+"</td>";
							str+="<td>"+item.depName+"</td>";
							str+="</tr>";
							num++;
						});
							str+="</tbody>";
							str+="</table>"
					}

				$('#divList').html(str);
				$('#meta_1').find('em').text(count);

			}

		});
		
	}
	
	
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="adminMngMem">
			<h2>강의 관리</h2>
			<p>조회결과 :<span class="item" id="meta_1">총 조회건수<em>0</em> 건</span></p>


			<!-- 페이징 처리를 위한 form 시작-->
			<form name="frmPage" method="post">
				<input type="hidden" name="" value="${param.eventName }"> <input
					type="hidden" name="">
			</form>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post" >
				<div class="divRight">
					과목 <select name="subjType" id="subjType">
						<option value="all">----All----</option>
						<c:if test="${!empty sList }">
							<c:forEach var="sVo" items="${sList }">
								<option value=${sVo.typeCode }>${sVo.type }</option>
							</c:forEach>
						
						</c:if>
					</select>
					학부 <select name="faculty" id="faculty">
						<option value="0">---All---</option>
						<c:if test="${!empty fList }">
							<c:forEach var="fVo" items="${fList }">
								<option value="${fVo.facultyNo }">${fVo.facultyName }</option>
							</c:forEach>
						</c:if>
					</select>
					학과 <select name="major" id="major">
						<option value="0">---All---</option>
							<c:if test="${!empty dList }">
								<c:forEach var="dVo" items="${dList }">
									<option value="${dVo.depNo }">${dVo.depName }</option>
								</c:forEach>
							</c:if>
					</select>
					<select name="" id="searchSelect">
						<option value="subjName">과목명</option>
						<option value="profName">교수명</option>
						<option value="openSubCode">강의번호</option>
					</select>
					<input type="text" size="8" name="searchKeyword" id="searchKeyword">
					<button type="button" class="btCustom btn btn-primary btn-lg login-button" id="btSearch">검색</button>
				
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
					<input type="button" class="btCustom btn btn-primary btn-lg login-button" id="btAdd" value="강의 추가"><br>
				</div>
				<div class="btdiv">
					<input type="button" class="btCustom btn btn-primary btn-lg login-button" id="btMultiDel" value="선택한 강의 삭제"><br>
				</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>