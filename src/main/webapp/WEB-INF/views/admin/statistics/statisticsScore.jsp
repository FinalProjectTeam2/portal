<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style>
.indexDOM_large {
	width: 1400px;
	margin: auto;
	float: none;
	background: #f5f5f5;
	height: 100%;
	overflow: hidden;
	position: relative;
	padding: 5px 10px;
	background: #f5f5f5;
}

.container .indexDOM_large .title {
	margin: 10px 5px;
	font-weight: bold;
	font-size: 1.2em;
}

.chart {
	width: 100% !important;
}

.pSpan {
	font-size: 0.7em;
	color: #838383;
}

.box2 thead {
	background-color: #f2f5fc;
	border-top: 1px solid #70bded;
	border-bottom: 1px solid #e5e5e5;
}

table {
	border-collapse: collapse;
	margin: 100px 0 26% 50px;
	width: 800px;
	float: left;
}

table * {
	padding: 2%;
	text-align: center;
}

table td {
	border-bottom: 1px solid #e5e5e5;
}

.condition {
	width: 450px;
	height: 500px;
	padding: 35px 50px;
	margin: 99px 0px 0px 914px;
	border: 1px solid #b7bcc7;
	float: left;
	position: absolute;
	border-radius: 5px;
}

input[type='radio'] {
	margin: 0 5px 0 1px;
	width: 15px;
	height: 15px;
}

label.radio {
	margin: 0 12px 0 1px;
}

.typeh5 {
	color: #595c5d;
	margin: 50px 0 10px 0;
}

button#search {
	margin: 70px -12px 0 0;
	float: right;
}
button#back {
    float: right;
    margin: 1% 14px 2% 0;
}
h2#none{
	margin: 30px 0;
	text-align: center;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<script type="text/javascript">
	$(function() {

		/*첫번째 */
		var ctx1 = document.getElementById('myChart1').getContext('2d');
		var myChart1 = new Chart(ctx1, {
			type : 'bar',
			data : {
				labels : ${depListCh},
				datasets : [ {
					label : '우수 학과',
					data : ${scoreListCh},
					backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(255, 159, 64, 0.2)',
							'rgba(255, 99, 132, 0.2)'],
					borderColor : [ 'rgba(54, 162, 235, 1)',
							'rgba(153, 102, 255, 1)', 
							'rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)',
							 'rgba(54, 162, 235, 1)',
								'rgba(153, 102, 255, 1)', 
								'rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)',
								'rgba(255, 99, 132, 1)'],
					borderWidth : 1
				} ]
			},
			options : {
				 legend: {
			            labels: false
			        },
			        scales: {
			            yAxes: [{
			                display: true,
			                stacked: true,
			                ticks: {
			                    min: 
			                    	<c:if test="${min-5<0}">
			                    	${min}
			                    	</c:if>
			                    	<c:if test="${min-5>=0}">
			                    	${min-5}
			                    	</c:if>, // minimum value
			                    max: 100 // maximum value
			                }
			            }]
			        }
			}
			
		});

		
	})
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="overflow: hidden;" id="box">
		<button type="button" class="btn btn-primary" id="back"
		onclick="location.href='/portal/admin/statistics/statisticsMain'">돌아가기</button>
			<div class="indexDOM_large">
				<p class="title">
					학과별 성적 <span class="pSpan">(평균 백분율 상위 학과)</span>
				</p>
				<c:if test="${empty scoreListCh}">
					<h2 id="none">결과가 없습니다</h2>
				</c:if>
				<c:if test="${!empty scoreListCh}">
					<canvas id="myChart1" class="chart"></canvas>
				</c:if>
			</div>
		</div>
		<div style="overflow: hidden;" id="box">
			<table class="box2">
				<colgroup>
					<col style="width: 25%" />
					<!-- 번호 -->
					<col style="width: 25%" />
					<!-- 이름 -->
					<col style="width: 25%" />
					<!-- 학부 -->
					<col style="width: 25%" />
					<!-- 학과 -->
				</colgroup>
				<thead>
					<tr>
						<th scope="col">학과명</th>
						<th scope="col">평균</th>
						<th scope="col">중간값</th>
						<th scope="col">
						<c:if test="${empty param.type || param.type==1 }">
						평균값 순위
						</c:if>
						<c:if test="${param.type==2 }">
						중간값 순위
						</c:if>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty scoreList }">
						<tr>
							<td colspan="4" style="padding: 5%;">결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty scoreList }">
						<!--반복시작-->
						<c:forEach var="map" items="${scoreList }">
							<tr>
								<td>${map['DEP_NAME']}</td>
								<td>${map['avg']}</td>
								<td>${map['med']}</td>
								<td>${map['ROWNUM']}</td>
							</tr>
						</c:forEach>
						<!-- 반복 끝 -->
					</c:if>
				</tbody>
			</table>
			<div class="condition">
				<form name="frm" method="post">
					<h4 style="color: #4bafed">조건 설정</h4>
					<h5 class="typeh5">학기</h5>
					<select name="semester" id="searchSelect">
						<option value="0">전체학기</option>
						<c:if test="${!empty slist }">
							<c:forEach var="i" begin="0" step="1" end="${fn:length(slist)-1}">
								<option value="${slist[i] }"
									<c:if test="${slist[i]==param.semester}">
						 selected="selected"
						</c:if>>${slist2[i]}</option>
							</c:forEach>
						</c:if>
					</select> <br>
					<h5 class="typeh5">학적</h5>
					<label class="radio"><input type="radio" name="state"
						value="1" 
						<c:if test="${empty param.state || param.state==1}">
						checked
						</c:if>
						>재학생</label> <label class="radio"><input
						type="radio" name="state" value="2"
						<c:if test="${param.state==2}">
						checked
						</c:if>
						>졸업생</label> <label
						class="radio"><input type="radio" name="state" value="3"
						<c:if test="${param.state==3}">
						checked
						</c:if>
						>전체</label>
					<h5 class="typeh5">정렬 기준</h5>
					<label class="radio"><input type="radio" name="type"
						value="1" 
						<c:if test="${empty param.type || param.type==1}">
						checked
						</c:if>
						>평균</label> <label class="radio"><input
						type="radio" name="type" value="2"
						<c:if test="${param.type==2}">
						checked
						</c:if>
						>중간값</label>
					<button class="btn btn-primary" id="search">조회</button>
				</form>
			</div>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>