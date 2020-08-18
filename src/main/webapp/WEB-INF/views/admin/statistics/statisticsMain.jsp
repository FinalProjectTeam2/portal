<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style>
.indexDOM_large {
	width: 650px;
	float: left;
	margin: 2%;
	background: #f5f5f5;
	height: 400px;
	overflow: hidden;
	position: relative;
	padding: 5px 10px;
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
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.7.0"></script>
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
							'rgba(255, 99, 132, 0.2)' ],
					borderColor : [ 'rgba(54, 162, 235, 1)',
							'rgba(153, 102, 255, 1)', 
							'rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)',
							'rgba(255, 99, 132, 1)' ],
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
			        },
			        plugins: {
			            datalabels: {
			                color: '#111',
			                textAlign: 'center',
			                font: {
			                    lineHeight: 1.6
			                },
			                formatter: function(value, ctx1) {
			                    return ctx1.chart.data.labels[ctx1.dataIndex] + '\n' + value;
			                }
			            }
			        }
			}
			
		});

		
		/*두번째 doughnut  */
		var ctx2 = document.getElementById('myChart2').getContext('2d');
		var myChart2 = new Chart(ctx2, {
			type : 'doughnut',
			data : {
				labels : ${boardListCh},
				datasets : [ {
					label : '게시글 수',
					data : ${countListCh},
					backgroundColor : [ 'rgba(54, 162, 235, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(255, 159, 64, 0.2)',
						'rgba(255, 99, 132, 0.2)' ],
				borderColor : [ 'rgba(54, 162, 235, 1)',
						'rgba(153, 102, 255, 1)', 
						'rgba(75, 192, 192, 1)', 'rgba(255, 159, 64, 1)',
						'rgba(255, 99, 132, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				 legend: {
			            labels: {
			                fontSize: 14
			            }
			        },
			       circumference : Math.PI,
			       rotation : -Math.PI,
			       tooltips: {
			            enabled: true
			        },
			       plugins: {
			            datalabels: {
			                color: '#111',
			                textAlign: 'center',
			                font: {
			                    lineHeight: 1.6
			                },
			                formatter: function(value, ctx2) {
			                    return ctx2.chart.data.labels[ctx2.dataIndex] + '\n' + value+"개";
			                }
			            }
			        }
			}
			
		});
		
		
		/*세번째 */
		var MONTHS = [ 'January', 'February', 'March', 'April', 'May', 'June',
				'July', 'August', 'September', 'October', 'November',
				'December' ];
		var color = Chart.helpers.color;
		var barChartData = {
			labels : [ 'January', 'February', 'March', 'April', 'May' ],
			datasets : [
					{
						label : 'Dataset 1',
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1,
						data : [ 20, 40, 50,30,40 ]
					},
					{
						label : 'Dataset 2',
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)' ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' ],
						borderWidth : 1,
						data : [ 40, 30, 20, 40,30 ]
					} ]

		};

		var ctx3 = document.getElementById('myChart3').getContext('2d');
		var myChart3 = new Chart(ctx3, {
			type : 'bar',
			data : barChartData,
			options : {
				responsive : true,
				legend : {
					position : 'top',
				},
				title : {
					display : true,
					text : 'Chart.js Bar Chart'
				}
			}
		});

		/*세번째  */
		/* var ctx3 = document.getElementById('myChart3').getContext('2d');
		var myChart3 = new Chart(ctx3, {
			type : 'doughnut',
			data : {
				labels : ${depListCh},
				datasets : [ {
					label : '',
					data : ${scoreListCh},
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(255, 159, 64, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(255, 159, 64, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				 legend: {
			            labels: {
			                fontSize: 17
			            }
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
			
		}); */
	})
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="overflow: hidden;" id="box">
			<div class="indexDOM_large">
				<p class="title">
					학과별 성적 <span class="pSpan">(평균 백분율 상위 학과)</span>
					<a href="/portal/admin/statistics/statisticsScore" style="float: right;">더보기</a>
				</p>
				<canvas id="myChart1" class="chart"></canvas>
			</div>
			<div class="indexDOM_large">
				<p class="title">
					인기 게시판 <span class="pSpan">(최근 1달 게시물 수)</span>
				</p>
				<canvas id="myChart2" class="chart"></canvas>
			</div>
			<div class="indexDOM_large">
				<p class="title">
					학생수 대비 개설인원<span class="pSpan"></span>
				</p>
				<canvas id="myChart3" class="chart"></canvas>
			</div>
			<div class="indexDOM_large">
				<p class="title">titi</p>
			</div>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>