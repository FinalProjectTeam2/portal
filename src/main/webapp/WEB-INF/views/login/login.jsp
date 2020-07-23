<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<link rel="stylesheet" href="https://mottie.github.io/Keyboard/css/keyboard.css">
<script type="text/javascript" src="https://mottie.github.io/Keyboard/js/jquery.keyboard.js"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/login.css'/>">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/virtual-keyboard/1.30.1/css/keyboard.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://mottie.github.io/Keyboard/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/virtual-keyboard/1.30.1/js/jquery.keyboard.extension-all.min.js"></script>
<style type="text/css">
.ui-tabs .ui-tabs-nav li {
    margin: 0;
}
.ui-widget.ui-widget-content {
    border: 0;
    width: 666px;    
    margin: 0 auto;
}
.ui-tabs .ui-tabs-nav {
    padding: 0;
}
.ui-widget-header {
   border:0;
}
.ui-tabs .ui-tabs-panel {
    padding: 0;
}

.ui-tabs .ui-tabs-nav .ui-tabs-anchor {
    width: 100%;
}

input[type=text],input[type=password]{
    height: 42px;
    border-top-width: 0px;
    border-bottom-width: 0px;
}
/* caret "after" content visible outside of keyboard popup */
.ui-keyboard-preview-wrapper {
    overflow: visible;
}
/* add caret character preview popup */
.ui-keyboard-caret:after {
    content: attr(data-character);
    background: red;
    color: white;
    font-family: Verdana, Tahoma, Segoe, sans-serif;
    font-size: 1.1em;
    min-width: 1em;
    position: absolute;
    z-index: 100;
    top: -1.4em;
    left: -.5em;
}
/* for password, set font to monospace to ensure caret stays lined up */
input[type=password] {
	font-family: monospace !important;
}


/* jsFiddle demo stuff */
body {
    font-size: 12px;
    margin-top: 200px;
}
#wrap {
    display: block;
    margin: 0 auto;
    width: 200px;
}
.spacer {
    height: 20px;
}
</style>
<script>
	$(function() {
		$("#tabs").tabs();
		
		$('.icon').click(function () {
			$('.keyboard')
		    .keyboard({
		    	initialized: function(e, keyboard) {
		    	      keyboard.reveal();
		    	},
				layout: 'custom',
				customLayout: {
					'normal': [
						'` 1 2 3 4 5 6 7 8 9 0 - = {bksp}',
						'{tab} q w e r t y u i o p [ ] \\',
						'a s d f g h j k l ; \' {enter}',
						'{shift} z x c v b n m , . / {shift}',
						'{accept} {space} {left} {right}'
					],
					'shift': [
						'~ ! @ # $ % ^ & * ( ) _ + {bksp}',
						'{tab} Q W E R T Y U I O P { } |',
						'A S D F G H J K L : " {enter}',
						'{shift} Z X C V B N M < > ? {shift}',
						'{accept} {space} {left} {right}'
					]
				}
		    })
		    .addTyping()
		    .addCaret({
		        caretClass: '',
		        // *** for future use ***
		        // data-attribute containing the character(s) next to the caret
		        charAttr: 'data-character',
		        // # character(s) next to the caret (can be negative for RTL)
		        // default is 1 which shows the character to the right of the caret
		        // setting this to -1 shows the character to the left
		        charIndex: 1,
		        // tweak caret position & height
		        offsetX: 0,
		        offsetY: 0,
		        adjustHt: 0
		    });
			
			
		    var kb = $(this).prev().prev().find(".keyboard").getkeyboard();
		    // typeIn( text, delay, callback );
		    kb.reveal().typeIn(500, function () {
		        // do something after text is added
		        // kb.accept();
		    });
		});

	});
</script>

</head>
<body>
	<article>
		<div class="container">
			<div id="tabs">
				<ul class="nav nav-pills nav-fill">
					<li  class="nav-item"><a class="nav-link" href="#tabs-1">학부생</a></li>
					<li  class="nav-item"><a class="nav-link" href="#tabs-2">교수</a></li>
				</ul>
				<div id="tabs-1">
					<div class="card">
						<div class="card-header">
							<p id="title">학부생 로그인</p>
						</div>
						<div class="card-body">
							<form name="loginfrm" method="post"
								action="<c:url value='/login/login'/>">
								<div class="input-group form-group">
									<label for="stuNo" class="lab">아이디</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user"
											style="color: white;"></i></span>
									</div>
									<input type="text" class="form-control" placeholder="아이디"
										name="stuNo">

								</div>
								<div class="input-group form-group">
									<label for="pwd" class="lab">비밀번호</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="keyboard form-control" placeholder="비밀번호"
										name="pwd"> <span class="input-group-text"
										><a href="#" class="icon"><i
											class="fas fa-keyboard" style="color: gray;"></i></a></span>
								</div>
								<div class="form-group">
									<div class="row align-items-center remember" id="chk">
										<input type="checkbox" name="saveStuNo">아이디 저장
									</div>
									<input type="submit" value="로그인"
										class="btn float-right login_btn" id="loginBt">
								</div>
							</form>
						</div>
						<div class="card-footer">
							<div class="d-flex justify-content-center links" id="rule">
								<ul>
									<li>* <em>아이디는 학번/교직원번호 입니다.</em></li>
									<li>* <em>99학번 이전은 학번 규칙 변경(6자리->8자리)에 의하여 다음과 같이
											조정하여 아이디를 입력 바랍니다.</em></li>
									<li>&nbsp;&nbsp;&nbsp;- 서울 : 31 + 학번 / 천안 : 51 + 학번 / 대학원
										: 71 + 학번</li>
									<li>* <em>최초 비밀번호는 생년월일(예, 19961010) 또는 주민등록번호
											뒤7자리(2015년 이전 구성원)입니다.</em></li>
									<li>* <em>최초 비밀번호는 로그인 후 반드시 변경하시기 바랍니다.</em></li>
									<li>* <em>안전한 비밀번호 만들기는 선택이 아닌 필수입니다.(관련근거:사용자보안 지침
											제19조)</em></li>
									<li>&nbsp;&nbsp;&nbsp;- 비밀번호는 학기별 1회 이상 변경한다.<br> <br>&nbsp;&nbsp;&nbsp;-
										비밀번호는 재사용하지 않는다.<br> <br>&nbsp;&nbsp;&nbsp;- 비밀번호는
										연속적인 숫자나 생일, 전화번호, 계정 등 추측하기 쉬운 정보를 사용하지 아니하도록 한다.
									</li>
									<li>* <a href="http://www.dankook.ac.kr/web/kor/privacy"
										target="_blank" style="color: black;"><em>개인정보 처리방침</em></a></li>
								</ul>

							</div>
							<div class="d-flex justify-content-center" id="find">
								<a href="<c:url value='/login/findId'/>"> &nbsp;아이디
									찾기&nbsp;&nbsp;</a>| <a href="<c:url value='/login/findPwd'/>">
									&nbsp;비밀번호 찾기(재설정)&nbsp;&nbsp;&nbsp;</a>| <a
									href="<c:url value='/login/StuNoForNew'/>">&nbsp;&nbsp;신편입생
									학번조회</a>
							</div>
						</div>
					</div>
				</div>

				<div  id="tabs-2">
					<div class="card">
						<div class="card-header">
							<p id="title">교수 로그인</p>
						</div>
						<div class="card-body">
							<form name="loginfrm" method="post"
								action="<c:url value='/login/login'/>">
								<div class="input-group form-group">
									<label for="stuNo" class="lab">아이디</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-user"
											style="color: white;"></i></span>
									</div>
									<input type="text" class="form-control" placeholder="아이디"
										name="stuNo">

								</div>
								<div class="input-group form-group">
									<label for="pwd" class="lab">비밀번호</label>
									<div class="input-group-prepend">
										<span class="input-group-text"><i class="fas fa-key"
											style="color: white;"></i></span>
									</div>
									<input type="password" class="form-control" placeholder="비밀번호"
										name="pwd"> <span class="input-group-text"
										id="keyboard"><a href="#"><i
											class="fas fa-keyboard" style="color: gray;"></i></a></span>
								</div>
								<div class="form-group">
									<div class="row align-items-center remember" id="chk">
										<input type="checkbox" name="saveStuNo">아이디 저장
									</div>
									<input type="submit" value="로그인"
										class="btn float-right login_btn" id="loginBt">
								</div>
							</form>
						</div>
						<div class="card-footer">
							<div class="d-flex justify-content-center links" id="rule">
								<ul>
									<li>* <em>아이디는 학번/교직원번호 입니다.</em></li>
									<li>* <em>99학번 이전은 학번 규칙 변경(6자리->8자리)에 의하여 다음과 같이
											조정하여 아이디를 입력 바랍니다.</em></li>
									<li>&nbsp;&nbsp;&nbsp;- 서울 : 31 + 학번 / 천안 : 51 + 학번 / 대학원
										: 71 + 학번</li>
									<li>* <em>최초 비밀번호는 생년월일(예, 19961010) 또는 주민등록번호
											뒤7자리(2015년 이전 구성원)입니다.</em></li>
									<li>* <em>최초 비밀번호는 로그인 후 반드시 변경하시기 바랍니다.</em></li>
									<li>* <em>안전한 비밀번호 만들기는 선택이 아닌 필수입니다.(관련근거:사용자보안 지침
											제19조)</em></li>
									<li>&nbsp;&nbsp;&nbsp;- 비밀번호는 학기별 1회 이상 변경한다.<br> <br>&nbsp;&nbsp;&nbsp;-
										비밀번호는 재사용하지 않는다.<br> <br>&nbsp;&nbsp;&nbsp;- 비밀번호는
										연속적인 숫자나 생일, 전화번호, 계정 등 추측하기 쉬운 정보를 사용하지 아니하도록 한다.
									</li>
									<li>* <a href="http://www.dankook.ac.kr/web/kor/privacy"
										target="_blank" style="color: black;"><em>개인정보 처리방침</em></a></li>
								</ul>

							</div>
							<div class="d-flex justify-content-center" id="find">
								<a href="<c:url value='/login/findId'/>"> &nbsp;아이디
									찾기&nbsp;&nbsp;</a>| <a href="<c:url value='/login/findPwd'/>">
									&nbsp;비밀번호 찾기(재설정)&nbsp;&nbsp;&nbsp;</a>| <a
									href="<c:url value='/login/StuNoForNew'/>">&nbsp;&nbsp;신편입생
									학번조회</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</article>
</body>
</html>