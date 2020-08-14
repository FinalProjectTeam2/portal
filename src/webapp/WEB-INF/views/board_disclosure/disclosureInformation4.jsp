<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style type="text/css">
.disclosureInformation5 {
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 14px;
	padding:2%;
}

table {
	width: 1200px;
	min-width: 500px;
	padding: 1.5%;
	font-size: 14px;
	line-height: 30px;
	border-collapse: collapse;
	border: 1px solid gary;
}

.text-right {
	text-align: right;
}

ul li {
	display:inline;
	border-left:1px solid #999;
	padding:0 10px; 
}

.menu {
	padding: 5px 5px;
	width: 1200px;
}

a:hover {
	background: skyblue;
}

tr, td, th {
	border: 1px solid gray;
}
</style>

<div class="disclosureInformation5">
	<div class="menu">
		<ul>
			<li><a href="#educationExpenses">학생1인당 교육비</a></li>
			<li><a href="#restoration">교육비환원율</a></li>
			<li><a href="#dependenceRate">등록금 의존율</a></li>
			<li><a href="#debt">부채비율</a></li>
			<li><a href="#revenue">수익용 기본재산 확보율 비교</a></li>
		</ul>
	</div>
<!-- 학생1인당 교육비 -->
	<div class="educationExpenses">
		<div class="title">
			<h4><a name="educationExpenses">학생 1인당 교육비</a></h4>
		</div>
		<div calss="table">
			<table>
				<colgroup>
					<col span="4" style="width: 25%">
				</colgroup>                                 
				<thead>
				    <tr>
				        <th scope="col">구분</th>
				        <th scope="col">2017</th>
				        <th scope="col">2018</th>
				        <th scope="col">2019</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <th scope="row">학생&nbsp;&nbsp;&nbsp;1인당&nbsp;&nbsp;&nbsp;교육비(천원)</th>
				        <td class="text-right">13,236</td>
				        <td class="text-right">13,425.7</td>
				        <td class="text-right">13,384.3</td>
				    </tr>
				    <tr>
				        <th scope="row">총교육비(천원)</th>
				        <td class="text-right">358,298,844</td>
				        <td class="text-right">358,681,924</td>
				        <td class="text-right">359,007,011</td>
				    </tr>
				    <tr>
				        <th scope="row">재학생수(명)</th>
				        <td class="text-right">27,070</td>
				        <td class="text-right">26,716</td>
				        <td class="text-right">26,823</td>
				    </tr>
				</tbody>
			</table>
		</div>
		<p>&nbsp;</p>
		<div class="contents">
			<p>산출방식 : 총교육비 / 재학생수</p>
			<p><strong>2015년 이전</strong></p>
			<p>*&nbsp;총교육비 : 교비회계 교육비 + 산학협력단회계 교육비</p>
			<p>-교비회계 교육비 : 자금계산서의 보수+관리운영비+연구학생경비-연구학생경비 중 입시관리비+도서구입비+기계·기구매입비</p>
			<p>-산학협력단회계 교육비 : 현금흐름표의 산학협력비+지원금사업비+일반관리비+간접비사업비+기계기구취득비</p>
			<p><strong>2016년 이후</strong></p>
			<p>*&nbsp;총교육비 : 교비회계 교육비+산학협력단회계 교육비+도서구입비+기계기구매입비</p>
			<p>-교비회계 교육비 : 자금계산서의 보수+관리운영비+연구학생경비-연구학생경비 중 입시관리비</p>
			<p>-산학협력단회계 교육비 : 현금흐름표의 산학협력비+지원금사업비+일반관리비+간접비사업비</p>
			<p>-도서구입비 : 교비회계 중 도서구입비</p>
			<p>-기계기구매입비 : 교비회계 중 기계·기구매입비+산학협력단회계 중 기계·기구취득비</p>
			<p>&nbsp;</p>
			<p>*재학생수 : 공시 직전연도 4. 1 기준 학부 및 대학원 재학생 수의 합</p>
			<p><font color="blue">해설 : 금액이 높을수록 대학의 학생에 대한 연구비·장학금 등 교육비로의 투자 성향이 높음을 의미함</font></p>
		</div>
	</div>
<br>

<!-- 교육비 환원율 -->	
	<div class="restoration">
		<div class="title">
			<h4><a name="restoration">교육비 환원율</a></h4>
		</div>
		<div calss="table">	
			<table>
				<colgroup>
					<col span="4" style="width: 25%">
				</colgroup>                    									              
				<thead>
				    <tr>
				        <th scope="col">구분</th>
				        <th scope="col">2017</th>
				        <th scope="col">2018</th>
				        <th scope="col">2019</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <th scope="row">교육비 환원율(%)</th>
				        <td class="text-right">161.6</td>
				        <td class="text-right">162.8</td>
				        <td class="text-right">162.4</td>
				    </tr>
				    <tr>
				        <th scope="row">총교육비(천원)</th>
				        <td class="text-right">358,298,844</td>
				        <td class="text-right">358,681,924</td>
				        <td class="text-right">359,007,011</td>
				    </tr>
				    <tr>
				        <th scope="row">등록금 수입(천원)</th>
				        <td class="text-right">221,770,924</td>
				        <td class="text-right">220,336,268</td>
				        <td class="text-right">221,044,556</td>
				    </tr>
				</tbody>
			</table>				
		</div>
		<p>&nbsp;</p>
		<div class="contents">
			<p>산출방식 : 총교육비/등록금수입×100</p>
			<p><strong>2015년 이전</strong></p>
			<p>*&nbsp;총교육비 : 교비회계 교육비 + 산학협력단회계 교육비</p>
			<p>-교비회계 교육비 : 자금계산서의 보수+관리운영비+연구학생경비-연구학생경비 중 입시관리비+도서구입비+기계․기구매입비</p>
			<p>-산학협력단회계 교육비 : 현금흐름표의 산학협력비+지원금사업비+일반관리비+간접비사업비+기계기구취득비</p>
			<p><strong>2016년 이후</strong></p>
			<p>*&nbsp;총교육비 : 교비회계 교육비+산학협력단회계 교육비+도서구입비+기계기구매입비</p>
			<p>-교비회계 교육비 : 자금계산서의 보수+관리운영비+연구학생경비-연구학생경비 중 입시관리비</p>
			<p>-산학협력단회계 교육비 : 현금흐름표의 산학협력비+지원금사업비+일반관리비+간접비사업비</p>
			<p>-도서구입비 : 교비회계 중 도서구입비</p>
			<p>-기계기구매입비 : 교비회계 중 기계·기구매입비+산학협력단회계 중 기계·기구취득비</p>
			<p>*&nbsp;등록금수입 : 교비회계의 단기수강료 수입을 제외한 등록금 수입 총액</p>
			<p><font color="blue">해설 : 상기의 지표는 학생이 납부한 등록금에 대한 직접 교육비로의 재투자 비율로서, 등록금의 교육비 환원정도를 의미함</font></p>
		</div>
	</div>
<br>

<!-- 등록금 의존율 -->	
	<div class="dependenceRate">
		<div class="title">
			<h4><a name="dependenceRate">등록금 의존율</a></h4>
		</div>
		<div calss="table">	
			<table>
	            <colgroup>
	                <col span="4" style="width: 25%">
	            </colgroup>                    									                                      
				<thead>
				    <tr>
				        <th scope="col">구분</th>
				        <th scope="col">2017</th>
				        <th scope="col">2018</th>
				        <th scope="col">2019</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <th scope="row">등록금의존율(%)</th>
				        <td class="text-right">68.1</td>
				        <td class="text-right">68.1</td>
				        <td class="text-right">68.8</td>
				    </tr>
				    <tr>
				        <th scope="row">등록금 수입(천원)</th>
				        <td class="text-right">221,770,924</td>
				        <td class="text-right">220,336,268</td>
				        <td class="text-right">221,044,556</td>
				    </tr>
				    <tr>
				        <th scope="row">자금수입 총액(천원)</th>
				        <td class="text-right">325,843,740</td>
				        <td class="text-right">323,350,744</td>
				        <td class="text-right">321,128,524</td>
				    </tr>
				</tbody>
			</table>
		</div>
		<p>&nbsp;</p>
		<div class="contents">
			<p>산출방식 : 등록금수입/자금수입총액×100</p>
			<p>*&nbsp;등록금수입 : 교비회계의 단기수강료 수입을 제외한 등록금 수입 총액</p>
			<p><font color="blue">해설 : 비율이 높을수록 등록금 수입에 대한 편중정도가 높아 교비회계 수입재원의 다변화가 요구되는 것을 의미함</font></p>
		</div>
	</div>
<br>

<!-- 부채비율 -->	
	<div class="debt">
		<div class="title">
			<h4><a name="debt">부채비율</a></h4>
		</div>
		<div calss="table">	
			<table>	
				<colgroup>
					<col span="4" style="width: 25%">
				</colgroup>                   									                                    
				<thead>
				    <tr>
				        <th scope="col">구분</th>
				        <th scope="col">2017</th>
				        <th scope="col">2018</th>
				        <th scope="col">2019</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <th scope="row">부채비율(%)</th>
				        <td class="text-right">2.2</td>
				        <td class="text-right">1.7</td>
				        <td class="text-right">1.3</td>
				    </tr>
				    <tr>
				        <th scope="row">총 부채(천원)(천원)</th>
				        <td class="text-right">93,223,933</td>
				        <td class="text-right">91,451,644</td>
				        <td class="text-right">90,274,533</td>
				    </tr>
				    <tr>
				        <th scope="row">예수금(천원)</th>
				        <td class="text-right">2,011,260</td>
				        <td class="text-right">1,866,745</td>
				        <td class="text-right">2,763,007</td>
				    </tr><tr>
				        <th scope="row">선수금(천원)</th>
				        <td class="text-right">79,599,839</td>
				        <td class="text-right">79,063,024</td>
				        <td class="text-right">79,073,290</td>
				    </tr>
				    <tr>
				        <th scope="row">기타유동부채(천원)</th>
				        <td class="text-right">883,034</td>
				        <td class="text-right">2,311,071</td>
				        <td class="text-right">2,447,148</td>
				    </tr>
				    <tr>
				        <th scope="row">기본금(천원)</th>
				        <td class="text-right">492,363,799</td>
				        <td class="text-right">484,812,265</td>
				        <td class="text-right">473,305,365</td>
				    </tr>
				</tbody>
			</table>
		</div>
		<p>&nbsp;</p>
		<div class="contents">
			<p>산출방식 : 총부채-(예수금+선수금+기타유동부채)/기본금×100</p>
			<p>*&nbsp;예수금 : 일시적으로 징구 또는 수령한 자금 중 향후 반환하는 것을 전제로 하는 일시적인 채무</p>
			<p>**&nbsp;선수금 : 학교법인 또는 학교의 수입으로 회계 처리될 금액이나 수입에 상응하는 용역제공이 완료되지 않은 경우 그 수령한 금액을 처리하는 계정</p>
			<p>***&nbsp;기타유동부채 : 예수금 및 선수금 이외의 일시적인 유동부채</p>
			<p><font color="blue">해설 : 비율이 낮을수록 타인자본에 비해 자기자본 보유 비중이 상대적으로 높아 재무구조가 안정적인 것을 의미함</font></p>
		</div>
<br>
	
<!-- 수익용 기본재산 확보율 비교 -->	
	<div class="revenue">
		<div class="title">
			<h4><a name="revenue">수익용 기본재산 확보율 비교</a></h4>
		</div>
		<div calss="table">	
			<table>	
				<colgroup>
                	<col span="4" style="width: 25%">
                </colgroup>                    									                                 
				<thead>
				    <tr>
				        <th scope="col">구분</th>
				        <th scope="col">2017</th>
				        <th scope="col">2018</th>
				        <th scope="col">2019</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				        <th scope="row">별표</th>
				        <td class="input text-right"><span class="badge star-rating rating-5">5</span></td>
				        <td class="input text-right"><span class="badge star-rating rating-5">5</span></td>
				        <td class="input text-right"><span class="badge star-rating rating-5">5</span></td>
				    </tr>
				    <tr>
				        <th scope="row">수익용 기본재산 확보율(%)</th>
				        <td class="text-right">135.5</td>
				        <td class="text-right">146.7</td>
				        <td class="text-right">169</td>
				    </tr>
				    <tr>
				        <th scope="row">법인전입금 전입액(보유액)</th>
				        <td class="text-right">343,017,439</td>
				        <td class="text-right">358,683,047</td>
				        <td class="text-right">410,045,407</td>
				    </tr>
				    <tr>
				        <th scope="row">운영수입(기준액)</th>
				        <td class="text-right">253,208,731</td>
				        <td class="text-right">244,418,132</td>
				        <td class="text-right">242,685,784</td>
				    </tr>
				</tbody>
			</table>	
		</div>
		<p>&nbsp;</p>
		<div class="contents">
			<p>산출방식 : 보유액/기준액×100</p>
			<p>*&nbsp;보유액 : 학교법인이 보유하고 있는 수익용기본재산의 평가액 합</p>
			<p>**&nbsp;기준액 : 운영수익총계 – 전입·기부·원조보조수입</p>
			<p>- 운영수익총계 : 학교회계 운영계산서상 수익 총계 단, 고유목적사업준비금환입액 제외</p>
			<p>- 전입·기부·원조보조수입 : 「대학설립·운영규정」시행규칙 제10조에 따른 전입금수입·기부금수입</p>
			<p><font color="blue">해설 : ⌈대학설립‧운영규정⌋ 제7조에 따라 학교법인은 대학의 연간학교회계 운영수익총액에 해당하는 가액의 수익용 기본재산을 확보하여야 함</font></p>
		</div>
	</div>
</div>