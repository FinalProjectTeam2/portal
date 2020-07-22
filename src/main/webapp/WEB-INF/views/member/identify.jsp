<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인인증 창</title>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
		var num = 180; // 몇분을 설정할지의 대한 변수 선언
	    var myVar;
	    function time(){
	        myVar = setInterval(alertFunc, 1000); 
	    }
	    
	    function alertFunc() {
	        var min = num / 60; 
	        min = Math.floor(min);
	         
	        var sec = num - (60 * min);
	        console.log(min)
	        console.log(sec)
	 
	        var $input = $('.input').val("남은시간" + min + "분" + sec + "초");
	 
	        if(num == 0){
	            clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료
	        }
	        num--;
	    }
	$(function() {

		
		
		//인증번호 발송 버튼을 누르면 해당버튼 사라짐
		//인증번호 발송 동시에 인증번호 입력창과 버튼이 생김
		$("#countdown").hide();
		$('#getCode').click(function() {
			$("#countdown").show();
			$(this).hide();
		    time();
			$.ajax({
				url:"<c:url value='/member/sendCode'/>",
				type:"get",
				data:"officialNo="+${param.officialNo},
				success:function(res){
					alert(res);
				},
				error:function(xhr, status, error){
					alert(status+","+error);
				}
				
			});

		});


	});
</script>
</head>
<body>
	<h1>휴대폰 본인인증</h1>
	<div id="countdown" style="display: hide">
		<input type="text" id="code" name="inputCode" /> 
		<input type="button" id="btSubmit" value="확인" /> 
		<input type="hidden" name="stuNo" value="${param.officialNo }" />
		<input type="text" class="input"/>
	</div>

	<input type="button" id="getCode" value="인증번호 받기" />
</body>
</html>