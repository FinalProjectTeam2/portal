<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<link rel="styl>esheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="<c:url value='/resources/css/datepicker.css'/>">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="<c:url value='/resources/js/bootstrap-datepicker.js'/>"></script>
<title>invem_index</title>
<script type="text/javascript">
</script>
<style type="text/css">
img { border: 0; }
header{
	width: 100%;
	height: 120px;
	background: lightgreen;
}
body{
	
}
.left-side{
	position: absolute;
	top: 120px;
	bottom: 50px;
	left: 320px;
	width: 220px;
	overflow: auto;
	background-color: #eee;
	height: 1330px;
}

.right-side{
	position: absolute;
	top: 120px;
	bottom: 50px;
	right: 320px;
	width: 220px;
	overflow: auto;
	background-color: #eee;
	height: 1330px;
}

.cf{
	background-color: #fff;
    width: 218px;
    margin-left: 1px;
}
dl dt{
    margin: 0;
    padding: 0;
    list-style: none;
    border: none;
    height: 110px;
    line-height: 110px;
    font-size: 30px;
    font-weight: normal;
    font-family: NanumGothicBold;
    text-align: center;
    color: #333;
}

dl{
	display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

dd{
	display: block;
    /* margin-inline-start: 40px; */
}

dd a{
    display: block;
    padding: 15px 30px 15px 20px;
    border-top: 1px solid #e7e7e7;
    font-family: NanumGothicBold;
    font-size: 16px;
    color: #333;
    letter-spacing: -0.1em;
    text-decoration: none;
}

.srch_sort{
    display: block;
    width: 168px;
    margin-left: 1px;
    padding: 0 25px;
    list-style: none;
    border: none;
    font-size: 12px;
	line-height: 20px;
    color: #333333;
    background-color: #ffffff;
}

ul{
	list-style: none;
    border: none;
}

.title{
	font-size: 16px;
    font-weight: 600;
}

p{
	margin: 0 0 10px;
	display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

li{
	line-height: 20px;
	text-align: -webkit-match-parent;	
}

.inbox{
	width: 100%;
	display: block;
}

.inbox button.on{
	border: 2px solid #3292f9;
    color: #3292f9;
}

.srch_sort .inbox button{
    float: left;
    height: 38px;
    width: 50%;
    background: #fff;
    border: 1px solid #c1c1c1;
    letter-spacing: -0.1em;
    overflow: visible;
    margin: 0;
    padding: 0;
    vertical-align: top;
    cursor: pointer;
    width: 72px;
    height: 40px;
    
}

button{
	font-family: '나눔고딕',NanumGothic;
    font-size: 12px;
    -webkit-appearance: button;
    font-weight: normal;
    line-height: 20px;
    
}

.inbox button{
	width: 72px;
    height: 40px;	
    margin-bottom: 5px;
}

#datetimepicker{
	float: left;
	display: table;
}
#datetimepicker2{
	position: relative;
    margin-left: 18px;
    float: left;
    display: table;
}

.inbox input{
	width: 71px;
    height: 35px;
    padding: 0;
    text-align: center;
    border: 2px solid #3292f9;
    color: #3292f9;
    letter-spacing: -0.1em;
    border-radius: 0;
    
}

#footer{
   
 	position: fixed;
bottom: 0;
left: 0;
right: 0;
color: white;
background-color: #333333;
}

.address{
	padding: 18px 0 0 35px;
    font-family: '나눔고딕',NanumGothic;
    font-size: 12px;
    color: #adadad;
}

.wrap {
min-height: 100%;
position: relative;
padding-bottom: 200px; /* footer height */
}

section{
	width: 650px;
	padding-left: 600px;
	padding-top: 20px
}


</style>

</head>
<body>
<div class="wrap">
<header>
<div style="padding-left: 250px;padding-top: 25px;float: left;display: inline-block;">
<a href="#"><img style="width: 300px;height: auto;" src="<c:url value='/resources/images/dku.png'/>"></a>
<div class="container" style="width: 800px;margin-top: -50px;margin-left: 250px;">
    <div class="row">    
        <div class="col-xs-8 col-xs-offset-2">
		    <div class="input-group">
                <div class="input-group-btn search-panel">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    	<span id="search_concept">Filter by</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#contains">Contains</a></li>
                      <li><a href="#its_equal">It's equal</a></li>
                      <li><a href="#greather_than">Greather than > </a></li>
                      <li><a href="#less_than">Less than < </a></li>
                      <li class="divider"></li>
                      <li><a href="#all">Anything</a></li>
                    </ul>
                </div>
                <input type="hidden" name="search_param" value="all" id="search_param">         
                <input type="text" class="form-control" name="x" placeholder="Search term...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
            </div>
        </div>
	</div>
</div>
</div>
<div style="float: left;margin-top: -23px;margin-left: 1180px;display: inline-block;">
	<input type="checkbox" name="chk_re" value="reSearch">결과내 재검색
	<select style="margin-left: 20px">
		<option>한국어</option>
		<option>english</option>
	</select>		
</div>

</header>

<aside class="left-side">
<dl class="cf">
	<dt>통합검색</dt>
	<dd><a href="#">통합검색</a></dd>
	<dd><a href="#">사이트/디렉토리</a></dd>
	<dd><a href="#">게시판</a></dd>
	<dd><a href="#">웹문서</a></dd>
	<dd><a href="#">인명/전화번호</a></dd>
	<dd><a href="#">학칙/규정</a></dd>
	<dd><a href="#">캠퍼스맵</a></dd>
	<dd><a href="#">구글 맞춤검색</a></dd>
</dl>

<ul class="sech_sort">
	<li>
		<p class="title" id="sort_title"> 정렬</p>
		<div class="inbox" id="filter_sort">
		<button class="on bdnr" value="정확도순" id="sort_button1">정확도순</button>
		<button value="최근순" id="sort_button2">최근순</button>
		</div>
	</li>
	<li>
		<p class="title" id="scope_title">영역</p>
		<div class="inbox" id="filter_scope">
			<button class="on bdnr bdnb" value="all" id="scope_button1">전체</button>
			<button value="제목" id="scope_button2">제목</button>
			<button value="본문" id="scope_button3">본문</button>
			<button value="작성자" id="scope_button4">작성자</button>
		</div>
	</li>
	<li>
		<p class="title" id="period_title">기간</p>
		<div class="inbox" id="filter_period">
			<button class="on bdnr bdnb" value="all" id="period_button1">전체</button>
			<button value="1" id="period_button2">1일</button>
			<button value="7" id="period_button3">1주일</button>
			<button value="30" id="period_button4">1개월</button>
			<button value="365" id="period_button5">1년</button>
			<button value="1095" id="period_button6">3년</button>
		</div>
	</li>
	<li>
		<p class="title" id="date_title">기간지정</p>
		<div class="inbox">
			<div id="datetimepicker">
				<div class="add-on">
					<input data-format="yyyy-MM-dd" type="text" data-time-icon="icon-time" data-date-icon="icon-calendar" title="검색시작" id="start_date" value="">
				</div>
			</div>
			
			<div id="datetimepicker2">
				<div class="add-on">
					<input data-format="yyyy-MM-dd" type="text" data-time-icon="icon-time" data-date-icon="icon-calendar" title="검색끝" id="end_date" value="">
				</div>
			</div>
			<!-- <span>
				<button style="width: 168px;height: 32px;margin-top: 10px;" id="date_search">검 색</button>
			</span> -->
		</div>
	
<script type="text/javascript">
$(function() {	
	$('#start_date').datepicker({
	    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
	    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
	    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    title: "테스트",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    
	});//datepicker end
});//ready end
</script>

<script type="text/javascript">
$(function() {	
	$('#end_date').datepicker({
	    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	    startDate: '-10d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
	    endDate: '+10d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
	    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
	    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
	    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
	    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
	    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
	    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
	    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
	    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
	    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
	    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
	    templates : {
	        leftArrow: '&laquo;',
	        rightArrow: '&raquo;'
	    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
	    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
	    title: "테스트",	//캘린더 상단에 보여주는 타이틀
	    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
	    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
	    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
	    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	    
	});//datepicker end
});//ready end
</script>




</aside>

<section>
<article>
<img src="<c:url value='/resources/images/type_keyword.png'/>">
</article>
</section>


</div>

<aside class="right-side">
네이버 검색 순위 api받아놨어요<br>
요것도 공부 좀 해봅시다ㅋㅋ
</aside>


<footer>
<div id="footer" class="total_srch"> 
	<!-- 하단 홈페이지 링크 -->
	<div class="foot_link_section">
		<div class="foot_link_inner container">
			<div class="row st2" style="display:none;"> 
				<!-- 대학 홈페이지 -->
				<div class="uni_area num_01 span4">
					<button data-toggle="collapse" data-target=".uni_list" class="collapsed">
					<h3>대학 홈페이지</h3>
					</button>
					
				</div>
				<!-- //대학 홈페이지 --> 
				<!-- 대학원 홈페이지 -->
				<div class="uni_area num_02 span4">
					<button data-toggle="collapse" data-target=".uni_list" class="collapsed">
					<h3>대학원 홈페이지</h3>
					</button>

				</div>
				<!-- //대학원 홈페이지 --> 
				<!-- 부속/부설기관 홈페이지 -->
				<div class="uni_area num_03 span4">
					<button data-toggle="collapse" data-target=".uni_list" class="collapsed">
					<h3>부속/부설기관 홈페이지</h3>
					</button>

				</div>
				<!-- //부속/부설기관 홈페이지 --> 
			</div>
		</div>
	</div>
	<!-- //하단 홈페이지 링크 -->
	<div class="footer_inner container">
		<div class="footer_menu">

			<!-- <ul>
				<li><a href="#none">개인정보처리방침</a></li>
				<li><a href="#none">이메일무단수집거부</a></li>
				<li><a href="#none">대학정보공시</a></li>
				<li><a href="#none">사이트맵</a></li>
				<li><a href="#none">모바일앱</a></li>
			</ul> -->

		</div>
		<address class="address">

	죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116 <em>통합콜센터 : 1899-3700</em> <span class="copyright">COPYRIGHT 2015 BY DANKOOK UNIVERSITY ALL RIGHT RESERVED</span>

		</address>
	</div>
</div>

</footer>

</body>
</html>