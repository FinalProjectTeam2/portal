<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학사일정-요약보기</title>
<style type="text/css">
.calendar_head{
	position:relative;
	text-align:center;
}
.calendar_head h2{
	display:inline-block;
	padding:0 48px;margin-bottom:35px;
	font-size:48px;letter-spacing:-2px;vertical-align:top;line-height:1em;
}
.calendar_head button{
	width:18px;height:33px;
	margin-top:9px;
	background: no-repeat center;
	font-size:0;vertical-align:top;
}
.calendar_head button.next{};
.calendar_head ul{
	border-top:2px solid #2d313e;
	text-align:center;font-size:0
}
.calendar_head ul li{
	display:inline-block;
	padding:15px 10px;
}
.calendar_head ul li a{
	display:inline-block;width:40px;height:40px;line-height:40px;
	border-radius:50%;
	text-align:center;font-size:20px;
}
.calendar_head ul li a.on{
	background:#db2931;
	color:#fff;
}
.calendar_head p{
	position:absolute;top:20px;right:0;
	font-size:0;
}
.calendar_head p a{
	display:inline-block;height:15px;line-height:15px;
	padding-left:35px;
	background:url(../img/common/ico_calendar.png) no-repeat 10px center;
	font-size:15px;color:#333;
}
.calendar_head p a.on{
	background-image:url(../img/common/ico_calendar_on.png);
	color:#1e71c0
}
.calendar_head p a+a{
	margin-left:10px;
	background-image:url(../img/common/ico_list.png);
	border-left:1px solid #dfdfdf;
}
.calendar_head p a+a.on{
	background-image:url(../img/common/ico_list_on.png);
}

.calendar_list{
	position:relative;
	min-height:300px;
	padding:40px 0 40px 300px;
	border-top:1px solid #dddfe5;
}
.calendar_list>div{
	position:absolute;left:0;
	width:245px;
}
.calendar_list>div h3{
	position:relative;
	font-size:17px;color:#333;font-weight:500
}
.calendar_list>div h3 b{
	display:inline-block;
	padding-right:10px;margin-top:-5px;
	font-size:60px;font-weight:400;letter-spacing:-3px;vertical-align:top;line-height:1em
}
.calendar_list>div h3:after{
	content:'';
	position:absolute;top:10px;right:0;
	display:block;width:80px;height:1px;
	background:#dddfe5;
}
.calendar_list>div table{width:100%}
.calendar_list>div table th{
	height:35px;
	text-align:center;font-size:14px;font-weight:500;color:#333;
}
.calendar_list>div table td{
	height:35px;
	text-align:center;font-size:13px;color:#666;
}
.calendar_list>div table td.on{
	background:#a2d1ff;
	color:#fff
}
.calendar_list>ul li{
	position:relative;
	padding-right:120px;
	font-size:16px;
}


.calendar_list>ul li time{
	position:absolute;top:5px;right:0;
	display:inline-block;width:110px;box-sizing:border-box;
	padding-left:23px;
	background:url(../img/common/ico_calendar2.png) no-repeat 0 3px;
	font-size:15px;color:#666
}

.calendar_list>ul li+li{margin-top:20px}
.calendar_list>ul li.no_date{
	padding:50px 0 0;
	text-align:center;color:#666
}
.calendar_summary{
	position:relative;
	padding-left:140px;
	border-top:1px solid #62666f;border-bottom:1px solid #dddfe5;
}
.calendar_summary+.calendar_summary{
	margin-top:-1px;
	border-top:1px solid #62666f;
}
.calendar_summary h3{
	position:absolute;top:50%;left:0;
	width:140px;
	margin-top:-26px;
	text-align:center;font-size:15px;color:#666;font-weight:500
}
.calendar_summary h3 b{
	display:block;
	font-size:36px;font-weight:400;letter-spacing:-3px;line-height:1em;color:#000
}
.calendar_summary ul{
	min-height:100px;
	border-left:1px solid #dddfe5;
}
.calendar_summary ul li{
	position:relative;
	padding:15px 0 15px 160px;
	font-size:16px
}
.calendar_summary ul li+li{
	border-top:1px solid #dddfe5;
}
.calendar_summary ul li time{
	position:absolute;left:0;top:0;
	width:140px;height:100%;box-sizing:border-box;
	padding:15px 0 0 40px;
	background:url(../img/common/ico_calendar2.png) no-repeat 18px 18px;
	border-right:1px solid #dddfe5;
	color:#666;font-size:15px
}
.calendar_summary ul li.no_date{
	padding:40px;
	text-align:center;color:#888
}

.campusinfo_undergraduate ul{width:103%;margin-left:-3%;font-size:0}
.campusinfo_undergraduate ul li{
	display:inline-block;width:30.33%;
	margin:0 0 3% 3%;padding:0 23px 15px;
	box-sizing:border-box;
	border:1px solid #dedfe4;border-top:1px solid #62666f;
	vertical-align:top
}
.campusinfo_undergraduate ul li dt{
	padding-top:20px;
	font-size:24px;color:#1f3870;font-family: 'Noto Sans KR';font-weight:400;line-height:1.1em
}
.campusinfo_undergraduate ul li dt:after{
	content:'';
	display:block;width:20px;height:2px;
	margin:20px 0;
	background:#da2931
}
.campusinfo_undergraduate ul li dd{
	padding-left:10px;margin-top:7px;
	background:url(../img/common/bul_red.png) no-repeat 0 7px;
}
.campusinfo_undergraduate ul li dd a{font-size:15px}
.campusinfo_undergraduate ul li dd a:hover{border-bottom:1px solid #333}
.campusinfo_undergraduate ul li:nth-child(1),
.campusinfo_undergraduate ul li:nth-child(2),
.campusinfo_undergraduate ul li:nth-child(3){min-height:340px}
.campusinfo_undergraduate ul li:nth-child(4),
.campusinfo_undergraduate ul li:nth-child(5),
.campusinfo_undergraduate ul li:nth-child(6){min-height:250px}

.reNundergraduate1_3.table_wrap {overflow-x:auto;}
.reNundergraduate1_3.table_wrap>table {width:1040px;}

.campusinfo_activities6 div.ct{width:100%;overflow:hidden;}
.campusinfo_activities6 div.ct ul{
	width:100.5%;
	margin-left:-0.5%;
	border-top:1px solid #333;
	font-size:0
}
.campusinfo_activities6 div.ct  li{
	position:relative;
	display:inline-block;min-width:50%;
	box-sizing:border-box;
	border-bottom:1px solid #dddfe5;border-left:1px solid #dddfe5;
}
.campusinfo_activities6 div.ct  li.col{width:100%}
.campusinfo_activities6 div.ct  li a{
	display:block;
	padding:15px 40px 13px 20px;
	font-size:15px;
}
.campusinfo_activities6 div.ct  li a:after{
	content:'';
	position:absolute;top:0;right:20px;
	display:block;width:17px;height:100%;
	background:url(../img/common/ico_down.png) no-repeat center;
}

.campusinfo_regulations{text-align:center; }
.campusinfo_regulations div{
	position:relative;
	max-width:790px;margin:0 auto 50px;
	border-bottom:1px solid #dddfe5;
	font-size:0
}
.campusinfo_regulations div a{position:absolute;bottom:84px;left:90px}
.campusinfo_regulations .caution{display:inline-block;margin-bottom:30px}

.certificate_commission .lineList_tbW .inp_r {vertical-align:middle;}
.certificate_commission .box_info p {margin:0;}
.certificate_commission .box_info p>b {padding:0 5px;font-weight:400;}

.exchange_student_step{font-size:0}
.exchange_student_step li{
	position:relative;
	display:inline-block;width:40%;
	box-sizing:border-box;
	margin-bottom:60px;padding:20px 90px 20px 25px;
	background:#f0f1f7;
	vertical-align:top
}
.exchange_student_step li:after{
	content:'';
	position:absolute;bottom:-30px;right:-30px;
	display:block;width:100px;height:100px;
	border:10px solid #fff;border-radius:50%;
	background:url(../img/campusinfo/exchange_student1_step1.png) no-repeat;
}
.exchange_student_step li.li2:after,
.exchange_student_step li.li4:after{right:auto;left:-30px;}
.exchange_student_step li.li3:after,
.exchange_student_step li.li4:after{bottom:auto;top:-30px;}
.exchange_student_step li.li2:after{background-image:url(../img/campusinfo/exchange_student1_step2.png)}
.exchange_student_step li.li3:after{background-image:url(../img/campusinfo/exchange_student1_step3.png)}
.exchange_student_step li.li4:after{background-image:url(../img/campusinfo/exchange_student1_step4.png)}
.exchange_student_step li:nth-child(even){margin-left:10%;padding:20px 15px 20px 100px;}
.exchange_student_step li span{
	display:table-cell;height:130px;
	vertical-align:middle;font-size:15px;
}
.exchange_student11 .ct1{
	padding:20px;
	background:#f0f2f7;
	text-align:center;font-family: 'Noto Sans KR';font-size:16px;color:#000;font-weight:500
}
.exchange_student11 .ct1 b{font-weight:500;color:#1e386f}
</style>
</head>
<body>
<!-- 학사일정 -->
<article class="calendar">
	<div class="calendar_head">
		<h2 id="SCH_YEAR">< 2020 ></h2>
		<p>
			<a href="#;" class="typeCal" title="월별 캘린더 화면으로 이동">월별캘린더</a>
			<a href="#;" class="typeSum on" title="요약보기 : 선택됨">요약보기</a>
		</p>
		<ul>
			<li><a href="#month1" title="1월">1</a></li>
			<li><a href="#month2" title="2월">2</a></li>
			<li><a href="#month3" title="3월">3</a></li>
			<li><a href="#month4" title="4월">4</a></li>
			<li><a href="#month5" title="5월">5</a></li>
			<li><a href="#month6" title="6월">6</a></li>
			<li><a href="#month7" title="7월:선택됨" class="on">7</a></li>
			<li><a href="#month8" title="8월">8</a></li>
			<li><a href="#month9" title="9월">9</a></li>
			<li><a href="#month10" title="10월">10</a></li>
			<li><a href="#month11" title="11월">11</a></li>
			<li><a href="#month12" title="12월">12</a></li>
		</ul>
	</div>
	<div class="calendar_summary" id="month1">
		<h3><b>01</b>January</h3>
		<ul class="calView_tb">
			<li>
				<time>01.01</time>
				신정(공휴일)
			</li>
			<li>
				<time>01.03</time>
				2020년 1학기 전공개방모집 희망전공정정
			</li>
			<li>
				<time>01.06~01.10</time>
				2020년 1학기 재입학 원서접수
			</li>
			<li>
				<time>01.08~01.10</time>
				2020년 전과(부) 원서접수
			</li>
			<li>
				<time>01.20~01.28</time>
				2020년 1학기 복학신
			</li>
			<li>
				<time>01.20~04.10</time>
				2020년 1학기 휴학신청
			</li>
			<li>
				<time>01.24~01.27</time>
				설날(공휴일) 27일 대체휴일(공휴일)
			</li>
			<li>
				<time>01.29~01.30</time>
				2020년 1학기 수강신청 장바구니 담기
			</li>
			<li>
				<time>12.23~01.15</time>
				동계 계절학기
			</li>
			<li>
				<time>12.27~01.02</time>
				2019년 2학기 성적조회
			</li>
			<li>
				<time>12.30~01.02</time>
				2019년 2학기 성적정정
			</li>
		</ul>
	</div>
	
	
	<div class="calendar_summary" id="month2">
		<h3><b>02</b>February</h3>
		<ul class="calView_tb">
			<li>
				<time>02.04</time>
				2020년 1학기 수강신청 장바구니 수정</li>
			<li>
				<time>02.12~02.14</time>
				2020년 1학기 수강신청
			</li>
			<li>
				<time>02.24~02.27</time>
				2020년 1학기 재학생 등록
			</li>
			<li>
				<time>12.23~02.29</time>
				겨울방학
			</li>
			</ul>
	</div>
	
	<div class="calendar_summary" id="month3">
		<h3><b>03</b>March</h3>
		<ul class="calView_tb">
			<li>
				<time>03.01</time>
				2020학년도 1학기 개시일
			</li>
			<li>
				<time>03.01</time>
				삼일절(공휴일)
			</li>
			<li>
				<time>03.16</time>
				2020년 1학기 개강
			</li>
			<li>
				<time>03.16~03.28</time>
				2020년 1학기 수강신청 정정
			</li>
			<li>
				<time>03.16~05.09</time>
				유연학기 Term1(8주)
			</li>
			<li>
				<time>03.30~04.05</time>
				2020년 1학기 수강과목 취소
			</li>
			<li>
				<time>03.30~04.10</time>
				2020년 1학기 강의 Feedback 실시
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month4">
		<h3><b>04</b>April</h3>
		<ul class="calView_tb">
			<li>
				<time>04.15</time>
				21대 국회의원 선거(공휴일)
			</li>
			<li>
				<time>04.30</time>
				석가탄신일(공휴일)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month5">
		<h3><b>05</b>May</h3>
		<ul class="calView_tb">
			<li>
				<time>05.04~05.09</time>
				2020년 1학기 중간시험(8주차)
			</li>
			<li>
				<time>05.05</time>
				어린이날(공휴일)
			</li>
			<li>
				<time>05.11~06.27</time>
				유연학기 Term2(7주)
			</li>
			<li>
				<time>05.18~05.22</time>
				졸업논문 제출
			 </li>
			<li>
				<time>05.18~05.29</time>
				2020년 2학기 다전공 신청(복수,융합,연계,자기설계,부전공)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month6">
		<h3><b>06</b>June</h3>
		<ul class="calView_tb">
			<li>
				<time>06.03</time>
				2020년 하계 계절학기 시행 공지
			</li>
			<li>
				<time>06.06</time>
				현충일(공휴일)
			</li>
			<li>
				<time>06.08~06.15</time>
				2020년 2학기 전공개방모집 희망전공 신청
			</li>
			<li>
				<time>06.15~07.17</time>
				2020년 1학기 강의평가
			</li>
			<li>
				<time>06.22~07.03</time>
				2020년 1학기 기말시험(이론)
			</li>
			<li>
				<time>06.22~07.10</time>
				2020년 1학기 기말시험(실험,실습,실기)
			</li>
			<li>
				<time>06.25~07.17</time>
				2020년 1학기 성적입력
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month7">
		<h3><b>07</b>July</h3>
		<ul class="calView_tb">
			<li>
				<time>07.06~07.10</time>
				2020년 2학기 재입학 원서 접수
			</li>
			<li>
				<time>07.11~08.31</time>
				2020년 여름방학
			</li>
			<li>
				<time>07.13~07.29</time>
				2020년 하계 계절학기
			</li>
			<li>
				<time>07.20~07.23</time>
				2020년 1학기 성적조회
			</li>
			<li>
				<time>07.22~07.23</time>
				2020년 1학기 성적정정
			</li>
			<li>
				<time>07.24</time>
				2020년 1학기 성적 확정(보관성적 이관)
			</li>
			<li>
				<time>07.24</time>
				2020년 2학기 전공개방모집 희망전공 정정
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month8">
		<h3><b>08</b>August</h3>
		<ul class="calView_tb">
			<li>
				<time>08.03~08.09</time>
				2020년 2학기 복학신청
			</li>
			<li>
				<time>08.03~09.28</time>
				2020년 2학기 휴학신청
			</li>
			<li>
				<time>08.05~08.06</time>
				2020년 2학기 수강신청 장바구니 담기
			</li>
			<li>
				<time>08.11</time>
				2020년 2학기 수강신청 장바구니 수정
			</li>
			<li>
				<time>08.15</time>
				광복절(공휴일)
			</li>
			<li>
				<time>08.17~08.21</time>
				학위수여식
			</li>
			<li>
				<time>08.18~08.20</time>
				2020년 2학기 수강신청
			</li>
			<li>
				<time>08.21</time>
				2020년 8월 학위수여자 졸업기준일
			</li>
			<li>
				<time>08.24~08.28</time>
				2020년 2학기 재학생 등록
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month9">
		<h3><b>09</b>September</h3>		
			<ul class="calView_tb">
			<li>
				<time>09.01</time>
				2020년 2학기 개시일/개강일
			</li>
			<li>
				<time>09.01~09.07</time>
				2020년 2학기 수강신청 정정
			</li>
			<li>
				<time>09.01~10.26</time>
				유연학기 Term3(8주)
			</li>
			<li>
				<time>09.22~09.28</time>
				2020년 2학기 수강과목 취소(4주차)
			</li>
			<li>
				<time>09.22~10.05</time>
				2020년 2학기 강의 Feedback 실시
			</li>
			<li>
				<time>09.30~10.02</time>
				추석(공휴일)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month10">
		<h3><b>10</b>October</h3>
			<ul class="calView_tb">
				<li>
					<time>10.03</time>
					개천절(공휴일)
				</li>
				<li>
					<time>10.09</time>
					한글날(공휴일)
				</li>
				<li>
					<time>10.11</time>
					개교102주년기념일
				</li>
				<li>
					<time>10.20~10.26</time>
					2020년 2학기 중간시험(8주차)
				</li>
				<li>
					<time>10.27~12.21</time>
					유연학기 Term4(8주)
				</li>
			</ul>
	</div>
	
	<div class="calendar_summary" id="month11">
		<h3><b>11</b>November</h3>
		<ul class="calView_tb">
			<li>
				<time>11.02</time>
				2020년 동계 계절학기 시행 공지</li>
			<li>
				<time>11.09~11.13</time>
				졸업논문 제출
			</li>
			<li>
				<time>11.16~11.27</time>
				2021년 1학기 다전공 신청(복수,융합,연계,자기설계,부전공)
			</li>
		</ul>
	</div>
	<div class="calendar_summary" id="month12">
		<h3><b>12</b>Desember</h3>
		<ul class="calView_tb">
			<li>
				<time>12.01~12.07</time>2021년 1학기 전공개방모집 희망전공 신청
			</li>
			<li>
				<time>12.01~12.25</time>
				2020년 2학기 강의평가 실시
			</li>
			<li>
				<time>12.15~12.21</time>
				2020년 2학기 기말시험(16주차)
			</li>
			<li>
				<time>12.18~12.26</time>
				2020년 2학기 성적입력
			</li>
			<li>
				<time>12.22~02.28</time>
				겨울방학
			</li>
			<li>
				<time>12.23~01.15</time>
				동계 계절학기
			</li>
			<li><time>12.25</time>성탄절(공휴일)
			</li>
			<li>
				<time>12.28~12.31</time>
				2020년 2학기 성적조회
			</li>
			<li>
				<time>12.30~12.31</time>
				2020년 2학기 성적정정
			</li>
		</ul>
	</div>
	
	<div class="box_caution">
		<ul class="list_dot blue">
			<li>위 학사일정은 학부 학사일정입니다.<br>대학원 학사일정은 각 대학원 홈페이지를 참고하시기 바랍니다.</li>
		</ul>
	</div>
</article>
</body>
</html>