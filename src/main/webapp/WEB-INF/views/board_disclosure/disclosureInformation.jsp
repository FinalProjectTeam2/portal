<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<main role="main" class="flex-shrink-0">
<div class="container">


<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>대학 공시 정보</title>
<style type="text/css">

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

/* Style the close button */
.topright {
  float: right;
  cursor: pointer;
  font-size: 28px;
}

.topright:hover {color: red;}

<!---------------------------------->
<!-- ul  -->
.div-list ul {
	display: table;
	list-style: none;
	background-color: gray;
}


<!---------------------------------->
<!-- 탭메뉴 - 대학경쟁력 알림 속 div -->
.divbox {
	border: 1px solid silver;
	width: 400px;
}

.list {
	list-style: none;
	
}
.count {
	text-align: right;
}

hr {
	color: silver;
	width: 85%;
}

<!---------------------------------->
.btn-group button {
  background-color: #4CAF50; /* Green background */
  border: 1px solid green; /* Green border */
  color: white; /* White text */
  padding: 10px 24px; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
  width: 300px;
}

/* Clear floats (clearfix hack) */
.btn-group:after {
  content: "";
  clear: both;
  display: table;
}

.btn-group button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

/* Add a background color on hover */
.btn-group button:hover {
  background-color: #3e8e41;
}

.btG{
	width: 900px;
}
<!---------------------------------->
.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}

.topnav .icon {
  display: none;
}

@media screen and (max-width: 600px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 600px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

</style>
<script type="text/javascript">
function openMenu(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}

	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
</script>
<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

<div id="tuition1">
<div class="infobox">
	<div class="img-box">
		<h3>로고자리</h3>
		
	</div>
	<div class="info">
		<span class="college-name">단국대학교[본교]
			<button type="button" class="btn" onclick="window.open('http://www.dankook.ac.kr')">학교홈페이지</button>
			<button type="button" class="btn" onclick="window.open('https://www.academyinfo.go.kr')">지도보기</button>
		</span>
	</div>
	<div class="info-row">
		<span class="info-label">주소 :</span>
		<span class="info-value">경기도 용인시 수지구 죽전로 152 (죽전동, 단국대학교)(우  : 16890)</span>
	</div>
	<div class="info-row">
		<span class="info-label">대표전화 :</span>
		<span class="info-value">1899-3700</span>
		<span class="info-label">대표팩스 :</span>
		<span class="info-value">031-8021-7106</span>
	</div>
	<div class="info-row">
		<span class="info-label">유형 :</span>
		<span class="info-value">대학교</span>
		<span class="info-label">설립 :</span>
		<span class="info-value">사립</span>
		<span class="info-label">학교설립일:</span>
		<span class="info-value">1947.11.03</span>
	</div>
</div>

<!-- -------------------------------------------------------------------------------------------------------- -->

<div class="college-desc">
<p>단국대학교는 1947년에 설립된 광복 후 최초의 4년제 사립대학입니다.<br> 
   ‘진리, 봉사’를 교시로 하고 “민족애를 바탕으로 인류사회에 공헌하는 전문인 양성”을 교육목표로 바람직한 대학 교육의 사명을 다해 왔으며,<br>
   1978년 천안캠퍼스 설립, 2007년 죽전캠퍼스로의 이전 등을 통해 한국 대학사에 새로운 지평을 열었습니다.<br>
   단국대학교는 “세계로 도약하는 민족사학”을 발전 비전으로 설정하고 정보통신, 생명공학, 문화콘텐츠 분야를 중심으로 선도적 연구 역량을 확보하여 세계 수준의 대학에 이르고자 하는 도전과 창조를 실천하고 있습니다.</p>
</div>


<span class="notice-text">보다 정확한 정보공시를 위하여, 일부 대학의 데이터 값이 수정될 수 있으니 이점 양해하여 주십시오.</span>
<!-- -------------------------------------------------------------------------------------------------------- -->

<div class="btG">
<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교</button>
  <button style="width:33.0%">단국대학교 _ 제2캠퍼스</button>
  <button style="width:33.0%">단국대학교 경영대학원</button>
</div>

<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교 교육대학원</button>
  <button style="width:33.0%">단국대학교 국제대학원(폐교)</button>
  <button style="width:33.0%">단국대학교 문화예술대학원</button>
</div>

<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교 부동산・건설대학원</button>
  <button style="width:33.0%">단국대학교 영화콘텐츠전문대학원</button>
  <button style="width:33.0%">단국대학교 일반대학원</button>
</div>

<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교 정보·지식재산대학원</button>
  <button style="width:33.0%">단국대학교 특수교육대학원</button>
  <button style="width:33.0%">단국대학교 행정법무대학원</button>
</div>

<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교 교육대학원 _ 제2캠퍼스</button>
  <button style="width:33.0%">단국대학교 보건복지대학원 _ 제2캠퍼스</button>
  <button style="width:33.0%">단국대학교 스포츠과학대학원 _ 제2캠퍼스</button>
</div>

<div class="btn-group" style="width:100%">
  <button style="width:33.0%">단국대학교 일반대학원 _ 제2캠퍼스</button>
  <button style="width:33.0%">단국대학교 정책경영대학원 _ 제2캠퍼스</button>
</div>
</div>

<!-- -------------------------------------------------------------------------------------------------------- -->
<div class="topnav" id="myTopnav">
 
  <a href="#news">우리대학경쟁력</a>
  <a href="#contact">공시정보</a>
  <a href="#about">학과정보</a>
   <a href="#about">재정회계지표</a>
  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>
<br><br><br>
<!-- -------------------------------------------------------------------------------------------------------- -->
<div class="tab">
  <button class="tablinks" onclick="openMenu(event, 'tmanu1')" id="defaultOpen">대학경쟁력알림</button>
  <button class="tablinks" onclick="openMenu(event, 'tmanu2')">학생</button>
  <button class="tablinks" onclick="openMenu(event, 'tmanu3')">교원연구</button>
  <button class="tablinks" onclick="openMenu(event, 'tmanu4')" >재정</button>
  <button class="tablinks" onclick="openMenu(event, 'tmanu5')">교육여건</button>
</div>

<div id="tmanu1" class="tabcontent">
	<span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
	<%@ include file="disclosureInformation2.jsp" %> 
</div>

<div id="tmanu2" class="tabcontent">
  <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
</div>

<div id="tmanu3" class="tabcontent">
  <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>

</div>

<div id="tmanu4" class="tabcontent">
  <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>
</div>
<div id="tmanu5" class="tabcontent">
  <span onclick="this.parentElement.style.display='none'" class="topright">&times</span>

</div>
</div>
<%@ include file="../inc/bottom.jsp"%>