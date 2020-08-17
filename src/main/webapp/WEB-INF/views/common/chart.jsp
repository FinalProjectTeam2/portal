<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
$(function() {
	var ctx = document.getElementById('myChart').getContext('2d');
	var str = ['January', 'February', 'March', 'April', 'May', 'June', 'July'];
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'line',

	    // The data for our dataset
	    data: {
	        labels: str,
	        datasets: [{
	            label: 'My First dataset',
	            backgroundColor: '#00000000',
	            borderColor: 'rgb(255, 99, 132)',
	            data: [0, 10, 5, 2, 20, 30, 45]
	        },{
	        	label: 'My Second dataset',
	            backgroundColor: '#00000000',
	            borderColor: 'blue',
	            data: [10, 5, 10, 0, 10, 45, 10]
	        }]
	    },

	    // Configuration options go here
	    options: {}
	});
});

</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<!-- 내용 입력 시작 -->
		<canvas id="myChart"></canvas>
		
		<!-- 내용 입력 끝 -->
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>