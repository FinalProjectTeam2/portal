<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<script type="text/javascript">
$(function() {
    $('#btRegi')
          .click(
                function() {
                   var sort = $('#sort').val();
                   if (sort == 1) {
                      check();
                      $('#form')
                            .prop("action",
                                  "<c:url value='/admin/adminRegisterEmployee' />");
                   } else if (sort == 2) {
                      check();
                      $('#form')
                            .prop("action",
                                  "<c:url value='/admin/adminRegisterProfessor' />");
                   } else if (sort == 3) {
                      check();
                      $('#form')
                            .prop("action",
                                  "<c:url value='/admin/adminRegisterStudent' />");
                   } else if (sort == null) {
                      alert('회원구분을 선택해주세요');
                      $('#sort').focus();
                      event.preventDefault();
                   }
                });

    function check() {
       if ($('#name').val() == "") {
          alert('이름을 입력해주세요');
          $('#name').focus();
          event.preventDefault();
       } else if ($('#SSN').val() == "") {
          alert('주민번호를 입력해주세요');
          $('#SSN').focus();
          event.preventDefault();
       } else if ($('#hp1').val() == "") {
          alert('전화번호를 입력해주세요');
          $('#hp1').focus();
          event.preventDefault();
       } else if ($('#hp2').val() == "") {
          alert('전화번호를 입력해주세요');
          $('#hp2').focus();
          event.preventDefault();
       } else if ($('#hp3').val() == "") {
          alert('전화번호를 입력해주세요');
          $('#hp3').focus();
          event.preventDefault();
          /*    }else if($('#depCode').val() == null){
                alert('부서를 선택해주세요');
                $('#depCode').focus();
                event.preventDefault();
             }else if($('#authCode').val() == null){
                alert('권한을 선택해주세요');
                $('#authCode').focus();
                event.preventDefault();
             }else if($('#positionCode').val() == null){
                alert('직책을 선택해주세요');
                $('#positionCode').focus();
                event.preventDefault(); */
       } else if (!validate_number($('#hp1').val())
             || !validate_number($('#hp2').val())
             || !validate_number($('#hp3').val())) {
          alert('전화번호는 숫자만 가능합니다.');
          $('#hp1').focus();
          event.preventDefault();
       } else if (!validate_number($('#SSN').val())) {
          alert('주민번호는 숫자만 가능합니다.');
          $('#SSN').focus();
          event.preventDefault();
       }
    }
    //이메일 직접입력
    $('#email2').change(function() {
          if($(this).val()=='etc'){
             $('#email3').val('');
             $('#email3').css('visibility','visible');
             $('#email3').focus();
          }else{
             $('#email3').css('visibility','hidden');
             $('#email3').val('');
          }
       });
    //숫자만 입력가능
    function validate_number(number) {
       var pattern = new RegExp(/^[0-9]*$/);
       return pattern.test(number);
    }

    //등록 구분 시 입력창
    $('select[name=sort]').change(function() {
       if ($('select[name=sort]').val() == 1) {
          $('.emp').css('display', 'block');
          $('.emp select').val("");
          $('.stud').css('display', 'none');
       } else {
          $('.emp').css('display', 'none');
          $('.stud').css('display', 'block');
          $('.stud select').val("");
       }
       if ($('select[name=sort]').val() == 2) {
          $('.prof').css('display', 'block');
          $('.prof select').val("");
       } else {
          $('.prof').css('display', 'none');
       }
    });
    //ajax 학과 검색
     $('#faculty').change(function() {
       $('#department').find('option').each(function() {
          $(this).remove();
       });
       $('#department').append("<option value=''>선택</option>");

       var faculty = $(this).val();
       if (faculty != "") {

          $.ajax({
             type:'get',
             url: "<c:url value='/admin/member/departmentList'/>",
             data:"facultyNo="+$('#faculty').val(),
             dataType:"json",
             success:function(res){
                $(res).each(function(i){
                   $('#department').append("<option value=\""+
                      res[i].depNo+"\">"+res[i].depName+"</option>");
                });
             },error:function(xhr){
                console.log(xhr.responseTest);
                alert("오류");
                return;
             }
             
          })
       }
    });
 });
</script>
<link
	href="<c:url value='/resources/css/admin/adminRegisterMember.css' />"
	rel="stylesheet">

<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="regiMember">
			<div class="container">
				<div class="row main">
					<div id="sel">
						<div id="header">
							<h3>회원 등록</h3>
						</div>
						<div class="main-login main-center">
							<!--  -->
							<form class="form-horizontal" method="post" id="form">
								<div class="form-group">
									<div>
										<label for="sort">회원 구분</label> <select name="sort" id="sort">
											<option value="3">학생</option>
											<option value="2">교수</option>
											<option value="1">임직원</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="cols-sm-2 control-label">이름</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="name" id="name"
												placeholder="이름을 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="ssn" class="cols-sm-2 control-label">주민번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-user fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="ssn" id="SSN"
												placeholder="-는 빼고 입력하세요" />
										</div>
									</div>
								</div>
								<div class="form-group">
									<label for="hp2" class="cols-sm-2 control-label">전화번호</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<span class="input-group-addon"><i
												class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
												type="text" class="form-control" name="hp1" id="hp1"
												value="010" /> <input type="text" class="form-control"
												name="hp2" id="hp2" /> <input type="text"
												class="form-control" name="hp3" id="hp3" />
										</div>
									</div>
								</div>
								<div class="form-group">


									<label for="email1" class="cols-sm-2 control-label">이메일</label>
									<div class="cols-sm-10">
										<div class="input-group">
											<input type="text" class="form-control" name="email1"
												id="email1" />@ <select name="email2" id="email2">
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="daum.net">daum.net</option>
												<option value="etc">직접입력</option>
											</select> <input type="text" class="form-control" name="email3"
												id="email3" style="visibility: hidden;" />
										</div>
									</div>
								</div>
								<!--공통입력 항목 구분선  -->
								<hr id="selLine">
								<div class="hid emp form-group">
									<div>
										<label for="depCode">부서</label> <select name="depCode"
											id="depCode">
											<option value="">선택</option>
											<c:forEach var="vo" items="${empDepartList }">
												<option value="${vo.depCode }">${vo.depName }</option>
											</c:forEach>

										</select>
									</div>
								</div>
								<div class="hid emp form-group">
									<div>
										<label for="authCode">권한</label> <select name="authCode"
											id="authCode">
											<option value="">선택</option>
											<c:forEach var="vo" items="${authorityList }">
												<option value="${vo.authCode }">${vo.authName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="hid emp form-group">
									<div>
										<label for="positionCode">직책</label> <select
											name="positionCode" id="positionCode">
											<option value="">선택</option>
											<c:forEach var="vo" items="${empPositionList }">
												<option value="${vo.positionCode }">${vo.positionName}</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="stud faculty form-group">
									<div>
										<label for="faculty">학부</label> <select name="facultyNo"
											id="faculty">
											<option value="">선택</option>
											<c:forEach var="facVo" items="${facultyList }">
												<option value="${facVo.facultyNo }">${facVo.facultyName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="stud department form-group">
									<div>
										<label for="depNo">학과</label> <select name="depNo"
											id="department">
										</select>
									</div>
								</div>
								<div class="hid prof department form-group">
									<div>
										<label for="positionNo">교수직급</label> <select name="positionNo">
											<option value="">선택</option>
											<c:forEach var="positionVo" items="${profPositionList }">
												<option value="${positionVo.positionNo }">${positionVo.positionName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group ">
									<button type="submit"
										class="btn btn-primary btn-lg btn-block login-button"
										id="btRegi">등록</button>
								</div>
								<div class="login-register"></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../inc/bottom.jsp"%>