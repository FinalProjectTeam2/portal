<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인인증 창</title>
<style type="text/css">

body{
	margin-top: 50px;
	text-align: center;
}
.input{
    display: block;
    margin: 20px;
}
h1{
	color: #626d80;
}
#getCode{
	margin-top: 50px;
	
}
#countdown{
	margin-top: 50px;
}
h3 {
    margin: 11px 0;
    letter-spacing: 0.2em;
}
</style>
<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
   <!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/identify.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/member.js'/>"></script>
<script type="text/javascript">
	var num = 180; // 몇분을 설정할지의 대한 변수 선언
    var myVar;
	var validate = true;
    function time(){
        myVar = setInterval(alertFunc, 1000); 
    }
    
    function alertFunc() {
        var min = num / 60; 
        min = Math.floor(min);
         
        var sec = num - (60 * min);
        console.log(min)
        console.log(sec)
 
        var $input = $('.input').html("남은시간 " + min + "분 " + sec + "초");
 
        if(num == 0){
            clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
            validate = false;
        }
        num--;
    }
	$(function() {
		if(${param.identState=='N' || empty param.identState}){
		$("#countdown").hide();
		$('#btcode').click(function() {
			if(!validate_ssn($("#ssn1").val()) || !validate_ssn($("#ssn2").val())){
				alert('주민번호는 숫자만 입력이 가능합니다.');
				$("#ssn1").focus();
				return;
			}else if($("#ssn1").val().length < 1 || $("#ssn2").val().length < 1){
				alert('주민번호 앞자리와 뒷자리의 첫째자리를 입력해주세요.');
				$("#ssn1").focus();
				return;
			}
			
			$.ajax({
				url:"<c:url value='/member/identSsn'/>",
				type:"post",
				data:{
					officialNo:$('#offNo').val(),
					ssn1:$('#ssn1').val(),
					ssn2:$('#ssn2').val(),
					identSsn:$('#identSsn').val()
					
				},
				dataType:"json",
				success:function(res){
					if(res.identSsn=='N'){
						alert(res.message);
					}else if(res.identSsn=='Y'){
						$('#offNo').val(res.officialNo);
						ident();
					}
					
				},
				error:function(xhr, status, error){
					alert(error);
				}
				
				
			});

		});
		
		$('#btSubmit').click(function(){
			if(!validate){
				alert('인증번호 유효기간이 지났습니다. 다시 시도하세요.');
				$(location).attr("href", "<c:url value='/member/identify?officialNo=${sessionScope.officialNo}'/>")
			}else{
				//$('form[name=frmGetCode]').submit();
				$.ajax({
					url:"<c:url value='/member/identify'/>",
					type:"post",
					data:{
						inputCode:$('#code').val(),
						officialNo:$('#offNo').val(),
						checkCode:"N"
					},
					dataType:"json",
					success:function(res){
						alert(res.message);
						if(res.identState=='Y'){
							opener.location.href="<c:url value='/login/inputChgPwd'/>"
							self.close();
						}else{
							alert(res.message)
							//실패시 입력창 그대로 남아있음
							$('#code').val('');
							$('#code').focus();
							
						}
						
					},
					error:function(xhr, status, error){
						alert(error);
					}
				});
			}
		});
	
		}else if(${param.identState=='Y'}){
			self.close();
		}
	});
	
function ident(){
		//인증번호 발송 버튼을 누르면 해당버튼 사라짐
		//인증번호 발송 동시에 인증번호 입력창과 버튼이 생김
	$("#showSsn").hide();
	$("#countdown").show();
	$("#getCode").hide();
    time();
	$.ajax({
		url:"<c:url value='/member/sendCode'/>",
		type:"post",
		data:{
			officialNo:$('#offNo').val()
		},
		success:function(res){
			alert(res);
		},
		error:function(xhr, status, error){
			alert(status+","+error);
		}
		
	});
}

</script>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h2>휴대폰 본인인증</h2>
				</div>
		<div class="card-body">
			<form method="post" action="<c:url value='/member/identify'/>" name="frmGetCode">
				<br><br><br><br>
				<div id="showSsn"class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text" style="font-size: 0.7em;"><i class="fas fa-key">주민번호 입력 </i></span>
					</div>
						<input width="100px" type="text" class="form-control" name="ssn1" id="ssn1" size="6" maxlength="6" /><span>&nbsp;-&nbsp;</span>
						<input type="text" name="ssn2" id="ssn2" size="1" maxlength="1" /><h3>&nbsp;&nbsp;******</h3> <br>
				</div>
				<div id="countdown" class="input-group form-group" style="display: hide">
					<div class="input-group-prepend">
						<span class="input-group-text" style="font-size: 0.7em;"><i class="fas fa-key">인증번호 입력</i></span>
					</div>
					<input width="100px" type="text" id="code" class="form-control" name="inputCode" size="20" maxlength="6" /> 
					<input type="hidden" id ="offNo" name="officialNo" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.officialNo}" />
					<input type="hidden" name="checkCode" value="N" />
					<input type="hidden" name="identSsn" id="identSsn" value="N" />
					<lable class="input" style="color:red"></lable>
					<br><br>			
					<div class="form-group">
						<input type="button" id="btSubmit" value="확인" style="margin-top: 30px;margin-right: 20px;" class="btn float-right login_btn"/>
					</div>
				</div>
			</form>
		<div id="getCode" class="form-group">
			<input type="button" id="btcode" value="인증번호 받기" style="margin-top: 30px;margin-right: 20px;" class="btn float-right login_btn"/>
		</div>
		</div>
		</div>
	</div>
</body>
</html>