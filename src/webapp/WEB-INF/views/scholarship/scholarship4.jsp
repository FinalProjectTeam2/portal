<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.scholarship {
	margin-left: 20%;
	margin-top: -20%;
	width: 80%;
}

/* 검색 조건 css */
.divTable {
	border: 1px solid gray;
}

.tableSearch {
	width: 1000px;
	min-width: 500px;
	border-collapse:collapse;
 	border-spacing: 1px;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	margin: 20px 10px;
	line-height: 1.5;
}

.tableSearch tr, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	margin: 1%, 5%, 1%, 1%;
}

#search {
	margin-left: 46%;
	margin-top: -105%;
	border: none;
	padding: 14px 28px;
	background-color: #2196F3;
	color: white;	
	font-size: 16px;
	cursor: pointer;
	margin-top: 1.5%;
	margin-bottom: 1.5%;
}

#search:hover {
	background: #0b7dda;
}	

/* 지급내역 css */	
.tablePayments {
	width: 1000px;
	min-width: 500px;
	border-collapse:collapse;
 	border-spacing: 1px;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	margin: 20px 10px;
	line-height: 1.5;s
}

.tablePayments tr, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}
</style>

<div class="scholarship">
<h1>장학금 관리 페이지</h1>
<hr align="left" width="55%">
<br>
<!-- 검색 조건 -->
	<div>
		<label>10건 검색되었습니다.</label>
	</div>
	
	<div class="divTable" style="width: 77%;">
		<table class="tableSearch">
			<colgroup>
				<col style="width:15%;" />
				<col style="width:30%;" />
				<col style="width:15%;" />
				<col style="width:30%;" />
			</colgroup>
			<tr>
				<td>신청일자</td>
				<td colspan="3"><%@ include file="../board_food/dateTerm.jsp"%></td>
			</tr>
			<tr>
				<td>장학금분류</td>
				<td>
					<select style="width: 150px;">
						<option> -- 구분 -- </option>
						<option>교내장학금</option>
						<option>교외장학금</option>
					</select>
				</td>
				<td>장학금명</td>
				<td>
					<select style="width: 150px;">
						<option> -- 구분 -- </option>
						<option>성적우수</option>
						<option>추천</option>
					</select>
				</td>					
			</tr>
			<tr>	
				<td>지급여부</td>
				<td>
					<select>
						<option> -- 구분 -- </option>
						<option>미지급</option>
						<option>지급</option>
					</select>
				</td>
				<td>승인여부</td>
				<td>
					<select>
						<option> -- 구분 -- </option>
						<option>대기</option>
						<option>완료</option>
					</select>
				</td>
			</tr>
			<tr>	
				<td>학부</td>
				<td>
					<select>
						<option> -- 구분 -- </option>
						<option>경영학부</option>
						<option>예체능</option>
					</select>
				</td>
				<td>학과</td>
				<td>
					<select style="width: 300px;">
						<option> -- 구분 -- </option>
						<option>경영학과</option>
						<option>경제학과</option>
					</select>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" id="search" value="검색">
		</div>
	</div>

<br>
<!-- 장학금 지급 내역 -->
	<div class="divPayments" style="width: 100%;">
		<div class="btn"> 
			<input type="button" value="추가">
			<input type="button" value="수정">
			<input type="button" value="삭제">
		</div>
		
		<table class="tablePayments">
			<colgroup>
				<col style="width:3%;" /> 
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:7%;" /> 
				<col style="width:5%;" /> 
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:10%;" />
				<col style="width:5%;" />
				<col style="width:10%;" /> 
				<col style="width:5%;" /> 
				<col style="width:10%;" />
			</colgroup>
			<tr>
				<td><input type="checkbox"></td>
				<td>학부</td>
				<td>학과</td>
				<td>학번</td>
				<td>이름</td>
				<td>장학금분류</td>
				<td>장학금명</td>
				<td>신청일자</td>			
				<td>승인여부</td>
				<td>승인일자</td>
				<td>지급구분</td>
				<td>지급액</td>
				<td>비고</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td>
				<td>경영학부</td>
				<td>경영학과</td>
				<td>2020~</td>
				<td>홍길동</td>
				<td>교내장학금</td>				
				<td>성적우수</td>
				<td>2020.7.10</td>
				<td>심사중</td>
				<td>&nbsp;</td>
				<td>미지급</td>
				<td>&nbsp;</td>
				<td><input type="button" value="학생정보"></td> <!-- 학점, 출결관리 정보 -> 팝업창으로 -->
			</tr>	
		</table>
	</div>
<br>	
<!-- 페이징처리 -->		
</div>
<%@ include file="../inc/bottom.jsp"%>