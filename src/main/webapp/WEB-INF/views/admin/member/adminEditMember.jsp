<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/studentEdit.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/materialize.min.css' />">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address").value = roadAddr;

			}
		}).open();
	}
</script>
<script type="text/javascript">
	//핸드폰 번호에 자동으로 "-"입력
	function inputPhoneNumber(obj) {
		var number = obj.value.replace(/[^0-9]/g, "");
		var phone = "";

		if (number.length < 4) {
			return number;
		} else if (number.length < 7) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3);
		} else if (number.length < 11) {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 3);
			phone += "-";
			phone += number.substr(6);
		} else {
			phone += number.substr(0, 3);
			phone += "-";
			phone += number.substr(3, 4);
			phone += "-";
			phone += number.substr(7);
		}
		obj.value = phone;
	}

	$(function() {
		$('#faculty').change(function() {
			$('#department').find('option').each(function() {
				$(this).remove();
			});
			
			var faculty = $(this).val();
			if(faculty != ''){
				$('#department').append("<option value=''>선택</option>");
				$.ajax({
					type : 'get',
					url : "/portal/common/departmentList",
					data : "facultyNo="
							+ $('#faculty').val(),
					dataType : "json",
					success : function(res){
						$(res).each(function(i) {
								$('#department').append("<option value=\""+ res[i].depNo + "\">"+ res[i].depName+ "</option>");
						});
					},error : function(error){
						alert(error);
					}
				});
			}else{
				$('#department').append("<option value=''>학부를 선택하세요</option>");
			}
		});
		$.select();
		
		$('#editFrm').submit(function() {
			var formData = new FormData();

			formData.append("officialNo", $("#officialNo").val());

			formData.append("bankCode", $("#bankCode").val());
			formData.append("accountNo", $("#accountNo").val());
			formData.append("accountName", $("#accountName").val());

			formData.append("hp", $("#hp").val());
			formData.append("email", $("#email").val());
			formData.append("zipcode", $("#zipcode").val());
			formData.append("address", $("#address").val());
			formData.append("addrDetail", $("#addrDetail").val());

			formData.append("oldFileName", $("#oldFileName").val());

			formData.append("upfile", $("#upfile")[0].files[0]);
			
			if($("#officialNo").val().substring(4,5)=='2'){
				if($("#department").val()==''){
					alert('학부를 선택하세요');
					return false;
				}
				formData.append("department", $("#department").val());
				formData.append("position", $("#position").val());
			}

			$.ajax({
				url : "<c:url value='/admin/member/memberEdit' />",
				type : "post",
				processData : false,
				contentType : false,
				data : formData,
				success : function(res) {
					alert("회원정보 수정이 완료되었습니다");
					if (!res) {
						alert("수정실패");
						return;
					}
					$.select();
				},
				error : function(xhr, status, error) {
					alert(status + ", " + error);
					alert("code = "+ xhr.status + " message = " + xhr.responseText + " error = " + error);
				}
			});
			return false;
		});

		$('#back').click(function() {
			location.href = "<c:url value='/admin/member/adminManageStudent' />";
		});

	});

	$.select = function () {
		var officialNo = $('#officialNo').val();
		console.log(officialNo);
		$.ajax({
			url : "<c:url value='/admin/member/selectInfo' />",
			type: "get",
			data : "officialNo=" + officialNo,
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


				var imgDiv = "<img id='studentImg' alt='사진' src='${ pageContext.request.contextPath }/common/image?img=" +res.IMAGE_URL+ "'/>"
						+'<div class="rowa" style=" margin-top: 20px;"> <label for="upfile">사진수정</label>'
						+'<input type="file" name="upfile" id="upfile" ></div>	'
						+'<input type="hidden" name="oldFileName" id="oldFileName" value=' + res.IMAGE_URL+ '>';

				var defaultDiv = "<img id='studentImg' alt='사진' src='${ pageContext.request.contextPath }/resources/images/student.png'/>"
						+'<div class="rowa" style=" margin-top: 20px;"> <label for="upfile">사진수정</label>'
						+'<input type="file" name="upfile" id="upfile" ></div>	'
						+'<input type="hidden" name="oldFileName" id="oldFileName" value=' + res.IMAGE_URL+ '>';

				var stuInfo = '<tr>'
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
	      			+ '<td>'+res.FACULTY_NAME+'/ 제1전공 : '+res.DEP_NAME+' / 부전공 : ' + res.minor_dep_name
	      			+ '<input type="button"'
					+ 'class="btCustom btn btn-primary btn-lg login-button"'
					+' onclick="location.href=\'/portal/admin/member/adminManageMajor?stuNo='+res.STU_NO+'\'"'
					+ "id='editDep'"
					+ "value='전공관리'" + '>'
	      			+'</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>과정</th>'
	      			+ '<td>학사: '+res.STATE_NAME+'/ '+res.SEMESTER+'학기 </td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>기타</th>'
	      			+ '<td>'+res.HP1+'-'+res.HP2+'-'+res.HP3+' / '+res.EMAIL1+'@'+res.EMAIL2
	      			+ '/ '+res.ZIPCODE+' '+res.ADDRESS+' '+res.ADDR_DETAIL+' / '+res.BANK_NAME+' '+res.ACCOUNT_NO +'('+res.ACCOUNT_NAME+')</td>'
	      			+ '</tr>';

				var profInfo = '<tr>'
	      			+ '<th>학번</th>'
	      			+ '<td>'+res.PROF_NO+' / 임용날짜 : '+moment(res.REGIGNATION_DATE).format('YYYY-MM-DD')
	      			+ '</td>'
		      		+ '</tr>'
		      		+ '<tr>'
	      			+ '<th>교수</th>'
	      			+ '<td>'+res.PROF_NAME+' / '+res.SSN+'/ 대한민국</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>소속</th>'
	      			+ '<td>'+res.FACULTY_NAME+'/ 제1전공 : '+res.DEP_NAME+'</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>직급</th>'
	      			+ '<td>'+res.POSITION_NAME+' </td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>기타</th>'
	      			+ '<td>'+res.HP1+'-'+res.HP2+'-'+res.HP3+' / '+res.EMAIL1+'@'+res.EMAIL2
	      			+ '/ '+res.ZIPCODE+' '+res.ADDRESS+' '+res.ADDR_DETAIL+' / '+res.BANK_NAME+' '+res.ACCOUNT_NO +'('+res.ACCOUNT_NAME+')</td>'
	      			+ '</tr>';

				var adminInfo = '<tr>'
	      			+ '<th>학번</th>'
	      			+ '<td>'+res.EMP_NO+' / 임용날짜 : '+moment(res.START_DATE).format('YYYY-MM-DD')
	      			+ '</td>'
		      		+ '</tr>'
		      		+ '<tr>'
	      			+ '<th>직원</th>'
	      			+ '<td>'+res.EMP_NAME+' / '+res.SSN+'/ 대한민국</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>소속</th>'
	      			+ '<td>'+res.DEP_NAME+'</td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>직급</th>'
	      			+ '<td>'+res.POSITION_NAME+' </td>'
	      			+ '</tr>'
	      			+ '<tr>'
	      			+ '<th>기타</th>'
	      			+ '<td>'+res.HP1+'-'+res.HP2+'-'+res.HP3+' / '+res.EMAIL1+'@'+res.EMAIL2
	      			+ '/ '+res.ZIPCODE+' '+res.ADDRESS+' '+res.ADDR_DETAIL+' / '+res.BANK_NAME+' '+res.ACCOUNT_NO +'('+res.ACCOUNT_NAME+')</td>'
	      			+ '</tr>';

				if(res.IMAGE_URL != 'default.jpg'){
					$('#imgDiv').html(imgDiv);
				}else{
					$('#imgDiv').html(defaultDiv);
				}

				if(res.type == 'STUDENT'){
	      			$('#infoTable').html(stuInfo);
	      			$('#name').val(res.NAME);
				}else if(res.type == 'PROFESSOR'){
	      			$('#infoTable').html(profInfo);
	      			$('#name').val(res.PROF_NAME);
				}else if(res.type=='ADMIN'){
	      			$('#infoTable').html(adminInfo);
	      			$('#name').val(res.EMP_NAME);
				}

	      		$('#ssn').val(res.SSN);
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

#editDep {
	width: 65px;
	height: 25px;
	font-size: 12px;
	padding: 0 1px 1px 0;
	margin: 0 0 5px 10px;
}
.toast {
    border-radius: 0;
    top: 60px;
    width: 260px;
    margin-top: 0;
    position: fixed;
    max-width: 350px;
    height: auto;
    min-height: 48px;
    line-height: 1em;
    background-color: white;
    padding: 0;
    font-size: 0.8em;
    font-weight: 100;
    color: white;
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: justify;
    -webkit-justify-content: space-between;
    -ms-flex-pack: justify;
    justify-content: space-between;
    cursor: default;
}
</style>
<main role="main" class="flex-shrink-0">
	<div class="container">

		<div id="editStu">
			<fieldset>
				<legend>정보조회 및 개인정보 변경</legend>
				<!-- contents -->
				<form name="editFrm" method="post" enctype="multipart/form-data"
					id="editFrm">
					<div class="rowa">
						<!-- 기존정보 -->
						<div class="cola s3" id="imgDiv">
							< <img id="studentImg" alt="디폴트"
								src="<c:url value='/resources/images/student.png'/>">
							<div class="rowa" style="margin-top: 20px;">
								<label for="upfile">사진수정</label> <input type="file"
									name="upfile" id="upfile">

							</div>
						</div>
			      <div class="cola s9" id="info">
			      	<table id="infoTable">
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
				      			<td><input placeholder="이름" name="name" id="name" type="text" class="validate"></td>
								<th>학번</th>
								<td><input placeholder="학번" name="officialNo" id ="officialNo" type="text" class="validate" readonly="readonly" value="${officialNo }"></td>
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
				      			<td><input placeholder="-없이 입력해주세요" name="accountNo" id="accountNo" type="text" class="validate"></td>
				      			<th>예금주</th>
				      			<td><input placeholder="예금주명" name="accountName" id="accountName" type="text" class="validate"></td>
				      		</tr>
				      		<tr>
				      			<th>우편번호</th>
				      			<td><input placeholder="우편번호" name="zipcode" id="zipcode" type="text" class="validate" value="">
				      			  <button  id="findZipBt" type="button" onclick="sample4_execDaumPostcode()">우편번호 찾기</button></td>
				      			<th>주소</th>
				      			<td><input placeholder="주소" name="address" id="address" type="text" class="validate" value="">
				      				<span id="dong"></span>
				      			</td>
				      			<th>상세주소</th>
				      			<td><input placeholder="상세주소" name="addrDetail" id="addrDetail" type="text" class="validate" value=""></td>
				      		</tr>
				      		<tr>
				      			<th>이메일</th>
								<td><input placeholder="이메일" name="email" id="email" type="text" class="validate" value=""></td>
								<th>전화번호</th>
								<td><input placeholder="핸드폰번호" onKeyup="inputPhoneNumber(this);" name="hp" id="hp" type="text" class="validate" value=""></td>
				      		</tr>
				      		<c:if test="${fn:substring(officialNo,4,5)=='2' }">
								<tr>
									<th>학부</th>
									<td>
									<select class="browser-default" name="facultyNo" id="faculty">
								      <c:if test="${!empty facultyList }">
								      	<c:forEach var="facultyVo" items="${facultyList }">
								      		<option value="${facultyVo.facultyNo }" 
								      		<c:if test="${profMap['FACULTY_NO']==facultyVo.facultyNo}">
												 selected="selected"
											</c:if>
								      		>${facultyVo.facultyName }</option>
								      	</c:forEach>
								      </c:if>
								    </select>
									<div>
										<label for="department">학과</label> 
										<select name="depNo" id="department">
												<option value="">학부를 선택하세요</option>
												<c:forEach var="vo" items="${departmentList }">
													<option value="${vo.depNo}"
														<c:if test="${profMap['DEP_NO']==vo.depNo}">
											 selected="selected"</c:if>>${vo.depName }</option>
												</c:forEach>
										</select>
									</div>
									</td>
								
									<th>직급</th>
									<td>
									<select class="browser-default" name="positionNo" id="position">
								      <c:if test="${!empty positionList }">
								      	<c:forEach var="posiVo" items="${positionList }">
								      		<option value="${posiVo.positionNo }" 
								      		<c:if test="${profMap['POSITION_NO']==posiVo.positionNo}">
												 selected="selected"
											</c:if>
								      		>${posiVo.positionName }</option>
								      	</c:forEach>
								      </c:if>
								    </select>
									</td>
								</tr>
				      		</c:if>
				      	</table>
				      	<div style="text-align: center; margin-top: 10px;">
				      			<input type="submit" id="editBt" value="정보수정" style="color: white;">
				      			<input type="button" id="back" value="되돌아가기" style="color: white;">
			    		</div>
			      </div>
			   </div>
			</form>
			</fieldset>
		</div>
		<%@ include file="../../inc/bottom.jsp"%>
