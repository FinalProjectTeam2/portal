<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기 - 팝업</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- sockJs -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="referrer" content="always">
<sec:authentication var="principal" property="principal" />
<style type="text/css">
body {
    margin: 0;
    font-size: 13px;
}
#pop_wrap{
	margin: 0 auto;
}
div#normalMode {
    padding: 11px 10px 7px 10px;
    border-bottom: 1px solid gray;
}

label.recipient {
    font-weight: bold;
    font-size: 1.05em;
}

input#chk_tome {
    margin: 0 0 0 5px;
    vertical-align: middle;
}

input#who {
    width: 230px;
}

.writing_area {
    padding: 15px;
    padding-bottom: 5px;
}

label {font-size: 1em;}

.writing_option {
    overflow: hidden;
    padding: 0 14px;
}

.character {
    float: right;
    text-align: right;
    width: 30%;
    font-size: 0.9em;
    padding: 0 10px;
}

div#comment1 {
    float: left;
    width: 83%;
}

#comment1 label {
    font-weight: bold;
}

p.txt_under {
    display: unset;
    font-size: 0.8em;
    color: gray;
    letter-spacing: -0.7px;
}
.btns {text-align: center;}

a.btn.btn-primary {
    margin: 5px;
}

input#savenote {
    margin: 0;
}
#addrList{
	margin: 0 0 3px 0;
    padding: 0 5px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#sendMessageBtn").click(function() {
			var officialNo = $("#officialNo").val();
			var writeNote = $("#writeNote").val();
			$.ajax({
				url : '<c:url value="/message/ajax/insert"/>',
				data : {
					officialNo : officialNo,
					writeNote : writeNote
				},
				type : 'get',
				success : function(res) {
					 window.opener.send12(officialNo); 
					 self.close();
				},
				error : function(e) {
					alert(e);
				}
			});
		});
		
		$("#addrList").click(function() {
			var win = window.open("<c:url value='/message/addrList'/>", "_blank",
			"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=510,height=415");
			return false;
		});
		
		$("#writeNote").keyup(function() {
			var len = $("#writeNote").val().length;
			$("#noteLen").html(len);
		});
		
		$("#chk_tome").change(function(){
	        if($(this).is(":checked")){
	            $("#officialNo").val('${principal.officialNo}');
	            $("#officialNo").attr("disabled","disabled");
	        }else{
	        	$("#officialNo").val('');
	            $("#officialNo").attr("disabled",false);
	        }
	    });
		
		if('${type}' == 'self'){
			$("#chk_tome").attr("checked","checked");
			$("#officialNo").val('${principal.officialNo}');
	        $("#officialNo").attr("disabled","disabled");
	        $("#addrList").attr("disabled","disabled");
		}else if('${type}' == 're'){
			$("#officialNo").val('${officialNo}');
	        $("#officialNo").attr("disabled","disabled");
	        $("#addrList").attr("disabled","disabled");
		}
	});
	
</script>
</head>
<body>
<div id="pop_wrap" class="pop_write">
	<div class="pop_content">
		<div class="note_write">			
			<div class="send_window">
				<div id="normalMode">
				<span class="tf_tit">
					<label for="who" class="recipient">받는사람</label>
					<input type="checkbox" id="chk_tome" >
					<label for="chk_tome">내게쓰기</label>
				</span>
				<span class="tf_cont">	
					<span class="tx">
						<input type="text" id="officialNo" value="" style="ime-mode: disabled;">
					</span>
					<button id="addrList" class="btn btn-secondary">주소록</button>
				</span>
				</div>
				<div class="writing_area">
					<textarea id="writeNote" maxlength="1000" style="resize:none;" rows="12" cols="75" title="쪽지 내용을 입력해 주세요."></textarea>
				</div>
				<div class="writing_option">
					<div class="character">
						<span id="noteLen">0</span> / <span id="noteMaxLen">1,000</span>자
					</div>					
				</div>
			</div>
			<div class="btns">				
				<a style="cursor: pointer;" class="btn btn-primary" id="sendMessageBtn">보내기</a>
				<a href="#" class="btn btn-primary" onclick="window.close();">취소</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>