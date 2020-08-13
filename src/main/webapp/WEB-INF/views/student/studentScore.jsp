<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/admin/adminManageMember.css'/>"
	rel="stylesheet">
<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> -->
<style>
#searchSelect {
	margin: 5px 5px 0 3px;
}

table.box2 td {
	border: solid 1px;
}

.colspan {
	border: none !important;
	font-weight: bold;
	padding: 50px !important;
	color: #626d80;
}

.total {
	border: none !important;
	font-weight: bold;
	padding: 50px !important;
}

#myChart {
	display: block;
	width: 80%;
	height: 100%;
	margin: auto;
}

#btChart {
	width: 100px;
	height: 30px;
	font-size: 1em;
	padding: 0;
	margin: 0;
}

.divLeft {
	position: absolute;
}

.colLeft {
	border-left: none !important;
	border-right: none !important;
	padding: 14px !important;
	color: #626d80;
	text-align: left;
	font-weight: 500;
}

span.fontLar {
	font-size: 1.2em;
	color: #2f353e;
}
</style>
<!-- <script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'X', '1', '2', '3', '4', '5', '6' ], [ 1, 2, 3, 4, 5, 6, 7 ],
				[ 2, 3, 4, 5, 6, 7, 8 ], [ 3, 4, 5, 6, 7, 8, 9 ],
				[ 4, 5, 6, 7, 8, 9, 10 ], [ 5, 6, 7, 8, 9, 10, 11 ],
				[ 6, 7, 8, 9, 10, 11, 12 ] ]);

		var options = {
			legend : 'none',
			hAxis : {
				maxValue : 7
			},
			vAxis : {
				maxValue : 13
			},
			lineWidth : 10,
			colors : [ '#e2431e', '#d3362d', '#e7711b', '#e49307', '#e49307',
					'#b9c246' ]
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script> -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="adminMngMem">
			<h2>성적 조회</h2>
			<form name="frmList" method="post">
				<input type="hidden" value="${principal.name }" id="name">
				<div class="divRight">
					<c:if test="${param.semester ==null || param.semester==''}">
						<div class="divLeft">
							<button type="button"
								class="btCustom btn btn-primary btn-lg login-button"
								id="btChart">성적그래프</button>
						</div>
					</c:if>
					<select name="semester" id="searchSelect">
						<option value="">전체학기</option>
						<c:if test="${!empty slist }">
							<c:forEach var="i" begin="0" step="1" end="${fn:length(slist)-1}">
								<option value="${slist[i] }"
									<c:if test="${slist[i]==param.semester}">
						 selected="selected"
						</c:if>>${slist2[i]}</option>
							</c:forEach>
						</c:if>
					</select>
					<button class="btCustom btn btn-primary btn-lg login-button"
						id="btSearch">조회</button>
					<c:if test="${param.semester ==null || param.semester==''}">

					</c:if>
					<div class="divList">
						<!-- <div id="chart_div" style="width: 900px; height: 500px;"></div> -->
						<c:set var="chart" value="<%=new int[] {}%>" />
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
								<c:set var="ttotal" value="0" />
								<c:set var="tcre" value="0" />
								<c:forEach var="list" items="${tlist}">
									<c:set var="cre" value="0" />
									<c:set var="total" value="0" />
									<tr>
										<td colspan="7" class="colLeft"><span><fmt:formatDate
													value="${list[0]['OPEN_DATE']}" pattern="yyyy" />년 <fmt:formatDate
													value="${list[0]['OPEN_DATE']}" var="semester" pattern="MM" />
												<c:if test="${semester==2 }">
									1학기
									</c:if> <c:if test="${semester==8 }">
									2학기
									</c:if></span></td>
									</tr>
									<c:set var="idx" value="${idx+1}"/>
									<c:forEach var="map" items="${list}">
										<tr class="align_center">
											<td style="border-left: none;"><fmt:formatDate
													value="${map['OPEN_DATE']}" pattern="yyyy" /> <%-- ${map['OPEN_DATE'] } --%>
											</td>
											<td><fmt:formatDate value="${map['OPEN_DATE'] }"
													var="semester" pattern="MM" /> <c:if
													test="${semester==2 }">
									1학기
									</c:if> <c:if test="${semester==8 }">
									2학기
									</c:if></td>
											<td>${map['TYPE'] }</td>
											<td>${map['SUBJ_NAME'] }</td>
											<td>${map['PROF_NAME'] }</td>
											<td>${map['CREDIT'] }<c:set var='cre'
													value="${cre+map['CREDIT'] }" />
											</td>
											<td style="border-right: none;"><c:set var="score"
													value="${map['TOTAL_GRADE']}" /> <c:choose>
													<c:when test="${score>=95}">
									A+
									<c:set var="grade" value="4.50" />
													</c:when>
													<c:when test="${score>=90}">
									A
									<c:set var="grade" value="4.00" />
													</c:when>
													<c:when test="${score>=85}">
									B+
									<c:set var="grade" value="3.50" />
													</c:when>
													<c:when test="${score>=80}">
									B
									<c:set var="grade" value="3.00" />
													</c:when>
													<c:when test="${score>=75}">
									C+
									<c:set var="grade" value="2.50" />
													</c:when>
													<c:when test="${score>=70}">
									C
									<c:set var="grade" value="2.00" />
													</c:when>
													<c:when test="${score>=65}">
									D+
									<c:set var="grade" value="1.50" />
													</c:when>
													<c:when test="${score>=60}">
									D
									<c:set var="grade" value="1.00" />
													</c:when>
													<c:otherwise>
									F
									<c:set var="score" value="0" />
													</c:otherwise>
												</c:choose></td>
										</tr>
										<c:set var="total" value="${total+(map['CREDIT']*grade) }" />
									</c:forEach>
									<tr>
									
										<c:if test="${!empty list }">
											<td colspan="7" class="colspan"><span>취득학점&nbsp;:&nbsp;
													${cre}&nbsp;&nbsp;&nbsp; 평점&nbsp; : &nbsp;${total/cre}</span></td>
											<%-- <c:set var="chart" value="${chart+(total/cre)}"></c:set> --%>
											<c:set var="tcre" value="${tcre+cre}" />
											<c:set var="ttotal" value="${ttotal+total}" />
										</c:if>
									</tr>
								</c:forEach>
								<tr>
									<c:if test="${!empty slist }">
										<c:if test="${param.semester ==null || param.semester==''}">
											<td colspan="7" class="total"><span class="fontLar">총
													취득학점&nbsp;:&nbsp; ${tcre}&nbsp;&nbsp;&nbsp; 총 평점&nbsp; :
													&nbsp;${ttotal/tcre}</span></td>
										</c:if>
									</c:if>
									<c:if test="${empty slist }">
										<td colspan="7" class="total"><span>수강내역이 없습니다.</span></td>
									</c:if>
								</tr>
							</tbody>
						</table>
					</div>
			</form>
		</div>
		<%@ include file="../inc/bottom.jsp"%>