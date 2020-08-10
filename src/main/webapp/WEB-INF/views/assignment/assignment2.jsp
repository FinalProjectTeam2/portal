<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
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
<style type="text/css">
.attendance {
	margin-left: 20%;
	margin-top: -20%;
	width: 80%;
	min-width: 500px;
}

hr {
	width: 45%;
	min-width: 15%;	
}

.table {
	width: 90%;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}

.divpage {
	text-align: center;
}
</style>
<div class="attendance">
<h1>과제관리 페이지</h1>
<hr align="left">
<br>
	<div>
		마감까지 <div id="countDown">  </div> 남았습니다.
	</div>

	<div class="divTable">
		<div class="btn">
			<select>
				<option> -- 구분 -- </option>
				<option>제출자</option>
				<option>제출여부</option>
			</select> 
			<input type="text">
			<input type="button" value="검색">
		</div>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>강의명</th>
					<th>교수명</th>
					<th>과제명</th>
					<th>제출자</th>
					<th>제출여부</th>
					<th>채점</th>
					<th>비고</th>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"></td>
					<td>경영이론1</td>	
					<td>변사또</td>	
					<td>시장조사분석</td>	
					<td>홍길동</td>	
					<td>미제출</td>
					<td>F</td>	
					<td><input type="button" value="수정"></td>
				</tr>
			</tbody>
		</table>
	</div>
	
<!-- 페이징처리 -->	
	<div class="divpage">
		<div> [1]</div>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>