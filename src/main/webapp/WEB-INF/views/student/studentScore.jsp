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
	padding: 50px !important;
}
</style>

<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<h2>성적 조회</h2>
			<form name="frmList" method="post">
				<div class="divRight">
				<select name="semester" id="searchSelect">
						<option value="">전체학기</option>
						<c:if test="${!empty list }">
						<c:forEach var="i" begin="0" step="1" end="${fn:length(slist)-1}">
						<option value="${slist[i] }">${slist2[i]}</option>
						</c:forEach>
						</c:if>
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
								<c:set var="total" value="0"/>
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
									<c:set var="grade" value="4.50"/>
									</c:when>
									<c:when test="${score>=90}">
									A
									<c:set var="grade" value="4.00"/>
									</c:when>
									<c:when test="${score>=85}">
									B+
									<c:set var="grade" value="3.50"/>
									</c:when>
									<c:when test="${score>=80}">
									B
									<c:set var="grade" value="3.00"/>
									</c:when>
									<c:when test="${score>=75}">
									C+
									<c:set var="grade" value="2.50"/>
									</c:when>
									<c:when test="${score>=70}">
									C
									<c:set var="grade" value="2.00"/>
									</c:when>
									<c:when test="${score>=65}">
									D+
									<c:set var="grade" value="1.50"/>
									</c:when>
									<c:when test="${score>=60}">
									D
									<c:set var="grade" value="1.00"/>
									</c:when>
									<c:otherwise>
									F
									<c:set var="score" value="0"/>
									</c:otherwise>
									</c:choose>
									</td>
								</tr>
								<c:set var="total" value="${total+(map['CREDIT']*grade) }"/>
								</c:forEach>
								<tr>
									<c:if test="${!empty list }">
									<td colspan="7" class="colspan"><span>취득학점&nbsp;:&nbsp; ${cre}&nbsp;&nbsp;&nbsp; 평점&nbsp; : &nbsp;${total/cre}</span></td>
									</c:if>
									<c:if test="${empty list }">
									<td colspan="7" class="colspan"><span>수강내역이 없습니다.</span></td>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>