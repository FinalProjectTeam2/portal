<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<style type="text/css">
.menu {
	margin-top: 3%;
	margin-left:15%;
	text-align: right;
}

table {
	border: 1px solid gray;
	border-collapse: collapse;
	width: 1200px;
}

th {
	background: #e6f3ff;
	text-align: center;
	font-weight: bold;
	border-top-color: #003566;
}

th, td {
	border: 1px solid gray;
}

.table1 {
	height: 50px;
	padding: 15%;
}

.table2 th{
	line-height: 35px;
}
.table3 th{
	line-height: 35px;
}

.table2 #t2_td {
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	color: blue;	
}
</style>

<div class="gradeCheck">
	<div>
		<h1>성적조회</h1>
	</div>
	<div class="menu">
		<span><a href="#">내 정보</a></span>
		<span> > </span>
		<span><a href="#">성적조회</a></span>
	</div>

<hr> 

<!--  -->
	<div class="">
		<table class="table1">
			<tr>
				<th>신청학점</th>
				<td>24</td>
				<th>취득학점</th>
				<td>24</td>
				<th>평균평점</th>
				<td>4.20</td>
			</tr>
		</table>
	</div>
<br><br>

<!-- 전체 성적 -->
	<div>
		<p>전체성적조회</p>
	</div>
	
	<div>
		<select>
			<option>2020</option>
			<option>2019</option>
			<option>2018</option>
			<option>2017</option>
		</select>

		<label>1학기</label><input type="radio" value="1학기">
		<label>2학기</label><input type="radio" value="1학기">

		<input type="button" value="검색">
	</div>
	
	<div class="divTable">
		<table class="table2">
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>이수구분</th>
				<th>교과목명</th>
				<th>교수명</th>
				<th>학점</th>
				<th>성적등급</th>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				
			</tr>
			<tr>
				<td colspan="7" id="t2_td">총평점 : 평균평점 :</td>		
		</table>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>