<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<style>
#searchSelect {
	margin: 0 5px 0 3px;
}

table.box2 td {
	border: solid 1px;
}
.colspan{
	border: none !important;
	font-weight: bold;
	padding: 25px !important;
}
</style>

<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<h2>성적 조회</h2>
			<form name="frmList" method="post" action="<c:url value='/admin'/>">
				<div class="divRight">
				<select name="" id="searchSelect">
						<option value="">전체학기</option>
						<c:forEach var="semester" items="${slist }">
						<option value="">${semester }</option>
						
						</c:forEach>
						<option value="">2019 2학기</option>
					</select> 
					<button class="btCustom btn btn-primary btn-lg login-button"
						id="btSearch">조회</button>
					<div class="divList">
						<table class="box2" summary="강의 목록">
							<caption>성적 조회</caption>
							<colgroup>
								<col style="width: 5%" />
								<col style="width: 5%" />
								<col style="width: 10%" />
								<col style="width: 40%" />
								<col style="width: 20%" />
								<col style="width: 10%" />
								<col style="width: 10%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">년도</th>
									<th scope="col">학기</th>
									<th scope="col">이수구분</th>
									<th scope="col">교과목명</th>
									<th scope="col">교수명</th>
									<th scope="col">학점</th>
									<th scope="col">성적</th>
								</tr>
							</thead>
							<tbody>					
								<c:set var="cre" value="0"/>
								<c:set var="avg" value="0"/>
								<c:forEach var="map" items="${list}">
								<tr class="align_center">
									<td style="border-left: none;">
									<fmt:formatDate value="${map['OPEN_DATE']}" pattern="yyyy" />
									<%-- ${map['OPEN_DATE'] } --%>
									</td>
									<td>
									<fmt:formatDate value="${map['OPEN_DATE'] }" var="semester" pattern="MM" />
									<c:if test="${semester==2 }">
									1학기
									</c:if>
									<c:if test="${semester==8 }">
									2학기
									</c:if>
									</td>
									<td>${map['TYPE'] }</td>
									<td>${map['SUBJ_NAME'] }</td>
									<td>${map['PROF_NAME'] }</td>
									<td>${map['CREDIT'] }
									<c:set var='cre' value="${cre+map['CREDIT'] }"/>
									</td>
									<td style="border-right: none;">
									<c:set var="score" value="${map['TOTAL_GRADE']}"/>
									<c:choose>
									<c:when test="${score>=95}">
									A+
									</c:when>
									<c:when test="${score>=90}">
									A
									</c:when>
									<c:when test="${score>=85}">
									B+
									</c:when>
									<c:when test="${score>=80}">
									B
									</c:when>
									<c:when test="${score>=75}">
									C+
									</c:when>
									<c:when test="${score>=70}">
									C
									</c:when>
									<%-- <c:when test="${score=='P' }">
									P
									</c:when> --%>
									<c:otherwise>
									F
									</c:otherwise>
									</c:choose>
									</td>
								</tr>
								</c:forEach>
								<tr>
									<td colspan="7" class="colspan"><p>취득학점 : ${cre} 평점 : 4.5</p></td>
								</tr>
								<tr class="align_center">
									<td style="border-left: none;">2019</td>
									<td>1학기</td>
									<td>전공필수</td>
									<td>인류가 멸망한 이유에 대한 연구 세미나</td>
									<td>타노스</td>
									<td>3</td>
									<td style="border-right: none;">A+</td>
								</tr>
								<tr class="align_center">
									<td style="border-left: none;">2019</td>
									<td>1학기</td>
									<td>전공선택</td>
									<td>인공지능 임베디드 프로그램 제작</td>
									<td>토니 스타크</td>
									<td>3</td>
									<td style="border-right: none;">A+</td>
								</tr>
								<tr class="align_center">
									<td style="border-left: none;">2019</td>
									<td>1학기</td>
									<td>일반교양</td>
									<td>재미있는 곤충 채집</td>
									<td>피터 파커</td>
									<td>2</td>
									<td style="border-right: none;">A+</td>
								</tr>
								<tr>
									<td colspan="7" class="colspan">취득학점 : 8 &nbsp; 평점 : 4.5</td>
								</tr>
								<%-- 		<c:set var="idx" value="${idx+1 }" />
								</c:forEach>
								<!-- 반복 끝 -->
							</c:if> --%>
							</tbody>
						</table>
					</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>