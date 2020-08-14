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
	#profSubjEval td{
		text-align: center;
	}
	
	#profSubjEval #title{
		margin: 15px 15px 30px 0;
	}
	
</style>
<script>
		function showContents(i) {
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
		}
		
</script>


<!-- main 시작 -->
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
		<div id="profSubjEval"><!-- lectureController -->
			<div id="title">
				<span style="font-size: 40px; font-weight: bold;">${principal.name }</span>
				 <span style="font-size: 30px;">교수님 강의평가</span>
			 </div>
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
					<th>총점</th>
					<th>강의평</th>
				</tr>
					<c:if test="${empty evalList }">
						<td colspan="12">데이터가 존재하지 않습니다</td>
					</c:if>	
					<c:if test="${!empty evalList }">
					<c:set var="j" value="0"></c:set>
					<c:forEach var="AllSubjAvgVO" items="${evalList }">
						<tr>
							<td style="text-align: left;">
							<%-- ${AllSubjAvgVO.subjName } --%>
								<c:if test="${!empty AllSubjAvgVO.subjAvgVO }">
									<a href="#" onclick="showContents(${j});">${AllSubjAvgVO.subjName }</a>
								</c:if>
								<c:if test="${empty AllSubjAvgVO.subjAvgVO }">
									${AllSubjAvgVO.subjName }
								</c:if> 
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
							<c:if test="${sum>0 }">
							<fmt:formatNumber value="${sum }" pattern=".0"/>
							</c:if>
							</td>
							<td>
								<c:if test="${vo.avgQ1 != null}">
									<a onclick="window.open('/portal/lecture/evalContents?subCode=${AllSubjAvgVO.subCode }&subjName=${AllSubjAvgVO.subjName }',
									'강의평보기','width=500,height=500')" 
									href="#">강의평 확인</a>
								</c:if>
								
							</td>
						</tr>
						<c:set var="j" value="${j+1 }"></c:set>
					</c:forEach>
					</c:if>
			</table>
			<div>
				<ul>
					
				</ul>
			</div>
				
		</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>