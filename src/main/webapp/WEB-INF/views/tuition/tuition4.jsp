<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>등록금납입고지서&영수증</title>
<style type="text/css">
h1 {
	margin: 2% 2%;
}

.dvibtn {
	margin: -50px;
}

table {
	border: 1px solid silver;
	border-collapse: collapse;
	width: 500px;
	height: 800px;
	text-align: center;
	font-family: 나눔고딕;
}

td, th, tr {
	border: 1px solid silver;
}

.divForm1 {
	float: left;
	margin: 3% 5%;
}

.divForm2 {
	float: left;
	margin: 1.3% -0.5%;
}

.divForm3 {
	float: left;
	margin: 38% -51.6%;
}

.divForm4 {
	float: left;
	margin: 38% -23.4%;
}

.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
  float: right;
  
}

.btn:hover {
  background-color: RoyalBlue;
}

.td_right {
	text-align: right;
}
</style>



</head>
<body>
<h1>납입금고지서&납입금영수증 </h1>
<!-- 인쇄버튼 -->
<div class="divbtn">
	<button class="btn" onclick="window.print()"><i class="fa fa-download"></i>납입내역출력하기</button> 
</div>

<br><br>

<!-- 납입금 고지서_은행용 -->
<div class="form">
<div class="divForm1">
	<table class="t1">
		<colgroup>
			<col style="width:25%;" />
			<col style="width:25%;" />
			<col style="width:25%;" />
			<col style="width:25%;" />
		</colgroup>
		<thead>
			<tr> 
				<th colspan="4">
					<label>납임금고지서[은행용]</label><br> 
					<label>2020학년도 제 1학기 1차</label>
				</th>
			</tr>
			<tr>
				<td scope="col">학년</td>
				<td scope="col">1</td>
				<td scope="col">학과</td>
				<td scope="col">행정학과</td>
			</tr>	
		</thead>
		<tbody>
				<tr>
					<td>이름</td>
					<td colspan="3">홍길동</td>
					
				</tr>
				<tr>
					<td>구분</td>
					<td colspan="2">등록금</td>
					<td>등록확인예치금</td>
	
				</tr>
				<tr>
					<td>입학금</td>
					<td colspan="2" class="td_right">0</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>수업료 Ⅰ </td>
					<td colspan="2" class="td_right">1,200,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>수업료 Ⅱ</td>
					<td colspan="2" class="td_right">100,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>계</td>
					<td colspan="2" class="td_right">1,300,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>납입금액</td>
					<td colspan="3" class="td_right">1,300,000</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4">
						▣  납입기간 : 2020년 3월 10일 ~ 2020년 3월 20일(16:00) <br>
						＊유의사항: 은행업무 시간 내에만 납부 가능 <br>
						▣  가상계좌 : 국민은행(1111-1111)<br>
						<img src="<c:url value='/resources/images/stamp1.png'/>">
						
					</td>
				</tr>
		</tbody>
</table>
</div>
<br><br>

<!-- 납입금 고지서_학생용 -->
<div class="divForm2">
	<table class="t2">
		<colgroup>
			<col style="width:25%;" />
			<col style="width:25%;" />
			<col style="width:25%;" />
			<col style="width:25%;" />
		</colgroup>
		<thead>
			<th colspan="4">
					<label>납임금영수증[납입자용]</label><br> 
					<label>2020학년도 제 1학기 1차</label>
				</th>
			<tr>
				<td scope="col">학년</td>
				<td scope="col">1</td>
				<td scope="col">학과</td>
				<td scope="col">행정학과</td>
			</tr>	
		</thead>
		<tbody>
				<tr>
					<td>이름</td>
					<td colspan="3">홍길동</td>
					
				</tr>
				<tr>
					<td>구분</td>
					<td colspan="2">등록금</td>
					<td>등록확인예치금</td>
	
				</tr>
				<tr>
					<td>입학금</td>
					<td colspan="2" class="td_right">0</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>수업료 Ⅰ </td>
					<td colspan="2" class="td_right">1,200,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>수업료 Ⅱ</td>
					<td colspan="2" class="td_right">100,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>계</td>
					<td colspan="2" class="td_right">1,300,000</td>
					<td class="td_right">0</td>
				</tr>
				<tr>
					<td>납입금액</td>
					<td colspan="3" class="td_right">1,300,000</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>수 납 인</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>서명할 곳</td>
				</tr>
				<tr>
					<td colspan="4">
						<h5>년	월	일</h5>						
						<img src="<c:url value='/resources/images/stamp1.png'/>">
					</td>
				</tr>
		</tbody>
</table>
</div>
<br><br>

<!-- 학생회비고지서_은행용 -->
<div class="divForm3">
	<table class="t3" border="1">
		<colgroup>
			<col style="width:25%;" />
			<col style="width:20%;" />
			<col style="width:25%;" />
			<col style="width:40%;" />
		</colgroup>
		<thead>
			<th colspan="4">
				<label>학생회비고지서[은행용]</label><br> 
				<label>2020학년도 제 1학기 1차</label>
			</th>
				
			<tr>
				<td scope="col">학년</td>
				<td scope="col">1</td>
				<td scope="col">학과</td>
				<td scope="col">행정학과</td>
			</tr>	
		</thead>
		<tbody>
				<tr>
					<td>이름</td>
					<td colspan="3">홍길동</td>
					
				</tr>
				<tr>
					<td colspan="2">구분</td>
					<td colspan="2">납입금액</td>
				</tr>
				<tr>
					<td colspan="2">잡비</td>
					<td colspan="2" class="td_right">22,000</td>
				</tr>
				<tr>
					<td colspan="4">
						▣  납입기간 : 2020년 3월 10일 ~ 2020년 3월 20일(16:00) <br>
						＊유의사항: 은행업무 시간 내에만 납부 가능 <br>
						▣  가상계좌 : 국민은행(1111-1111)
						
						<img src="<c:url value='/resources/images/stamp2.png'/>">
					</td>
				</tr>
		</tbody>
</table>
<br><br>
</div>
<!-- 학생회비고지서_학생용 -->
<div class="divForm4">
	<table class="t4">
		<colgroup>
			<col style="width:25%;" />
			<col style="width:20%;" />
			<col style="width:25%;" />
			<col style="width:40%;" />
		</colgroup>
		<thead>
			<th colspan="4">
					<label>학생회비영수증[납입자용]</label><br> 
					<label>2020학년도 제 1학기 1차</label>
				</th>
			<tr>
				<td scope="col">학년</td>
				<td scope="col">1</td>
				<td scope="col">학과</td>
				<td scope="col">행정학과</td>
			</tr>	
		</thead>
		<tr>
				<td>이름</td>
				<td colspan="3">홍길동</td>
					
				</tr>
				<tr>
					<td colspan="2">구분</td>
					<td colspan="2">납입금액</td>
				</tr>
				<tr>
					<td colspan="2">잡비</td>
					<td colspan="2" class="td_right">22,000</td>
				</tr>
					<td colspan="3">&nbsp;</td>
					<td>수 납 인</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td>서명할 곳</td>
				</tr>
				<tr>
					<td colspan="4">
						<h5>년 월 일</h5>
						
						<img src="<c:url value='/resources/images/stamp2.png'/>">
					</td>
				</tr>
		</tbody>
</table>
</div>
</div>
</body>
</html>