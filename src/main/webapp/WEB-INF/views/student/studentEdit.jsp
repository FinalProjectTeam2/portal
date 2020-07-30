<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
    <link rel="stylesheet" href="<c:url value='/resources/css/studentEdit.css' />">
    <link rel="stylesheet" href="<c:url value='/resources/css/materialize.min.css' />">

<input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
<span id="guide" style="color:#999;display:none"></span>
<input type="text" id="sample4_detailAddress" placeholder="상세주소">
<input type="text" id="sample4_extraAddress" placeholder="참고항목">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
		
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
<script>
	$(function () {
		$.select();
		$('#editFrm').submit(function () {
			$.ajax({
				url : "<c:url value='/student/studentEdit' />",
				type: "post",
				data : {
					bankCode:$('#bankCode').val(),
					accountNo:$('#accountNo').val(),
					accountName:$('#accountName').val(),
					
					hp:$('#hp').val(), 
					email:$('#email').val(), 
					zipcode:$('#zipcode').val(),
					address:$('#address').val(), 
					addrDetail:$('#addrDetail').val(),
					
				},
				success:function(res){
					alert("회원정보 수정이 완료되었습니다");
					if(!res){
						alert("수정실패");
						return;
					}
					$.select();
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
			});
			return false;
		});	
	});
	$.select = function () {
		$.ajax({
			url : "<c:url value='/student/selectInfo' />",
			type: "get",
			dataType: "json",
			success:function(res){
							
				$('#bankCode').val(res.BANK_CODE);
				$('#accountNo').val(res.ACCOUNT_NO);
				$('#accountName').val(res.ACCOUNT_NAME);
				
				$('#hp').val(res.HP1 +"-"+res.HP2+ "-"+ res.HP3); 
				$('#email').val(res.EMAIL1 + "@" + res.EMAIL2); 
				$('#zipcode').val(res.ZIPCODE);
				$('#address').val(res.ADDRESS); 
				$('#addrDetail').val(res.ADDR_DETAIL);
				var inHtml = '<tr>'
	      			+ '<th>학번</th>'
	      			+ '<td>'+res.STU_NO+' / 입학날짜 : '+moment(res.ADMISSION_DATE).format('YYYY-MM-DD')
	      			+ '</td>'
		      		+ '</tr>'
		      		+ '<tr>'
	      			+ '<th>학생</th>'
	      			+ '<td>'+res.NAME+' / '+res.SSN+'/ 대한민국</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>소속</th>'
	      			+ '<td>'+res.FACULTY_NAME+'/ 제1전공 : '+res.DEP_NAME+'</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>과정</th>'
	      			+ '<td>학사: '+res.STATE+'/ '+res.SEMESTER+'학기 </td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>기타</th>'
	      			+ '<td>'+res.HP1+'-'+res.HP2+'-'+res.HP3+' / '+res.EMAIL1+'@'+res.EMAIL2
	      			+ '/ '+res.ZIPCODE+' '+res.ADDRESS+' '+res.ADDR_DETAIL+' / '+res.BANK_NAME+' '+res.ACCOUNT_NO +'('+res.ACCOUNT_NAME+')</td>'
	      			+ '</tr>';
	      			
	      		$('#studentTable').html(inHtml);
	      		$('#ssn').val(res.SSN);
	      		$('#name').val(res.NAME);
	      		
			},
			error:function(xhr,status,error){
				alert(status + ", " + error);
			}
		});
	}
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
			      	<table id="studentTable">
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
			      			<td>${map['HP1'] }-${map['HP2'] }-${map['HP3'] } / ${map['EMAIL1'] }@${map['EMAIL2'] } 
			      			/ ${map['ZIPCODE'] } ${map['ADDRESS'] } ${map['ADDR_DETAIL'] } / ${map['BANK_NAME'] } ${map['ACCOUNT_NO'] }(${map['ACCOUNT_NAME'] })</td>
			      		</tr>
			      	</table>
			      </div>
			      <!--  -->
			      <div class="rowa">
			      
			      </div>
			      <!-- 기본정보 -->
			      <div class="cola s12" id="canEdit">
			      <hr><!-- style="border: 0.5px solid #01539d -->
				      	
				      	<table id="editInfo">
				      		<tr>
				      			<th>이름</th>
				      			<td><input placeholder="이름" name="name" id="name" type="text" class="validate" readonly="readonly"></td>
								<th>학번</th>
								<td><input placeholder="학번" name="officialNo" type="text" class="validate" readonly="readonly" value="${principal.officialNo }"></td>
				      			<th>주민번호</th>
				      			<td><input placeholder="주민번호" name="jumin" id="ssn" type="text" class="validate" readonly="readonly"></td>
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
				      			<td><input placeholder="계좌번호" name="accountNo" id="accountNo" type="text" class="validate"></td>
				      			<th>예금주</th>
				      			<td><input placeholder="예금주명" name="accountName" id="accountName" type="text" class="validate"></td>
				      			
				      		</tr>
				      		<tr>
				      			<th>우편번호</th>
				      			<td><input placeholder="우편번호" name="zipcode" id="zipcode" type="text" class="validate" value="${map['ZIPCODE'] }">
				      			  <button  id="findZipBt" type="button">우편번호 찾기</button></td>
				      			<th>주소</th>
				      			<td><input placeholder="주소" name="address" id="address" type="text" class="validate" value="${map['ADDRESS'] }"></td>
				      			<th>상세주소</th>
				      			<td><input placeholder="상세주소" name="addrDetail" id="addrDetail" type="text" class="validate" value="${map['ADDR_DETAIL'] }"></td>
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