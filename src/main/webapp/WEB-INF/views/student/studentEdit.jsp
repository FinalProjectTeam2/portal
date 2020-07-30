<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
    <link rel="stylesheet" href="<c:url value='/resources/css/studentEdit.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/materialize.min.css' />">
    
<script>
	$(function () {
		$('#editFrm').submit(function () {
			$.ajax({
				url : "<c:url value='/student/studentEdit' />",
				type: "post",
				data : {
					bankCode:$('#bankCode').val(),
					bankName:$('#bankName').val(),
					bankNo:$('#bankNo').val(),
					
					hp:$('#hp').val(), 
					email:$('#email').val(), 
					zipcode:$('#zipcode').val(),
					address:$('#address').val(), 
					addrDetail:$('#addrDetail').val(),
					imageUrl:$('#upfile').val()
				},
				success:function(res){
					
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
			});
		});	
	});

</script>   
    
    
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
		<form name="editFrm" method="post" enctype="multipart/form-data" id="editFrm">
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
			      			<td>${map['STU_NO'] } / 입학날짜 : <fmt:formatDate value='${map["ADMISSION_DATE"] }' pattern="yyyy-MM-dd" />
			      			 </td>
			      		</tr>
			      		<tr>
			      			<th>학생</th>
			      			<td>${map['NAME'] } / ${map['SSN'] }/ 대한민국</td>
			      		</tr>
			      		<tr>
			      			<th>소속</th>
			      			<td>${map['FACULTY_NAME'] }/ 제1전공 : ${map['DEP_NAME'] }</td>
			      		</tr>
			      		<tr>
			      			<th>과정</th>
			      			<td>학사: ${map['STATE'] }/ ${map['SEMESTER'] }학기 </td>
			      		</tr>
			      		<tr>
			      			<th>기타</th>
			      			<td>${map['HP1'] }-${map['HP2'] }-${map['HP1'] } / ${map['EMAIL1'] }@${map['EMAIL2'] } 
			      			/ ${map['ZIPCODE'] } ${map['ADDRESS'] } ${map['ADDRESSDETAIL'] } / 우리은행 1002-000-0000(예금주명)</td>
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
				      			<td><input placeholder="이름" name="name" type="text" class="validate" readonly="readonly" value="${map['NAME'] }"></td>
								<th>학번</th>
								<td><input placeholder="학번" name="officialNo" type="text" class="validate" readonly="readonly" value="${map['STU_NO'] }"></td>
				      			<th>주민번호</th>
				      			<td><input placeholder="주민번호" name="jumin" type="text" class="validate" readonly="readonly" value="${map['SSN'] }"></td>
				      		</tr>
				      		<tr>
				      			<th>은행명</th>
				      			<td>
			      				    <select class="browser-default" name="bankCode" id="bankCode">
								      <c:if test="${!empty bankList }">
								      	<c:forEach var="bankVo" items="${bankList }">
								      		<option value="${bankVo.bankCode }">${bankVo.bankName }</option>
								      	</c:forEach>
								      </c:if>
								    </select>
				      			</td>
				      			<th>계좌번호</th>
				      			<td><input placeholder="계좌번호" name="accountNo" id="accountNo" type="text" class="validate" value="1002-0000-00000"></td>
				      			<th>예금주</th>
				      			<td><input placeholder="예금주명" name="accountName" id="accountName" type="text" class="validate" value="신희나"></td>
				      			
				      		</tr>
				      		<tr>
				      			<th>우편번호</th>
				      			<td><input placeholder="우편번호" name="zipcode" id="zipcode" type="text" class="validate" value="${map['ZIPCODE'] }">
				      			  <button  id="findZipBt" type="button">우편번호 찾기</button></td>
				      			<th>주소</th>
				      			<td><input placeholder="주소" name="address" id="address" type="text" class="validate" value="${map['ADDRESS'] }"></td>
				      			<th>상세주소</th>
				      			<td><input placeholder="상세주소" name="addrDetail" id="addrDetail" type="text" class="validate" value="${map['ADDRESSDETAIL'] }"></td>
				      		</tr>
				      		<tr>
				      			<th>이메일</th>
								<td><input placeholder="이메일" name="email" id="email" type="text" class="validate" value="${map['EMAIL1'] }@${map['EMAIL2'] }"></td>
								<th>전화번호</th>
								<td><input placeholder="핸드폰번호" name="hp" id="hp" type="text" class="validate" value="${map['HP1'] }-${map['HP2'] }-${map['HP3'] }"></td>
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
<%@ include file="../inc/bottom.jsp"%>