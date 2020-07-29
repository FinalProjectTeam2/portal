<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
    <link rel="stylesheet" href="<c:url value='/resources/css/studentEdit.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/materialize.min.css' />">
    
<style>
select:focus {
	background-color: #ffffff;
}

li:focus {
	background-color: #ffffff00;
}
a:focus {
	background-color: #ffffff00;
}
</style>
<main role="main" class="flex-shrink-0">
	<div class="container">


		<div id="editStu">
		<fieldset>
		<legend>정보조회 및 개인정보 변경</legend>
			<!-- contents -->
		<form name="editFrm" method="post" enctype="multipart/form-data">
			   <div class="rowa">
			      <!-- 기존정보 -->
			      <div class="cola s3" id="imgDiv">
			      	<img id="studentImg" alt="" src="<c:url value='/resources/images/student.png'/>">
					   <div class="rowa" style=" margin-top: 20px;">
					   		<label for="upfile">사진수정</label>
					      	<input type="file" name="upfile" id="upfile" >
						</div>			      	
			      </div>
			      <div class="cola s9" id="info">
			      	<table>
			      		<tr>
			      			<th>학번</th>
			      			<td>2014110498 / 입학날짜 : 2014-03-01</td>
			      		</tr>
			      		<tr>
			      			<th>학생</th>
			      			<td>홍길동 / 1995-03-28 / 여 / 대한민국</td>
			      		</tr>
			      		<tr>
			      			<th>소속</th>
			      			<td>사회과학대학/ 제1전공 : 경영학과</td>
			      		</tr>
			      		<tr>
			      			<th>과정</th>
			      			<td>학사: 정규학생/ 9학기 / 재학</td>
			      		</tr>
			      		<tr>
			      			<th>기타</th>
			      			<td>010-1234-1234/ shn6314@gmail.com / 서울시 영등포구 / 우리은행 1002-000-0000(예금주명)</td>
			      		</tr>
			      	</table>
			      </div>
			      <!--  -->
			      <div class="rowa">
			      
			      </div>
			      <!-- 기본정보 -->
			      <div class="cola s12" id="canEdit">
			      <hr><!-- style="border: 0.5px solid #01539d -->

				      	<table>
										      	
				      		<tr>
				      			<th>이름</th>
				      			<td><input placeholder="이름" name="name" type="text" class="validate" readonly="readonly" value="홍길동"></td>
								<th>학번</th>
								<td><input placeholder="학번" name="stuNo" type="text" class="validate" readonly="readonly" value="2014110498"></td>
				      			<th>주민번호</th>
				      			<td><input placeholder="주민번호" name="jumin" type="text" class="validate" readonly="readonly" value="950328*******"></td>
				      		</tr>
				      		<tr>
				      			<th>은행명</th>
				      			<td>
			      				    <select class="browser-default" name="bank">
								      <option>우리은행</option>
								      <option>신한은행</option>
								      <option>하나은행</option>
								    </select>
				      			</td>
				      			<th>계좌번호</th>
				      			<td><input placeholder="계좌번호" name="accountNo" type="text" class="validate" value="1002-0000-00000"></td>
				      			<th>예금주</th>
				      			<td><input placeholder="예금주명" name="accountOwner" type="text" class="validate" value="신희나"></td>
				      		</tr>
				      		<tr>
				      			<th>우편번호</th>
				      			<td><input placeholder="우편번호" name="zipcode" type="text" class="validate" value="12345">
				      			  <button  id="findZipBt" type="button">우편번호 찾기</button></td>
				      			<th>주소</th>
				      			<td><input placeholder="주소" name="addr" type="text" class="validate" value="서울시영등포구"></td>
				      			<th>상세주소</th>
				      			<td><input placeholder="상세주소" name="addrDetail" type="text" class="validate" value="땡떙아파트"></td>
				      		</tr>
				      		<tr>
				      			<th>이메일</th>
								<td><input placeholder="이메일" name="email" type="text" class="validate" value="shn6314@gmail.com"></td>
								<th>전화번호</th>
								<td><input placeholder="핸두폰번호" name="hp" type="text" class="validate" value="010-1234-1234"></td>
				      		</tr>
				      	

				      	</table>
				      	<div style="text-align: center; margin-top: 10px;">
				      			<input type="submit" id="editBt" value="정보수정" style="color: white;">
			    		</div>
			      </div>
			   </div>
			</form>
			</fieldset>
		</div>

	
<%@ include file="../../inc/bottom.jsp"%>