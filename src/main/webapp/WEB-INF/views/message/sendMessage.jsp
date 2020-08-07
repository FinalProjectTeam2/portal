<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기 - 팝업</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="referrer" content="always">
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
    width: 15%;
    font-size: 0.9em;
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
</style>
</head>
<body>
<div id="pop_wrap" class="pop_write">
	<div class="pop_content">
		<div class="note_write">			
			<div class="send_window">
				<div id="normalMode">
				<span class="tf_tit">
					<a class="recipient" id="recipient" style="display:none;">받는사람</a>
					<label for="who" class="recipient">받는사람</label>
					<input type="checkbox" id="chk_tome" onclick="">
					<label for="chk_tome">내게쓰기</label>
				</span>
				<span class="tf_cont">	
					<span class="tx">
						<input type="text" id="who" value="" style="ime-mode: disabled;">
					</span>
				</span>
				</div>
				<div class="writing_area">
					<textarea id="writeNote" maxlength="1000" style="resize:none;" onkeyup="checkContentLength();" rows="12" cols="75" title="쪽지 내용을 입력해 주세요."></textarea>
				</div>
				<div class="writing_option">
					<div class="character">
						<span id="noteLen">0</span> / <span id="noteMaxLen">1,000</span>자
					</div>					
					<div id="comment1" class="save">
						<input type="checkbox" id="savenote">
						<label for="savenote">보낸쪽지함에 저장</label> 
						<p class="txt_under">(보낸쪽지함에 저장하면 수신확인/발송취소가 가능합니다.)</p>
					</div>
					<!-- [D] 내게쓰기 체크시 display:block -->
					<p id="comment2" style="display:none">
						내게 쓴 쪽지는 <strong>내게쓴쪽지함</strong>에만 저장되며,<br>
						삭제하시지 않으시면 영구 보관됩니다.
					</p>
				</div>
			</div>
			<div class="btns">				
				<a href="#" class="btn btn-primary">보내기</a>
				<a href="#" class="btn btn-primary" onclick="window.close();">취소</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>