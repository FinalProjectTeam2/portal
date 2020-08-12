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

.tableWrite {
	width: 1400px;
	min-width: 500px;
	border-collapse:collapse;
 	border-spacing: 1px;
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	margin: 20px 10px;
	line-height: 1.5;s
}

.tableWrite tr, td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.td {
	background-color: #e6f3ff;
}

</style>

<div class="scholarship">
<h1>장학금 관리 페이지 - 글쓰기</h1>
<hr align="left" width="55%">
<br>

<!-- 장학금 지급 내역 -->
	<div class="divWrite" style="width: 77%;">
		<form action="">
			<table class="tableWrite">
				<colgroup>
					<col style="width:30%;" /> 
					<col style="width:70%;" />
				</colgroup>
				<tr>
					<td class="td">학부</td>
					<td>
						<select style="width: 210px;">
							<option> -- 구분 -- </option>
							<option>경영학부</option>
							<option>예체능</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td">학과</td>
					<td>
						<select style="width: 210px;">
							<option> -- 구분 -- </option>
							<option>경영학과</option>
							<option>경제학과</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td">학번</td>
					<td><input type="text"></td>
				</tr>
				<tr>	
					<td class="td">이름</td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td class="td">장학금분류</td>
					<td>
						<select style="width: 210px;">
							<option> -- 구분 -- </option>
							<option>교내장학금</option>
							<option>교외장학금</option>
						</select>				
					</td>
				</tr>
				<tr>	
					<td class="td">장학금명</td>
					<td>
						<select style="width: 210px;">
							<option> -- 구분 -- </option>
							<option>성적우수</option>
							<option>추천</option>
						</select>				
					</td>
				</tr>
				<tr>	
					<td class="td">신청일자</td>	
					<td><input type="text"></td>		
				</tr>
				<tr>
					<td class="td">승인여부</td>
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>대기</option>
							<option>완료</option>
						</select>	
					</td>			
				<tr>
					<td class="td">승인일자</td>
					<td><input type="text"></td>
				</tr>
				<tr>	
					<td class="td">지급여부</td>
					<td>
						<select>
							<option> -- 구분 -- </option>
							<option>미지급</option>
							<option>지급</option>
						</select>				
					</td>
				</tr>
				<tr>	
					<td class="td">지급액</td>
					<td><input type="text"></td>
				</tr>
			</table>
			<div class="btn">
				<input type="button" value="등록">
				<input type="button" value="목록">
			</div>
		</form>
	</div>
<br>	

</div>
<%@ include file="../inc/bottom.jsp"%>