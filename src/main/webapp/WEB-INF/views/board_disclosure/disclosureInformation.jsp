<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
.disclosureInformation {
	margin-top: 2%;
}
#img {
	background: #ccc;
	width: 160px;
	padding: 5px;
}

.divBox1 {
	width:1200px;
	min-width:500px;
	margin-left:18.5%;
	margin-top:-18%;
	padding: 2% 2% 2% 2%;
}

.boxImg {
	width: 30%;
	margin-top: -5%;
}

.boxInfo {
	width: 70%;
	margin-left: 16%;
	margin-top: -5%;
}

.divBox2, .divBox3 {
	width: 1400px; 
	min-width: 500px;
}

.divBox2 {
	margin-left: 20%;
}

.divBox3 {
	margin-left: 20%;
	margin-top: 8%;
}

.divBox2 ul li{   
	list-style: none;          
	color: white;               
	background-color: #026BAD; 
	float: left;              
	line-height: 35px;    
	vertical-align: middle;    
	text-align: center;        
}

.menuLink {                             
    text-decoration:none;                     
    color: white;
    display: block;  
    width: 230px;
    font-size: 12px;
    font-weight: bold;
    font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
}

.menuLink:hover {
    color: skyblue;
    background-color: #0C4A71;
}

.divBox3 ul li {
	list-style: none;          
	color: white;               
	background-color: skyblue; 
	float: left;              
	line-height: 20px;    
	vertical-align: middle;    
	text-align: center;        
}

.divBox3 .menuLink {
	width: 400px;
	font-size: 18px;
	padding: 2%;
}

.divBox4{
	margin-left: 20%;
	margin-top: 13%;
}

.divBox2 {
	margin-top: -2%;
}

.divBox5, .divBox6{
	margin-left: 20%;
	margin-top: 11%;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.divBox4').show();
		$('#menu1').click(function(){
			$('.divBox4').show();
			$('.divBox5').hide();
			$('.divBox6').hide();
		});
	});

	
	$(function() {
		$('.divBox5').hide();
		$('#menu2').click(function(){
			$('.divBox5').show();
			$('.divBox4').hide();
			$('.divBox6').hide();
		});
	});

	$(function() {
		$('.divBox6').hide();
		$('#menu3').click(function(){
			$('.divBox6').show();
			$('.divBox4').hide();
			$('.divBox5').hide();
		});
	});
</script>
<div class="disclosureInformation">
	<div class="divBox1">
		<div class="boxImg">
			<img id="img" src="<c:url value='../resources/images/logo.png' />">
		</div>
		<div class="boxInfo">
			<span style="font-size: 22px"><strong>척척학사</strong></span>
			<span>
				<a href="<c:url value='../index'/>"><input type="button" value="메인으로"></a>
				<a href="<c:url value='../campusMap'/>"><input type="button" value="지도보기"></a>
			</span><br>
			<span>주소 : 서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워)</span><br>
			<span>대표전화 : 02-6255-8002 | 대표팩스 : 02-569-8069</span><br>
			<span>설립 : 사립 | 학교설립일 : 1947.11.03</span><br>
		</div><br>
		<hr style="border:1px solid gray dashed;" align="left" width="1400px;">
		<div>
		척척학사는 1947년에 설립된 광복 후 최초의 4년제 사립대학입니다. ‘진리, 봉사’를 교시로 하고 “민족애를 바탕으로 인류사회에 공헌하는 전문인 양성”을 교육목표로 바람직한 대학 교육의 사명을 다해 왔으며, 1978년 천안캠퍼스 설립, 2007년 죽전캠퍼스로의 이전 등을 통해 한국 대학사에 새로운 지평을 열었습니다. 척척학사는 “세계로 도약하는 민족사학”을 발전 비전으로 설정하고 정보통신, 생명공학, 문화콘텐츠 분야를 중심으로 선도적 연구 역량을 확보하여 세계 수준의 대학에 이르고자 하는 도전과 창조를 실천하고 있습니다.
		</div>
	</div><br>
		
	<div class="divBox2">
		<ul>			
			<li><a class="menuLink" href="#">척척학사</a></li>
			<li><a class="menuLink" href="#">척척학사 _ 제2캠퍼스</a></li>
			<li><a class="menuLink" href="#">척척학사 경영대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 교육대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 문화예술대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 부동산・건설대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 영화콘텐츠전문대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 일반대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 정보·지식재산대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 특수교육대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 행정법무대학원</a></li>
			<li><a class="menuLink" href="#">척척학사 교육대학원 _ 제2캠퍼스</a></li>
			<li><a class="menuLink" href="#">척척학사 보건복지대학원 _ 제2캠퍼스</a></li>
			<li><a class="menuLink" href="#">척척학사 스포츠과학대학원 _ 제2캠퍼스</a></li>
			<li><a class="menuLink" href="#">척척학사 일반대학원 _ 제2캠퍼스</a></li>
			<li><a class="menuLink" href="#">척척학사 정책경영대학원 _ 제2캠퍼스</a></li>
		</ul>
	</div><br>

	<div class="divBox3">
		<ul>
			<li><a class="menuLink" href="#" id="menu1">우리대학경쟁력</a></li>
			<li><a class="menuLink" href="#" id="menu2">공시정보</a></li>
			<li><a class="menuLink" href="#" id="menu3">재정회계지표</a></li>
		</ul>
	</div>
<!-- 우리대학경쟁력 내용 -->
	<div class="divBox4">
		<%@ include file="disclosureInformation2.jsp"%>
	</div>
	
<!-- 공시정보 내용 -->
	<div class="divBox5">
		<%@ include file="disclosureInformation3.jsp"%>
	</div>
	
<!-- 재정회계지표 내용 -->	
	<div class="divBox6">
		<%@ include file="disclosureInformation4.jsp"%>
	</div>

</div>
<%@ include file="../inc/bottom.jsp"%>