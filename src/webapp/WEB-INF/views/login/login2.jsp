<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 키보드 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/virtual-keyboard/1.30.1/css/keyboard-dark.min.css">
<script type="text/javascript"
	src="https://mottie.github.io/Keyboard/js/jquery.keyboard.js"></script>
<script type="text/javascript"
	src="https://mottie.github.io/Keyboard/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="https://mottie.github.io/Keyboard/js/jquery.keyboard.extension-typing.js"></script>

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
	border: 0;
}

.ui-tabs .ui-tabs-panel {
	padding: 0;
}

.ui-tabs .ui-tabs-nav .ui-tabs-anchor {
	width: 100%;
}

input[type=text], input[type=password] {
	height: 42px;
	border-top-width: 0px;
	border-bottom-width: 0px;
}

div#keyboard_keyboard {
	font-size: 0.8em;
	width: 621px;
	height: 252px;
	background: #a0a0a0b0;
}

button.ui-keyboard-button:hover {
	color: white;
}
</style>
<script>
	$(function() {
		
		$("#tabs").tabs();

		/* VIRTUAL KEYBOARD DEMO - https://github.com/Mottie/Keyboard */

		// text that is typed when when pressing the
		// keyboard icon (actual code using .typeIn()
		// is at the bottom of this code block
		// create a new language (love, awww) by copying the english language
		// file. we're doing this just for this demo, so we can add "<3" to the
		// combo regex
		$.keyboard.language.love = $.extend($.keyboard.language.en);
		$('.icon')
				.click(
						function() {
							$('.keyboard')
									.keyboard(
											{
												// set this to ISO 639-1 language code to override language set by
												// the layout: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
												// language defaults to ["en"] if not found
												language : [ 'love' ],
												rtl : false,

												// *** choose layout & positioning ***
												// choose from 'qwerty', 'alpha',
												// 'international', 'dvorak', 'num' or
												// 'custom' (to use the customLayout below)
												layout : 'qwerty',
												customLayout : {
													'normal' : [
															'` 1 2 3 4 5 6 7 8 9 0 - = {bksp}',
															'{tab} q w e r t y u i o p [ ] \\',
															'a s d f g h j k l ; \' {enter}',
															'{shift} z x c v b n m , . / {shift}',
															'{accept} {space} {left} {right}' ],
													'shift' : [
															'~ ! @ # $ % ^ & * ( ) _ + {bksp}',
															'{tab} Q W E R T Y U I O P { } |',
															'A S D F G H J K L : " {enter}',
															'{shift} Z X C V B N M < > ? {shift}',
															'{accept} {space} {left} {right}' ]
												},
												// Used by jQuery UI position utility
												position : {
													// null = attach to input/textarea;
													// use $(sel) to attach elsewhere
													of : $(".container"),
													my : 'right middle',
													at : 'right middle',
													// used when "usePreview" is false
													at2 : 'right middle'
												},

												// allow jQuery position utility to reposition the keyboard on
												// window resize
												reposition : true,

												// true: preview added above keyboard;
												// false: original input/textarea used
												usePreview : true,

												// if true, the keyboard will always be visible
												alwaysOpen : false,

												// give the preview initial focus when the keyboard
												// becomes visible
												initialFocus : true,
												// Avoid focusing the input the keyboard is attached to
												noFocus : false,

												// if true, keyboard will remain open even if
												// the input loses focus.
												stayOpen : false,

												// Prevents the keyboard from closing when the user clicks or
												// presses outside the keyboard. The `autoAccept` option must
												// also be set to true when this option is true or changes are lost
												userClosed : false,

												// if true, keyboard will not close if you press escape.
												ignoreEsc : false,

												// *** change keyboard language & look ***
												display : {
													'meta1' : '\u2666', // Diamond
													'meta2' : '\u2665', // Heart

													// check mark (accept)
													'a' : '\u2714:Accept (Shift-Enter)',
													'accept' : 'Accept:Accept (Shift-Enter)',
													'alt' : 'AltGr:Alternate Graphemes',
													// Left arrow (same as &larr;)
													'b' : '\u2190:Backspace',
													'bksp' : 'Bksp:Backspace',
													// big X, close/cancel
													'c' : '\u2716:Cancel (Esc)',
													'cancel' : 'Cancel:Cancel (Esc)',
													// clear num pad
													'clear' : 'C:Clear',
													'combo' : '\u00f6:Toggle Combo Keys',
													// num pad decimal '.' (US) & ',' (EU)
													'dec' : '.:Decimal',
													// down, then left arrow - enter symbol
													'e' : '\u21b5:Enter',
													'empty' : '\u00a0', // &nbsp;
													'enter' : 'Enter:Enter',
													// left arrow (move caret)
													'left' : '\u2190',
													// caps lock
													'lock' : '\u21ea Lock:Caps Lock',
													'next' : 'Next \u21e8',
													'prev' : '\u21e6 Prev',
													// right arrow (move caret)
													'right' : '\u2192',
													// thick hollow up arrow
													's' : '\u21e7:Shift',
													'shift' : 'Shift:Shift',
													// +/- sign for num pad
													'sign' : '\u00b1:Change Sign',
													'space' : '\u00a0:Space',
													// right arrow to bar
													// \u21b9 is the true tab symbol
													't' : '\u21e5:Tab',
													'tab' : '\u21e5 Tab:Tab',
													// replaced by an image
													'toggle' : ' ',

													// added to titles of keys
													// accept key status when acceptValid:true
													'valid' : 'valid',
													'invalid' : 'invalid',
													// combo key states
													'active' : 'active',
													'disabled' : 'disabled'

												},

												// Message added to the key title while hovering,
												// if the mousewheel plugin exists
												wheelMessage : 'Use mousewheel to see other keys',

												css : {
													// input & preview
													input : 'ui-widget-content ui-corner-all',
													// keyboard container
													container : 'ui-widget-content ui-widget ui-corner-all ui-helper-clearfix',
													// keyboard container extra class (same as container, but separate)
													popup : '',
													// default state
													buttonDefault : 'ui-state-default ui-corner-all',
													// hovered button
													buttonHover : 'ui-state-hover',
													// Action keys (e.g. Accept, Cancel, Tab, etc);
													// this replaces "actionClass" option
													buttonAction : 'ui-state-active',
													// Active keys
													// (e.g. shift down, meta keyset active, combo keys active)
													buttonActive : 'ui-state-active',
													// used when disabling the decimal button {dec}
													// when a decimal exists in the input area
													buttonDisabled : 'ui-state-disabled',
													// {empty} button class name
													buttonEmpty : 'ui-keyboard-empty'
												},

												// *** Useability ***
												// Auto-accept content when clicking outside the
												// keyboard (popup will close)
												autoAccept : false,
												// Auto-accept content even if the user presses escape
												// (only works if `autoAccept` is `true`)
												autoAcceptOnEsc : false,

												// Prevents direct input in the preview window when true
												lockInput : false,

												// Prevent keys not in the displayed keyboard from being
												// typed in
												restrictInput : false,
												// Additional allowed characters while restrictInput is true
												restrictInclude : '', // e.g. 'a b foo \ud83d\ude38'

												// Check input against validate function, if valid the
												// accept button is clickable; if invalid, the accept
												// button is disabled.
												acceptValid : true,
												// Auto-accept when input is valid; requires `acceptValid`
												// set `true` & validate callback
												autoAcceptOnValid : false,

												// if acceptValid is true & the validate function returns
												// a false, this option will cancel a keyboard close only
												// after the accept button is pressed
												cancelClose : true,

												// tab to go to next, shift-tab for previous
												// (default behavior)
												tabNavigation : false,

												// enter for next input; shift-enter accepts content &
												// goes to next shift + "enterMod" + enter ("enterMod"
												// is the alt as set below) will accept content and go
												// to previous in a textarea
												enterNavigation : false,
												// mod key options: 'ctrlKey', 'shiftKey', 'altKey',
												// 'metaKey' (MAC only)
												// alt-enter to go to previous;
												// shift-alt-enter to accept & go to previous
												enterMod : 'altKey',

												// if true, the next button will stop on the last
												// keyboard input/textarea; prev button stops at first
												// if false, the next button will wrap to target the
												// first input/textarea; prev will go to the last
												stopAtEnd : true,

												// Set this to append the keyboard immediately after the
												// input/textarea it is attached to. This option works
												// best when the input container doesn't have a set width
												// and when the "tabNavigation" option is true
												appendLocally : false,
												// When appendLocally is false, the keyboard will be appended
												// to this object
												appendTo : 'body',

												// If false, the shift key will remain active until the
												// next key is (mouse) clicked on; if true it will stay
												// active until pressed again
												stickyShift : true,

												// Prevent pasting content into the area
												preventPaste : false,

												// caret places at the end of any text
												caretToEnd : false,

												// caret stays this many pixels from the edge of the input
												// while scrolling left/right; use "c" or "center" to center
												// the caret while scrolling
												scrollAdjustment : 10,

												// Set the max number of characters allowed in the input,
												// setting it to false disables this option
												maxLength : false,
												// allow inserting characters @ caret when maxLength is set
												maxInsert : true,

												// Mouse repeat delay - when clicking/touching a virtual
												// keyboard key, after this delay the key will start
												// repeating
												repeatDelay : 500,

												// Mouse repeat rate - after the repeatDelay, this is the
												// rate (characters per second) at which the key is
												// repeated. Added to simulate holding down a real keyboard
												// key and having it repeat. I haven't calculated the upper
												// limit of this rate, but it is limited to how fast the
												// javascript can process the keys. And for me, in Firefox,
												// it's around 20.
												repeatRate : 20,

												// resets the keyboard to the default keyset when visible
												resetDefault : false,

												// Event (namespaced) on the input to reveal the keyboard.
												// To disable it, just set it to ''.
												openOn : 'focus',

												// Event (namepaced) for when the character is added to the
												// input (clicking on the keyboard)
												keyBinding : 'mousedown touchstart',

												// enable/disable mousewheel functionality
												// enabling still depends on the mousewheel plugin
												useWheel : true,

												// combos (emulate dead keys)
												// if user inputs `a the script converts it to à,
												// ^o becomes ô, etc.
												useCombos : true,
												// if you add a new combo, you will need to update the
												// regex below
												combos : {
													// uncomment out the next line, then read the Combos
													//Regex section below
													'<' : {
														3 : '\u2665'
													}, // turn <3 into ♥ - change regex below
													'a' : {
														e : "\u00e6"
													}, // ae ligature
													'A' : {
														E : "\u00c6"
													},
													'o' : {
														e : "\u0153"
													}, // oe ligature
													'O' : {
														E : "\u0152"
													}
												},

												// *** Methods ***
												// Callbacks - attach a function to any of these
												// callbacks as desired
												initialized : function(e,
														keyboard, el) {
												},
												beforeVisible : function(e,
														keyboard, el) {
												},
												visible : function(e, keyboard,
														el) {
												},
												beforeInsert : function(e,
														keyboard, el, textToAdd) {
													return textToAdd;
												},
												change : function(e, keyboard,
														el) {
												},
												beforeClose : function(e,
														keyboard, el, accepted) {
												},
												accepted : function(e,
														keyboard, el) {
												},
												canceled : function(e,
														keyboard, el) {
												},
												restricted : function(e,
														keyboard, el) {
												},
												hidden : function(e, keyboard,
														el) {
												},

												// called instead of base.switchInput
												// Go to next or prev inputs
												// goToNext = true, then go to next input;
												//   if false go to prev
												// isAccepted is from autoAccept option or
												//   true if user presses shift-enter
												switchInput : function(
														keyboard, goToNext,
														isAccepted) {
												},

												/*
												      // build key callback
												    buildKey : function( keyboard, data ) {
												        /* data = {
												          // READ ONLY
												          isAction: [boolean] true if key is an action key
												    		// name... may include decimal ascii value of character
												          // prefix = 'ui-keyboard-'
												          name    : [string]  key class name suffix
												          value   : [string]  text inserted (non-action keys)
												          title   : [string]  title attribute of key
												          action  : [string]  keyaction name
												          // html includes a <span> wrapping the text
												          html    : [string]  HTML of the key;
												          // DO NOT MODIFY THE ABOVE SETTINGS

												    		// use to modify key HTML
												          $key    : [object]  jQuery selector of key already added to keyboard
												        }
												 * /
												        data.$key.html('<span class="ui-keyboard-text">Foo</span>');
												        return data;
												  		},
												 */

												// this callback is called just before the "beforeClose"
												// to check the value if the value is valid, return true
												// and the keyboard will continue as it should (close if
												// not always open, etc)
												// if the value is not value, return false and the clear
												// the keyboard value ( like this
												// "keyboard.$preview.val('');" ), if desired
												validate : function(keyboard,
														value, isClosing) {
													return true;
												}

											})
									// activate the typing extension
									.addTyping({
										showTyping : true,
										delay : 250
									});

							/* Combos Regex -
								You could change $.keyboard.comboRegex so that it applies to all
								keyboards, but if a specific layout language has a comboRegex defined,
								it has precidence over this setting. This regex is used to match combos
								to combine, the first part looks for the accent/letter and the second
								part matches the following letter so lets say you want to do something
								crazy like turn "<3" into a heart. Add this to the
								combos '<' : { 3: "\u2665" } and add a comma to the end if needed.
								Then change the regex to this: /([<`\'~\^\"ao])([a-z3])/mig;
							                                         ( first part  )( 2nd  )  */
							$.keyboard.language.love.comboRegex = /([<`\'~\^\"ao])([a-z3])/mig;

							/* if you look close at the regex, all that was added was "<" to the
							  beginning of the first part; some characters need to be escaped with a
							  backslash in front because they mean something else in regex. The
							  second part has a 3 added after the 'a-z', so that should cover both
							  parts :P */

							// Typing Extension
							var kb = $(this).parent().find('.keyboard')
									.getkeyboard();
							// typeIn( text, delay, callback );
							kb.reveal().typeIn();
							$("#keyboard_keyboard").hide();
							$("#keyboard_keyboard").slideDown(200);
						});

		$('form[name=loginStu]').submit(function() {
			if ($('#officialNo').val() == '') {
				alert('아이디를 입력하세요');
				$('#officialNo').focus();
				return false;
			} else if ($('input[name=pwdd]').val() == '') {
				alert('비밀번호를 입력하세요');
				$('input[name=pwdd]').focus();
				return false;
			}
			
		});//submit
		
	});
</script>
<!-- main 시작 -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.username" var="username" />
</sec:authorize>
<sec:authorize access="!isAuthenticated()">
    <sec:authentication property="principal" var="username" />
</sec:authorize>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div id="tabs">
			<ul class="nav nav-pills nav-fill">
				<li class="nav-item"></li>

			</ul>
			<div class="card">
				<div class="card-header">
					<p id="title">로그인</p>
				</div>
				<div class="card-body">
					<form name="loginStu" method="post"
						action="<c:url value='/loginOk'/>">
						<input name="${_csrf.parameterName}" type="hidden"
							value="${_csrf.token}" />
						<div class="input-group form-group">
							<label for="officialNo" class="lab">아이디</label>
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"
									style="color: white;"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="아이디"
								name="officialNo" id="officialNo"
								value="${cookie.ck_officialNo.value}">

						</div>
						<!-- <div id="wrap">
  <input id="keyboard" type="text" />
  <img id="icon" src="https://mottie.github.io/Keyboard/docs/css/images/keyboard.png" />
</div> -->
						<div id="wrap" class="wrap input-group form-group">
							<label for="pwdd" class="lab">비밀번호</label>
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"
									style="color: white;"></i></span>
							</div>
	
							<input type="password" class="keyboard form-control"
								placeholder="비밀번호" name="pwdd" id="keyboard"> <span
								class="icon input-group-text"><a id="icon" href="#"><i
									class="fas fa-keyboard" style="color: gray;"></i></a></span>
						</div>
						<div style="text-align: center; color: orange;">
							<span id="msg"></span>
						</div>
						<div class="form-group">
							<div class="row align-items-center remember" id="chk">
								<input type="checkbox" name="saveNo" id="saveNo"
									<c:if test = "${!empty cookie.ck_officialNo.value }">
												checked = "checked"
											</c:if>><label for="saveNo">아이디
								저장</label>
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
							<li>* <em>99학번 이전은 학번 규칙 변경(6자리->8자리)에 의하여 다음과 같이 조정하여
									아이디를 입력 바랍니다.</em></li>
							<li>&nbsp;&nbsp;&nbsp;- 서울 : 31 + 학번 / 천안 : 51 + 학번 / 대학원 :
								71 + 학번</li>
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
							&nbsp;비밀번호 찾기(재설정)&nbsp;&nbsp;&nbsp;</a>
					</div>
				</div>
			</div>
		</div>


		<script>
			/* Code to get jQuery UI to work with jQuery 3.4+ ... */
			$.isArray = function(a) {
				return Object.prototype.toString.call(a) === '[object Array]';
			}
			$.isFunction = function(f) {
				return typeof f === 'function';
			}
			$.isWindow = function(w) {
				var toString = Object.prototype.toString.call(w);
				return toString == '[object global]'
						|| toString == '[object Window]'
						|| toString == '[object DOMWindow]';
			}
		</script>
		<script
			src="https://mottie.github.io/Keyboard/docs/js/jquery-ui-custom.min.js"></script>
	</div>
	<!-- bottom -->
	<%@ include file="../inc/bottom.jsp"%>
	<script type="text/javascript">

	if(${!empty error}){
		alert('${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}');
	}
	if(${!empty logout}){
		alert('${msg}');
	}
		
	</script>