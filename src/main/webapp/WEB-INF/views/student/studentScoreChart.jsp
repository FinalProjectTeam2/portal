<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<style>
#btBack {
	float: right;
	margin: 50px 0 50px 0;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
	$(function() {
		var ctx = document.getElementById('myChart').getContext('2d');
		var str = ${slistCh};
		var chart = new Chart(ctx, {
			// The type of chart we want to create
			type : 'line',

			// The data for our dataset
			data : {
				labels : str,
				datasets : [ {
					label : '${stuName}의 성적',
					backgroundColor : '#00000000',
					borderColor : '#4babef',
					data : ${dlist}
				}]
			},

			// Configuration options go here
			options : {
				 legend: {
			            labels: {
			                // This more specific font property overrides the global property
			                fontSize: 20
			            }
			        },
			        scales: {
			            yAxes: [{
			                display: true,
			                stacked: true,
			                ticks: {
			                    min: ${min}, // minimum value
			                    max: 4.5 // maximum value
			                }
			            }]
			        }
			}
		});
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<canvas id="myChart"></canvas>
		<button type="button" onclick="location.href='/portal/student/studentScore'"
								class="btCustom btn btn-primary btn-lg login-button"
								id="btBack">돌아가기</button>

		<%@ include file="../inc/bottom.jsp"%>