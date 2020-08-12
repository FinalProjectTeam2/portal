<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/certificate.css'/>">
<style>
	 

 
</style>

<script type="text/javascript">
	
function tui1(){
	$('#tuition1').show();	
	$('#issue').attr('class', 'off');
	$('#tuition2').hide();
	$('#info').attr('class', 'on');
}

function tui2(){
	$('#tuition1').hide();	
	$('#info').attr('class', 'off');
	$('#tuition2').show();
	$('#issue').attr('class', 'on');
}

	
	$(function(){
		$('#tuition2').hide();
		
		$('.on').click(function(){
			tui1();
		});
		
		$('.off').click(function(){
			tui2();
		});
		
	});
</script>


<main role="main" class="flex-shrink-0">
	<div class="container">
			<div class="list_tab_wrap">
				<button>증명서 발급안내</button>
				<ul class="list_tab tab3 parentTab" style="display: block;">
					<li><a style="text-decoration:none;" id="info" href="#" class="on" title="증명서 발급안내">증명서 발급안내</a></li>
					<li><a style="text-decoration:none;" id="issue" href="#" class="off" title="인터넷 발급">인터넷 발급</a></li>
				</ul>
				<div id="sub_tab" style="display: none;">
					<ul id="sub_tab_list">
					</ul>
				</div>
			</div>
		<div id="tuition1">

			<article class="ct_area">
				<h3 class="tit_line mt0">증명서 발급안내</h3>
				<h4 class="tit_blue">발급 증명서 현황</h4>
				<div class="table_wrap">
					<table class="table_normal">
						<caption>유형, 증명서, 발급대상, 발급언어, 발급료, 발급방법 항목에 따른 발급 증명서 현황</caption>
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="12%">
							<col width="12%">
							<col width="12%">
							<col width="24%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="no_line_b">유형</th>
								<th scope="col" class="no_line_b">증명서</th>
								<th scope="col" style="text-align: center;">발급대상<br>(학부/<br>대학원)
								</th>
								<th scope="col" style="text-align: center;">발급언어</th>
								<th scope="col" style="text-align: center;">발급료</th>
								<th scope="col" style="text-align: center;">발급방법</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th rowspan="14">학적 및 성적 관련</th>
								<th class="al">졸업증명서</th>
								<td rowspan="3">학부</td>
								<td rowspan="2">국/영문</td>
								<td rowspan="13">유료</td>
								<td rowspan="17"><a href="https://mportal.cau.ac.kr/"
									target="_blank">mportal.cau.ac.kr</a><br> <br>인터넷증명발급<br>
									<br>무인증명발급기</td>
							</tr>
							<tr>
								<th class="al">졸업예정증명서 *</th>
							</tr>
							<tr>
								<th class="al">복학예정증명서*</th>
								<td>국문</td>
							</tr>
							<tr>
								<th class="al">재적증명서*</th>
								<td rowspan="7">공통</td>
								<td rowspan="5">국/영문</td>
							</tr>
							<tr>
								<th class="al">재학증명서</th>
							</tr>
							<tr>
								<th class="al">성적증명서*</th>
							</tr>
							<tr>
								<th class="al">휴학증명서</th>
							</tr>
							<tr>
								<th class="al">수료증명서*</th>
							</tr>
							<tr>
								<th class="al">학적부 (학사팀 내방)</th>
								<td rowspan="3">국문</td>
							</tr>
							<tr>
								<th class="al">종합평가서*</th>
							</tr>
							<tr>
								<th class="al">수료예정증명서</th>
								<td rowspan="4">대학원</td>
							</tr>
							<tr>
								<th class="al">학위수여예정증명서*</th>
								<td rowspan="3">국/영문</td>
							</tr>
							<tr>
								<th class="al">학위수여증명서</th>
							</tr>
							<tr>
								<th class="al">연구등록증명서*</th>
								<td rowspan="18">무료</td>
							</tr>
							<tr>
								<th rowspan="6">자격 관련</th>
								<th class="al">법학과목학점취득확인서</th>
								<td rowspan="2">학부</td>
								<td rowspan="6">국문</td>
							</tr>
							<tr>
								<th class="al">교직과목이수확인서</th>
							</tr>
							<tr>
								<th class="al">교사자격취득예정증명서</th>
								<td>공통</td>
							</tr>
							<tr>
								<th class="al" rowspan="2">공학교육인증프로그램 <br>이수예정확인서
								</th>
								<td rowspan="5">학부</td>
							</tr>
							<tr>
								<td rowspan="10"><a href="https://mportal.cau.ac.kr/"
									target="_blank">mportal.cau.ac.kr</a></td>
							</tr>
							<tr>
								<th class="al">공학교육인증프로그램 <br>이수확인서
								</th>
							</tr>
							<tr>
								<th rowspan="2">교과목 이수 관련</th>
								<th class="al">수강신청확인서 (본인 포탈)</th>
								<td>국문</td>
							</tr>
							<tr>
								<th class="al">교과목개요확인서* <br>(학사팀 문의)
								</th>
								<td></td>
							</tr>
							<tr>
								<th rowspan="3">장학금 관련</th>
								<th class="al">장학금 비수혜확인서</th>
								<td rowspan="8">공통</td>
								<td rowspan="2">국/영문</td>
							</tr>
							<tr>
								<th class="al">장학금 수혜확인서</th>
							</tr>
							<tr>
								<th class="al">장학추천서 <br>(학생지원팀 내방)
								</th>
								<td rowspan="7">국문</td>
							</tr>
							<tr>
								<th rowspan="2">등록금 관련</th>
								<th class="al">교육비납입증명서</th>
							</tr>
							<tr>
								<th class="al">등록금 납입확인서</th>
							</tr>
							<tr>
								<th rowspan="4">비교과 관련</th>
								<th class="al" rowspan="2">학생자기계발통합인증서</th>
							</tr>
							<tr>
								<td rowspan="3"><a href="https://rainbow.cau.ac.kr"
									target="_blank">rainbow.cau.ac.kr</a></td>
							</tr>
							<tr>
								<th class="al">비교과이수내역증명서</th>
							</tr>
							<tr>
								<th class="al">봉사활동확인서</th>
								<td>학부</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div class="table_wrap">
					<table class="table_normal no_line">
						<caption>증명서 종류에 따른 증명서 정보 표</caption>
						<colgroup>
							<col width="30%">
							<col width="*">
						</colgroup>
						<thead></thead>
						<tbody>
							<tr class="line_d">
								<th scope="row">졸업예정증명서</th>
								<td class="al">마지막 학차 재학생으로 취득학점이 당해 학기로 졸업을 할 수 있는 자. <br>(수료생은
									학사팀 문의)
								</td>
							</tr>
							<tr>
								<th scope="col">복학예정증명서</th>
								<td class="al">복학 직전학기 발급.</td>
							</tr>
							<tr>
								<th scope="col">재적증명서</th>
								<td class="al">본교에 재적한 사실이 있는 자로, 제적자는 제적 사유 기재</td>
							</tr>
							<tr>
								<th scope="col">성적증명서</th>
								<td class="al">석차 요청 시 학사팀 내방(학부 및 일반대학원만 석차기재 가능)</td>
							</tr>
							<tr>
								<th scope="col">수료증명서(학부)</th>
								<td class="al">취득학점이 학직 59조에 해당하는 자.<br>(단, 4학년 수료증명서는
									학적상태 수료일 경우만 발급)<br>2004학번 이전 제적자의 학년 수료증명서는 학사팀 문의
								</td>
							</tr>
							<tr>
								<th scope="col">종합평가서</th>
								<td class="al">의과대학을 졸업한 자(학부 및 의학전문대학원)</td>
							</tr>
							<tr>
								<th scope="col">학위수여예정증명서</th>
								<td class="al">수료자나 수료예정자중 종합시험에 합격하고 논문 제출승인서를 제출한 자.</td>
							</tr>
							<tr>
								<th scope="col">연구등록증명서</th>
								<td class="al">대학원 수료자 중 연구등록제에 의하여 등록한 자</td>
							</tr>
						</tbody>
					</table>
				</div>
				<h4 class="tit_blue">학적 변경 신청</h4>
				<ul class="list_dot">
					<li>학적(개명 및 주민등록번호 변경 등) 변경 신청
						<ul class="list_line">
							<li>변경 전후가 기재된 주민등록초본 원본 1부 및본인 신분증(우편신청 시 사본),
								학적부기재사항정정신청서를 교무처 &nbsp;&nbsp;학사팀으로제출(우편신청 가능)</li>
						</ul>
					</li>
				</ul>
				<p class="mT5 mL10">
					<a class="btn_down" onclick="fileDown(this);" href="#;"
						data-filenm="학적부기재사항정정신청서.hwp"
						data-filesaved="upload/CMS/학적부기재사항정정신청서.hwp">학적부기재사항정정 신청서</a>
				</p>
				<ul class="list_dot">
					<li>개인정보 수정(주소, 연락처, e-mail, 영문이름, 한자명): 본인 직접 수정 가능
						<ul class="list_line">
							<li>중앙대학교 포탈 로그인 후[my secret - 내정보 수정]</li>
						</ul>
					</li>
				</ul>
				<h4 class="tit_blue">증명서 관련 부서 연락처</h4>
				<p class="txtR mB0 mT0">
					<b>(업무시간: 월-금 09:00~18:00)</b>
				</p>
				<div class="table_wrap">
					<table class="table_normal">
						<caption>구분, 관련 부서, 위치, 연락처 항목에 따른 증명서 관련 부서 연락처</caption>
						<colgroup>
							<col width="35%">
							<col width="20%">
							<col width="*">
							<col width="18%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">구분</th>
								<th scope="col">관련 부서</th>
								<th scope="col">위치</th>
								<th scope="col">연락처</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="al" rowspan="2"><b>학생 관련 증명서/학생증 및 학번 문의</b></td>
								<td class="al">학사팀(서울)</td>
								<td class="al">본관(201관) 1층</td>
								<td class="al">02)820-6035~6</td>
							</tr>
							<tr>
								<td class="al">학생지원팀(안성)</td>
								<td class="al">학생복지관(610관) 2층</td>
								<td class="al">031)670-3388</td>
							</tr>
							<tr>
								<td class="al"><b>교직원 관련 증명서 및 신분증</b></td>
								<td class="al">인사팀</td>
								<td class="al">본관(201관) 1층</td>
								<td class="al">02)820-6067</td>
							</tr>
							<tr>
								<td class="al"><b>등록금 관련 증명서</b></td>
								<td class="al">재무회계팀</td>
								<td class="al">본관(201관) 1층</td>
								<td class="al">02)820-6072</td>
							</tr>
							<tr>
								<td class="al"><b>장학 관련 증명서</b></td>
								<td class="al">학생지원팀</td>
								<td class="al">학생회관(107관) 2층</td>
								<td class="al">02)820-6047</td>
							</tr>
							<tr>
								<td class="al"><b>교직 관련 증명서</b></td>
								<td class="al">교직팀</td>
								<td class="al">서라벌홀(203관) 5층</td>
								<td class="al">02)820-5080</td>
							</tr>
							<tr>
								<td class="al"><b>레인보우시스템 관련</b></td>
								<td class="al">다빈치인재개발원</td>
								<td class="al">100주년기념관(310관)2층</td>
								<td class="al">02)820-6054</td>
							</tr>
							<tr>
								<td class="al"><b>공학인증관련 증명서</b></td>
								<td class="al">공학교육혁신센터</td>
								<td class="al">100주년기념관(310관)3층</td>
								<td class="al">02)820-6536</td>
							</tr>
							<tr>
								<td class="al" rowspan="2"><b>증명서 발급제한(도서미납) 관련</b></td>
								<td class="al">학술정보원(서울)</td>
								<td class="al">중앙도서관(204관) 2층</td>
								<td class="al">02)820-6195~7</td>
							</tr>
							<tr>
								<td class="al">학술정보원(안성)</td>
								<td class="al">중앙도서관(901관) 3층</td>
								<td class="al">031)670-3450~2</td>
							</tr>
						</tbody>
					</table>
				</div>
			</article>
		</div>
		<div id="tuition2">
			<article class="ct_area">
				<h3 class="tit_line mt0">증명서 발급</h3>
				<select class="form-control" id="subjCode" style="width: 72%;">
					<option></option>
				</select>
				
				<h4 class="tit_blue">발급 증명서 현황</h4>
			</article>
		</div>
		<%@ include file="../inc/bottom.jsp"%>