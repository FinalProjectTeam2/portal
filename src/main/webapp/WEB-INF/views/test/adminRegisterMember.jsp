<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<script type="text/javascript">
	$(function () {

		$('#btRegi').click(function () {
			var sort = $('#sort').val();
			if(sort == 1){
				check();
				$('#form').prop("action","<c:url value='/admin/adminRegisterMemberEmployee' />");
			}else if(sort == 2){
				check();
				$('#form').prop("action","<c:url value='/admin/adminRegisterMemberProfessor' />");
			}else if(sort == 3){
				check();
				$('#form').prop("action","<c:url value='/admin/adminRegisterMemberStudent' />");
			}else if(sort == null){
				alert('회원구분을 선택해주세요');
				$('#sort').focus();
				event.preventDefault();
			}
		});	 
		
		
		function check() {
			if($('#name').val() == ""){
				alert('이름을 입력해주세요');
				$('#name').focus();
				event.preventDefault();
			}else if($('#SSN').val() == ""){
				alert('주민번호를 입력해주세요');
				$('#SSN').focus();
				event.preventDefault();
			}else if($('#hp1').val() == ""){
				alert('전화번호를 입력해주세요');
				$('#hp1').focus();
				event.preventDefault();
			}else if($('#hp2').val() == ""){
				alert('전화번호를 입력해주세요');
				$('#hp2').focus();
				event.preventDefault();
			}else if($('#hp3').val() == ""){
				alert('전화번호를 입력해주세요');
				$('#hp3').focus();
				event.preventDefault();
			}else if($('#depCode').val() == null){
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
				event.preventDefault();
			}else if(!validate_number($('#hp1').val()) || !validate_number($('#hp2').val())|| !validate_number($('#hp3').val())){
				alert('전화번호는 숫자만 가능합니다.');
				$('#hp1').focus();
				event.preventDefault();
			}else if(!validate_number($('#SSN').val())){
				alert('주민번호는 숫자만 가능합니다.');
				$('#SSN').focus();
				event.preventDefault();
			}
		}
		
		//숫자만 입력가능
		function validate_number(number) {
			var pattern = new RegExp(/^[0-9]*$/);
			return pattern.test(number);
		}
		

	});
</script>
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
                     <form class="form-horizontal" method="post" action="#" id="form">
                        <div class="form-group">
                           <div>
                              <label for="sort">회원 구분</label> <select name="sort" id="sort">
                                 <option disabled selected>선택</option>
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
                           <label for="SSN" class="cols-sm-2 control-label">주민번호</label>
                           <div class="cols-sm-10">
                              <div class="input-group">
                                 <span class="input-group-addon"><i
                                    class="fa fa-user fa" aria-hidden="true"></i></span> <input
                                    type="text" class="form-control" name="SSN" id="SSN"
                                    placeholder="-는 빼고 입력하세요" /><span id="ssnError"></span>
                              </div>
                           </div>
                        </div>         
                        <div class="form-group">
                           <label for="email" class="cols-sm-2 control-label">hp1</label>
                           <div class="cols-sm-10">
                              <div class="input-group">
                                 <span class="input-group-addon"><i
                                    class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
                                    type="text" class="form-control" name="tel" id="hp1"
                                    placeholder="-는 빼고 입력해주세요" />
                              </div>
                           </div>
                        </div>            
                        <div class="form-group">
                           <label for="email" class="cols-sm-2 control-label">hp2</label>
                           <div class="cols-sm-10">
                              <div class="input-group">
                                 <span class="input-group-addon"><i
                                    class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
                                    type="text" class="form-control" name="tel" id="hp2"
                                    placeholder="-는 빼고 입력해주세요" />
                              </div>
                           </div>
                        </div>            
                        <div class="form-group">
                           <label for="email" class="cols-sm-2 control-label">hp3</label>
                           <div class="cols-sm-10">
                              <div class="input-group">
                                 <span class="input-group-addon"><i
                                    class="fa fa-envelope fa" aria-hidden="true"></i></span> <input
                                    type="text" class="form-control" name="tel" id="hp3"
                                    placeholder="-는 빼고 입력해주세요" />
                              </div>
                           </div>
                        </div>            
        
                        <hr id="selLine">
                        <div class="form-group">
                           <div>
                              <label for="depCode">부서</label> <select name="depCode" id="depCode">
                                 <option disabled selected>선택</option>
                                 <option value="1">교학처</option>
                                 <option value="2">기획처</option>
                                 <option value="3">학생처</option>
                                 <option value="4">입학홍보처</option>
                                 <option value="5">사무처</option>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                           <div>
                              <label for="authCode">권한</label> <select name="authCode" id="authCode">
                                 <option disabled selected>선택</option>
                                 <option value="1">admin</option>
                                 <option value="2">manager</option>
                                 <option value="3">staff</option>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                           <div>
                              <label for="positionCode">직책</label> <select name="positionCode" id="positionCode">
                                 <option disabled selected>선택</option>
                                 <option value="1">부장</option>
                                 <option value="2">주임</option>
                                 <option value="3">사원</option>
                              </select>
                           </div>
                        </div>
                         <!-- <div class="form-group">
                           <label for="" class="cols-sm-2 control-label"></label>
                           <div class="cols-sm-10">
                              <div class="input-group">
                                 <span class="input-group-addon"><i
                                    class="fa fa-user fa" aria-hidden="true"></i></span> <input
                                    type="text" class="form-control" name="" id=""
                                    placeholder="-는 빼고 입력하세요" />
                              </div>
                           </div>
                        </div> -->
                        
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