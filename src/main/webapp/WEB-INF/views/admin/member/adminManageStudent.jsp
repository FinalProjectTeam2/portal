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
      $('#btMultiUpdateState').click(function() {
         var len=$('tbody input[type=checkbox]:checked').length;
         if(len==0){
            alert('학적상태를 변경하려는 학생부터 선택하세요');
            return;
         }else if($('#states').val() == '0'){
            alert('변경하려는 학적상태를 선택하세요');
            return;
         }
         
         $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiUpdateState'/>");
         $('form[name=frmList]').submit();
      });
   
      $('#btMultiDel').click(function() {
         var len=$('tbody input[type=checkbox]:checked').length;
         if(len==0){
            alert('학적상태를 변경하려는 학생부터 선택하세요');
            return;
      
         }
         
         $('form[name=frmList]').prop("action","<c:url value='/admin/member/multiDelete'/>");
         $('form[name=frmList]').submit();
      
      });
   
   
   });

</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<div class="divTop">
				<h2>학생 관리</h2>
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
					action="<c:url value='/admin/member/adminManageStudent'/>">
					<input type="hidden" name="name" value="${studentSearchVo.name}">
					<input type="hidden" name="facultyNo"
						value="${studentSearchVo.facultyNo}"> <input type="hidden"
						name="major" value="${studentSearchVo.major}"> <input
						type="hidden" name="state1" value="${studentSearchVo.state1}">
					<input type="hidden" name="state2"
						value="${studentSearchVo.state2}"> <input type="hidden"
						name="state3" value="${studentSearchVo.state3}"> <input
						type="hidden" name="state4" value="${studentSearchVo.state4}">
					<input type="hidden" name="state5"
						value="${studentSearchVo.state5}"> <input type="hidden"
						name="state6" value="${studentSearchVo.state6}"> <input
						type="hidden" name="startNo" value="${studentSearchVo.startNo}">
					<input type="hidden" name="endNo" value="${studentSearchVo.endNo}">
					<input type="hidden" name="currentPage">
				</form>
			</div>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post"
				action="<c:url value='/admin/member/adminManageStudent'/>">
				<div class="divRight">
					<div class="divTop">
						<div class="stud">
							<label for="faculty"><span>학부</span></label> <select
								name="facultyNo" id="faculty">
								<option value="0">선택</option>
								<c:forEach var="facVo" items="${facultyList }">
									<option value="${facVo.facultyNo }"
										<c:if test="${facVo.facultyNo==param.facultyNo }">
									 selected="selected"
									</c:if>>${facVo.facultyName }</option>
								</c:forEach>
							</select> <label for="department"><span>학과</span></label> <select
								name="major" class="rightEnd" id="department">
								<option value="0">학부를 선택하세요</option>
							</select>
						</div>
						<div class="ckState stud">
							<input type="checkbox" name="stateAll" value="0" id="selectAll"><label
								for="selectAll">전체</label>


							<c:forEach var="vo" items="${stateList}">
								<input type="checkbox" name="state" value="${vo.state }"
									id="${vo.state }">
								<label for="${vo.state }"> ${vo.stateName }</label>
							</c:forEach>
						</div>
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now }" var="year" pattern="yyyy" />
						학번<select name="startNo" class="date">
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
						</select> 이름 <input type="text" name="name">
						<button class="btCustom btn btn-primary btn-lg login-button"
							id="btSearch">검색</button>
						<p style="float: left">조회결과 : ${pagingInfo.totalRecord }건</p>
					</div>
					<div class="divList">
						<table class="box2" summary="학생 목록">
							<caption>학생 목록</caption>
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
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">학부</th>
									<th scope="col">학과</th>
									<th scope="col">학기</th>
									<th scope="col">학적 상태</th>
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
								<!--반복시작-->
								<c:set var="idx" value="0"/>
									<c:forEach var="map" items="${list }">
										<tr>
											  <td><input type="checkbox" name="stuList[${idx }].stuNo"
                                    value="${map['STU_NO']}"></td>
											<td>${map['STU_NO']}</td>
											<td>${map['NAME']}</td>
											<td>${map['FACULTY_NAME']}</td>
											<td>${map['DEP_NAME']}</td>
											<td>${map['SEMESTER']}</td>
											<td>${map['STATE_NAME']}</td>
											<td><a
												href="<c:url value='/admin/member/memberEdit?officialNo=${map["STU_NO"] }'/>">수정</a></td>
											<td><a
												href="<c:url value='/admin/member/deleteStudent?stuNo=${map["STU_NO"] }'/>">삭제</a></td>
										</tr>
										  <c:set var="idx" value="${idx+1 }"/>
									</c:forEach>
									<!-- 반복 끝 -->
								</c:if>
								<%--	<c:if test="${!empty list }">
									<!-- 반복 시작 -->
									<c:set var="idx" value="0" />
									<c:forEach var="vo" items="${list }">
										<c:if test="${!empty list }">
											<!-- 반복 시작 -->
											<c:set var="idx" value="0" />
											<c:forEach var="vo" items="${list }">
												<tr class="align_center">
													<td><input type="checkbox"
														name="pdItems[${idx }].productNo" value="${vo. }">
														<input type="hidden" name="pdItems[${idx}].imageURL"
														value="${vo.imageURL}"></td>
													<td><a href=""> <img
															src="<c:url value='/pd_images/${vo.imageURL}'/>"
															alt="${vo.productName }" width="50"></a></td>
													<td class="align_left">${vo.productName }</td>
													<td class="align_right"><fmt:formatNumber
															value="${vo.sellPrice }" pattern="#,###" />원</td>
													<td><fmt:formatDate value="${vo.regDate }"
															pattern="yyyy-MM-dd" /></td>
													<td><a href="#">수정</a></td>
													<td><a href="#">삭제</a></td>
												</tr>
												<c:set var="idx" value="${idx+1 }" />
											</c:forEach>
											<!-- 반복 끝 -->
										</c:if>
										<c:set var="idx" value="${idx+1 }" />
									</c:forEach>
									<!-- 반복 끝 -->
								</c:if> --%>
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
                  <select name="states" id="states">
                     <option value="0">학적상태 변경</option>
                     <option value="1">신입생</option>
                     <option value="2">재학생</option>
                     <option value="3">휴학생</option>
                     <option value="4">졸업가능생</option>
                     <option value="5">졸업생</option>
                     <option value="6">제적생</option>
                  </select>
                  <input type="button" id="btMultiUpdateState" value="변경" >
               </div>

					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							onclick="location.href='<c:url value="/admin/member/adminRegisterMember?sort=3"/>'"
							id="btInsert" value="회원 추가"><br>
					</div>
					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button"
							id="btMultiDel" value="선택한 학생 삭제"><br>
					</div>
				</div>
			</form>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>