<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<!-- main 시작 -->
<script>

 $(function() {
	$('#evalForm').submit(function() {
		if(!confirm('강의평가 제출 후 수정은 불가능합니다. 정말 제출 하시겠습니까?')){
			event.preventDefault();
		}
	});
});
</script>
<style>
	#subjEval #title{
		font-size: 20px;
		font-weight: bold;
	}
	
/* 	#subjEval .lecLab{
		width: 20%;
		float: left;
	} */
</style>
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
	<div id="subjEval">
		<div>
			<p id="title">강의평가</p>
		</div>
		<div style="margin-bottom: 10px;">
			<label class="lecLab">강의명 : </label>
			<span>dd</span>
			<br>
			<label class="lecLab">담당교수 : </label>
			<span>dd</span>
		</div>
		<form id="evalForm" name="evalForm" method="post" action="<c:url value='/student/subjEval' />"><!-- studentController -->
			<input type="hidden" name="subjCode" value="MRC-111-101">
	   	<ul>
	   		<li>
				<label>Q1. 나는 수업에 적극적으로 참여하였다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value1').innerHTML=this.value;">
					<span id="value1">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q2. 강의는 수업계획서 대로 진행되었다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value2').innerHTML=this.value;">
					<span id="value2">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q3. 수업계획서에는 강의에 관한 정보가 체계적이고 명확하게 제시되었다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value3').innerHTML=this.value;">
					<span id="value3">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q4. 교수는 수업준비(교재, 학습자료 등을) 철저히 하였다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value4').innerHTML=this.value;">
					<span id="value4">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q5. 교수는 학생들의 출결관리를 철저하게 하였다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value5').innerHTML=this.value;">
					<span id="value5">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q6. 교수는 열성적으로 강의하였다</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value6').innerHTML=this.value;">
					<span id="value6">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q7. 본 강의의 난이도는 어떤 정도로 보는가?</label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value7').innerHTML=this.value;">
					<span id="value7">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>Q8. 성에 관한 편견이나 고정관념없이 </label>
				<div style="text-align: center;">	   				
				    <input type="range" class="custom-range" min="0" max="10" name="q1" oninput="document.getElementById('value8').innerHTML=this.value;">
					<span id="value8">5</span>
		   		</div>
	   		</li>
	   		<li>
				<label>강의에서 좋았던 점이나 개선할 점이 있다면 자유롭게 적어주세요</label>
				<div>	   				
				    <textarea name ="content" style="width: 100%;"></textarea>
		   		</div>
	   		</li>
	   		<li>
	   			<div style="text-align: center; margin-top: 10px;">
	   				<input type="submit" value="강의평가 등록" class="btn btn-success">
	   			</div>
	   		</li>
	   	</ul>
	   	</form>
	</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>