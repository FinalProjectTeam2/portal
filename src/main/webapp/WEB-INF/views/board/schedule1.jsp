<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л�����-��ຸ��</title>
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
<!-- �л����� -->
<article class="calendar">
	<div class="calendar_head">
		<h2 id="SCH_YEAR">< 2020 ></h2>
		<p>
			<a href="#;" class="typeCal" title="���� Ķ���� ȭ������ �̵�">����Ķ����</a>
			<a href="#;" class="typeSum on" title="��ຸ�� : ���õ�">��ຸ��</a>
		</p>
		<ul>
			<li><a href="#month1" title="1��">1</a></li>
			<li><a href="#month2" title="2��">2</a></li>
			<li><a href="#month3" title="3��">3</a></li>
			<li><a href="#month4" title="4��">4</a></li>
			<li><a href="#month5" title="5��">5</a></li>
			<li><a href="#month6" title="6��">6</a></li>
			<li><a href="#month7" title="7��:���õ�" class="on">7</a></li>
			<li><a href="#month8" title="8��">8</a></li>
			<li><a href="#month9" title="9��">9</a></li>
			<li><a href="#month10" title="10��">10</a></li>
			<li><a href="#month11" title="11��">11</a></li>
			<li><a href="#month12" title="12��">12</a></li>
		</ul>
	</div>
	<div class="calendar_summary" id="month1">
		<h3><b>01</b>January</h3>
		<ul class="calView_tb">
			<li>
				<time>01.01</time>
				����(������)
			</li>
			<li>
				<time>01.03</time>
				2020�� 1�б� ����������� �����������
			</li>
			<li>
				<time>01.06~01.10</time>
				2020�� 1�б� ������ ��������
			</li>
			<li>
				<time>01.08~01.10</time>
				2020�� ����(��) ��������
			</li>
			<li>
				<time>01.20~01.28</time>
				2020�� 1�б� ���н�
			</li>
			<li>
				<time>01.20~04.10</time>
				2020�� 1�б� ���н�û
			</li>
			<li>
				<time>01.24~01.27</time>
				����(������) 27�� ��ü����(������)
			</li>
			<li>
				<time>01.29~01.30</time>
				2020�� 1�б� ������û ��ٱ��� ���
			</li>
			<li>
				<time>12.23~01.15</time>
				���� �����б�
			</li>
			<li>
				<time>12.27~01.02</time>
				2019�� 2�б� ������ȸ
			</li>
			<li>
				<time>12.30~01.02</time>
				2019�� 2�б� ��������
			</li>
		</ul>
	</div>
	
	
	<div class="calendar_summary" id="month2">
		<h3><b>02</b>February</h3>
		<ul class="calView_tb">
			<li>
				<time>02.04</time>
				2020�� 1�б� ������û ��ٱ��� ����</li>
			<li>
				<time>02.12~02.14</time>
				2020�� 1�б� ������û
			</li>
			<li>
				<time>02.24~02.27</time>
				2020�� 1�б� ���л� ���
			</li>
			<li>
				<time>12.23~02.29</time>
				�ܿ����
			</li>
			</ul>
	</div>
	
	<div class="calendar_summary" id="month3">
		<h3><b>03</b>March</h3>
		<ul class="calView_tb">
			<li>
				<time>03.01</time>
				2020�г⵵ 1�б� ������
			</li>
			<li>
				<time>03.01</time>
				������(������)
			</li>
			<li>
				<time>03.16</time>
				2020�� 1�б� ����
			</li>
			<li>
				<time>03.16~03.28</time>
				2020�� 1�б� ������û ����
			</li>
			<li>
				<time>03.16~05.09</time>
				�����б� Term1(8��)
			</li>
			<li>
				<time>03.30~04.05</time>
				2020�� 1�б� �������� ���
			</li>
			<li>
				<time>03.30~04.10</time>
				2020�� 1�б� ���� Feedback �ǽ�
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month4">
		<h3><b>04</b>April</h3>
		<ul class="calView_tb">
			<li>
				<time>04.15</time>
				21�� ��ȸ�ǿ� ����(������)
			</li>
			<li>
				<time>04.30</time>
				����ź����(������)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month5">
		<h3><b>05</b>May</h3>
		<ul class="calView_tb">
			<li>
				<time>05.04~05.09</time>
				2020�� 1�б� �߰�����(8����)
			</li>
			<li>
				<time>05.05</time>
				��̳�(������)
			</li>
			<li>
				<time>05.11~06.27</time>
				�����б� Term2(7��)
			</li>
			<li>
				<time>05.18~05.22</time>
				������ ����
			 </li>
			<li>
				<time>05.18~05.29</time>
				2020�� 2�б� ������ ��û(����,����,����,�ڱ⼳��,������)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month6">
		<h3><b>06</b>June</h3>
		<ul class="calView_tb">
			<li>
				<time>06.03</time>
				2020�� �ϰ� �����б� ���� ����
			</li>
			<li>
				<time>06.06</time>
				������(������)
			</li>
			<li>
				<time>06.08~06.15</time>
				2020�� 2�б� ����������� ������� ��û
			</li>
			<li>
				<time>06.15~07.17</time>
				2020�� 1�б� ������
			</li>
			<li>
				<time>06.22~07.03</time>
				2020�� 1�б� �⸻����(�̷�)
			</li>
			<li>
				<time>06.22~07.10</time>
				2020�� 1�б� �⸻����(����,�ǽ�,�Ǳ�)
			</li>
			<li>
				<time>06.25~07.17</time>
				2020�� 1�б� �����Է�
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month7">
		<h3><b>07</b>July</h3>
		<ul class="calView_tb">
			<li>
				<time>07.06~07.10</time>
				2020�� 2�б� ������ ���� ����
			</li>
			<li>
				<time>07.11~08.31</time>
				2020�� ��������
			</li>
			<li>
				<time>07.13~07.29</time>
				2020�� �ϰ� �����б�
			</li>
			<li>
				<time>07.20~07.23</time>
				2020�� 1�б� ������ȸ
			</li>
			<li>
				<time>07.22~07.23</time>
				2020�� 1�б� ��������
			</li>
			<li>
				<time>07.24</time>
				2020�� 1�б� ���� Ȯ��(�������� �̰�)
			</li>
			<li>
				<time>07.24</time>
				2020�� 2�б� ����������� ������� ����
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month8">
		<h3><b>08</b>August</h3>
		<ul class="calView_tb">
			<li>
				<time>08.03~08.09</time>
				2020�� 2�б� ���н�û
			</li>
			<li>
				<time>08.03~09.28</time>
				2020�� 2�б� ���н�û
			</li>
			<li>
				<time>08.05~08.06</time>
				2020�� 2�б� ������û ��ٱ��� ���
			</li>
			<li>
				<time>08.11</time>
				2020�� 2�б� ������û ��ٱ��� ����
			</li>
			<li>
				<time>08.15</time>
				������(������)
			</li>
			<li>
				<time>08.17~08.21</time>
				����������
			</li>
			<li>
				<time>08.18~08.20</time>
				2020�� 2�б� ������û
			</li>
			<li>
				<time>08.21</time>
				2020�� 8�� ���������� ����������
			</li>
			<li>
				<time>08.24~08.28</time>
				2020�� 2�б� ���л� ���
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month9">
		<h3><b>09</b>September</h3>		
			<ul class="calView_tb">
			<li>
				<time>09.01</time>
				2020�� 2�б� ������/������
			</li>
			<li>
				<time>09.01~09.07</time>
				2020�� 2�б� ������û ����
			</li>
			<li>
				<time>09.01~10.26</time>
				�����б� Term3(8��)
			</li>
			<li>
				<time>09.22~09.28</time>
				2020�� 2�б� �������� ���(4����)
			</li>
			<li>
				<time>09.22~10.05</time>
				2020�� 2�б� ���� Feedback �ǽ�
			</li>
			<li>
				<time>09.30~10.02</time>
				�߼�(������)
			</li>
		</ul>
	</div>
	
	<div class="calendar_summary" id="month10">
		<h3><b>10</b>October</h3>
			<ul class="calView_tb">
				<li>
					<time>10.03</time>
					��õ��(������)
				</li>
				<li>
					<time>10.09</time>
					�ѱ۳�(������)
				</li>
				<li>
					<time>10.11</time>
					����102�ֳ�����
				</li>
				<li>
					<time>10.20~10.26</time>
					2020�� 2�б� �߰�����(8����)
				</li>
				<li>
					<time>10.27~12.21</time>
					�����б� Term4(8��)
				</li>
			</ul>
	</div>
	
	<div class="calendar_summary" id="month11">
		<h3><b>11</b>November</h3>
		<ul class="calView_tb">
			<li>
				<time>11.02</time>
				2020�� ���� �����б� ���� ����</li>
			<li>
				<time>11.09~11.13</time>
				������ ����
			</li>
			<li>
				<time>11.16~11.27</time>
				2021�� 1�б� ������ ��û(����,����,����,�ڱ⼳��,������)
			</li>
		</ul>
	</div>
	<div class="calendar_summary" id="month12">
		<h3><b>12</b>Desember</h3>
		<ul class="calView_tb">
			<li>
				<time>12.01~12.07</time>2021�� 1�б� ����������� ������� ��û
			</li>
			<li>
				<time>12.01~12.25</time>
				2020�� 2�б� ������ �ǽ�
			</li>
			<li>
				<time>12.15~12.21</time>
				2020�� 2�б� �⸻����(16����)
			</li>
			<li>
				<time>12.18~12.26</time>
				2020�� 2�б� �����Է�
			</li>
			<li>
				<time>12.22~02.28</time>
				�ܿ����
			</li>
			<li>
				<time>12.23~01.15</time>
				���� �����б�
			</li>
			<li><time>12.25</time>��ź��(������)
			</li>
			<li>
				<time>12.28~12.31</time>
				2020�� 2�б� ������ȸ
			</li>
			<li>
				<time>12.30~12.31</time>
				2020�� 2�б� ��������
			</li>
		</ul>
	</div>
	
	<div class="box_caution">
		<ul class="list_dot blue">
			<li>�� �л������� �к� �л������Դϴ�.<br>���п� �л������� �� ���п� Ȩ�������� �����Ͻñ� �ٶ��ϴ�.</li>
		</ul>
	</div>
</article>
</body>
</html>