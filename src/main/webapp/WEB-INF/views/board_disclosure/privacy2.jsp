<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<main role="main" class="flex-shrink-0">
<div class="container">

<title>개인정보 취급방침</title>
<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
body {
    padding: 0;
    margin: 2% 2%;
    font-family: '나눔고딕', NanumGothic;
    font-size: 13px;
}

legend {
    visibility: hidden;
    overflow: hidden;
    position: absolute;
    top: -50px;
    left: -50px;
    width: 0;
    height: 0;
    padding: 0;
    font-size: 0;
    line-height: 0
}

.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}

.btn:hover {
  background-color: RoyalBlue;
}

select, input, label {
    margin: 0;
    padding: 0;
    font-family: NanumGothic, '나눔고딕', 'Nanum Gothic', sans-serif;
    font-size: 12px;
    color: #666
}

img {
    max-width: 100%;
    width: auto;
    height: auto;
    border: 0;
    vertical-align: top;
    -ms-interpolation-mode: bicubic
}
</style>
<link href="/html/portlet/journal_content/css/dku_content.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script type="text/livescript">
    $(function () {
        $('.btn').on('click',function(){
            window.close();
        })

    })
</script>
<div id="tuition1">

    <div class="information_wrap">
        <div class="email_information">
	        <p class="logo"><img src="https://portal.dankook.ac.kr/www-theme/images/custom/common/h1_logo_pc.png" alt="단국대 로고" /></p>
	        <p class="tit">이메일 무단수집 거부</p>
	        <p class="cmt">본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>
	       	  이를 위반시 <span class="fc_red">정보통신망법에 의해 형사처벌됨</span>을 유념하시기 바랍니다.</p>
	        <p class="t_right">게시일 2020년 7월 22일</p>
	    </div>
	   <button class="btn"><i class="fa fa-close"></i> Close</button>
	</div>
</div>
<%@ include file="../inc/bottom.jsp"%>