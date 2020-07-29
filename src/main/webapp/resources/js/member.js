/**
 * mamber.js
 */
var contextPath = "/herb";
$(function() {
	$('#email2').change(function() {
		if($(this).val() == 'etc'){
			$('#email3').css('visibility', 'visible');
			$("#email3").val("");
            $("#email3").focus();
		}else{
			$('#email3').css('visibility', 'hidden');
		}
	});
	
	$('#btnChkId').click(function() {
		var userid = $('#userid').val()
		window.open(contextPath+'/member/checkUserid.do?userid='+userid, 'chk', 'width=450, height=300, left=0, top=0, location=yes, resizable=yes');
	});
	
	$('#btnZipcode').click(function () {
		window.open(contextPath+'/zipcode/zipcode.do', 'code', 'width=500, height=500, left=100, top=50, location=yes, resizable=yse');
	});
});

function validate_userid(id) {
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(id);
}
/*정규식 /^[a-zA-Z0-9_]+$/g
a에서 z 사이의 문자, A~Z사이의 문자, 0 에서 9사이의 숫자나 _로 시작하거나 끝나야 한다는 의미
닫기 대괄호(]) 뒤의 + 기호는 이 패턴이 한 번 또는 그 이상 반복된다는 의미*/

function validate_phone(tel){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(tel);
}
/*정규식 /^[0-9]*$/g
0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복*/

function validate_ssn(ssn){
	var pattern = new RegExp(/^[0-9]*$/g);
	return pattern.test(ssn);
}



