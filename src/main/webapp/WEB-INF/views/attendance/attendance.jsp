<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.attendance {
	margin-left: 20%;
	margin-top: -20%;
	min-height: 500px;
}

hr {
	width: 35%;
	min-width: 15%;	
}

.btSearch {
	margin-left: 30%;
	margin-top: -1.8%;
}

.table1, .table2 {
	width: 80%;
	min-width: 500px;
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    margin: 20px 10px;
}

.table1 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #efefef;
    text-align: center;
}
.table1 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<div class="attendance">
<h1>출결관리 페이지</h1>
<hr align="left">
<br>
	<div class="">
		<label><h3>2020. 8. 6. 목</h3></label>
	</div>
	
	<div>
		<div class=""><%@ include file="../board_food/dateTerm.jsp"%> </div> 
		<div class="btSearch"><input type="button" value="검색"></div>
	</div>
<br>
<!-- 학생 정보 -->	
	<div calss="divTable1">
		<table class="table1">
			<colgroup>
				<col style="width:25%">
				<col style="width:25%">
				<col style="width:35%">
				<col style="width:5%">
				<col style="width:5">		
				<col style="width:*">		
			</colgroup>
	
			<thead>
				<tr>
					<th scope="col">학부</th>
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>경영대학</option>
							<option>예체능</option>
						</select> 
					</td>
					<th scope="col">학과</th>
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>경영학과</option>
							<option>경제학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="col">학년</th>
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>1학년</option>
							<option>2학년</option>
						</select>
					</td>
					
					<th scope="col">학기</th>
					<td scope="col">
						<select>
							<option> -- 구분 -- </option>
							<option>1학기</option>
							<option>2학기</option>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="col">이름</th>
					<td>홍길동</td>
				</tr>	
			</thead>		
		</table>
	</div>		
<br>
		
<!-- 출결 상태 -->		
	<div class="divTable2">		
		<table class="table2">
			<colgroup>
					<col style="width:3%">
					<col style="width:15%"> 
					<col style="width:15%"> 
					<col style="width:5%"> 
					<col style="width:5"> 
					<col style="width:15%"> 
					<col style="width:5%">
					<col style="width:5%"> 
					<col style="width:5%"> 
					<col style="width:5"> 
					<col style="width:*">	
				</colgroup>
		
				<thead>
					<tr>
						<th scope="col"><input type="checkbox"></th>
						<th scope="col">학부</th>
						<th scope="col">학과</th>
						<th scope="col">학년</th>
						<th scope="col">이름</th>
						<th scope="col">강의명</th>
						<th scope="col">교수명</th>
						<th scope="col" colspan="3">출석</th>
						<th scope="col" >비고</th>
						
					</tr>
					<tr>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col" rowspan="1"></th>
						<th scope="col">지각</th>
						<th scope="col">조퇴</th>
						<th scope="col">결석</th>
						<th scope="col" rowspan="1"><input type="button" value="상세보기"></th>
					</tr>	
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox"></td>
						<td>경영학부</td>
						<td>경영학과</td>
						<td>1학년</td>
						<td>홍길동</td>
						<td>경영이론1</td>
						<td>변사또</td>
						<td><input type="checkbox"></td>			
						<td><input type="checkbox"></td>			
						<td><input type="checkbox"></td>
					</tr>
				</tbody>			
		</table>
	</div>
	
<!-- 페이징처리 -->	
</div>
<%@ include file="../inc/bottom.jsp"%>