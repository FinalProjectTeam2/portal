<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>개인정보 취급방침</title>
    <meta content="text/html; charset=UTF-8" http-equiv="content-type" />
    <style type="text/css">
        body {
            padding: 0;
            margin: 0;
            font-family: '나눔고딕', NanumGothic;
            font-size: 13px
        }
        
        ol,
        ul {
            margin: 0;
            padding: 0;
            list-style: none
        }
        
        fieldset {
            margin: 0;
            padding: 0;
            border: none
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
        
        button {
            overflow: visible;
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            vertical-align: top;
            cursor: pointer
        }
        
        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            margin: 0;
            font-weight: normal
        }
        
        select,
        input,
        label {
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
</head>

<body>
    <div class="information_wrap">
        <div class="email_information">

            <p class="logo"><img src="https://portal.dankook.ac.kr/www-theme/images/custom/common/h1_logo_pc.png" alt="단국대 로고" />
            </p>

            <p class="tit">이메일 무단수집 거부</p>
            <p class="cmt">본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>
             이를 위반시 <span class="fc_red">정보통신망법에 의해 형사처벌됨</span>을 유념하시기 바랍니다.</p>
            <p class="t_right">게시일 2004년 9월 7일</p>
        </div>
        <p class="cls">CLOSE X</p>
    </div>
</body>
<script type="text/livescript">
    $(function () {
        $('.cls').on('click',function(){
            window.close();
        })

    })
</script>

</html>