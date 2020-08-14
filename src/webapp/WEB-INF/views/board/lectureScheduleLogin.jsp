<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>수강신청 로그인</title>
<style type="text/css">
.login {
	width:38%;
	margin: 5% 5% 10%;
}

.login_txt {
	width: 58%;
	float: right;
	margin: -40% -2%;


}

.addr_box {
	width:80%;
	background-color: gray;
	padding: 2% 2%;
	text-align: center;
	margin: 3% 0% -5% 0%;
}


</style>
</head>
<body>
<div class="login">
<%@ include file="../login/login.jsp" %>   
</div>

<div class="login_txt">
	<dt>불법 수강신청에 따른 안내</dt>
	<dd>불법 수강신청으로 인하여 타학생에게 피해를 주고<br> 대학 전산망에 악영향을 주는 행위에 대하여<br> 학교당국에서는 강력히 대응 할 것이며 학칙에 의거 엄중 처벌됨을 알려드립니다.<br>
	<font color="red">또한 수강신청 Black List에 등록된 수강신청자는 금학기 및 차기학기 수강신청 권한이 제한됨을 알려드립니다.</font>
	</dd>
	<dd>
		<ul class="lst_hyphen">
			<li>
				<span class="lst_head">-</span>
				타인의 비밀번호를 도용하여 수강신청하는 행위
			</li>
			<li>
				<span class="lst_head">-</span>
				매크로 등 불법 프로그램을 이용하여 수강신청하는 행위<br>
				<font color="red">(현재 수강신청 프로그램 내 매크로 방지 기능 포함 운영 중)</font>
			</li>
			<li>
				<span class="lst_head">-</span>
				기타 불법행위
			</li>
		</ul>
	</dd>
	
	
	<dt>수강신청 안내</dt>
	<dd>최초 비밀번호는 <strong>생년월일(8자리)</strong>이며 웹정보 시스템에서 비밀번호 변경이 가능합니다.</dd>
	<dd>수강신청 프로그램은  <strong>Internet Explorer 9.0 이상</strong>에서 사용하실 수 있습니다.<br>
	<ul class="lst_hyphen">
		<li style="color:#FF0000;">
			<span class="lst_head">-</span>
			<strong> IE 8.0 이하에서는 정상적으로 동작하지 않을 수 있습니다. (최신 버전 권장)</strong>
		</li>
		<li>
			<span class="lst_head">-</span>
			Chrome, Firefox, Safari 이용 가능(브라우저별 최신 버전으로 업그레이드 권장)
		</li>
	</ul>
	</dd>
	<dd>웹 수강신청 프로그램 이용 안내를 읽어보시기 바랍니다. </dd>
	<dd>
	<ul class="lst_hyphen">
		<li>
			<span class="lst_head">-</span>
			죽전: 학사팀(031-8005-2056),교양(031-8005-2521)
		</li>
		<li>
			<span class="lst_head">-</span>
			천안: 학사팀(041-550-1222~1227),교양(041-550-1342,1343)
		</li>
	</ul>
	</dd>
	</dl>
      <div class="addr_box">
        <p class="addr">죽전캠퍼스 경기도 용인시 수지구 죽전로 152 (우)16890 / 천안캠퍼스 충남 천안시 동남구 단대로 119 (우)31116</p>
        <p>Copyright(c) 2015 BY DANKOOK UNIVERSITY. All rights reserved.</p>
      </div>
    </div>
</div>

</body>
</html>