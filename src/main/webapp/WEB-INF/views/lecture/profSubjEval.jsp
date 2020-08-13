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
				</tr>
					<c:if test="${empty evalList }">
						<td colspan="11">데이터가 존재하지 않습니다</td>
					</c:if>	
					<c:if test="${!empty evalList }">
					<c:forEach var="AllSubjAvgVO" items="${evalList }">
						<tr>
							<td style="text-align: left;">${AllSubjAvgVO.subjName }</td>
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
						</tr>
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