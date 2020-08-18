<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/admin/adminManageMember.js'/>"></script>

<script>
$(function() {
	
	   $('#deleteBt').click(function() {
			if(!confirm('정말로 삭제하시겠습니까?')){
				event.preventDefault();
			}
		});
    $('#btMultiUpdateposition').click(function() {
       var len=$('tbody input[type=checkbox]:checked').length;
       if(len==0){
          alert('직급을 변경하려는 교수를 선택하세요');
          return;
       }else if($('#positionNo').val() == '0'){
          alert('변경하려는 직급을 선택하세요');
          return;
       }
       
       $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiUpdateposition'/>");
       $('form[name=frmList]').submit();
    });
    
    
    $('#btMultiDel').click(function() {
       var len=$('tbody input[type=checkbox]:checked').length;
       if(len==0){
          alert('학적상태를 변경하려는 학생부터 선택하세요');
          return;
    
       }
       
       $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiDeleteProfessor'/>");
       $('form[name=frmList]').submit();
    
    });
    
    
});
</script>


<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<div class="divTop">
				<h2>교수 관리</h2>
				<input type="button" class="btTop btCustom btn btn-primary" id="bt1"
					value="학생 관리"
					onclick="location.href='<c:url value="/admin/member/adminManageStudent"/>'"><input
					type="button" class="btTop btCustom btn btn-primary" id="bt2"
					onclick="location.href='<c:url value="/admin/member/adminManageProfessor"/>'"
					value="교수 관리"> <input type="button"
					class="btTop btCustom btn btn-primary" id="bt3" value="직원 관리"
					onclick="location.href='<c:url value="/admin/member/adminManageEmployee"/>'">
				<!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post"
					action="<c:url value='/admin/member/adminManageProfessor'/>">
					<input type="hidden" name="profName"
						value="${profSearchVo.profName}"> <input type="hidden"
						name="facultyNo" value="${profSearchVo.facultyNo}"> <input
						type="hidden" name="depNo" value="${profSearchVo.depNo}">
					<input type="hidden" name="positionNo1"
						value="${profSearchVo.positionNo1}"> <input type="hidden"
						name="positionNo2" value="${profSearchVo.positionNo2}"> <input
						type="hidden" name="positionNo3"
						value="${profSearchVo.positionNo3}"> <input type="hidden"
						name="positionNo4" value="${profSearchVo.positionNo4}"> <input
						type="hidden" name="positionNo5"
						value="${profSearchVo.positionNo5}"> <input type="hidden"
						name="startNo" value="${profSearchVo.startNo}"> <input
						type="hidden" name="endNo" value="${profSearchVo.endNo}">
					<input type="hidden" name="currentPage">
				</form>
			</div>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post"
				action="<c:url value='/admin/member/adminManageProfessor'/>">
				<div class="divRight">
					<div class="divTop">
						<div class="stud">
							<label for="faculty"><span>학부</span></label> <select
								name="facultyNo" id="faculty">
								<option value="">선택</option>
								<c:forEach var="facVo" items="${facultyList }">
									<option value="${facVo.facultyNo }"
										<c:if test="${facVo.facultyNo==param.facultyNo }">
									 selected="selected"
									</c:if>>${facVo.facultyName }</option>
								</c:forEach>
							</select> <label for="department"><span>학과</span></label> <select
								name="depNo" class="rightEnd" id="department">
								<c:if test="${empty param.facultyNo }">
									<option value="0">학부를 선택하세요</option>
								</c:if>
								<c:if test="${!empty param.facultyNo }">
									<option value='0'>선택</option>
									<c:forEach var="vo" items="${departmentList}">
										<option value="${vo.depNo}"
											<c:if test="${param.depNo==vo.depNo }">
									 selected="selected" 
									</c:if>>${vo.depName }</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
						<div class="ckState stud">
							<input type="checkbox" name="stateAll" value="0" id="selectAll"><label
								for="selectAll">전체</label>

							<c:set var="positionCB"
								value="${profSearchVo.positionNo1} ${profSearchVo.positionNo2} ${profSearchVo.positionNo3}
								${profSearchVo.positionNo4} ${profSearchVo.positionNo5}" />
							<c:forEach var="vo" items="${profPositionList}">
								<input type="checkbox" name="position" value="${vo.positionNo }"
									id="${vo.positionNo }"
									<c:if test="${fn:indexOf(positionCB,vo.positionNo)>-1 }">
									 checked="checked"
								</c:if>>
								<label for="${vo.positionNo }"> ${vo.positionName }</label>
							</c:forEach>
						</div>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now }" var="year" pattern="yyyy" />
						등록년도<select name="startNo" class="date">
							<c:forEach var="i" begin="1990" end="${year }">
								<option value="${i }"
									<c:if test="${i==param.startNo }">
									 selected="selected"
									</c:if>>${i }</option>
							</c:forEach>
						</select>~<select name="endNo" class="date">
							<c:forEach var="j" begin="0" end="39">
								<option value="${year-j }"
									<c:if test="${year-j==param.endNo }">
									 selected="selected"
									</c:if>>${year-j }</option>
							</c:forEach>
						</select> 이름 <input type="text" name="profName"
							value="${profSearchVo.profName}">
						<button class="btCustom btn btn-primary btn-lg login-button"
							id="btSearch">검색</button>
						<p style="float: left">조회결과 : ${pagingInfo.totalRecord }건</p>
					</div>
					<div class="divList">
						<table class="box2" summary="교수 목록">
							<caption>교수 목록</caption>
							<colgroup>
								<col style="width: 6%" />
								<!-- 체크박스 -->
								<col style="width: 11%" />
								<!-- 번호 -->
								<col style="width: 16%" />
								<!-- 이름 -->
								<col style="width: 11%" />
								<!-- 학부 -->
								<col style="width: 21%" />
								<!-- 학과 -->
								<col style="width: 11%" />
								<!-- 학기 -->
								<col style="width: 15%" />
								<!-- 학적 -->
								<col style="width: 9%" />
								<!-- <col style="width: 8%" /> -->
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="chkAll"></th>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">학부</th>
									<th scope="col">학과</th>
									<th scope="col">교수직급</th>
									<th scope="col">부임일</th>
									<th scope="col">수정</th>
									<!-- <th scope="col">삭제</th> -->
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list }">
									<tr>
										<td colspan="9">결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
									<c:set var="idx" value="0"></c:set>
									<c:forEach var="map" items="${list }">
										<tr>
											<td><input type="checkbox"
												name="profList[${idx }].profNo" value="${map['PROF_NO']}"></td>
											<td>${map['PROF_NO']}</td>
											<td>${map['PROF_NAME']}</td>
											<td>${map['FACULTY_NAME']}</td>
											<td>${map['DEP_NAME']}</td>
											<td>${map['POSITION_NAME']}</td>
											<td><fmt:formatDate value="${map['START_DATE']}"
													pattern="yyyy-MM-dd" /></td>
											<td><a
												href="<c:url value='/admin/member/memberEdit?officialNo=${map["PROF_NO"] }'/>">수정</a></td>
											<%-- <td><a id="deleteBt"
												href="<c:url value='/admin/member/deleteProfessor?profNo=${map["PROF_NO"] }'/>">삭제</a></td> --%>
										</tr>
										<c:set var="idx" value="${idx+1 }"></c:set>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
					<div class="divPage">
						<!-- 페이지 번호 추가 -->
						<c:if test="${pagingInfo.firstPage>1 }">
							<a href="#" onclick="boardList(${pagingInfo.firstPage-1})"
								class="imgNext"> <img
								src='<c:url value="/resources/images/first.JPG" />' border="0">
							</a>
							<a href="#" style="color: #3333339c" onclick="boardList(1)">
								1 </a>
							<span style="color: #3333339c">&nbsp; ... &nbsp;</span>
						</c:if>

						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage }"
							end="${pagingInfo.lastPage }">
							<c:if test="${i==pagingInfo.currentPage }">
								<span class="pageA">${i }</span>
							</c:if>
							<c:if test="${i!=pagingInfo.currentPage }">
								<a href="#" style="color: #3333339c" onclick="boardList(${i})">
									${i } </a>
							</c:if>
						</c:forEach>

						<c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
							<span style="color: #3333339c">&nbsp; ... &nbsp;</span>
							<a href="#" style="color: #3333339c"
								onclick="boardList(${pagingInfo.totalPage})">
								${pagingInfo.totalPage } </a>
							<a href="#" onclick="boardList(${pagingInfo.lastPage+1})"
								class="imgNext"> <img
								src="<c:url value="/resources/images/last.JPG" />" border="0">
							</a>
						</c:if>
						<!--  페이지 번호 끝 -->
					</div>
					<div class="divRight">
						<select name="positionNo" id="positionNo">
							<option value="0">직책 변경</option>
							<c:forEach var="vo" items="${profPositionList}">
								<option value="${vo.positionNo }">${vo.positionName }</option>
							</c:forEach>
						</select> <input type="button" id="btMultiUpdateposition" value="변경">
					</div>
					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							onclick="location.href='<c:url value="/admin/member/adminRegisterMember?sort=2"/>'"
							id="btInsert" value="회원 추가"><br>
					</div>
	<!-- 				<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							id="btMultiDel" value="선택한 교수 삭제"><br>
					</div> -->
				</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>