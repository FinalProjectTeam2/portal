<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>등록금</title>
<style type="text/css">
body {
	margin: 2%; 50%;
}
.divTable { 
	display: table; 
	width: 800px;
	
}
	
.divTableRow { 
	display: table-row; 
}

.divTableHeading { 
 	background-color: #EEE; 
 	display: table-header-group; 
} 

.divTableCell, .divTableHead, .cellColor{ 
 	border: 1px solid #999999; 
 	display: table-cell; 
 	padding: 3px 10px; 
} 

.cellColor {
	color:white;
	background-color: gray;
}

.divTableHeading { 
	background-color: #EEE; 
	display: table-header-group; 
	font-weight: bold; 
} 
 
.divTableFoot {
	background-color: #EEE; 
	display: table-footer-group; 
	font-weight: bold; 
} 

.divTableBody { 
	display: table-row-group; 
}



<!-- 테이블 -->
		
.box {
	width: 1000px;
	margin:10px 0;
	padding:10px 5px 10px 0;
	border:3px solid silver;
}

.box tr, td {
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	
}


</style>
</head>
<body>
<h1>대학 등록금 납부 내역 조회 </h1>
<form name="frmWrite" method="post" action="<c:url value=''/>" >
	<div class="divTable" > 
		<div class="divTableBody"> 
			<div class="divTableRow"> 
				<div class="cellColor">대학</div> 
				<div class="divTableCell">문과대학</div> 			
				<div class="cellColor">학과</div>
				<div class="divTableCell">국어국문과</div> 
			</div> 
		<div class="divTableRow"> 
			<div class="cellColor">학번</div> 
			<div class="divTableCell">20202020</div> 						
			<div class="cellColor">이름</div>
			<div class="divTableCell">홍길동</div> 
		</div> 
		<div class="divTableRow"> 
			<div class="cellColor">학기</div> 
			<div class="divTableCell">
				<select>
					<option> -- 구분 -- </option>
					<option> 1학기  1차</option>
					<option> 1학기  2차</option>
					<option> 2학기 1차</option>
					<option> 2학기 2차</option>
					<option> 계절학기</option>
				</select>
			</div>
			<div class="cellColor">&nbsp;</div>
			<div class="divTableCell">&nbsp;</div> 
	</div>
	</div>
</div>
		
<br><br><br>

<div class="divTable">
	<table class="box">
		<colgroup>
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
			<col style="width:10%;" />		
		</colgroup>
		<thead>
	  		<tr>
				<th>선택</th>
				<th>수납구분</th>
				<th>납부기간</th>
				<th>가상계좌</th>
				<th>수납금액</th>
				<th>수납여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="radio"></td>
				<td>등록금 수납</td>
				<td>2020-03-10 ~ 2020-03-20</td>
				<td>국민은행111-1111</td>
				<td>1,000,000</td>
				<td>납부</td>
			</tr>
		</tbody>
</table>
</div>
<div>
	<input type="submit" value="확인" id="bt">
	<input type="button" value="취소" id="bt">
</div>
</form>
</div>
</body>
</html>