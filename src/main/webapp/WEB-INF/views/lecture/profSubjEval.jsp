<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<style>
	#profSubjEval th{
		text-align: center;
		font-weight: bold;
		font-size: 17px;
	}
	#profSubjEval tr{
		background-color: white;
	}
	
	#profSubjEval td{
		text-align: center;
	}
	
	#profSubjEval #title{
		margin: 15px 15px 30px 0;
	}
	
	#profSubjEval .hidden{
		display: none;
	}
	
	
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
/* 		function showContents(i) {
			var result = new Array();
			
			<c:forEach var="AllSubjAvgVO" items="${evalList}" >
				var json = new Object();
				json.subCode="${AllSubjAvgVO.subCode }";
				result.push(json);
			</c:forEach>
			
			console.log("jsonIfno=" + JSON.stringify(result));
			
			var subCode = result[i].subCode;
			alert(subCode);
			
			$.ajax({
				type:"get",
				url:"<c:url value='/lecture/ajax/evalContents' />",
				data : {subCode: subCode},
				async:false,
				dataType : "json",
				succeess:function(res){
					console.log("res : "+res);
				},error:function(xhr,status,error){
					alert(error);
				}
			});
		} */
		
/* 		function showContents(this) {
			$(this).css('background','black');
			console.log($(this).nextUntil('#trList'));
			$(this).nextUntil('#trList').toggleClass("hidden");
		} */
		
	$(function () {
			$('.evalContentsTr').toggleClass("hidden");
			$('.trList').click(function() {
				$(this).nextUntil('#trList').toggleClass("hidden");
			});
			
			var sbArray = new Array();
			$('.subName').each(function() {
				var subName =$(this).val();
				sbArray.push(subName);
			});
			
			var sumArray = new Array();
			$('.sumClass').each(function() {
				var sum = $(this).val();
				sumArray.push(sum);
			});
			
			console.log(sbArray);
			console.log(sumArray);
			var ctx = document.getElementById('myChart').getContext('2d');
			var str = sbArray;
			Chart.defaults.global.defaultFontSize = 17;
			Chart.defaults.global.defaultFontStyle = 'bold';
			var chart = new Chart(ctx, {
			    // The type of chart we want to create
			    type: 'horizontalBar',//horizontalBar
			    // The data for our dataset
			    data: {
			        labels: str,
			        datasets: [{
			            label: '총 평균점수',
			            barPercentage: 0.5,
			            barThickness: 6,
			            maxBarThickness: 8,
			            minBarLength: 2,
			            backgroundColor : 'rgba(233,196,241,1)',
			            data: sumArray
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
				            xAxes: [{
				                display: true,
				                stacked: true,
				                ticks: {
				                    max:80 // maximum value
				                }
				            }]
				        }
				}
			});	
			
		
	}); 
</script>

<style>
	#profSubjEval .trList:hover {
		font-weight: bold;
		background-color: #dbdbe896;
	}
</style>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
		<div id="profSubjEval"><!-- lectureController -->
			<div id="title">
				<span style="font-size: 40px; font-weight: bold;">${principal.name }</span>
				 <span style="font-size: 30px;">교수님 강의평가</span>
			 </div>
			 <canvas id="myChart" height="100">
			 
			 </canvas>
			 
			 
			<table class="table table-striped">
				<tr class= "table-success">
					<th>강의명</th>
					<th>강의코드</th>
					<th>Q1</th>
					<th>Q2</th>
					<th>Q3</th>
					<th>Q4</th>
					<th>Q5</th>
					<th>Q6</th>
					<th>Q7</th>
					<th>Q8</th>
					<th>총 평점</th>
<!-- 					<th>강의평</th> -->
				</tr>
					<c:if test="${empty evalList }">
						<td colspan="12">데이터가 존재하지 않습니다</td>
					</c:if>	
					<c:if test="${!empty evalList }">
					<c:set var="j" value="0"></c:set>
					<c:forEach var="AllSubjAvgVO" items="${evalList }">
						<input class="subName" value="${AllSubjAvgVO.subjName }" type="hidden">
						<tr id="trList" class="trList">
							<td style="text-align: left;">
									${AllSubjAvgVO.subjName }
							</td>
							
							<td>${AllSubjAvgVO.subCode }</td>
							<c:set var="vo" value="${AllSubjAvgVO.subjAvgVO }"></c:set>
							<td><fmt:formatNumber value="${vo.avgQ1 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ2 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ3 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ4 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ5 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ6 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ7 }" pattern=".0"/></td>
							<td><fmt:formatNumber value="${vo.avgQ8 }" pattern=".0"/></td>
							<c:set var="sum" value="${vo.avgQ1+vo.avgQ2+vo.avgQ3+vo.avgQ4+vo.avgQ5+vo.avgQ6+vo.avgQ7+vo.avgQ8 }"></c:set>
							<td>
							<input type="hidden" class="sumClass" value="${sum }">
							<c:if test="${sum>0 }">
							<fmt:formatNumber value="${sum }" pattern=".0"/>
							</c:if>
							</td>
<%-- 							<td>
								<c:if test="${vo.avgQ1 != null}">
									<a onclick="window.open('/portal/lecture/evalContents?subCode=${AllSubjAvgVO.subCode }&subjName=${AllSubjAvgVO.subjName }',
									'강의평보기','width=500,height=500')" 
									href="#">강의평 확인</a>
								</c:if>
								
							</td> --%>
						</tr>
							<c:set var="subjList" value="${AllSubjAvgVO.subjList }"></c:set>
							<c:if test="${!empty subjList }">
								<c:forEach var="Subj_evalVO" items="${subjList }">
									<tr id="evalContentsTr" class="evalContentsTr" style="background-color: #d6cdb41c;">
										<td colspan="11" style="text-align: left; font-size : 14px; padding: 0 0 0 12px;">${Subj_evalVO.content }</td>								
									</tr>
								</c:forEach>
							</c:if>
						<c:set var="j" value="${j+1 }"></c:set>
					</c:forEach>
					</c:if>
			</table>
				
		</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>