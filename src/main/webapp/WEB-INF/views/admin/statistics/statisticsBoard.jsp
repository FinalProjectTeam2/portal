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
	float: right;
	padding: 15px 25px 20px 0;
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

button#back {
	float: right;
	margin: 1% 14px 2% 0;
}

select {
	margin: 15px 15px 0 0;
}

button#search {
	margin-bottom: 3px;
}

#box2 {
	margin-top: 100px;
}

.indexDOM_large {
	padding-bottom: 5%;
}

h2 {
	margin: 60px 0 30px 0;
	text-align: center;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
<script type="text/javascript">
	$(function() {

		var ctx2 = document.getElementById('myChart2').getContext('2d');
		var myChart2 = new Chart(ctx2, {
			type : 'pie',
			data : {
				labels : ${boardListCh},
				datasets : [ {
					label : '게시글 수',
					data : ${countListCh},
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
			            labels: {
			                fontSize: 14
			            }
			        },
			       plugins: {
			            datalabels: {
			                color: '#111',
			                textAlign: 'center',
			                font: {
			                    lineHeight: 1.6
			                },
			                display: function(ctx3) {
	                            return ctx3.dataset.data[ctx3.dataIndex] > 1;
	                        },
			                formatter: function(value, ctx2) {
			                    return ctx2.chart.data.labels[ctx2.dataIndex] + '\n' + value+"개";
			                }
			            }
			        }
			}
			
		});

		//2nd
		var ctx3 = document.getElementById('myChart3').getContext('2d');
		var myChart3 = new Chart(ctx3, {
			type : 'pie',
			data : {
				labels : ${boardListCh2},
				datasets : [ {
					label : '조회수',
					data : ${countListCh2},
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
			            labels: {
			                fontSize: 14
			            }
			        },
			       plugins: {
			            datalabels: {
			                color: '#111',
			                textAlign: 'center',
			                font: {
			                    lineHeight: 1.6
			                },
			                display: function(ctx3) {
	                            return ctx3.dataset.data[ctx3.dataIndex] > 5;
	                        },
			                formatter: function(value, ctx3) {
			                    return ctx3.chart.data.labels[ctx3.dataIndex] + '\n' + value+"회";
			                }
			            }
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
				<form name="frm" method="post">
					<div class="condition">
						<select name="time" id="time">
							<option value="">전체기간</option>
							<option value="7"
								<c:if test="${param.time==7}">
						 selected="selected"
						</c:if>>일주일
								이내</option>
							<option value="30"
								<c:if test="${param.time==30}">
						 selected="selected"
						</c:if>>한달
								이내</option>
							<option value="90"
								<c:if test="${param.time==90}">
						 selected="selected"
						</c:if>>세달
								이내</option>
							<option value="360"
								<c:if test="${param.time==360}">
						 selected="selected"
						</c:if>>일년
								이내</option>
						</select>
						<button class="btn btn-primary" id="search">조회</button>
					</div>
				</form>
				<p class="title">
					게시물 개수
					<c:if test="${!empty param.time}">
						<span class="pSpan">(${param.time} 일 이내)</span>
					</c:if>
				</p>
				<c:if test="${empty boardListCh}">
					<h2>결과가 없습니다</h2>
				</c:if>
				<c:if test="${!empty boardListCh}">
					<canvas id="myChart2" class="chart"></canvas>
				</c:if>
			</div>
		</div>
		<div style="overflow: hidden;" id="box2">
			<div class="indexDOM_large">
				<p class="title">
					조회수
					<c:if test="${!empty param.time}">
						<span class="pSpan">(${param.time} 일 이내)</span>
					</c:if>
				</p>
				<c:if test="${empty boardListCh2}">
					<h2>결과가 없습니다</h2>
				</c:if>
				<c:if test="${!empty boardListCh2}">
					<canvas id="myChart3" class="chart"></canvas>
				</c:if>
			</div>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>