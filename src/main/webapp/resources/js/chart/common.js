/********************************************************
파일명 : common.js
설 명 : 대교협 공통   JavaScript
수정일 수정자 Version Function 명
------- -------- ---------- --------------
2014.01.01 홍길동 1.0 최초   생성
*********************************************************/


/***********************************************************************
함수명 : gfn_nvl
설 명 : 시스템 구분으로 프로그램 목록을 조회
인 자 : str : 스트링 문자
사용법 : gfn_nvl(str)
작성일 : 2014-02-01
작성자 : 각팀명(예. 공통서비스 개발팀) 홍길동
수정일 수정자 수정내용
------ ------ -------------------
2014.02.01 길동이 윤년 처리 추가
***********************************************************************/
function gfn_nvl(str){
	return (str == null)?"&nbsp;":str;
}

/***********************************************************************
함수명 : gfn_null
설 명 : 시스템 구분으로 프로그램 목록을 조회
인 자 : str : 스트링 문자
사용법 : gfn_null(str)
작성일 : 2014-02-01
작성자 : 각팀명(예. 공통서비스 개발팀) 홍길동
수정일 수정자 수정내용
------ ------ -------------------
2014.02.01 길동이 윤년 처리 추가
***********************************************************************/
function gfn_null(str){
	return (str == null)?"":str;
}

/***********************************************************************
함수명 : gfn_zeroToHipen
설 명 : 시스템 구분으로 프로그램 목록을 조회
인 자 : str : 스트링 문자
사용법 : gfn_zeroToHipen(str)
작성일 : 2014-02-01
작성자 : 각팀명(예. 공통서비스 개발팀) 홍길동
수정일 수정자 수정내용
------ ------ -------------------
2014.02.01 길동이 윤년 처리 추가
 ***********************************************************************/
function gfn_zeroToHipen(str){
	return (str == null || str == '0' || str == '0 : 1')?"-":str;
}
/***********************************************************************
함수명 : gfn_setTotalPage
설 명 : 페이징 처리시 총 건수와 페이지 번호를 화면에 보여준다.
인 자 : page : 현재 선택 된 페이지, totcnt : 전체 데이터 수, totalPages 총 페이지 수
사용법 : fn_onclick_page(page, totcnt, totalPages)
작성일 : 2015-01-13
작성자 : 응용팀 김충현
수정일 수정자 수정내용
------ ------ -------------------

***********************************************************************/
function gfn_setTotalPage(page, totcnt, totalPages)
{
	$('#page-content').html('총<span>'+totcnt+'</span>건('+page+'/'+totalPages+'page)');
}


/***********************************************************************
함수명 : gfn_leadingZeros
설 명 : 숫자 앞에 '0' 이 없어져서 나올경우 숫자 데이터와 자리수를 입력하면 '0' 을 채워 리턴한다.
인 자 : data : 원래 '0' 이 붙어야 하는 숫자 데이터, num : 필요한 자리수
사용법 : gfn_leadingZeros(data, num)
작성일 : 2015-08-12
작성자 : 응용팀 박현수
수정일 수정자 수정내용
------ ------ -------------------

***********************************************************************/
function gfn_leadingZeros(data, num) {
	 var zero = '';
	 data = gfn_null(data).toString();
	
	 if (data.length < num) {
	  for (var i = 0; i < num - data.length; i++)
	   zero += '0';
	 }
	 return zero + data;
}


/***********************************************************************
함수명 : gfn_Btn_Create
설 명 : 권한 별 버튼 생성
인 자 : btnID : 버튼이 생성 될 DIV 태그의 ID
        , eventID : 버튼 생성시 클릭 이벤트
        , btnCass : 버튼 생성시 클래스(신규등록 및 답글:Btn_write, 수정:Btn_modify, 삭제:Btn_delete, 저장:Btn_save)
        , btnName : 버튼 이름
사용법 : gfn_Btn_Create(btnID, eventID, btnCass, btnName)
작성일 : 2015-01-13
작성자 : 응용팀 김충현
수정일 수정자 수정내용
------ ------ -------------------
2015.01.13 김충현 최조생성
 ***********************************************************************/
function gfn_Btn_Create(btnID, eventID, btnCass, btnName)
{
	btnID.empty();
	if(btnID != ""){
		btnID.append('<a href="#" onclick="'+eventID+'" class="'+btnCass+'">'+btnName+'</a>');
	}
}

/***********************************************************************
함수명 : gfn_downFile
설 명 : 파일 다운로드
인 자 : formName : 화면 ID
        , atch_file_id : 파일 시퀀스
        , target : from target
사용법 : gfn_downFile(formName, atch_file_id, file_sn, target)
작성일 : 2015-01-19
작성자 : 응용팀 hyj
수정일 수정자 수정내용
------ ------ -------------------
2015.01.19 hyj 최조생성
 ***********************************************************************/
function gfn_downFile(formName, atch_file_id, file_sn, target){

	var frm = document.getElementById(formName);
	if(atch_file_id != undefined && atch_file_id != null && atch_file_id != '') {
		frm.file_seq.value = atch_file_id;
	}
	
	if(file_sn != undefined && file_sn != null && file_sn != '') {
		frm.file_sn.value = file_sn;
	}
	
	var t = frm.target;
	
	if(target != undefined && target != null && target != "") {
		frm.target = target;
	} else {
		frm.target = "KCUE_BLANK_FR";
	}
	
	$.post("/common/file/filecheck.do",$("#frm").serialize(),function(data){	 
		if(data.resultVO.resultCode == "SUCCESS"){
			frm.action = "/common/file/FileDownload.do";
			frm.submit();
			frm.target = t;
		}else{
			alert("해당 파일이 존재하지 않습니다.");
		}
	 }, "json");
}

/***********************************************************************
함수명 : gfn_datepick
설 명 : 달력호출
인 자 : formId : 항목ID
사용법 : gfn_datepick(formId)
작성일 : 2015-01-2
작성자 : 강인규
수정일 수정자 수정내용
------ ------ -------------------
2015.01.22 강인규 최초생성
 ***********************************************************************/
function gfn_datepick(formId){
	$( formId ).datepicker({
		selectOtherMonths: true,
		changeYear: true,
		changeMonth: true,
		showButtonPanel: true,
		showOn: "button",
		buttonImage: "/images/btn_b2_calendar.gif",
		buttonImageOnly: true,
		buttonText: "Select date"
	});
}

/***********************************************************************
함수명 : gfn_pageCall
설 명 : 페이지 이동
인 자 : url - 컨트롤러 호출 명
사용법 : fn_pageCall(url)
작성일 : 2015-01-15
작성자 : 응용팀 김충현
수정일      수정자      수정내용
------ ------ -------------------

 ***********************************************************************/
function gfn_pageCall(url) {
	$.post(url,  $("#frm").serialize(), function(data){   
         $("#bodyInit").html(data);
     }
   , "html").error(function() { alert("에러가 발생했습니다!"); });
}

/***********************************************************************
함수명 : gfn_Submission_Call
설 명 : 
인 자 : doUrl - (컨트롤러 호출 명)
       tranData - 전송데이터
       callBackFunc - 콜백함수
       contentType - 컨텐트 type
사용법 : gfn_Submission_Call(doUrl, tranData, callBackFunc, contentType)
작성일 : 2015-01-23
작성자 : 송광호
수정일 수정자 수정내용
------ ------ -------------------
2015.01.23 송광호 최초생성
***********************************************************************/
function gfn_Submission_Call(doUrl, tranData, callBackFunc, contentType){
	var fCallBack;
	var strAddBaseParam = "";
	var doBlock = true;
	
	//기본 전송 파라미터 체크 
	if(doUrl.indexOf("?") > 0)
	{
		strAddBaseParam = "&";
	}else
	{
		strAddBaseParam = "?";
	}
	
	//기본 전송 파라미터 설정
	doUrl += strAddBaseParam;
	
	fCallBack = function(data)
				{
					//loading 해제
					doBlock = false;
					//$.unblockUI();
				  	
				    //콜백함수 설정
					if(callBackFunc != undefined && callBackFunc != null && (typeof callBackFunc == 'function'))
					{	
						callBackFunc(data);
					}
				};
				
	//default json으로 설정
	if(contentType == undefined || contentType == null || contentType == "")
	{
		contentType = "json";
	}
	
	// loading 메세지 출력
//	$.blockUI({ onUnblock: $.unblockUI });
	
//	setTimeout(function() {
//		if (doBlock)
//			$.blockUI({ onUnblock: $.unblockUI });
//	}, 500);
	
	$.post(doUrl, tranData, fCallBack, contentType);
	
}

/***********************************************************************
함수명 : gfn_Pagination
설 명 : 공통 페이징 처리
인 자 : totalRecordCount - 전체 건수
	  pageSize - 화면에 보여줄 건수
	  currentPageNo - 현재 선택한 페이지
	  formTagSet - pageindex 셋팅 hidden tag
	  callSearchFunc - 호출할 조회 function 
사용법 : gfn_Pagination(totalRecordCount, pageSize, currentPageNo, formTagSet, callSearchFunc)
작성일 : 2018-04-05
작성자 : 김충현
수정일 수정자 수정내용
------ ------ -------------------
2018-04-05 송광호 최초생성
***********************************************************************/
function gfn_Pagination(totalRecordCount, pageSize, currentPageNo, formTagSet, callSearchFunc){
	var v_totalPages = Math.ceil(totalRecordCount / pageSize);
	
	$('#paginationholder').html('');
    $('#paginationholder').html('<ul id="pagination" class="pagination-list"></ul>');
    
	$('#pagination').twbsPagination({
		totalPages: v_totalPages, 
		visiblePages: pageSize, 
		startPage: currentPageNo, 
		first: '처음', 
		prev: '이전', 
		next: '다음', 
		last: '마지막', 
		onPageClick: function (event, page) {
			formTagSet.val(page);
			//콜백함수 설정
			if(callSearchFunc != undefined && callSearchFunc != null && (typeof callSearchFunc == 'function'))
			{	
				callSearchFunc(page);
			}
		}
	});
	
	$("#pagination .num a").filter(function() {
	    return $(this).text() === currentPageNo;
	}).addClass("on");
}
/***********************************************************************
함수명 : gfn_Pagination
설 명 : 공통 페이징 처리
인 자 : totalRecordCount - 전체 건수
	  pageSize - 화면에 보여줄 건수
	  currentPageNo - 현재 선택한 페이지
	  formTagSet - pageindex 셋팅 hidden tag
	  callSearchFunc - 호출할 조회 function 
사용법 : gfn_Pagination(IdName,totalRecordCount, pageSize, currentPageNo, formTagSet, callSearchFunc)
작성일 : 2018-04-05
작성자 : 김충현
수정일 수정자 수정내용
------ ------ -------------------
2018-04-05 송광호 최초생성
 ***********************************************************************/
function gfn_PaginationIDName(idName,totalRecordCount, pageSize, currentPageNo, formTagSet, callSearchFunc){
	var v_totalPages = Math.ceil(totalRecordCount / pageSize);
	
	$('#'+idName+'holder').html('');
	$('#'+idName+'holder').html('<ul id="'+idName+'" class="pagination-list"></ul>');
	
	$('#'+idName).twbsPagination({
		totalPages: v_totalPages, 
		visiblePages: pageSize, 
		startPage: currentPageNo, 
		first: '처음', 
		prev: '이전', 
		next: '다음', 
		last: '마지막', 
		onPageClick: function (event, page) {
			formTagSet.val(page);
			//콜백함수 설정
			if(callSearchFunc != undefined && callSearchFunc != null && (typeof callSearchFunc == 'function'))
			{	
				callSearchFunc(page);
			}
		}
	});
	
	$("#"+idName+" .num a").filter(function() {
		return $(this).text() === currentPageNo;
	}).addClass("on");
}

/***********************************************************************
함수명 : gfn_winOpen
설 명 : 오픈팝업
인 자 : doUrl - (컨트롤러 호출 명)
       OpenName - 팝업명
       Wid - 가로크기
       Hei - 세로크기
사용법 : gfn_winOpen(doUrl,OpenName,Wid,Hei)
작성일 : 2015-01-23
작성자 : 강인규
수정일 수정자 수정내용
------ ------ -------------------
2015.01.26 강인규 최초생성
***********************************************************************/

function gfn_winOpen(doUrl,OpenName,Wid,Hei){
	var ScreenWidth		= screen.width;
	var ScreenHeight	= screen.height;
	var OpenWinWidth	= Wid;
	var OpenWinHeight	= Hei;
	var OpenLeft		= (ScreenWidth - OpenWinWidth) / 2;
	var OpenTop			= (ScreenHeight - OpenWinHeight) / 2;
	var OpenWinStatus="left="+OpenLeft+",top="+OpenTop+",toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=yes,width="+OpenWinWidth+",height="+OpenWinHeight+"";
	var windowID = window.open(doUrl,OpenName,OpenWinStatus);
	return windowID;
}



/***********************************************************************
함수명 : gfn_setCtlDisable
설 명 : 
인 자 : ctlObj - (콤보 컨트롤 ID LIST) (EX> ["cmbId","txtId","txtEmpno"])
       disableFlag - 수정불가 여부( true/false)
사용법 : gfn_setCtlDisable(ctlObj, disableFlag)
작성일 : 2015-01-27
작성자 : 송광호
수정일       수정자    수정내용
------     ------ -------------------
2015.01.27 송광호    최초생성
***********************************************************************/
function gfn_setCtlDisable(ctlObj, disableFlag){
	var strTagName = "";	
	
	for(var i=0; i < ctlObj.length; i++)
	{
		strTagName = $("#"+ ctlObj[i]).prop("tagName");
		
		if(disableFlag)
		{
			switch(strTagName)
			{
				case "SELECT" :
					$("#" + ctlObj[i] + " option").not(":selected").attr("disabled", "disabled");
					$("#" + ctlObj[i]).attr("class", "input_2");					
					break;
					
				case "INPUT" :
					switch($("#" + ctlObj[i]).attr("type"))
					{
						case "checkbox" :
							$("#" + ctlObj[i]).attr("disabled", true);
							break;
						default :
							$("#" + ctlObj[i]).attr("readonly", true);
							$("#" + ctlObj[i]).attr("class", "input_2");
					}					
					break;
					
				case "TEXTAREA" :
					$("#" + ctlObj[i]).attr("readonly", true);
					$("#" + ctlObj[i]).attr("class", "input_2");					
					break;
					
				default:
			}
			
		}else
		{
			switch(strTagName)
			{
				case "SELECT" :
					$("#" + ctlObj[i] + " option").not(":selected").removeAttr("disabled");
					$("#" + ctlObj[i]).attr("class", "select");					
					break;
					
				case "INPUT" :
					switch($("#" + ctlObj[i]).attr("type"))
					{
						case "checkbox" :
							$("#" + ctlObj[i]).removeAttr("disabled");
							break;
						default :
							$("#" + ctlObj[i]).attr("readonly", false);
							$("#" + ctlObj[i]).attr("class", "input");
					}					
					break;
					
				case "TEXTAREA" :
					$("#" + ctlObj[i]).attr("readonly", false);
					$("#" + ctlObj[i]).attr("class", "input");
					break;
					
				default:
			}
		}
	}
}

/***********************************************************************
함수명 : gfn_getUsAthrCd
설 명 : 메뉴에 대한 권한 정보를 찾는다.
인 자 : menu_list : 메뉴리스트 정보, menuID : 메뉴ID 정보, getType : 게시판 ID 정보
사용법 : gfn_getUsAthrCd(menu_list, menuID, getType)
작성일 : 2015-01-28
작성자 : 김충현
수정일       수정자    수정내용
------     ------ -------------------
2015.01.28 김충현    최초생성
***********************************************************************/
function gfn_getUsAthrCd(menu_list, menuID, getType){
	var usAthr = "R"; 
	var titleTopMake = $(".AreaTx");	// body 화면 상위 타이틀 생성
	var titleBotMake = $(".Tit");	// body 화면 하위 타이틀 생성
	titleTopMake.empty();
	titleBotMake.empty();
	
	for ( var i = 0; i < menu_list.length; i++)
	{
		if (menu_list[i].menu_id == menuID)
		{
			if(getType == null || getType == ""){
				usAthr = menu_list[i].us_athr_cd;
			}else if(getType == "board_id"){
				usAthr = menu_list[i].board_id;
			}
			
			// 타이틀 생성
			titleTopMake.append(menu_list[i].sys_div_nm+" > <span>"+menu_list[i].menu_nm+"</span>");
			titleBotMake.append("<p>"+menu_list[i].menu_nm+"</p>");
		}
	}
	
	return usAthr;
}


/***********************************************************************
함수명 : gfn_dataSerialize
설 명   : 폼 태그의 데이터를 직렬화 한다.
인 자   : formId - 폼 id
사용법 : gfn_dataSerialize(formId)
작성일 : 2015-02-05
작성자 : 송광호
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
function gfn_dataSerialize(formId)
{
	//체크박스의 경우 체크된 내역만 직렬화가 되어 예외처리하여 전송데이터 가공.
	var param1 = $("#"+ formId + " :not(input[type='checkbox'])").serialize();
	var param2 = $("#"+ formId + " input[type='checkbox']").map(function(){return this.id+"="+ (this.checked ? "Y" : "N"); }).get().join("&");
				
	return param1 + "&" + param2;
}


function gfn_naviFnPageCall(pageURL, div, sysDivCd)
{	
	if(pageURL == "#url"){
		return;
	}

	if(div == "reload" || $(".LeftTit").attr("id") != sysDivCd){
		location.href = "/PageLinkAll.do?link="+pageURL;
	}else{
		gfn_Submission_Call(pageURL, "", function(data){   
		        $("#bodyInit").html(data);
		        $(".Left_Mbx > .LeftM_a > a").removeClass("selected");
				$(".Left_Mbx > .LeftM_a > #" + $("#p_menu_id").val()).addClass("selected");
		    }
		, "html");
	}
}

/***********************************************************************
함수명 : gfn_checkDate
설 명   : 시작일자와 종료일자를 체크한다.
인 자   : stDt - 시작일자
          edDt - 종료일자
사용법 : gfn_checkDate(stDt, edDt)
작성일 : 2015-02-26
작성자 : 송광호
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
function gfn_checkDate(stDt, edDt){
	if(stDt.replace(/-/gi,"") > edDt.replace(/-/gi,"")){
		alert("시작일시가 종료일시 보다 클 수 없습니다");
		return false;
	}
	return true;
}


/***********************************************************************
함수명 : gfn_numFormat
설 명   : 숫자형 데이터에 콤마구분을 지은다.
인 자   : 
사용법 : 123456.gfn_numFormat() = 123,456
작성일 : 2015-02-26
작성자 : 박현수
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
Number.prototype.gfn_numFormat = function(){
	if(this == 0) return 0;
	
	var r = /(^[+-]?\d+)(\d{3})/;
	var n = (this + '');
	
	while(r.test(n)) n = n.replace(r, '$1' + ',' + '$2');
	
	return n;
};


/***********************************************************************
함수명 : gfn_numFormat
설 명   : 문자형 숫자 데이터에 콤마구분을 지은다.
인 자   : 
사용법 : "123456".gfn_numFormat() = 123,456
작성일 : 2015-02-26
작성자 : 박현수
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
String.prototype.gfn_numFormat = function(){
	var n = parseFloat(this);
	
	if(isNaN(n)) return "0";
	
	return n.gfn_numFormat();
};


/***********************************************************************
함수명 : gfn_trim
설 명   : 문자형 데이터 양쪽 공백 제거
인 자   : 
사용법 : " 123456 ".gfn_trim() = "123456"
작성일 : 2015-02-26
작성자 : 박현수
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
String.prototype.gfn_trim = function(){
	return this.replace(/\s/g, "");
};



/***********************************************************************
함수명 : gfn_getParam
설 명   : url의 파라미터 값을 가져온다.
인 자   : 
사용법 : url = "a=1&b=2&c=3" || key=파라미터명
작성일 : 2015-02-26
작성자 : 박현수
수정일      수정자     수정내용
------ ------ -------------------

***********************************************************************/
function gfn_getParam(url,key){
   var parameters = [];
   var rtn_param = "";
	
   parameters = url.split("&");
   
   for ( var k =0; k < parameters.length; k++ ){
       if (parameters[k].split("=")[1].length > 0 ){
       	var val = parameters[k].split("=")[0];
       	var param = parameters[k].split("=")[1];
       	
       	if(key == val){
       		rtn_param = param;
       	}
       }
   }
   
   return rtn_param == "" ? "" : rtn_param;
}

/*
 * 팝업창(10:현재창, 20:팝업, 30:새창 ,40:팝업 -같은 팝업창에서 호출됨 ) 
 */
function go_pop(link, link_cd, link_width, link_vrticl){
//22
	var target = "";
	var size = "";
	if(link_cd == "10"){
		target = "_self";
	}else if(link_cd == "20"){
		target = "_blank";
		size   = "width="+link_width+", height="+link_vrticl;
	}else if(link_cd == "30"){
		target = "_blank";
		size   = "width="+screen.width+", height="+screen.height+", top=0, left=0, fullscreen=yes, status=yes, menubar=yes, toolbar=yes, resizable=yes, location=yes";
	}else if(link_cd == "40"){
		target = "popup";
		size   = "width="+screen.width+", height="+screen.height+", top=0, left=0, fullscreen=yes, status=yes, menubar=yes, toolbar=yes, resizable=yes, location=yes";
	}
	window.open(link, target, size+", scrollbars=yes");
}


/**
 * @class 쿠키 관리 클래스
 * @author 송광호 / 2015-02-27
 */
gCookieUtil = {
	/**
	 * 쿠키 관리
	 * @member init
	 * @return void
	 * @type void
	 * @author 송광호 / 2015-02-27
	 */
	init : function(){},

		
	/**
	 * 쿠키값을 삭제한다.
	 * @member delCookie
	 * @param {String} psKey
	 * @return String
	 * @type String
	 * @author 송광호 / 2015-02-27
	 */
	delCookie : function (psKey) {
	    var date = new Date(); // 오늘 날짜 
	    var validity = -1;
	    date.setDate(date.getDate() + validity);

	    document.cookie = psKey + "=;path=/;expires=" + date.toGMTString();
	},

	/**
	 * 쿠키값을 설정한다.
	 * @member setCookie
	 * @param {String} psKey
 	 * @param {String} psValue
	 * @param {int} piAddDay
	 * @return void
	 * @type void
	 * @author 송광호 / 2015-02-27
	 */
	setCookie : function(psKey, psValue, piAddDay) {
		piAddDay = 1;
		var date = new Date(); // 오늘 날짜		
		date = new Date(parseInt(date.getTime() / 86400000) * 86400000 + 54000000);				
	    if ( date > new Date() )  
	    {  
		  piAddDay = piAddDay - 1;  
	     } 		 
		// 만료시점 : 설정		
	    date.setDate(date.getDate() + piAddDay);
		// 쿠키 저장
	    document.cookie = psKey + '=' + escape(psValue) + ';path=/;expires=' + date.toGMTString();
		
	},
	
	/**
	 * 쿠키값을 가져온다.
	 * @member getCookie
	 * @param {String} psKey
	 * @return String
	 * @type String
	 * @author 송광호 / 2015-02-27
	 */
	getCookie : function (psKey) {
	    var allcookies = document.cookie;
	    var cookies = allcookies.split("; ");
	    for (var i = 0; i < cookies.length; i++) {
	        var keyValues = cookies[i].split("=");
	        if (keyValues[0] == psKey) {
	            return unescape(keyValues[1]);
	        }
	    }
	    return "";
	}

};
/**
 * 관심 학교/학과를 추가한다. 
 * @param {String} gubun  :schl/mjr
 * @param {String} value 
 * 
 * */
function gnf_add_favrt(gubun,value,obj){
	var pKey 		= "fvr_"+gubun;
	var cookie		= gCookieUtil.getCookie(pKey);
	var gubunStr	= (gubun == 'schl') ?'대학':'학과';
	
	if( cookie.split(",").indexOf(value) == -1 ){
		cookie += ","+ value
		gCookieUtil.setCookie(pKey,cookie);
		gnf_add_favrt_cnt();
//		if( confirm("관심"+gubunStr+'에 추가 되었습니다.\n비교하기로 이동하시겠습니까?') ){
//			window.opener.location.replace="/pubinfo/pubinfo0370/selectListLink.do?gubun="+gubun;
//		}
	//	alert("추가 되었습니다.");

		if( !$(obj).hasClass("active") ){
			$(obj).addClass("active");
		}
	}else{
		gnf_delte_favrt(gubun, value,obj )
	//	alert("삭제 되었습니다.");
	}
}
/**
 * 2019.07.30 정래경 작성
 * realGrid에서 관심 학교/학과를 추가한다. 
 * @param {String} gubun  :schl/mjr
 * @param {String} value 
 * 
 * */
function gnf_realgrid_add_favrt(gubun,value,obj){
	var pKey 		= "fvr_"+gubun;
	var cookie		= gCookieUtil.getCookie(pKey);
	var gubunStr	= (gubun == 'schl') ?'대학':'학과';
	
	if( cookie.split(",").indexOf(value) == -1 ){
		cookie += ","+ value
		gCookieUtil.setCookie(pKey,cookie);
		gnf_add_favrt_cnt();
		
		setReadGridLayerFavorite();
//		if( !$(obj).hasClass("active") ){
//			$(obj).addClass("active");
//		}
	}else{
		gnf_delte_favrt(gubun, value,obj )
	//	alert("삭제 되었습니다.");
	}
}
/**
 * 2019.11.14 정래경 작성
 * realGrid에서 관심 학교/학과를 추가시 div를 호출한다. 
 * 
 * */
function setReadGridLayerFavorite(){
	var layer = $('.js-layer-favorite');
	if(layer.length > 0){
		setTimeout(function(){
			layer.stop().show().animate({
				opacity:1
			},500, function () {
				$(this).css("z-index", 9999);
			});
		}, 0);
		setTimeout(function(){
			layer.stop().animate({
				opacity:0
			},500, function () {
				$(this).css("z-index", 0);
				$(this).hide();
			});
		}, 2400);
	}
}
function gnf_add_favrt_cnt(){
	var schl_cnt =gnf_favrt("schl").split(",").length -1 ;
	var mjr_cnt =gnf_favrt("mjr").split(",").length - 1;
	
	if( (schl_cnt +mjr_cnt ) > 0 ){
		$("#favor_cnt").html("("+(schl_cnt +mjr_cnt )+")");
	}
}
/**
 * 관심 학교/학과를 삭제한다. 
 * @param {String} gubun  :schl/mjr
 * @param {String} value 
 * 
 * */
function gnf_delte_favrt(gubun, value,obj ){
	var pKey = "fvr_"+gubun;
	var cookie=gCookieUtil.getCookie(pKey);
	var cookieArr=cookie.split(",");
	var index = cookieArr. indexOf(value);
	
	if (index > -1){ 
		cookieArr. splice(index, 1);
	}
	
	gCookieUtil.setCookie(pKey,cookieArr.toString());
	$(obj).removeClass("active");
	gnf_add_favrt_cnt();
}
/**
 * 관심 학교/학과를 가져온다.
 * @param {String} gubun  :schl/mjr
 * @param {String} value 
 * @return String
 * */
function gnf_favrt(gubun){
	var pKey = "fvr_"+gubun;
	var cookie=gCookieUtil.getCookie(pKey);
	return cookie;
}
/**
 * 관심 학교/학과를 가져온다.
 * @param {String} gubun  :schl/mjr
 * @param {String} value 
 * @return true/false
 * */
function gnf_favrtYN(gubun, value){
	var pKey = "fvr_"+gubun;
	var cookie=gCookieUtil.getCookie(pKey);

	return ( cookie.split(",").indexOf(value) > -1 );
}

/**
 * 학교 상세 팝업
 * @param {String} schl_id  :학교 아이디
 * @param {String} gubun    : pubinfo(공시정보) / mjr(학과정보) /compt(우리대학경쟁력) /finc(재정회계지표) 
 * @return true/false
 * */
function gnf_go_schl_detail(schl_id, gubun){
	var link_vrticl = screen.availHeight - 60;
	var link ="";
	if( gubun == "pubinfo" ){ //공시정보
		link="/pubinfo/pubinfo0020/list.do?schlId="+schl_id;
	}else if( gubun == "mjr" ){ //학과정보
		link="/pubinfo/pubinfo1600/doInit.do?schlId="+schl_id;
	}else if( gubun == "compt" ){ //우리대학경쟁력
		link="/popup/pubinfo1690/list.do?schlId="+schl_id;
	}else if( gubun == "finc" ){ //재정회계지표
		link="/pubinfo/pubinfo0140/selectListLink.do?schlId="+schl_id;			
	}
	
	go_pop(link, "20", 1180, link_vrticl);	
}  

function gnf_go_mjr_detail(schlId, schlMjrId, mjrId, mjrNm, schNm, svyYr){
	var link="/pubinfo/pubinfo0081/doInit.do?schlId="+schlId+"&schlMjrId="+schlMjrId+"&mjrId="+mjrId+"&mjrNm="+mjrNm+"&schNm="+schNm+"&svyYr="+svyYr;

	var w = 1180;
	var h = (screen.height - 60);
	
	var option = "height="+ h +", width="+ w +", top=10, left=10, scrollbars=1,resizable=0,toolbar=0, status=0, menubar=0,location=0";
	
	go_pop(link, "20", w, h);	
}  

//뷰어 호출
/**
 * 뷰어 호출
 * @param {String} paramSvyYr  공시년도
 * @param {String} paramSchlDivCd 학교구분 ( 01:전문대 , 02:대학교 ,03 : 대학원 ,04:대학원 대학 )
 * @param {String} paramItemId 공시 아이템 아이디
 * @param {String} paramFormClftCd 상세 여부( 학과별 :36 , 학교별평균값:30 ) 
 * @param {String} paramMjrItem1 전공/학과 선택값(대분류)-기본:00( 대분류: 00 인문 사회계열:A , 자연과학계열:B, 예ㆍ체능계열:C, 공학계열:D,의학계열:E   ) 
 * @return true/false
 * */
function fn_open_view_submit(paramSvyYr,paramSchlDivCd,paramItemId,paramFormClftCd ,paramMjrItem1, paramMjrItem2, paramMjrItem3) {
	if(false == fn_prevSubmit()){

		return false;	
	}
	if( paramFormClftCd == null || paramFormClftCd =="" || paramFormClftCd  == undefined ) {
		paramFormClftCd="30";
	}
		
	if( paramMjrItem1 == null || paramMjrItem1 =="" || paramMjrItem1  == undefined ) {
		paramMjrItem1="00";
	}
	if( paramMjrItem2 == null || paramMjrItem2 =="" || paramMjrItem2  == undefined ) {
		paramMjrItem2="00";
	}
	if( paramMjrItem3 == null || paramMjrItem3 =="" || paramMjrItem3  == undefined ) {
		paramMjrItem3="00";
	}
	
	$("#paramSvyYr").val(paramSvyYr) ;
	$("#paramSchlDivCd").val(paramSchlDivCd) ;
	$("#paramItemId").val(paramItemId) ;
	$("#paramFormClftCd").val(paramFormClftCd) ;
	$("#paramMjrItem1").val(paramMjrItem1) ;
	$("#paramMjrItem2").val(paramMjrItem2) ;
	$("#paramMjrItem3").val(paramMjrItem3) ;

	var frm = document.reportFrm;
	
	var now = new Date();
	var winNm = "RST" + now.getHours()+ now.getMinutes() + now.getSeconds() + now.getMilliseconds();
	window.open("",winNm);
	frm.target = winNm;
	frm.action = "/uipnh/unt/unmcom/RdViewer.do";
	frm.submit();
}

function numberFormat(number) {
    var string = number.toString();
    var length = string.length;
    var standard = (length % 3 === 0) ? 3 : length % 3;
    var arr = [];

    var start = 0;

    while (true) {
        var temp = string.substr(start, standard);

        if (temp === "") break;

        arr.push(temp);

        start = start + standard;
        standard = 3;
    }

    var result = arr.join(",");

    return result;
}

//submit 전 체크사항
function fn_prevSubmit()
{
//	var frm = document.listForm;
//	if(	frm.paramSchlDivCd.value == "" )
//	{
//		alert("학교종류를 선택해 주세요!");
//		return false;
//
//	}
//	if(	frm.paramSvyYr.value == "" )
//	{
//		
//		$("#paramSvyYr").val($("#item1 option:selected").val()) ;
//
//	}
//	if(	frm.paramItemId.value == "" )
//	{
//		alert("공시항목을 선택해 주세요!");
//		return false;
//	}
//	
//	if( frm.paramSchlNm.value.length > 0 && frm.paramSchlNm.value.length < 2 )
//		{
//			alert("2자이상 입력해 주세요.");
//			return false;
//		}
//	
//	if(	frm.paramStudCntLess.value != "" || frm.paramStudCntGrate.value != "")
//	{
//		if(parseInt(frm.paramStudCntGrate.value) < parseInt(frm.paramStudCntLess.value))
//		{
//			alert("검색 옵션에서 최소학생수가 최대학생수 보다 큽니다.");
//			frm.paramStudCntGrate.focus();
//			return false;
//		}
//	}
//    
//	var condi1 = fn_condition_checkbox("schlKindSub");
//	var condi2 = fn_condition_checkbox("schlEstab");
//	var condi3 = fn_condition_checkbox("zone");
//	
//	frm.paramSchlKindCd.value 	= condi1;
//    frm.paramSchlEstabCd.value 	= condi2;
//    frm.paramZoneCd.value 		= condi3;
//    
//    //계열 활성여부 체크
//    if(frm.mjrItem1.disabled == true)
//    {
//    	frm.paramMjrItem1Act.value 	= "N";	//계열(대분류)
//    }
//    else
//    {
//    	frm.paramMjrItem1Act.value 	= "Y";	//계열(대분류)
//    }
//    
//   //전공학과 활성여부 체크
//    if(frm.mjrItem4.disabled == true)
//    {
//    	frm.paramMjrItem4Act.value 	= "N";	//전공학과
//    }
//    else
//    {
//    	frm.paramMjrItem4Act.value 	= "Y";	//전공학과
//    }
//    
//    
//     
//  //정렬아이템
//    if(frm.sortItem.value.length > 0)
//    	frm.paramSortItem.value = frm.sortItem.value;
//    
//    //정렬방법
//    if(frm.sortMethod[0].checked == true)
//    	frm.paramSortMethod.value = "ASC";
//    else if(frm.sortMethod[1].checked == true)
//		frm.paramSortMethod.value = "DESC";
//    
//  	//학교/학과명 검색 아이템
//    if(frm.searchItem.value.length > 0)
//    	frm.paramSearchItem.value = frm.searchItem.value;
//    
    
    
	return true;
}

function gnf_pop_srchguide(){
	var link="/pop/guide/guide0840.html";

	var w = 1180;
	var h = (screen.height - 60);
	
	var option = "height="+ h +", width="+ w +", top=10, left=10, scrollbars=1,resizable=0,toolbar=0, status=0, menubar=0,location=0";
	
	go_pop(link, "20", w, h);		
}


/**
 * 용어사전 호출
 * @param {String} dicStr  용어사전 검색 용어
 * @return String
 * */
function pop_dictionary(dicStr, dicId) {
	var dicBtn = "";

	if(dicStr != null && dicStr != "") {
        switch (dicStr) {
            case "전임교원수" :
                dicId = "1";
                break;
            case "전임교원" :
                dicId = "1";
                break;
            case "비전임교원" :
                dicId = "2";
                break;
            case "전임교원 확보율" :
                dicId = "5";
                break;
            case "1인당 연구비 수혜 실적" :
                dicId = "9";
                break;
            case "강사 강의료" :
                dicId = "10";
                break;
            case "교사시설확보율" :
                dicId = "24";
                break;
            case "교지확보율" :
                dicId = "25";
                break;
            case "기숙사&nbsp;&nbsp;&nbsp;수용률" :
                dicId = "26";
                break;
            case "기숙사수용률" :
                dicId = "26";
                break;
            case "기숙사 수용률" :
                dicId = "26";
                break;
            case "모집인원" :
                dicId = "34";
                break;
            case "학생1인당 교육비" :
                dicId = "40";
                break;
            case "학생 1인당 교육비" :
                dicId = "40";
                break;
            case "학생&nbsp;&nbsp;&nbsp;1인당&nbsp;&nbsp;&nbsp;교육비" :
                dicId = "40";
                break;
            case "재정지원사업 지원액" :
                dicId = "40";
                break;
            case "교내 장학금" :
                dicId = "45";
                break;
            case "교내장학금" :
                dicId = "45";
                break;
            case "교외 장학금" :
                dicId = "46";
                break;
            case "교외장학금" :
                dicId = "46";
                break;
            case "1인당 장학금" :
                dicId = "47";
                break;
            case "학생 1인당 장학금" :
                dicId = "47";
                break;
            case "학생 1인당 연간 장학금" :
                dicId = "47";
                break;
            case "학생&nbsp;&nbsp;&nbsp;1인당&nbsp;&nbsp;&nbsp;연간&nbsp;&nbsp;&nbsp;장학금" :
                dicId = "47";
                break;
            case "사이버대학" :
                dicId = "53";
                break;
            case "교육대학" :
                dicId = "55";
                break;
            case "방송통신대학" :
                dicId = "56";
                break;
            case "기술대학" :
                dicId = "57";
                break;
            case "산업대학" :
                dicId = "58";
                break;
            case "전문대학" :
                dicId = "62";
                break;
            case "입학정원" :
                dicId = "63";
                break;
            case "학생정원" :
                dicId = "64";
                break;
            case "재학생수" :
                dicId = "67";
                break;
            case "재학생" :
                dicId = "67";
                break;
            case "신입생 충원율" :
                dicId = "69";
                break;
            case "외국인 중도 탈락 현황" :
                dicId = "70";
                break;
            case "총 외국인 유학생" :
                dicId = "71";
                break;
            case "재적학생" :
                dicId = "72";
                break;
            case "재학생 충원율" :
                dicId = "75";
                break;
            case "신입생&nbsp;&nbsp;&nbsp;경쟁률" :
                dicId = "76";
                break;
            case "신입생 경쟁률" :
                dicId = "76";
                break;
            case "중도탈락률" :
                dicId = "77";
                break;
            case "사유별 중도탈락 학생" :
                dicId = "77";
                break;
            case "취업률" :
                dicId = "79";
                break;
            case "교비회계" :
                dicId = "81";
                break;
            default :
                dicId = "";
                break;
        }
	}

	if(dicId != null && dicId != "") {
		dicBtn = '<button type="button" class="btn-dictionary" onclick="javascript:go_pop(\'/popup/main2110/list.do?item_wrd_id='+dicId+'\' ,\'20\' ,\'750\',\'700\');"></button>';
	}

	return dicBtn;
}