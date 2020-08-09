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
    $('#btMultiUpdateposition').click(function() {
       var len=$('tbody input[type=checkbox]:checked').length;
       if(len==0){
          alert('직급을 변경하려는 직원를 선택하세요');
          return;
       }else if($('#positionC').val() == '0'){
          alert('변경하려는 직급을 선택하세요');
          return;
       }
       
       $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiUpdateEmpPosition'/>");
       $('form[name=frmList]').submit();
    });
    
    
    $('#btMultiDel').click(function() {
       var len=$('tbody input[type=checkbox]:checked').length;
       if(len==0){
          alert('학적상태를 변경하려는 학생부터 선택하세요');
          return;
    
       }
       
       $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiDeleteEmployee'/>");
       $('form[name=frmList]').submit();
    
    });
    
    
});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<div class="divTop">
				<h2>직원 관리</h2>
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
					action="<c:url value='/admin/member/adminManageEmployee'/>">
					<input type="hidden" name="empName" value="${empSearchVo.empName}">
					<input type="hidden" name="depCode" value="${empSearchVo.depCode}">
					<input type="hidden" name="positionCode"
						value="${empSearchVo.positionCode}"> <input type="hidden"
						name="authCode1" value="${empSearchVo.authCode1}"> <input
						type="hidden" name="authCode2" value="${empSearchVo.authCode2}">
					<input type="hidden" name="authCode3"
						value="${empSearchVo.authCode3}"> <input type="hidden"
						name="startNo" value="${empSearchVo.startNo}"> <input
						type="hidden" name="endNo" value="${empSearchVo.endNo}"> <input
						type="hidden" name="currentPage">
				</form>
			</div>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post"
				action="<c:url value='/admin/member/adminManageEmployee'/>">
				<div class="divRight">
					<div class="divTop">
						<div class="stud">
							<label for="depCode"><span>부서</span></label> <select
								name="depCode" id="depCode">
								<option value="">선택</option>
								<c:forEach var="vo" items="${empDepartList }">
									<option value="${vo.depCode }"
										<c:if test="${vo.depCode==param.depCode }">
									 selected="selected"
									</c:if>>${vo.depName }</option>
								</c:forEach>
							</select> <label for="positionCode"><span>직책</span></label> <select
								name="positionCode" id="positionCode">
								<option value="">선택</option>
								<c:forEach var="vo" items="${empPositionList }">
									<option value="${vo.positionCode }"
										<c:if test="${vo.positionCode==param.positionCode }">
									 selected="selected"
									</c:if>>${vo.positionName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="ckState stud">
							<input type="checkbox" name="stateAll" value="0" id="selectAll"><label
								for="selectAll">전체</label>
							<c:set var="authCB"
								value="${empSearchVo.authCode1} ${empSearchVo.authCode2} ${empSearchVo.authCode3}" />
							<c:forEach var="vo" items="${authorityList}">
								<input type="checkbox" name="authCode" value="${vo.authCode }"
									id="${vo.authCode }"
									<c:if test="${fn:indexOf(authCB,vo.authCode)>-1 }">
									 checked="checked"
								</c:if>>
								<label for="${vo.authCode }"> ${vo.authName }</label>
							</c:forEach>
						</div>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now }" var="year" pattern="yyyy" />
						입사연도<select name="startNo" class="date">
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
						</select> 이름 <input type="text" name="empName"
							value="${empSearchVo.empName}">
						<button class="btCustom btn btn-primary btn-lg login-button"
							id="btSearch">검색</button>
						<p style="float: left">조회결과 : ${pagingInfo.totalRecord }건</p>
					</div>
					<div class="divList">
						<table class="box2" summary="직원 목록">
							<caption>직원 목록</caption>
							<colgroup>
								<col style="width: 5%" />
								<!-- 체크박스 -->
								<col style="width: 10%" />
								<!-- 번호 -->
								<col style="width: 15%" />
								<!-- 이름 -->
								<col style="width: 10%" />
								<!-- 학부 -->
								<col style="width: 20%" />
								<!-- 학과 -->
								<col style="width: 10%" />
								<!-- 학기 -->
								<col style="width: 14%" />
								<!-- 학적 -->
								<col style="width: 8%" />
								<col style="width: 8%" />
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" name="chkAll"></th>
									<th scope="col">사번</th>
									<th scope="col">이름</th>
									<th scope="col">부서</th>
									<th scope="col">직책</th>
									<th scope="col">권한</th>
									<th scope="col">입사일</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
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
											<td><input type="checkbox" name="empList[${idx }].empNo"
												value="${map['EMP_NO']}"></td>
											<td>${map['EMP_NO']}</td>
											<td>${map['EMP_NAME']}</td>
											<td>${map['DEP_NAME']}</td>
											<td>${map['POSITION_NAME']}</td>
											<td>${map['AUTH_NAME']}</td>
											<td><fmt:formatDate value="${map['START_DATE']}"
													pattern="yyyy-MM-dd" /></td>
											<td><a
												href="<c:url value='/admin/member/memberEdit?officialNo=${map["EMP_NO"] }'/>">수정</a></td>
											<td><a
												href="<c:url value='/admin/member/deleteEmployee?empNo=${map["EMP_NO"] }'/>">삭제</a></td>
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
						<select name="positionC" id="positionC">
							<option value="0">직책 변경</option>
							<c:forEach var="vo" items="${empPositionList}">
								<option value="${vo.positionCode }">${vo.positionName }</option>
							</c:forEach>
						</select> <input type="button" id="btMultiUpdateposition" value="변경">
					</div>
					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							onclick="location.href='<c:url value="/admin/member/adminRegisterMember?sort=1"/>'"
							id="btInsert" value="회원 추가"><br>
					</div>
					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							id="btMultiDel" value="선택한 직원 삭제"><br>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>