<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.assignment {
	margin-left: 3%;
	margin-top: 2%;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
}

.table, .table2 {
	width:1400px;
	border-bottom: 1px solid gray;
}

.table th{
	border-right: 1px solid gray;
	text-align: right;
	width: 300px;
}

.table2 th {
	text-align: center;
	border-bottom: 3px solid gray;
	font-size: 16px;
	font-weight: bold;
}

.table2 td {
	text-align: center;
	border-bottom: 1px solid gray;
	font-size:14px;
	line-height: 30px;
}

.table2 tr:hover {
	background: #eee;
}

.search {
	margin-left: 35%;
}

.divbtn {
	text-align: center;
	margin-left: 35%;
}

.page {
	text-align: center;
}
</style>
<script type="text/javascript">
// 과제마감 카운트다운 
const countDownTimer = function (id, date) { 
	var _vDate = new Date(date); // 전달 받은 일자
	var _second = 1000; 
	var _minute = _second * 60; 
	var _hour = _minute * 60; 
	var _day = _hour * 24; 
	var timer; 
	
	function showRemaining() { 
		var now = new Date(); 
		var distDt = _vDate - now; 
		
		if (distDt < 0) { clearInterval(timer); 
			document.getElementById(id).textContent = '해당 이벤트가 종료 되었습니다!'; 
		
			return; 
		} 
		
		var days = Math.floor(distDt / _day); 
		var hours = Math.floor((distDt % _day) / _hour); 
		var minutes = Math.floor((distDt % _hour) / _minute); 
		var seconds = Math.floor((distDt % _minute) / _second); 
		
		//document.getElementById(id).textContent = date.toLocaleString() + "까지 : "; 
		document.getElementById(id).textContent = days + '일 '; 
		document.getElementById(id).textContent += hours + '시간 '; 
		document.getElementById(id).textContent += minutes + '분 '; 
		document.getElementById(id).textContent += seconds + '초'; 
	} 
	
	timer = setInterval(showRemaining, 1000); 
} 

	var dateObj = new Date(); 
	dateObj.setDate(dateObj.getDate() + 1); 
	
	countDownTimer('countDown', '08/19/2020 00:00 AM'); // 2020년 8월 19일까지, 시간을 표시하려면 01:00 AM과 같은 형식을 사용한다. 


</script>
<div class="assignment">
	<div class="">
		<h1>과제제출</h1>
		<hr align="left" width="85%">
	</div>
	<br>
<!-- 과제정보 -->	
	<div class="title">
		<h4>과제정보</h4>
	</div>
	<br>
	<div class="divTable">
		<table class="table">
			<tr>
				<th>과목명</th>
				<td>
					<select style="width: 300px;">
						<option>------------------------------</option>
						<option>이론1</option>
						<option>이론2</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>교수명</th>
				<td>변사또</td>
			</tr>
			<tr>
				<th>제출기한</th>
				<td>2020. 07. 10. ~ 2020. 08. 19. (기간후 제출 불가 )</td>
			</tr>
			<tr>
				<th>남은시간</th>
				<td><div id="countDown"></td>
			</tr>
			<tr>
				<th>양식</th>
				<td>자유</td>
			</tr>
			<tr>
				<th>분량</th>
				<td>A4 1장 이상</td>
			</tr>
		</table>
	</div>
	<br><br>

<!-- 과제제출 목록 -->	
	<div class="title">
		<h4>과제제출</h4>
	</div>
	<br>

	<div class="divTable2">
		<table class="table2">
			<tr>
				<th>강의명</th>
				<th>교수명</th>
				<th>과제명</th>
				<th>제출자</th>
				<th>제출여부</th>
				<th>채점</th>
			</tr>
	
			<tr>
				<td>경영이론1</td>	
				<td>변사또</td>	
				<td>시장조사분석</td>	
				<td>홍길동</td>	
				<td>미제출</td>
				<td>F</td>	
			</tr>
		</table>
	</div>
	<br>
	
<!-- 페이징처리 -->
	<div class="page">[1]</div><br>


<!-- 검색 -->	
	<div class="search">
		<select style="width: 150px;">
			<option>제출자</option>
			<option>제출여부</option>
		</select>
		<input type="text">
		<input type="button" value="검색">
	</div>
	<br>
	<br>

<!-- 제출, 목록 버튼 -->	
	<div class="divbtn"> 
		<input type="submit" value="제출">
		<input type="button" value="목록" id="btnList">
	</div>


</div>

<%@ include file="../inc/bottom.jsp"%>