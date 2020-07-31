<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:url value='/resources/js/admin/adminManageMember.js'/>"></script>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="adminMngMem">
			<div class="divTop">
				<h2>직원 관리</h2>
				<input type="button" class="btTop btCustom btn btn-primary" id="bt1"
					value="학생 관리" onclick="location.href='<c:url value="/admin/member/adminManageStudent"/>'"><input type="button"
					class="btTop btCustom btn btn-primary" id="bt2" onclick="location.href='<c:url value="/admin/member/adminManageProfessor"/>'" value="교수 관리">
				<input type="button" class="btTop btCustom btn btn-primary" id="bt3"
					value="직원 관리" onclick="location.href='<c:url value="/admin/member/adminManageEmployee"/>'">
				<!-- 페이징 처리를 위한 form 시작-->
				<form name="frmPage" method="post"
					action="<c:url value='/admin/member/adminManageStudent'/>">
					<input type="hidden" name="sort" value="${param.sort }"> <input
						type="hidden" name="currentPage">
				</form>
			</div>
			<!-- 페이징 처리 form 끝 -->

			<form name="frmList" method="post"
				action="<c:url value='/admin/member/adminManageStudent'/>">
				<div class="divRight">
					<div class="divTop">
					<div class="emp">
							<label for="depCode">부서</label> <select name="depCode"
							id="depCode">
							<option value="">선택</option>
							<c:forEach var="vo" items="${empDepartList }">
								<option value="${vo.depCode }">${vo.depName }</option>
							</c:forEach>
						</select> <label for="authCode">권한</label> <select name="authCode"
							id="authCode">
							<option value="">선택</option>
							<c:forEach var="vo" items="${authorityList }">
								<option value="${vo.authCode }">${vo.authName }</option>
							</c:forEach>
						</select> <label for="positionCode">직책</label> <select name="positionCode"
							id="positionCode" class="rightEnd">
							<option value="">선택</option>
							<c:forEach var="vo" items="${empPositionList }">
								<option value="${vo.positionCode }">${vo.positionName}</option>
							</c:forEach>
						</select>
					</div>


					이름 <input type="text" size="8" name="searchKeyword">
					<button class="btCustom btn btn-primary btn-lg login-button"
						id="btSearch">검색</button>
					<p style="float: left">조회결과 : {}건</p>
					</div>
					<div class="divList">
						<table class="box2" summary="학생 목록">
							<caption>학생 목록</caption>
							<colgroup>
								<col style="width: 5%" />
								<col style="width: 10%" />
								<col style="width: 15%" />
								<col style="width: 20%" />
								<col style="width: 20%" />
								<col style="width: 14%" />
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
									<th scope="col">학적 상태</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="pdItems[].productNo"
										value=""> <input type="hidden"
										name="pdItems[].imageURL" value=""></td>
									<td>202031230001</td>
									<td>학생킹</td>
									<td>학부</td>
									<td>학과</td>
									<td>신입생</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">삭제</a></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="pdItems[].productNo"
										value=""> <input type="hidden"
										name="pdItems[].imageURL" value=""></td>
									<td>202031230001</td>
									<td>학생킹</td>
									<td>학부</td>
									<td>학과</td>
									<td>신입생</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">삭제</a></td>
								</tr>
								<tr>
									<td><input type="checkbox" name="pdItems[].productNo"
										value=""> <input type="hidden"
										name="pdItems[].imageURL" value=""></td>
									<td>202031230001</td>
									<td>학생킹</td>
									<td>학부</td>
									<td>학과</td>
									<td>신입생</td>
									<td><a href="#">수정</a></td>
									<td><a href="#">삭제</a></td>
								</tr>

								<%-- 	<c:if test="${empty list }">
									<tr>
										<td colspan="8">결과가 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty list }">
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
						<%-- 	<c:if test="${pagingInfo.firstPage>1 }">
							<a href="#" onclick="boardList(${pagingInfo.firstPage-1})"> <img
								src='<c:url value="/resources/images/first.JPG" />' border="0">
							</a>
						</c:if> --%>

						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<%-- 	<c:forEach var="i" begin="${pagingInfo.firstPage }"
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
						</c:if> --%>
						<!--  페이지 번호 끝 -->
					</div>

					<div class="btdiv">
						<input type="button"
							class="btCustom btn btn-primary btn-lg login-button" onclick="location.href='<c:url value="/admin/member/adminManageStudent"/>'"
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