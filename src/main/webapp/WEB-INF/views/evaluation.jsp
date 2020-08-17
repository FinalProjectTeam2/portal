<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %> 

<style>
  table {
    width: 100%;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
  input[type=radio]{
  	display: none;
  	margin: 10px;
  }
  .align-center{
  	text-align: center;
  }
  
.radio {
	overflow:hidden;
	display:inline-block;
	position:relative;
	height:26px;
	box-sizing:border-box;
	cursor:pointer;
}
.radio input {
	overflow:hidden;
	display:none;
	width:0px;
	height:0px;
	border:0 none;
	font-size:0;
	line-height:0;
	clip:rect(0 0 0 0);
	opacity:0;
}
.radio .ico{
	position:absolute;
	left:3px;
	top:3px;
	width:20px;
	height:20px;
	background-image:url("../../resources/images/btn_qty_down.gif") no-repeat 0 0;}
.radio .txt {
	display:inline-block;
	padding-left:30px;
	font-size:16px;
	color:#333;
}
.radio input:checked + .ico {
	background-position:0 -40px;
	background-image:url("../../resources/images/btn_qty_up.gif") no-repeat 0 0;}
}/* 체크됐을때, 이미지변경 */

  
  
</style>
<script type="text/javascript">
	
</script>
<table style="width: 750px;">

	<colgroup>
		<col width="10%">
		<col width="10%">
		<col width="5%">
		<col width="35%">
		<col width="8%">
		<col width="8%">
		<col width="8%">
		<col width="8%">
		<col width="8%">
	</colgroup>
	<tr>
		<th>평가요인</th>
		<th>평가항목</th>
		<th>배점</th>
		<th>강의평가 문항</th>
		<th>매우그렇다</th>
		<th>대체로그렇다</th>
		<th>보통이다</th>
		<th>대체로그렇지않다</th>
		<th>전혀그렇지않다</th>
	</tr>
	<tr>
		<td rowspan="8">교수 학습요인</td>
		<td>성취도</td>
		<td>10</td>
		<td>1. 담당교수는 학습목표 및 내용을 명확히 제시하였다.</td>
			<td class="align-center"><label class="radio"><input type="radio" value="1" name="q1"><span class="ico">①</span></label></td>
			<td class="align-center"><input type="radio" value="2" name="q1" id="radio12"><label for="radio12">②</label></td>
			<td class="align-center"><input type="radio" value="3" name="q1" id="radio13"><label for="radio13">③</label></td>
			<td class="align-center"><input type="radio" value="4" name="q1" id="radio14"><label for="radio14">④</label></td>
			<td class="align-center"><input type="radio" value="5" name="q1" id="radio15"><label for="radio15">⑤</label></td>
	</tr>
	<tr>
		<td rowspan="5">교수 학습활동</td>
		<td>10</td>
		<td>2.담당교수는 학습내용을 효과적으로 전달하였다.</td>
			<td class="align-center"><input type="radio" value="1" name="q2" id="radio21"><label for="radio21">①</label></td>
			<td class="align-center"><input type="radio" value="2" name="q2" id="radio22"><label for="radio22">②</label></td>
			<td class="align-center"><input type="radio" value="3" name="q2" id="radio23"><label for="radio23">③</label></td>
			<td class="align-center"><input type="radio" value="4" name="q2" id="radio24"><label for="radio24">④</label></td>
			<td class="align-center"><input type="radio" value="5" name="q2" id="radio25"><label for="radio25">⑤</label></td>
	</tr>
	<tr>
		<td>10</td>
		<td>3.담당교수는 본 수업에 대한 전문성을 갖추고 있다.</td>
			<td class="align-center"><input type="radio" value="1" name="q3">①</td>
			<td class="align-center"><input type="radio" value="2" name="q3">②</td>
			<td class="align-center"><input type="radio" value="3" name="q3">③</td>
			<td class="align-center"><input type="radio" value="4" name="q3">④</td>
			<td class="align-center"><input type="radio" value="5" name="q3">⑤</td>
	</tr>
	<tr>
		<td>15</td>
		<td>4. 담당교수는 본 수업에서 질문, 피드백 등의 소통을 확발히 하였다.</td>
			<td class="align-center"><input type="radio" value="1" name="q4">①</td>
			<td class="align-center"><input type="radio" value="2" name="q4">②</td>
			<td class="align-center"><input type="radio" value="3" name="q4">③</td>
			<td class="align-center"><input type="radio" value="4" name="q4">④</td>
			<td class="align-center"><input type="radio" value="5" name="q4">⑤</td>
	</tr>
	<tr>
		<td>15</td>
		<td>5. 담당교수는 본 수업에 열정적이고 성실히 임하였다.</td>
			<td class="align-center"><input type="radio" value="1" name="q5">①</td>
			<td class="align-center"><input type="radio" value="2" name="q5">②</td>
			<td class="align-center"><input type="radio" value="3" name="q5">③</td>
			<td class="align-center"><input type="radio" value="4" name="q5">④</td>
			<td class="align-center"><input type="radio" value="5" name="q5">⑤</td>
	</tr>
	<tr>
		<td>10</td>
		<td>6. 담당교수는 과제부여와 평가를 공정하고 체계적으로 실시하였다.</td>
			<td class="align-center"><input type="radio" value="1" name="q6">①</td>
			<td class="align-center"><input type="radio" value="2" name="q6">②</td>
			<td class="align-center"><input type="radio" value="3" name="q6">③</td>
			<td class="align-center"><input type="radio" value="4" name="q6">④</td>
			<td class="align-center"><input type="radio" value="5" name="q6">⑤</td>
	</tr>
	<tr>
		<td rowspan="2">교수 학습활동</td>
		<td>10</td>
		<td>7. 나는 본 수업을 다른 학생들에게 추천하고 싶다.</td>
			<td class="align-center"><input type="radio" value="1" name="q7">①</td>
			<td class="align-center"><input type="radio" value="2" name="q7">②</td>
			<td class="align-center"><input type="radio" value="3" name="q7">③</td>
			<td class="align-center"><input type="radio" value="4" name="q7">④</td>
			<td class="align-center"><input type="radio" value="5" name="q7">⑤</td>
	</tr>
	<tr>
	<td>20</td>
		<td>8. 나는 본 수업에 전반적으로 만족하였다.</td>
			<td class="align-center"><input type="radio" value="1" name="q8">①</td>
			<td class="align-center"><input type="radio" value="2" name="q8">②</td>
			<td class="align-center"><input type="radio" value="3" name="q8">③</td>
			<td class="align-center"><input type="radio" value="4" name="q8">④</td>
			<td class="align-center"><input type="radio" value="5" name="q8">⑤</td>
	</tr>
	<tr>
		<td colspan="2">배점 합계</td>
		<td>100</td>
		<td colspan="6"></td>
	</tr>
</table>
	
	<div>
		<label for="description" style="vertical-align: center;">개방형 질문 </label>
		<textarea cols="70" rows="10"></textarea>
	</div>





















<%@ include file="inc/bottom.jsp" %> 