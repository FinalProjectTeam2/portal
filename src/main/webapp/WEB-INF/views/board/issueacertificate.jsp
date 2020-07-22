<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>증명서발급 안내</title>
<style>
@charset "UTF-8";


/*TITILE*/
.tit_sub{
	margin-bottom:30px;
	font-family: 'Noto Sans KR';font-size:36px;color:#1e386f;line-height:1.4em;letter-spacing:-1px;font-weight:500;
}
.tit_sub.small{font-size:24px}
.tit_sub span{
	padding-left:20px;
	font-family: 'Noto Sans KR';font-size:24px;color:#000;font-weight:500
}
.tit_sub span.block{display:block;padding-left:0}
.txt_sub{
	margin:-10px 0 30px;
	font-size:15px;color:#000;line-height:1.8em;
}
.tit_blue{
	margin:40px 0 10px;
	font-family: 'Noto Sans KR';font-size:18px;color:#1e386f;line-height:1.4em;letter-spacing:-1px;font-weight:500;
}
.tit_blue.line{padding-top:40px;border-top:1px solid #dddfe5;}
.tit_black{
	margin:40px 0 10px;
	font-family: 'Noto Sans KR';font-size:24px;color:#000;line-height:1.4em;letter-spacing:-1px;font-weight:500;
}
.tit_black.small{font-size:18px;}
.tit_black+.tit_blue{margin-top:20px;}
.tit_gray{
	/*margin:30px 0 10px;*/margin:20px 0 10px;
	font-family: 'Noto Sans KR';font-size:15px;color:#666;line-height:1.4em;letter-spacing:-1px;font-weight:500;
}
.tit_line{
	margin:50px 0 30px;
	font-family: 'Noto Sans KR';font-size:24px;font-weight:500;line-height:1.4em;letter-spacing:-1px;
}
.tit_line span{padding-left:10px;font-family: 'Noto Sans KR';font-size:18px;font-weight:500;}
.tit_line span:before{
	content:'';
	display:inline-block;width:2px;height:15px;
	margin:12px 10px 0 0;
	background:#ccc;
	vertical-align:top
}
.tit_line:after{
	content:'';
	display:block;width:40px;height:3px;
	margin-top:12px;
	background:#db2931;
}
.tit_visual{
	position:relative;
	min-height:190px;box-sizIng:border-box;
	padding:40px;margin-bottom:40px;
	background:url(../img/campusinfo/undergraduate_main_visual.png) no-repeat;background-size:cover;
}
.tit_visual .tit_sub{margin-bottom:15px;}
.tit_visual p{font-size:15px;color:#333;line-height:2em}
.tit_visual p .block{display:block;}

/*TAB*/
.list_tab_wrap{max-width:790px;margin-bottom:45px}
.list_tab_wrap button{display:none;}
.list_tab{
	background:url(../img/common/bg_tab.png);
	font-size:0
}
.list_tab>li{
	box-sizing:border-box;
	display:inline-block;min-width:98px;vertical-align:top
}
.list_tab>li>a{
	position:relative;
	display:block;height:51px;line-height:51px;
	padding:0 12px;
	text-align:center;font-size:16px;color:#333;letter-spacing:-0.5px
}
.list_tab a:hover,
.list_tab_wrap div a:hover,
.list_tab>li>a.on{
	color:#1e71c0;
}
.list_tab>li>a.on:after{
	content:'';
	position:absolute;bottom:-1px;left:0;
	display:block;width:100%;height:2px;
	background:#1e71c0;
}
.list_tab_wrap div ul{margin-left:-30px;font-size:0}
.list_tab_wrap div ul li{
	display:inline-block;
	margin:10px 0 0 30px;
}
.list_tab_wrap div ul li a{
	display:block;
	padding-left:9px;
	background:url(../img/common/bul_tab.png) no-repeat 0 7px;
	font-size:15px;color:#666;letter-spacing:-0.5px
}
.list_tab_wrap div ul li a.on{background-image:url(../img/common/bul_tab_on.png);color:#1e71c0}

.ct_tab {overflow:hidden;margin:0 0 32px;}
.ct_tab li {float:left;margin:0 2px 2px 0;}
.ct_tab li>a {display:block;height:44px;padding:0 35px;background:#f1f2f7;color:#333;font-family:'Noto Sans KR';font-size:15px;font-weight:400;line-height:44px;text-align:center;}
.ct_tab li>a:hover,
.ct_tab li>a.on {background:#1e71c0;color:#fff;}

/*BTNS*/
.btn_down{
	display:inline-block;box-sizing:border-box;height:45px;line-height:45px;
	padding:0 15px;
	border:1px solid #1e71c0;
	text-align:center;font-size:15px;color:#1e71c0;
}
.btn_down:after{
	content:'';
	display:inline-block;width:17px;height:100%;
	margin-left:20px;
	background:url(../img/common/ico_down.png) no-repeat center;
	vertical-align:top;
}
.btn_down.blue{background:#1e71c0;color:#fff}
.btn_down.blue:after{background-image:url(../img/common/ico_down2.png)}
.btn_down.acr:after{background-image:url(../img/common/ico_down3.png)}
.btn_down.acr{border-color:#dadce3;color:#666}
.btn_down.acr:before{
	content:'';
	display:inline-block;width:23px;height:100%;
	margin-right:15px;
	background:url(../img/common/ico_acr.png) no-repeat center;
	vertical-align:top;
}
.btn_go{
	display:inline-block;box-sizing:border-box;height:45px;line-height:45px;
	padding:0 15px;
	border:1px solid #1e71c0;background:#1e71c0;
	text-align:center;font-size:15px;color:#fff;
}
.btn_go:after{
	content:'';
	display:inline-block;width:17px;height:100%;
	margin-left:20px;
	background:url(../img/common/arrow_go3.png) no-repeat center;
	vertical-align:top;
}
.btn_go.line{background:#fff;border-color:#1e71c0;color:#1e71c0;}
.btn_go.line:after{background-image:url(../img/common/arrow_go4.png)}
.btn_go.w100{width:100%}
.btn_go2{
	display:inline-block;box-sizing:border-box;height:35px;line-height:35px;
	padding:0 10px;
	border:1px solid #c0c3ce;background:#fff;
	text-align:center;font-size:14px;color:#62666f;vertical-align:middle
}
.btn_go2:after{
	content:'';
	display:inline-block;width:7px;height:100%;
	margin-left:12px;
	background:url(../img/common/arrow_go2.png) no-repeat center;
	vertical-align:top;
}

.btn_link{border-bottom:1px solid #1e71c0;color:#1e71c0;}

.btn_home{
	display:inline-block;box-sizing:border-box;height:40px;line-height:40px;
	padding:0 15px 0 45px;
	border:1px solid #1e71c0;
	background:url(../img/common/ico_home2.png) no-repeat 15px center;
	text-align:center;font-size:15px;color:#1e71c0;
}
.btn_home.blue{background-color:#1e386f;border-color:#1e386f;background-image:url(../img/common/ico_home.png);color:#fff;}
.btn_home.red{background-color:#db2931;border-color:#db2931;background-image:url(../img/common/ico_home.png);color:#fff;}
.btn_home.small{font-size:0;width:31px;height:31px;padding:0;background-position:center;}
.btn_major{
	display:inline-block;box-sizing:border-box;height:40px;line-height:40px;
	padding:0 15px 0 45px;
	border:1px solid #c0c3ce;
	background:url(../img/common/ico_book.png) no-repeat 15px center;
	text-align:center;font-size:15px;color:#666;
}


.btn_blue {display:inline-block;box-sizing:border-box;min-width:120px;height:40px;line-height:40px;padding:0 15px;background:#1e386f;text-align:center;font-family:'Noto Sans KR';font-size:18px;font-weight:300;color:#fff;}

.btn_go_red{
	display:inline-block;
	padding-right:23px;margin:20px 25px 0 0;
	background:url(../img/common/arrow_go.png) no-repeat right center;
	font-size:14px;color:#db2931;text-transform:uppercase;
}
.btn_c{text-align:center;}
.mt,
.btn_mt{margin-top:50px !important;}
.mt2,
.btn_mt2{margin-top:20px !important;}
.mt3,
.btn_mt3{margin-top:30px !important;}
.mt0{margin-top:0 !important;}

.point_blue{color:#1e386f !important}

.ac {text-align:center !important;}
.al {text-align:left !important;}
.ar {text-align:right !important;}

/*table*/
.table_wrap, .table_wrap2, .table_wrap3{
	width:100%;
	overflow:auto;overflow-y:hidden;
}
.table_wrap+ul{margin-top:15px}
.table_wrap2 .table_normal{min-width:100%}
.table_wrap.no_scroll .table_normal{min-width:100%;}
.table_normal {
	table-layout:fixed;
	width:100%;min-width:700px;
	margin-left:-1px;
	border-top:1px solid #62666f;border-collapse:collapse;
}
.table_normal.small th,
.table_normal.small td{font-size:14px;letter-spacing:-1px;padding:5px}
.table_normal th{
	padding:10px;
	border:1px solid #dddfe5;border-right:0;
	background:#f0f2f7;
	font-size:15px;color:#62666f;word-break:break-all
}
.table_normal td{
	padding:10px;
	border-bottom:1px solid #dddfe5;border-left:1px solid #dddfe5;
	text-align:center;font-size:15px;color:#000;word-break:break-all
}
.table_normal .line th,
.table_normal .line td{border-top:1px solid #62666f;}
.table_normal.no_line{border-top:0}

.table_normal .line_d th,
.table_normal .line_d td{border-top:1px solid #dddfe5;}
.table_normal .no_line_t{border-top:0}
.table_normal .no_line_b{border-bottom:0}

.table_wrap3 {border-top:1px solid #62666f;}
.table_wrap3.no_scroll .table_normal {min-width:100%;}
.table_wrap3 .table_normal {width:calc(100% + 1px);margin-top:-1px;border-top:none;}
.table_wrap3 .table_normal thead th {background:#f0f2f7;color:#62666f;font-weight:bold;letter-spacing:-1px;}

table td.al{text-align:left;}
table td.no_data{
	padding:130px 0 40px;
	background:url(../img/about/caupusmap/no_data.png) no-repeat center 50px;
	text-align:center;font-size:15px;color:#62666f
}
.table_free{table-layout:auto !important;}

/*ct area*/
.box_info{
	position:relative;
	padding:20px 160px 1px 20px;margin-bottom:20px;
	background:#f0f2f7;
}
.box_info.no_pd{
	padding-right:20px;
}
.box_info>ul{
	font-size:0;
}
.box_info>ul>li{
	position:relative;
	display:inline-block;min-height:30px;line-height:30px;
	padding:0 20px 20px 40px;
	font-size:16px;font-weight:normal;vertical-align:top;
}
.box_info>ul>li.w100{min-width:100%}
.box_info>ul>li:before{
	content:'';
	position:absolute;top:0;left:0;
	display:block;width:30px;height:30px;
	background:url(../img/common/ico_print.png) no-repeat center;
}
.box_info>ul>li b{
	padding-right:13px;
	color:#1e386f;font-weight:500;font-family: 'Noto Sans KR';
}
.box_info>ul>li .block{display:block;letter-spacing:-0.5px}
.box_info>ul>li .block b{padding-left:20px;color:#000}
.box_info>ul>li .block b:first-child{padding-left:0}
.box_info>ul>li.tel:before{
	background-image:url(../img/common/ico_tel.png)
}
.box_info>ul>li.office:before{
	background-image:url(../img/common/ico_location.png)
}
.box_info>ul>li.email:before{
	background-image:url(../img/common/ico_email.png)
}
.box_info>ul>li.hours:before{
	background-image:url(../img/common/ico_hour.png)
}
.box_info p{padding-bottom:20px;}
.box_info p>a,
.box_info>a{
	display:inline-block;
	height:40px;line-height:40px;
	padding:0 14px 0 39px;
	background:#1e386f url(../img/common/ico_home.png) no-repeat 16px center;
	font-size:16px;color:#fff;
}
.box_info a+a{margin-left:5px}
.box_info>a{position:absolute;top:15px;right:20px;margin:0}
.box_info.style2{padding-right:20px;}
.box_info.style2>ul>li{box-sizing:border-box;width:50%;height:auto;padding-left:140px;}
.box_info.style2>ul>li b{position:absolute;left:39px;}
.box_info.style2.list1>ul>li{width:100%}
.box_info.style3>ul>li{padding-left:160px;}
.box_info p a.faculty{background-image:url(../img/common/ico_faculty.png);padding-left:42px}
.box_info p a.curriculum{background-image:url(../img/common/ico_curriculum.png)}

.box_caution{
	position:relative;
	padding:20px 20px 20px 150px;margin:50px 0;
	background:#f0f2f7 url(../img/common/ico_box_caution.png) no-repeat 52px center;
}
.box_caution p{line-height:1.8em;}
.tit_blue+.box_caution,
.tit_black+.box_caution{margin-top:20px}
p.caution{
	padding-left:20px;
	background:url(../img/common/icon_caution.png) no-repeat 0 6px;
	font-size:14px;color:#666;line-height:1.7em !important;letter-spacing:-1px
}
p.caution.small{font-size:14px !important;color:#666 !important}
p.caution.small2{font-size:13px !important;color:#666 !important}
p.caution.mt{margin:15px 0 0 11px !important}
p.caution+p.caution {margin-top:-10px;}

.list_dot>li{
	padding-left:11px;
	background:url(../img/common/bul_red.png) no-repeat 0 9px;
	font-size:15px;color:#000;letter-spacing:-0.5px;line-height:1.7em;
}
.list_dot>li+li{margin-top:5px}
.list_dot>li b.underline {text-decoration:underline;}
.list_dot ul{margin:10px 0}
.list_dot.blue>li{background-image:url(../img/common/bul_blue.png)}
.list_dot.gray>li{background-image:url(../img/common/bul_gray.png)}
.list_dot.noDot>li{padding-left:0;background:none;}

.list_line>li{
	padding-left:11px;
	background:url(../img/common/bul_line.png) no-repeat 0 7px;
	font-size:15px;color:#666;line-height:1.3em;letter-spacing:-0.5px
}
.list_line2>li{
	padding-left:11px;
	background:url(../img/common/bul_line.png) no-repeat 0 7px;
	font-size:15px;color:#666;line-height:1.7em;letter-spacing:-0.5px
}
.list_line2>li+li{margin-top:5px}
.list_dot.inline{font-size:0}
.list_dot.inline>li{display:inline-block;box-sizing:border-box;min-width:50%;vertical-align:top}

.list_step{width:100%;overflow:hidden;margin:50px 0 50px !important;font-size:0;text-align:center}
.list_step li{
	position:relative;
	display:inline-block;width:33.3%;box-sizing:border-box;
	margin-bottom:30px;padding:0 40px;
	text-align:center;font-size:15px;vertical-align:top;letter-spacing:-1px
}
.list_step li+li:before{
	content:'';
	position:absolute;top:59px;left:-10px;
	display:block;width:52px;height:10px;
	background:url(../img/campusinfo/step_arrow.png) no-repeat right 0;
}
.list_step li img{display:block;margin:0 auto 20px;}
.list_step li span{display:block;font-weight:600;letter-spacing:-1px}
.list_step.style2 li{width:33.33%}
.list_step.style2 li:before{left:-70px;width:140px;background-image:url(../img/campusinfo/step_arrow.png);background-position:right 0}
.list_step.style2 li:nth-child(4){
	float:right;
	margin-right:16.5%;margin-top:60px;
}
.list_step.style2 li:nth-child(5){
	float:right;
	margin-top:60px;
}
.list_step.style2 li:nth-child(4):before{
	top:-58px;left:50%;
	width:72px;height:126px;
	margin-left:63px;
	background-image:url(../img/campusinfo/step_arrow2.png);
}
.list_step.style2 li:nth-child(5):before{
	left:50%;margin-left:62px;
	transform:rotate(-180deg)
}


.list_icon li{
	position:relative;
	padding-left:100px;
	font-size:15px;
}
.list_icon li+li{margin-top:25px;}
.list_icon li b{
	position:absolute;left:0;
	display:inline-block;
	padding-left:40px;font-weight:500;
}
.list_icon li b:before{
	content:'';
	position:absolute;top:-4px;left:0;
	display:inline-block;width:30px;height:30px;
	background:url(../img/common/ico_location.png) no-repeat center;
}
.list_icon li b.tel:before{background-image:url(../img/common/ico_tel.png)}
.list_icon li b.fax:before{background-image:url(../img/common/ico_print.png)}
.list_icon li b.email:before{background-image:url(../img/common/ico_email.png)}

.ct_area{position:relative;}
.ct_area *{word-break:keep-all}
.ct_area p{
	margin:20px 0;
	font-size:15px;color:#333;line-height:1.9em;letter-spacing:-0.5px
}
.ct_area p .w,
.ct_area div .w {display:inline-block;}
.ct_area p .m,
.ct_area div .m {display:none;}
.ct_area p b{font-family: 'Noto Sans KR';font-weight:500;color:#000}
.ct_area p.line,
.ct_area div.line{border:1px solid #dddfe5;text-align:center;font-size:0}
.ct_area p.img2{margin:50px 0;text-align:center;font-size:0}
.ct_area p.img2.line{padding:30px}
.ct_area p.img .m,
.ct_area p.img2 .m{display:none}
/*.ct_area p.caution{padding-left:20px;background-position:0 5px;font-size:14px;color:#666}*/
.ct_area .ct{position:relative;}
.ct_area .img{font-size:0;line-height:0}
.ct_area .img img{font-size:0;}
.tit_blue+ul{margin-top:20px}

.ct_left, .ct_right{position:relative;width:100%;overflow:hidden;box-sizing:border-box;}
.ct_left .img{float:left;max-width:40%;margin:0 40px 40px 0}
.ct_right .img{float:right;max-width:40%;margin:0 0 40px 40px}
.ct_pd_left{position:relative;padding-left:300px}
.ct_pd_left .img{position:absolute;top:0;left:0;margin-top:0 !important}
.ct_left .tit_sub,
.ct_right .tit_sub,
.ct_pd_left .tit_sub,
.ct_pd_right .tit_sub{margin:-8px 0 20px}

.ct_subject ul{border-top:1px solid #333;margin-bottom:20px;}
.ct_subject li {position: relative;display: inline-block;min-width: 49.5%;box-sizing: border-box;border-bottom: 1px solid #dddfe5;}
.ct_subject li a{display: block;padding: 15px 40px 13px 20px;font-size: 15px;}
.ct_subject li a:after{content: '';position: absolute;top: 0;right: 20px;display: block;width: 17px;height: 100%;background: url(../img/common/ico_down.png) no-repeat center;}

/*대학소개*/
.welcome_message .message_info2{
	position:relative;
	min-height:590px;
	padding:0 400px 50px 0;
	border-bottom:1px solid #dddfe5;
}
.welcome_message .message_info2 h3{
	padding:16px 0 0 28px;
	background:Url(../img/common/bg_message.png) no-repeat;
	font-family: 'Noto Sans KR';font-weight:400;font-size:40px;color:#1e386f;letter-spacing:-1px;line-height:1.2em
}
.welcome_message .message_info2 h3+p{padding-left:28px;}
.welcome_message .message_info2 .img{position:absolute;top:0;right:0}
.welcome_message .message_info2 .img span{display:block;padding-top:20px;text-align:right;font-size:13px}
.welcome_message .message_info2 .img span b{font-size:14px}
.welcome_message .message_info2 .img span img{margin-left:20px;vertical-align:middle}
.welcome_message .history dl{position:relative;padding-left:150px}
.welcome_message .history dl dt{
	position:absolute;top:15px;left:0;
	width:100px;height:100px;
	box-sizing:border-box;padding:22px 15px 0 22px;
	background:#a0abc2;
	font-size:18px;color:#fff
}
.welcome_message .history dl dd{
	position:relative;
	padding:15px 0 15px 100px;
	border-bottom:1px solid #dddfe5;
	font-size:15px;color:#333;letter-spacing:-0.5px
}
.welcome_message .history dl dd b{
	position:absolute;left:0;
	display:inline-block;
	padding-left:22px;
	background:url(../img/about/history_bul.png) no-repeat 0 center;
	font-size:15px
}
.welcome_message .history dl.ct2 dd{padding-left:140px}
/*.presidents_message3 .message_info{border-bottom:0}*/

.welcome_history ul{width:102%;margin-left:-2%;overflow:hidden;}
.welcome_history ul li{
	float:left;width:23%;min-height:340px;
	margin-left:2%
}
.welcome_history ul li img{display:block;border:1px solid #dadce3;font-size:0}
.welcome_history ul li dl{
	padding:10px 0 5px 18px;margin-top:20px;
	background:url(../img/about/presidents.png) no-repeat;
}
.welcome_history ul li dl dt{
	padding-bottom:5px;
	font-family: 'Noto Sans KR';font-size:17px;font-weight:500;color:#000
}
.welcome_history ul li dl dd{font-size:15px;line-height:1.8em;letter-spacing:-1px}

.welcome_status4{position:relative;text-align:center}
.welcome_status4:before{
	content:'';
	position:absolute;top:0;left:50%;
	display:block;width:1px;height:100%;
	background:#dddfe5
}
.welcome_status4 h3{
	position:relative;
	box-sizing:border-box;width:220px;height:220px;
	padding-top:120px;margin:0 auto 50px;
	background:#1e71c0 url(../img/about/logo.png) no-repeat center 50px;
	border-radius:50%;
	text-align:center;font-family: 'Noto Sans KR';font-size:20px;color:#fff;line-height:1.2em;
}
.welcome_status4>ul{position:relative;font-size:0}
.welcome_status4>ul>li{position:relative;display:inline-block;vertical-align:top}
.welcome_status4 .ct1{padding-bottom:50px}
.welcome_status4 .ct1 li{
	box-sizing:border-box;width:240px;
	padding:15px;
	background:#a0abc2;
	font-family: 'Noto Sans KR';font-size:15px;color:#fff;line-height:1.2em;word-break:keep-all;
}
.welcome_status4 .ct1 li+li{margin-left:90px;}
.welcome_status4 .ct1 li+li:before{
	content:'';
	position:absolute;left:-90px;top:26px;
	display:block;width:90px;height:1px;
	background:#dddfe5
}
.welcome_status4 .ct2{padding-top:30px;background:#fff;}
/* 200212 수정 시작*/
.welcome_status4 .ct2>li{
	box-sizing:border-box;width:345px; 
	padding:30px;
	background:#f0f2f7;
	font-family: 'Noto Sans KR';font-size:19px;color:#1e386f;line-height:1.2em;word-break:keep-all;
}
/* 200212 수정 끝*/
.welcome_status4 .ct2>li+li{
	margin-left:90px;
	text-align:left;
}
.welcome_status4 .ct2>li:before{
	content:'';
	position:absolute;top:-29px;left:50%;
	display:block;width:1px;height:29px;
	background:#dddfe5
}
.welcome_status4 .ct2>li:after{
	content:'';
	position:absolute;top:-30px;left:50%;
	display:block;width:100%;height:1px;
	background:#dddfe5
}
.welcome_status4 .ct2>li+li:after{left:auto;right:50%}
.welcome_status4 .ct2>li li{
	position:relative;height:45px;line-height:45px;
	padding-left:10px;
	background:url(../img/common/bul_red.png) no-repeat 0 50%;
	font-family: 'Noto Sans KR';font-size:15px;
}
.welcome_status4 .ct2>li ul{margin-top:10px}
.welcome_status4 .ct2>li li a{
	position:absolute;right:0;top:50%;
	display:block;width:23px;height:23px;
	margin-top:-12px;
	background:url(../img/common/btn_go1.png) no-repeat;
	font-size:0
}

.presidents_message {position:relative;padding:0 390px 100px 0}
.presidents_message div{position:absolute;top:0;right:0;text-align:center;}
.presidents_message div p img{vertical-align:middle;margin-left:20px}
.presidents_message dl{
	padding:16px 0 0 28px;
	background:Url(../img/common/bg_message.png) no-repeat;
}
.presidents_message dl dt{
	font-family: 'Noto Sans KR';font-weight:500;font-size:40px;color:#1e386f;letter-spacing:-1px
}
.presidents_message dl dd{
	margin:10px 0 30px;
	font-family: 'Noto Sans KR';font-weight:400;font-size:30px;color:#000;letter-spacing:-1px;line-height:1.2em
}
.presidents_message>p{margin-left:28px}
#presidents_message{
	position:relative;
	float:left;
	width:100%;max-width:790px;height:250px;
	border-top:1px solid #dddfe5;padding-top:50px;
	background:url(../img/about/presidents_message_bg_s.png) no-repeat center 50px;
	text-align:center
}
/*
#presidents_message{
	position:relative;
	clear:both;
	height:250px;
	background:url(../img/about/presidents_message_bg.png) no-repeat center;
	text-align:center
}
#presidents_message:before{
	content:'';
	position:absolute;top:0;left:50%;
	display:block;width:1000%;height:100%;
	margin-left:-500%;
	background:url(../img/about/presidents_message_bg.png) no-repeat center;
}
*/
#presidents_message dl{position:relative;z-index:1}
#presidents_message dt{
	padding-top:50px;
	font-size:18px;color:#fff
}
#presidents_message dt b{
	display:block;
	font-family: 'Noto Sans KR';font-weight:400;font-size:36px;color:#fff;
}
#presidents_message dt b:before{
	content:'';
	display:block;width:35px;height:1px;
	margin:5px auto;
	background:#fff;
}
#presidents_message dd{padding-top:15px;font-size:0}
#presidents_message dd a{
	box-sizing:border-box;
	display:inline-block;width:160px;height:42px;line-height:42px;
	border:1px solid #fff;
	text-align:center;font-size:18px;color:#fff
}
#presidents_message dd a:before{
	content:'';
	display:inline-block;width:23px;height:100%;
	background:url(../img/common/ico_write.png) no-repeat 0 center;
	vertical-align:top
}
#presidents_message dd a+a{margin-left:15px}
#presidents_message dd a+a:before{background-image:url(../img/common/ico_search.png)}

.presidents_messageWrite h2,
.presidents_messageWrite p {display:block;}
.presidents_messageWrite .board_area tr.w_txt td {vertical-align:top;}
.presidents_messageWrite .board_area tr.w_txt td p {min-height:200px;}

.message_info{
	position:relative;
	width:100%;max-width:790px;overflow:hidden;box-sizing:border-box;
	margin:0 auto 35px;
	border-bottom:1px solid #dddfe5
}
.message_info dl{
	box-sizing:border-box;max-width:280px;
	padding:16px 0 0 28px;margin-top:33px;
	background:Url(../img/common/bg_message.png) no-repeat;
}
.message_info dl dt{
	font-family: 'Noto Sans KR';font-weight:400;font-size:20px
}
.message_info dl dt b{
	display:block;
	margin:10px 0;
	font-size:46px;color:#1e386f;font-weight:400;letter-spacing:-4px;line-height:1.1em
}
.message_info dl dt span{font-size:15px}
.message_info dl dd:before{
	content:'';
	display:block;width:38px;height:1px;
	margin:80px 0 25px;
	background:#1e386f;
}
.message_info dl dd{
	font-family: 'Noto Sans KR';font-size:15px;
}
.message_info dl dd em{font-style:normal;color:#1e386f}
.message_info dl dd b{
	display:block;
	font-size:18px;font-weight:500
}
.message_info>img{float:right}
.presidents_message2 .message_info dl{float:left}
.presidents_message2 .img{padding-top:20px;margin:0;text-align:center;font-size:0}
.presidents_message2 .ct1{
	width:430px;box-sizing:border-box;
	margin:0 auto 50px;padding:30px 50px;
	background:#f1f2f7
}
.presidents_message2 .ct2,
.presidents_message4 .ct2,
.presidents_message5 .ct2,
.status_test_effect .ct2{position:relative;padding-left:160px;min-height:120px;}
.status_test_effect .ct2+.ct2{margin-top:50px;padding-top:40px}
.presidents_message2 .ct2 h4,
.presidents_message4 .ct2 h4,
.presidents_message5 .ct2 h4,
.status_test_effect .ct2 h4{
	position:absolute;top:10px;left:0;
	width:120px;height:120px;
	box-sizing:border-box;
	background:#a0abc2;
	text-align:center;font-family: 'Noto Sans KR';font-size:17px;color:#fff;font-weight:500
}
.presidents_message2 .ct2 h4 em,
.status_test_effect .ct2 h4 em{display:block;padding:20px 0 3px;font-size:13px;font-style:normal;opacity:0.6}
.presidents_message2 .ct2 h4 span,
.presidents_message4 .ct2 h4 span,
.status_test_effect .ct2 span{display:block;font-family: 'Noto Sans KR';font-weight:500}
.autograph{padding-top:40px;text-align:right}
.autograph dd{padding-top:30px;font-family: 'Noto Sans KR';font-size:15px;}
.autograph dd img{margin-left:15px;vertical-align:middle}
.presidents_message4 .ct2 h4{padding-top:40px;}
.presidents_message4 .ct2 h4 span{margin-top:-10px}
.presidents_message3 .message_info,
.presidents_message5 .message_info{
	/*min-height:410px;*/
	padding:40px 0 40px 40px;
	/*background:url(../img/about/presidents_message3_a.png) no-repeat right 0;*/
	/*background:url(../img/about/presidents_messageNew.png) no-repeat right 0;*/
}
.presidents_message3 .message_info .photo,
.presidents_message5 .message_info .photo {float:right;}
.presidents_message3 .message_info dl,
.presidents_message5 .message_info dl{float:left;margin:0}
.presidents_message3 .message_info dl dd:before,
.presidents_message5 .message_info dl dd:before{margin:30px 0 25px}
.presidents_message3 .ct1{column-count: 2;column-gap: 40px;}
.presidents_message3 .ct1 p{margin-top:0}

/*.presidents_message5 .message_info{background-image:url(../img/about/presidents_message5_a.png)}*/
/*.presidents_message5 .message_info{background-image:url(../img/about/presidents_messageNew.png)}*/
.presidents_message5 .ct2 h4{padding-top:40px}

.presidents_message3 p,
.presidents_message5 p{word-wrap:break-word;word-break:break-all;line-height:1.7em !important;}

.presidents_interview h3{
	padding-bottom:50px;
	text-align:center;font-family: 'Noto Sans KR';font-size:16px;color:#666
}
.presidents_interview h3 span{display:block;}
.presidents_interview h3 b{
	display:inline-block;
	padding:16px 0 0 28px;
	background:Url(../img/common/bg_message.png) no-repeat;
	font-size:50px;color:#1e386f;font-weight:400
}
.presidents_interview div{position:relative;height:277px;border:1px solid #dddfe5;}
.presidents_interview div+div{border-top:0;margin-top:-1px}
.presidents_interview div p{position:absolute;top:0;left:0;height:100%;width:50%;margin:0;background-size:cover;}
.presidents_interview div:nth-child(even){padding-left:50%}
.presidents_interview div:nth-child(odd){padding-right:50%}
.presidents_interview div:nth-child(odd) p{left:auto;right:0}
.presidents_interview div dl{padding:50px 40px 0;text-align:center;}
.presidents_interview div dl dt{
	font-family: 'Noto Sans KR';font-size:16px;
	overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
}
.presidents_interview div dl dd{
	max-height:70px;
	margin-top:15px;
	font-family: 'Noto Sans KR';font-size:24px;line-height:1.4em;
	overflow: hidden;
	white-space:normal;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	word-wrap:break-word;
}
.presidents_profile .message_info dl{float:left}
.presidents_profile .history li{
	position:relative;
	padding:15px 0 15px 150px;
	border-bottom:1px solid #dddfe5;
	font-size:15px;color:#333;letter-spacing:-0.5px
}
.presidents_profile .history li b{
	position:absolute;left:0;
	display:inline-block;
	padding-left:22px;
	background:url(../img/about/history_bul.png) no-repeat 0 center;
	font-size:15px
}
.presidents_profile .history .ct2 li{padding-left:210px}

.cau2030 {}
.cau2030 p {margin:0;}
.cau2030>.tit {margin-bottom:45px;}
.cau2030>.tit>h3 {display:block;margin-bottom:15px;color:#000;font-family:'Noto Sans KR';font-size:36px;font-weight:500;line-height:40px;text-align:center;}
.cau2030>.tit>p {color:#62666f;font-family:'Noto Sans KR';font-size:20px;font-weight:500;line-height:24px;text-align:center;}
.cau2030 dl dd .list_dot.gray li {padding-left:9px;text-align:left;letter-spacing:-1px;word-break:break-all;word-wrap:break-word;}
.cau2030 .diagram01 {margin:0 auto 50px;font-size:0;text-align:center;}
.cau2030 .diagram01 dl {display:inline-block;width:calc(33.3% - 20px);max-width:250px;vertical-align:top;}
.cau2030 .diagram01 dl+dl {margin-left:20px}
.cau2030 .diagram01 dl dt {width:210px;height:210px;margin:0 auto 30px;box-sizing:border-box;padding-top:45px;border-radius:105px;border:3px solid #dedfe4;background:#fff;}
.cau2030 .diagram01 dl dt>strong {display:block;padding:85px 10px 0;color:#010101;font-family:'Noto Sans KR';font-size:18px;font-weight:400;line-height:20px;text-align:center;}
.cau2030 .diagram01 dl dd {position:relative;width:100%;min-height:260px;margin:30px 0 0;box-sizing:border-box;padding:20px 15px 20px 20px;border:1px solid #dddfe5}
.cau2030 .diagram01 dl dd::before {content:'';position:absolute;left:50%;top:-30px;display:block;width:1px;height:30px;background:url(../img/about/line_v2px.png) repeat-y;}
.cau2030 .diagram01 .unit01 dt>strong {background:url(../img/about/cau2030_ico01.png) no-repeat 50% 12px;}
.cau2030 .diagram01 .unit02 dt>strong {background:url(../img/about/cau2030_ico02.png) no-repeat 50% 0;}
.cau2030 .diagram01 .unit03 dt>strong {background:url(../img/about/cau2030_ico03.png) no-repeat 50% 12px;}
.cau2030>h4 {display:block;position:relative;margin-bottom:45px;padding:0 20px;color:#62666f;font-size:24px;line-height:25px;text-align:center;}
.cau2030>h4::before {content:'';display:block;position:absolute;left:0;top:11px;width:100%;height:1px;background:#dddfe5;text-align:center;z-index:0;}
.cau2030>h4>span {display:inline-block;position:relative;min-width:90px;box-sizing:border-box;padding:0 20px;background:#fff;font-size:24px;line-height:25px;text-align:center;z-index:1;}
.cau2030>.grpTit {position:relative;margin-bottom:45px;}
.cau2030>.grpTit>strong {display:block;color:#1f3870;font-family:'Roboto';font-size:30px;font-weight:400;line-height:32px;text-align:center;}
.cau2030>.grpTit>p {display:block;margin-top:20px;color:#666;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:19px;text-align:center;}
.cau2030 .diagram02 {margin:0 auto 50px;font-size:0;text-align:center;}
.cau2030 .diagram02 dl {display:inline-block;width:calc(33.3% - 20px);max-width:250px;box-sizing:border-box;border:1px solid #dddfe5;vertical-align:top;}
.cau2030 .diagram02 dl+dl {margin-left:20px}
.cau2030 .diagram02 dl dt {width:100%;margin:0 auto;box-sizing:border-box;padding-top:120px;}
.cau2030 .diagram02 dl dt>strong {display:block;height:75px;padding:0 10px;color:#000;font-family:'Roboto';font-size:22px;font-weight:500;line-height:24px;text-align:center;}
.cau2030 .diagram02 dl dt>strong>span {display:block;margin-top:10px;padding:0 10px;color:#1e71c1;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:19px;text-align:center;}
.cau2030 .diagram02 dl dd {position:relative;width:100%;min-height:230px;box-sizing:border-box;padding:20px 15px 20px 20px;}
.cau2030 .diagram02 .unit01 dt {background:url(../img/about/cau2030_ico04.png) no-repeat 50% 34px;}
.cau2030 .diagram02 .unit02 dt {background:url(../img/about/cau2030_ico05.png) no-repeat 50% 37px;}
.cau2030 .diagram02 .unit03 dt {background:url(../img/about/cau2030_ico06.png) no-repeat 50% 37px;}
.cau2030 .diagram03.grpTit>strong {display:block;color:#1f3870;font-family:'Roboto';font-size:38px;font-weight:500;line-height:40px;text-align:center;}
.cau2030 .diagram03.grpTit>strong>img {margin:2px 1px 0;vertical-align:top;}
.cau2030 .diagram03.grpTit>strong>span {display:inline-block;font-size:24px;font-weight:400;line-height:34px;}
.cau2030 .diagram03 {max-width:790px;margin:0 auto 50px;font-size:0;text-align:center;}
.cau2030 .diagram03 dt {margin-bottom:66px;}
.cau2030 .diagram03 dt>p {display:inline-block;position:relative;width:210px;height:210px;margin:0 auto;box-sizing:border-box;padding-top:42px;border-radius:105px;}
.cau2030 .diagram03 dt>p+p {margin-left:20px}
.cau2030 .diagram03 dt>p>strong {display:block;padding:77px 10px 0;color:#fff;font-family:'Noto Sans KR';font-size:22px;font-weight:400;line-height:24px;text-align:center;}
.cau2030 .diagram03 dt>p>strong>span {color:#fff;font-family:'Noto Sans KR';font-size:22px;font-weight:400;line-height:24px;}
.cau2030 .diagram03 dt>p>span {display:block;margin-top:10px;color:#fff;font-family:'Noto Sans KR';font-size:18px;font-weight:400;line-height:20px;}
.cau2030 .diagram03 dd ul {position:relative;font-size:0;text-align:center;}
.cau2030 .diagram03 dd ul::before {content:'';position:absolute;left:0;top:50%;display:block;width:90%;height:1px;margin:0 5%;background:url(../img/about/line_h2px.png) repeat-x;z-index:0;}
.cau2030 .diagram03 dd li {display:inline-block;position:relative;width:calc(20% - 15px);box-sizing:border-box;padding:10px 5px;border:1px solid #dddfe5;background:#fff;color:#62666f;font-family:'Noto Sans KR';font-size:16px;font-weight:500;line-height:24px;z-index:1;}
.cau2030 .diagram03 dd li+li {margin-left:15px;}
.cau2030 .diagram03 .unit01 {background:#1e71c1;}
.cau2030 .diagram03 .unit01::before {content:'';position:absolute;left:50%;bottom:-33px;display:block;width:1px;height:33px;background:url(../img/about/line_v2px.png) repeat-y;}
.cau2030 .diagram03 .unit01::after {content:'';position:absolute;left:105px;bottom:-33px;display:block;width:300px;height:1px;background: #fff url(../img/about/line_h2px.png) repeat-x;}
.cau2030 .diagram03 .unit01>strong {color:#a2d1ff;background:url(../img/about/cau2030_ico07.png) no-repeat 50% 0;}
.cau2030 .diagram03 .unit02 {background:#1f3870;}
.cau2030 .diagram03 .unit02::before {content:'';position:absolute;left:50%;bottom:-66px;display:block;width:1px;height:66px;background:url(../img/about/line_v2px.png) repeat-y;}
.cau2030 .diagram03 .unit02>strong {color:#a2d1ff;background:url(../img/about/cau2030_ico08.png) no-repeat 50% 0;}
.cau2030 .diagram03 .unit03 {background:#71b2f2;}
.cau2030 .diagram03 .unit03::before {content:'';position:absolute;left:50%;bottom:-33px;display:block;width:1px;height:33px;background:url(../img/about/line_v2px.png) repeat-y;z-index:0;}
.cau2030 .diagram03 .unit03::after {content:'';position:absolute;right:105px;bottom:-33px;display:block;width:300px;height:1px;background: #fff url(../img/about/line_h2px.png) repeat-x;}
.cau2030 .diagram03 .unit03>strong {color:#fff;background:url(../img/about/cau2030_ico09.png) no-repeat 50% 0;}
.cau2030 .diagram03 .unit03>strong>span {color:#1e376f;}
.cau2030 .diagram04 {margin-bottom:50px;font-size:0;text-align:center;}
.cau2030 .diagram04 dl {display:inline-block;width:calc(33.3% - 20px);max-width:250px;box-sizing:border-box;vertical-align:top;}
.cau2030 .diagram04 dl+dl {margin-left:20px}
.cau2030 .diagram04 dl>dt {position:relative;height:115px;padding:20px 0 0 70px;box-sizing:border-box;color:#000;font-family:'Roboto';font-size:24px;font-weight:500;line-height:26px;text-align:left;}
.cau2030 .diagram04 dl>dt>img {position:absolute;left:0;top:0;}
.cau2030 .diagram04 dl>dt>span {display:block;margin-bottom:5px;color:#1f3870;font-family:'Noto Sans KR';font-size:16px;font-weight:400;line-height:20px;letter-spacing:-1px;}
.cau2030 .diagram04 dl dd {position:relative;width:100%;min-height:260px;box-sizing:border-box;}
.cau2030 .diagram04 dl dd .list_process li {display:table;position:relative;min-height:100px;}
.cau2030 .diagram04 dl dd .list_process li::before {content:'';display:block;position:absolute;left:50%;top:-29px;width:9px;height:28px;background: #fff url(../img/about/line_dotArrB_gray.png) no-repeat 50%;}
.cau2030 .diagram04 dl dd .list_process li:first-child::before {display:none;}
.cau2030 .diagram04 dl dd .list_process li+li {margin-top:30px;}
.cau2030 .diagram04 dl dd .list_process li>p {display:table-cell;padding:0 20px;box-sizing:border-box;background:#f1f2f7;color:#000;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:21px;text-align:center;vertical-align:middle;}
.cau2030 .diagram04 .wayEnd {display:block;position:relative;margin-top:105px;box-sizing:border-box;padding:25px;background:#1f3870;color:#fff;font-family:'Noto Sans KR';font-size:18px;font-weight:500;line-height:24px;}
.cau2030 .diagram04 .wayEnd::before {content:'';position:absolute;left:50%;top:-69px;display:block;width:72px;height:35px;margin:0 0 0 -36px;background:url(../img/about/ico_bigArrB_gray.png) no-repeat center;}

.history_introduction .ct_pd_left{padding-left:370px}
.history_introduction .spirit_img02 {float:left;margin:0 35px 15px 0;}
.history_introduction .ct1{position:relative;}
.history_introduction .ct1 b{
	position:absolute;left:0;bottom:0;
	display:block;box-sizing:border-box;width:100%;
	padding:8px;
	background:rgba(30,56,111,0.9);
	text-align:center;font-family: 'Noto Sans KR';font-size:15px;line-height:1.4em;color:#fff
}
.history_identity .ct1{padding-bottom:40px;margin-bottom:50px;border-bottom:1px solid #dddfe5}
.history_identity .ct3{position:relative;text-align:center}
.history_identity .ct3:before{
	content:'';
	position:absolute;top:0;left:50%;
	display:block;width:1px;height:100%;
	border-left:1px dashed #a4acc3;
}
.history_identity .ct3 *{position:relative;}
.history_identity .ct3 .img2{margin-bottom:0;position:relative;}
.history_identity .ct3 dl{
	display:inline-block;width:250px;
	padding:20px 30px;
	vertical-align:top;text-align:right
}
.history_identity .ct3 dl+dl{text-align:left}
.history_identity .ct3 dl dt{position:absolute;visibility:hidden;}
.history_identity .ct3 dl dd b{
	display:block;
	margin-bottom:8px;
	font-family: 'Noto Sans KR';font-size:15px;font-weight:500;line-height:1.3em;
}
.history_identity .ct3 dl dd.dot{
	padding-left:11px;
	background:url(../img/common/bul_red.png) no-repeat 0 9px;
	font-size:14px;color:#000;letter-spacing:-1px;line-height:1.7em;
}
.history_identity .ct3 h5{
	padding:10px;
	background:#fff;
	font-family: 'Noto Sans KR';font-size:18px;font-weight:500;color:#db2931
}
.history_identity .ct3 div{
	padding:20px;margin-top:30px;
	border:1px solid #dddfe5;
	background:#fff;
}
.history_identity .ct3 div h6{
	padding-bottom:10px;
	font-family: 'Noto Sans KR';font-size:18px;font-weight:500;color:#333
}
.history_identity .ct3 div.ct3_b p{padding-left:50px;text-align:left}
.history_identity .ct3 div p{margin:0;font-size:15px;}


.yearbook ul{width:102%;margin-left:-2%;font-size:0}
.yearbook ul li{
	display:inline-block;max-width:23%;
	margin:0 0 2% 2%;
	vertical-align:top
}
.yearbook ul li a{display:block;position:relative;font-size:0;background-size:cover}
.yearbook ul li a b{
	position:absolute;bottom:0;left:0;
	display:block;width:100%;height:40px;line-height:40px;
	background:rgba(30,56,111,0.9);
	text-align:center;font-size:16px;color:#fff
}

.introduction_symbols .ct1 {padding-right:300px;margin-bottom:50px}
.introduction_symbols .ct1 .color{
	position:absolute;top:0;right:0;
	width:200px;height:200px;box-sizing:border-box;
	padding-top:70px;
	background:#2453a5;border-radius:50%;
	text-align:center;font-size:13px;color:#fff
}
.introduction_symbols .ct1 .color b{
	display:block;
	font-size:18px;color:#fff
}
.introduction_symbols .ct2 .img{
	padding:45px 20px;
	border:1px solid #dddfe5;
}
.introduction_symbols .ct2 dt{
	font-family: 'Noto Sans KR';font-weight:500;color:#000;font-size:15px;
}
.introduction_symbols .ct2 dd{
	padding:10px 0 25px;
	font-size:15px;color:#333;line-height:1.9em;letter-spacing:-0.5px
}
.introduction_ui.ui1 .ct2{
	margin-top:50px;
	border-top:1px solid #dddfe5;
	font-size:0
}
.introduction_ui.ui1 .ct1 .img.line {display:inline-block;width:48%;}
.introduction_ui.ui1 .ct1 .img.line+.img.line {margin-left:2%;}
.introduction_ui.ui1 .ct3,
.introduction_ui.ui1 .ct4{font-size:0}
.introduction_ui.ui1 .ct4 dl,
.introduction_ui.ui1 .ct2>div,
.introduction_ui.ui1 .ct3>div,
.introduction_ui.ui2 div,
.introduction_ui.ui3 .ct1,
.introduction_ui.ui3 .ct2 p{
	display:inline-block;width:48%;
	box-sizing:border-box;
	vertical-align:top;font-size:0
}
.introduction_ui.ui1 .ct4 dl:nth-child(odd),
.introduction_ui.ui1 .ct2>div:nth-child(odd),
.introduction_ui.ui1 .ct3>div:nth-child(odd),
.introduction_ui.ui2 div+div,
.introduction_ui.ui3 .ct1+div,
.introduction_ui.ui3 .ct2 p+p{
	margin-left:4%;
}
.introduction_ui.ui1 .ct4 dl dt{
	margin-bottom:10px;
	font-size:18px;font-weight:600;color:#1e386f;
}
.introduction_ui.ui1 .ct4 dl dd{
	margin-bottom:40px;
	font-size:15px;line-height:1.9em
}
.introduction_ui.ui1 .ct4 dl{
	position:relative;
	padding-left:106px;margin-bottom:30px;
	border:1px solid #dddfe5;
}
.introduction_ui.ui1 .ct4 dl dt{
	position:absolute;top:0;left:0;
	box-sizing:border-box;
	width:90px;height:100%;
	background:#1e71c0;
	color:#fff;
}
.introduction_ui.ui1 .ct4 dl dt span{
	display:table-cell;width:90px;height:85px;
	padding:0 15px;
	vertical-align:middle;text-align:center;font-size:15px;font-weight:Normal;line-height:1.2em;
}
.introduction_ui.ui1 .ct4 dl dd{
	min-height:50px;
	margin:0;padding:15px 0;
	font-size:13px;line-height:1.36em
}
.introduction_ui.ui1 .ct4 dl dd span{
	display:table-cell;height:53px;
	vertical-align:middle
}
.introduction_ui.ui1 .ct4 dl:nth-child(3) dt{background:#ed1c24;}
.introduction_ui.ui1 .ct4 dl:nth-child(4) dt{background:#8a8c8f;}
.introduction_ui.ui1 .ct4 dl:nth-child(5) dt{background:#e5e6e6;color:#000;}
.introduction_ui.ui1 .ct4 dl:nth-child(6) dt{background:#9fadb5;}
.introduction_ui.ui1 .ct4 dl:nth-child(7) dt{background:#aa8a4c;}
.introduction_ui.ui2,
.introduction_ui.ui3,
.introduction_ui.ui3 .ct2{font-size:0}
.introduction_ui.ui2 div .tit_blue{margin-top:0}
.introduction_ui.ui3 .ct1{max-width:371px}
.introduction_ui.ui3 .btn_c{font-size:0}
.introduction_ui.ui3 .btn_c a{width:49%}
.introduction_ui.ui3 .btn_c a+a{margin-left:2%}
.introduction_ui.ui4 .ct1{width:102%;overflow:hidden;margin-left:-2%;font-size:0}
.introduction_ui.ui4 .ct1 li{float:left;width:23%;margin:0 0 2% 2%}
.introduction_ui.ui5 .ct1{position:relative;padding-left:420px;font-size:0}
.introduction_ui.ui5 .ct1 .tit_blue{margin-top:0}
.introduction_ui.ui5 .ct1 .img{position:absolute;top:0;left:0;margin-top:0}
.introduction_ui.ui5 .ct1 .color{	position:relative;margin-top:0}
.introduction_ui.ui5 .ct1 .color:before{
	content:'';
	display:block;height:60px;
	margin-bottom:5px;
	background:url(/cau/img/about/ui5_c.png) repeat-y
}
.introduction_ui.ui5 .ct1 .color span{
	display:inline-block;
	font-size:13px;
}
.introduction_ui.ui5 .ct1 .color span+span{position:absolute;right:0}
.introduction_ui.ui5 .ct1 .color.color_sub{
	display:inline-block;
	width:32%;
	vertical-align:top
}
.introduction_ui.ui5 .ct1 .color.color_type{
	display:inline-block;
	width:49%;
	vertical-align:top
}
.introduction_ui.ui5 .ct1 .color.color_sub+.color_sub,
.introduction_ui.ui5 .ct1 .color.color_type+.color_type{margin-left:2%}
.introduction_ui.ui5 .ct1 .color.color_sub:before,
.introduction_ui.ui5 .ct1 .color.color_type:before{height:40px}
.introduction_ui.ui5 .ct1 .color.color_sub:before{background:#0055a8}
.introduction_ui.ui5 .ct1 .color.color_sub.b:before{background:#ffb200}
.introduction_ui.ui5 .ct1 .color.color_sub.c:before{background:#00b0d1}
.introduction_ui.ui5 .ct1 .color.color_type:before{background:#000000}
.introduction_ui.ui5 .ct1 .color.color_type.b:before{background:#747474}

.introduction_ui.ui5 .ct1.gray .color:before{background-image:url(/cau/img/about/ui5_e.png)}
.introduction_ui.ui5 .ct1.gray .color.color_sub:before,
.introduction_ui.ui5 .ct1.gray .color.color_type:before{height:40px}
.introduction_ui.ui5 .ct1.gray .color.color_type::before{background:#000000;}
.introduction_ui.ui5 .ct1.gray .color.color_type.b::before{background:#747474;}
.introduction_ui.ui5 .ct1.gray .color.color_sub:before{background:#707070}
.introduction_ui.ui5 .ct1.gray .color.color_sub.b:before{background:#b3b3b3}
.introduction_ui.ui5 .ct1.gray .color.color_sub.c:before{background:#bfbfbf}
.introduction_ui.ui5 .ct2,
.introduction_ui.ui5 .ct3,
.introduction_ui.ui5 .ct4,
.introduction_ui.ui6 .ct2,
.introduction_ui.ui6 .ct4{font-size:0}
.introduction_ui.ui5 .ct2 p,
.introduction_ui.ui5 .ct3 div,
.introduction_ui.ui5 .ct4 p,
.introduction_ui.ui6 .ct2 div,
.introduction_ui.ui6 .ct4 p{
	display:inline-block;
	width:47%;box-sizing:border-box;
}
.introduction_ui.ui5 .ct2 p:nth-child(odd),
.introduction_ui.ui5 .ct3 div:nth-child(odd),
.introduction_ui.ui5 .ct4 p:nth-child(even),
.introduction_ui.ui6 .ct2 div:nth-child(even),
.introduction_ui.ui6 .ct4 p:nth-child(even){margin-left:6%}
.introduction_ui.ui6 .ct4 p.last{margin-left:0;width:100%}

.introduction_ui.ui6 .ct1{position:relative;padding-left:420px;font-size:0}
.introduction_ui.ui6 .ct1 .tit_blue{margin-top:0}
.introduction_ui.ui6 .ct1 .img{position:absolute;top:0;left:0;margin-top:0}
.introduction_ui.ui6 .ct1 .color{
	display:inline-block;
	width:32%;
	margin-top:0;
	vertical-align:top;
}
.introduction_ui.ui6 .ct1 .color:before{
	content:'';
	display:block;height:40px;
	margin-bottom:5px;
	background:#244ea2;
}
.introduction_ui.ui6 .ct1 .color span{
	display:inline-block;
	font-size:13px;
}
.introduction_ui.ui6 .ct1 .color + .color{margin-left:2%}
.introduction_ui.ui6 .ct1 .color.b:before{background:#80c342}
.introduction_ui.ui6 .ct1 .color.c:before{background:#ee2c6c}
.introduction_ui.ui6 .ct1 .color_sub:before{background:#2e6ab3}
.introduction_ui.ui6 .ct1 .color_sub.b:before{background:#00a8e5}
.introduction_ui.ui6 .ct1 .color_sub.c:before{background:#bed62f}
.introduction_ui.ui6 .ct1 .color_sub.d{margin-left:0}
.introduction_ui.ui6 .ct1 .color_sub.d:before{background:#f68b33}
.introduction_ui.ui6 .ct1 .color_sub.e:before{background:#ffde3f}
.introduction_ui.ui6 .ct1 .color_sub.f:before{background:#7e489c}

.introduction_ui.ui6 .ct1.gray .color:before{background:#58595b}
.introduction_ui.ui6 .ct1.gray .color.b:before{background:#bcbec0}
.introduction_ui.ui6 .ct1.gray .color.c:before{background:#808285}
.introduction_ui.ui6 .ct1.gray .color_sub:before{background:#818285}
.introduction_ui.ui6 .ct1.gray .color_sub.b:before{background:#939598}
.introduction_ui.ui6 .ct1.gray .color_sub.c:before{background:#d1d2d4}
.introduction_ui.ui6 .ct1.gray .color_sub.d:before{background:#a7a9ac}
.introduction_ui.ui6 .ct1.gray .color_sub.e:before{background:#bcbdc0}
.introduction_ui.ui6 .ct1.gray .color_sub.f:before{background:#6d6e71}

.status_test_effect .ct1{
	padding-bottom:40px;margin-bottom:50px;
	border-bottom:1px solid #dadce3;
}
.status_test_effect .ct1 .img2{font-size:0}

.campus_roadmap .info{position:relative;font-size:0}
.campus_roadmap .info p{
	position:absolute;bottom:0;left:0;
	box-sizing:border-box;width:100%;
	padding:15px;margin:0;
	background:rgba(98,102,111,0.9);
	text-align:center;font-size:0
}
.campus_roadmap .info p span{
	display:inline-block;
	font-family: 'Noto Sans KR';font-size:15px;font-weight:400;color:#fff
}
.campus_roadmap .info p span+span:before{
	content:'';
	display:inline-block;width:1px;height:14px;
	margin:5px 18px 0;
	background:#989aa1;
	vertical-align:top
}
.campus_roadmap .info div{font-size:0}
.campus_roadmap .ct li{
	position:relative;
	padding-left:110px;
	font-size:15px;line-height:1.9em;word-break:keep-all
}
.campus_roadmap .ct_a li{padding-left:95px}
.campus_roadmap .ct li+li{margin-top:16px;}
.campus_roadmap .ct li b{
	position:absolute;left:0;top:-1px;
	font-family: 'Noto Sans KR';font-size:15px;font-weight:400;letter-spacing:-0.5px;
}
.campus_roadmap .ct li b img{margin-right:14px;vertical-align:middle}
.campus_roadmap td small{display:block;font-size:12px;letter-spacing:-1.5px}

.campus_roadmap .list_dot li b{display:block;margin-bottom:5px}
.campus_roadmap .ct2 li{display:inline-block;margin:0 20px 10px 0}
.campus_roadmap .ct2 li img{margin-right:14px;vertical-align:middle}
.campus_roadmap .ct3 span{display:none}

.history_list{
	position:relative;
	padding:0 0 30px 42px
}
.history_list:before{
	content:'';
	display:block;width:1px;height:100%;
	position:absolute;left:3px;
	background:#dddfe5
}
.history_list:after{
	content:'';
	position:absolute;left:0;top:8px;
	display:block;width:7px;height:8px;
	background:url(../img/about/history_bul.png);
	z-index:1
}
.history_list.first:before{top:10px}
.history_list.last:before{
	top:0;height:10px;
}
.history_list h3{
	position:relative;
	padding-right:70px;
	font-family: 'Noto Sans KR';font-size:16px;font-weight:400;cursor:pointer
}
.history_list h3:before,
.history_list h3:after{
	content:'';
	position:absolute;right:0;top:50%;
	display:block;width:16px;height:2px;
	background:#c0c3ce;
	transition:.3s
}
.history_list h3:after{transform:rotate(90deg)}
.history_list>div{
	width:100%;overflow:Hidden;
	padding-top:20px;
	display:none;
}
.history_list>div img{
	float:left;
	display:inline-block;
	margin:0 40px 30px 0
}
.history_list>div p{
	margin-bottom:30px;
	font-size:15px;color:#333
}
.history_list.on h3{
	font-size:34px;font-weight:400
}
.history_list.on:after{
	left:3px;
	width:4px;height:70px;
	background:#db2931
}
.history_list.on h3{line-height:1.2em}
.history_list.on h3:after{width:30px;height:3px;background:#333;transform:rotate(0deg)}
.history_list.first div{display:block}

.organizationChart{position:relative;}
.organizationChart h2{
	position:relative;
	box-sizing:border-box;
	width:220px;height:220px;
	padding:115px 25px 0;margin:0 auto 24px;
	background:#1e71c0 url(../img/about/organizationChart.png) no-repeat center 40px;
	border-radius:50%;
	text-align:center;font-family: 'Noto Sans KR';font-size:24px;color:#fff;line-height:1.2em
}
.organizationChart h2 a{
	display:block;margin-top:15px;
	font-size:14px;
}
.organizationChart h2 a:after{
	content:'';
	display:inline-block;width:8px;height:13px;
	margin:7px 0 0 10px;
	background:url(../img/common/arrow_go3.png) no-repeat center;
	vertical-align:top
}
.organizationChart h2:after{
	content:'';
	position:absolute;bottom:-24px;left:50%;
	display:block;width:1px;height:24px;
	background:#dddfe5
}
.organizationChart div{
	position:relative;
}
.organizationChart div.chart1{
	width:100%;max-width:680px;overflow:hidden;
	margin:0 auto;padding-bottom:80px
}
.organizationChart div.chart1 ul{
	position:relative;
	float:left;
	width:240px;
}
.organizationChart div.chart1 ul+ul{float:right}
.organizationChart div.chart1 ul:before{
	content:'';
	display:block;width:1px;height:24px;
	margin:0 auto;
	background:#dddfe5
}
.organizationChart div.chart1 ul:after{
	content:'';
	display:block;width:100%;height:1px;
	position:absolute;top:0;left:50%;
	background:#dddfe5
}
.organizationChart div.chart1 ul+ul:after{left:auto;right:50%}
.organizationChart div.chart1 li{
	padding:10px 10px;margin-bottom:20px;
	background:#757f99;
	text-align:center;font-family: 'Noto Sans KR';font-size:18px;color:#fff
}
.organizationChart div.chart1 li small{
	display:block;
	font-size:15px;font-weight:normal
}
.organizationChart div.chart2{
	position:relative;
	padding:1px 0 0 50%;
	text-align:right
}
.organizationChart div.chart2:after{
	content:'';
	position:absolute;top:40px;left:120px;
	display:block;width:1px;height:100%;
	background:#dddfe5;
}
.organizationChart div.chart2 div{overflow:hidden;margin-top:40px}
.organizationChart div.chart2 div:after{
	content:'';
	position:absolute;top:26px;left:0;
	display:block;width:1px;height:100%;
	border-left:1px dashed #dddfe5;
}
.organizationChart div.chart2 div.ct{overflow:visible;}
.organizationChart div.chart2 div.ct:after{height:120%}
.organizationChart div.chart2 h3{
	position:absolute;left:0;
	box-sizing:border-box;width:240px;
	padding:12px 10px;margin-top:40px;
	background:#1e386f;
	text-align:center;font-family: 'Noto Sans KR';font-size:18px;color:#fff;
	z-index:1
}
.organizationChart div.chart2 h4{
	position:relative;
	box-sizing:border-box;width:200px;
	padding:12px 10px;margin:0 0 20px 120px;
	background:#fff;border:1px solid #1e386f;
	text-align:center;font-family: 'Noto Sans KR';font-size:18px;color:#1e386f;
	z-index:1
}
.organizationChart div.chart2 h4:after{
	content:'';
	position:absolute;top:101%;left:50%;
	display:block;width:1px;height:24px;
	border-left:1px dashed #dddfe5;
}
.organizationChart div.chart2 h4:before{
	content:'';
	position:absolute;top:50%;right:100%;
	display:block;width:120px;height:1px;
	border-top:1px dashed #dddfe5;
}
.organizationChart div.chart2 h4+div{margin-top:0}
.organizationChart div.chart2 h3+h4{
	position:absolute;left:0;
	width:240px;
	margin:91px 0 0;
}
.organizationChart div.chart2 h3+h4+div{margin-top:40px}
.organizationChart div.chart2 h3:before{
	content:'';
	position:absolute;top:50%;left:100%;
	display:block;width:100%;height:1px;
	border-top:1px dashed #dddfe5;
}

.organizationChart div.chart2 div>ul{
	position:relative;
	box-sizing:border-box;
	display:inline-block;width:345px;
	margin-bottom:20px;
	border:1px solid #dddfe5;
	background:#f0f2f7;
	text-align:left;z-index:1
}
.organizationChart div.chart2 div>ul:before{
	content:'';
	position:absolute;top:22px;right:100%;
	display:block;width:50px;height:1px;
	border-top:1px dashed #dddfe5;
}
.organizationChart div.chart2 div>ul:first-child:before{display:none}
.organizationChart div.chart2 div>ul>li+li{border-top:1px solid #dddfe5;}
.organizationChart div.chart2 div>ul>li>a,
.organizationChart div.chart2 div>ul>li>span{
	display:block;
	padding:0 26px;margin:12px 0;
	background:url(../img/common/bul_red.png) no-repeat 15px 45%;
	font-family: 'Noto Sans KR';font-size:15px;font-weight:400
}
.organizationChart div.chart2 div>ul ul{padding:6px 0 12px;background:#fff;border-top:1px solid #dddfe5;}
.organizationChart div.chart2 div>ul ul.no_line{border-top:0}
.organizationChart div.chart2 div>ul ul a,
.organizationChart div.chart2 div>ul ul span{
	position:relative;
	display:block;
	padding:0 40px 0 15px;margin-top:10px;
	font-size:15px;color:#666;letter-spacing:-1px
}
.organizationChart div.chart2 div>ul ul a:after{
	content:'';
	position:absolute;top:50%;right:15px;
	display:block;width:19px;height:19px;
	margin-top:-10px;
	background:url(../img/common/btn_go4.png) no-repeat;
}
.organizationChart div.chart2 div>ul .blue a,
.organizationChart div.chart2 div>ul .blue span{color:#1e71c0;font-weight:600}
.organizationChart div.chart2 div>ul .blue a:after{background-image:url(../img/common/btn_go5.png)}
.organizationChart div.chart2 div>ul.last:after{
	content:'';
	position:absolute;top:23px;left:-51px;
	display:block;width:50px;height:200%;
	background:#fff;
	z-index:1
}
.organizationChart div.chart2 h3.last:after{
	content:'';
	position:absolute;top:100%;left:120px;
	display:block;width:1px;height:1000%;
	background:#fff;
	z-index:1
}
.organizationChart div.chart2 h3.last+div>ul::before {
	content:'';
	position:absolute;top:118px;right:100%;
	display:block;width:50px;height:1px;
	border-top:1px dashed #dddfe5;
}
.organizationChart div.chart2 h3.last+div>.last {margin-bottom:0;}
.organizationChart div.chart2 h3.last+div>.last::before {display:none;}
.organizationChart div.chart2 h3.last+div>.last::after {top:-46px;}
.organizationChart{max-width:790px;margiN:0 auto}

.history_profile ul{width:102%;margin-left:-2%;font-size:0;}
.history_profile ul li{
	position:relative;
	display:inline-block;width:48%;min-height:208px;box-sizing:border-box;
	margin:0 0 40px 2%;padding:0 15px 0 195px;
	vertical-align:top;
}
.history_profile ul li img{position:absolute;left:0;top:0;}
.history_profile ul li dt{
	display:block;
	padding:10px 0 5px 18px;
	background:url(../img/about/presidents.png) no-repeat;
	font-family: 'Noto Sans KR';font-size:17px;font-weight:500;color:#000
}
.history_profile ul li dd{
	margin:8px 0 0 18px;
	font-size:15px;color:#333;letter-spacing:-1px;word-break:keep-all
}
.history_profile ul li dd b{ font-family: 'Noto Sans KR';color:#1e386f;font-weight:500}

.administration_tab1_5 .ct{
	padding:50px 30px;
	border:1px solid #dddfe5;
	text-align:center;color:#666;font-size:20px;
}
.administration_tab1_5 .ct b{font-size:40px;color:#db2931;font-weight:normal}

.welcome_status3 div{position:relative;}
.welcome_status3 div dl{padding-bottom:40px;}
.welcome_status3 div dl:before{
	content:'';
	position:absolute;left:50%;
	display:block;width:1px;height:100%;
	background:#dcdfe4
}
.welcome_status3 div dl.last:before{background:#fff}
.welcome_status3 div dt{
	position:relative;
	margin-bottom:20px;
	font-size:28px;font-family: 'Noto Sans KR';font-weight:400;letter-spacing:-1px;line-height:0.5em;
}
.welcome_status3 div dt:after{
	content:'';
	position:absolute;top:0;
	display:block;width:11px;height:11px;
	background:url(../img/common/bul_quadrangle.png)
}
.welcome_status3 div dd{
	position:relative;
	margin-top:10px;
	font-size:15px;line-height:1.9em;letter-spacing:-1px;
}
.welcome_status3 div dd b{
	position:absolute;
	font-size:15px;color:#666;font-weight:600;letter-spacing:-0.5px;
}
.welcome_status3 div dd:before{
	content:'';
	position:absolute;top:12px;
	display:block;width:3px;height:3px;
	background:#c0c2ce;
}
.welcome_status3 div img{position:absolute;top:40px}
.welcome_status3 div:nth-child(odd){padding-left:50%}
.welcome_status3 div:nth-child(odd) img{left:0}
.welcome_status3 div:nth-child(odd) dt{padding-left:35px;}
.welcome_status3 div:nth-child(odd) dt:after{left:-5px;}
.welcome_status3 div:nth-child(odd) dd{padding-left:120px;}
.welcome_status3 div:nth-child(odd) dd b{left:35px}
.welcome_status3 div:nth-child(odd) dd:before{left:105px}
.welcome_status3 div:nth-child(even){padding-right:50%;text-align:right}
.welcome_status3 div:nth-child(even) img{right:0}
.welcome_status3 div:nth-child(even) dt{padding-right:35px;}
.welcome_status3 div:nth-child(even) dt:after{right:-6px;}
.welcome_status3 div:nth-child(even) dd{padding-right:120px;}
.welcome_status3 div:nth-child(even) dd b{right:35px}
.welcome_status3 div:nth-child(even) dd:before{right:105px}

.status_rule_wrap .list_option .searchBox{float:none;text-align:left;}
.status_rule_wrap .list_option .searchBox .inp_s{width:29%;margin:0 1% 0 0}
.status_rule_wrap .list_option .searchBox .search{width:70%;margin:0}
.status_rule_wrap .menu{font-size:0}
.status_rule_wrap .menu li{
	display:inline-block;box-sizing:border-box;width:20%;
	border:1px solid #fff;
}
.status_rule_wrap .menu li a{
	display:block;height:50px;line-height:50px;
	padding:0 5px;
	background:#f0f2f7;
	text-align:center;font-size:15px;color:#333;letter-spacing:-1px;
	overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
}
.status_rule_wrap .menu li a:hover{background:#1e71c0;color:#fff}
.status_rule_wrap .status_rule div ul{border-top:1px solid #333}
.status_rule_wrap .status_rule div ul li{
	position:relative;
	/*padding:15px 0;*/padding:15px 90px 15px 50px;
	border-bottom:1px solid #dddfe5;
}
.status_rule_wrap .status_rule div ul li b{
	position:absolute;left:0;top:14px;
	font-size:17px;color:#1e71c0;font-weight:600
}
.status_rule_wrap .status_rule div ul li>a{
	font-family: 'Noto Sans KR';font-weight:400;font-size:17px;letter-spacing:-1px
}
.status_rule_wrap .status_rule div ul li>span{position:absolute;top:0;right:10px;display:block;height:100%}
.status_rule_wrap .status_rule div ul li>span a{
	display:block;width:17px;height:100%;
	background:url(../img/common/ico_down.png) no-repeat center;
	font-size:0
}
.status_rule_wrap .status_rule .btn_revision {display:block;position:absolute;right:0;top:12px;min-width:68px;height:27px;border:1px solid #1e71c0;color:#1e71c0;font-family:'Noto Sans KR';font-size:13px;font-weight:400;line-height:27px;text-align:center;}

.status_rule_wrap .status_revision .revision_list {overflow:hidden;border-top:1px solid #62666f;color:#000;}
.status_rule_wrap .status_revision .revision_list li {float:left;position:relative;width:50%;box-sizing:border-box;padding:20px 15px;border-bottom:1px solid #dddfe5;color:#000;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:16px;text-align:left;}
.status_rule_wrap .status_revision .revision_list li:nth-child(2n) {border-left:1px solid #dddfe5;}
.status_rule_wrap .status_revision .revision_list li .btn_preview {display:block;position:absolute;right:60px;top:20px;overflow:hidden;width:16px;height:16px;background:url(../img/common/ico_magnify_gray.png) no-repeat 50% 50%;text-indent:-999px;}
.status_rule_wrap .status_revision .revision_list li .hasArea {position:absolute;right:5px;top:16px;min-width:41px;padding:0;}
.status_rule_wrap .status_revision .revision_list li .hasArea .hasfile {display:inline-block;overflow:hidden;width:17px;height:17px;background:url(../img/common/ico_down.png) no-repeat 50% 50%;text-indent:-100px;}
.status_rule_wrap .status_revision .revision_list li .hasArea .hasfileNum {display:inline-block;position:relative;left:-10px;top:5px;min-width: 18px;height:18px;margin:0;padding-right:1px;border-radius:9px;background:#1e71c0;color:#fff;font-size:12px;line-height:18px;text-align:center;letter-spacing:-1px;padding:0 2px 0 0;}

.list_goals{margin:40px 0;text-align:center;clear:both}
/*
.list_goals h4{
	position:relative;
	padding-bottom:40px;
	background:url(../img/about/attached_tab1.png) no-repeat center bottom;
	font-family: 'Noto Sans KR';font-weight:400;font-size:30px;letter-spacing:-1px
}
.list_goals ul{
	padding:26px;margin-top:-12px;
	border:1px solid #dddfe5;border-radius:200px;
	font-size:0
}
*/
.list_goals h4{
	position:relative;
	font-family: 'Noto Sans KR';font-weight:400;font-size:30px;letter-spacing:-1px
}
.list_goals ul{
	padding:26px;
	font-size:0
}
.list_goals ul li{
	display:inline-block;
	background:#1e71c0;
	border-radius:50%;
}
.list_goals ul li+li{margin-left:70px}
.list_goals ul li span{
	display:table-cell;box-sizing:border-box;width:180px;height:180px;
	padding:0 20px;
	vertical-align:middle;
	font-family: 'Noto Sans KR';font-weight:400;font-size:16px;letter-spacing:-1px;color:#fff
}
.list_goals ul li:nth-child(2){background:#8a90a0}
.list_goals ul li:nth-child(3){background:#8ac3fb}
.list_goals ul li b{display:block;font-size:20px;font-weight:500}
.attached_tab1 .btn_home{position:absolute;right:0;margin-top:-63px}
.attached_tab1 .ct_right .btn_home{right:300px}
.attached_tab1>div+div{border-top:1px solid #dddfe5;padding-top:50px;}
.attached_tab3 .ct{padding-left:300px}
.attached_tab3 .ct .img{position:absolute;left:0;top:0;margin-top:0}

.tuition2 .ct_right h5+ul.list_dot{position: relative;}
.tuition2 .ct_right h5+ul.list_dot>li:nth-child(1){padding-right: 290px;}
.tuition2 .ct_right h5+ul.list_dot li p.img{position: absolute;right: 0;top: -90px;}

/*대학/대학원*/
.academics_main div{
	position:relative;
	min-height:185px;
	padding-left:280px;
}
.academics_main div+div{margin-top:70px}
.academics_main div .img{
	position:absolute;top:0;left:0;
}
.academics_main dt{
	font-family: 'Noto Sans KR';font-size:28px;font-weight:500
}
.academics_main dd{
	margin:20px 0;
	font-size:15px;color:#666;line-height:1.8em;word-break:keep-all
}
.academics_main li,
.academics_main li+li{display:inline-block;margin:0 30px 0 0}
.academics_main p {position:absolute;top:0;right:0}
.academics_main p>a {vertical-align:top;}
.academics_main .btn_home{width:35px;height:35px;padding:0;margin-left:5px;background-position:center;font-size:0}

.academics_intro .info{
	position:relative;
	min-height:255px;
	padding:0 0 40px 385px;
	border-bottom:1px solid #dddfe5
}
.academics_intro .info.no_line{border-bottom:0;padding-bottom:0}
.academics_intro .info .img{position:absolute;top:8px;left:0;margin:0}
.academics_intro .info a+a{margin-left:5px}
.academics_intro .line_bottom{padding-bottom:40px;border-bottom:1px solid #dddfe5}
.academics_intro .list_goals_info{padding:40px;font-size:0;text-align:center;}
.academics_intro .list_goals_info li{
	display:inline-block;width:33.33%;
	box-sizing:border-box;
	padding:0 8px;
	vertical-align:top;text-align:center;
}
.academics_intro .list_goals_info li b,
.academics_intro .list_goals_info2 li b{display:block;font-size:21px;font-weight:normal;line-height:1.2em}
.academics_intro .list_goals_info2 li{position:relative;padding:20px 0 20px 200px}
.academics_intro .list_goals_info2 li>span{
	position:absolute;top:50%;left:0;
	display:block;width:200px;
	margin-top:-48px;
	text-align:center;
}
.academics_intro .training_goal {overflow:hidden;margin-bottom:25px;font-size:0;text-align:center;}
.academics_intro .training_goal dt {display:block;width:100%;margin-bottom:20px;color:#0f4987;font-family:'Noto Sans KR';font-size:29px;font-weight:700;}
.academics_intro .training_goal dd {display:inline-block;width:calc(33.3% - 1px);box-sizing:border-box;padding:10px;border-top:1px solid #7fbdd2;color:#fff;font-family:'Noto Sans KR';font-size:18px;line-height:28px;text-align:center;}
.academics_intro .training_goal dd:nth-of-type(1) {background:#00679a;}
.academics_intro .training_goal dd:nth-of-type(2) {border-left:1px solid #30a7c5;background:#007eaa;}
.academics_intro .training_goal dd:nth-of-type(3) {border-left:1px solid #30a7c5;background:#0094b9;}
.academics_intro .list_major{
	position:relative;
	/*height:170px;*/
	padding:70px 0 0;margin:50px 0 0;
	background:url(../img/academics/university/bg.png) no-repeat center 0;
}
.academics_intro .list_major:before,
.academics_intro .list_major:after{
	content:'';
	position:absolute;left:-1800px;top:0;
	display:block;width:1800px;height:100%;
	background:url(../img/academics/university/bg.png) repeat-x 300px 0;
	z-index:-1
}
.academics_intro .list_major:after{left:auto;right:-1800px;background-position:-1183px 0}
.academics_intro .list_major.style2{background-image:url(../img/academics/university/bg2.png)}
.academics_intro .list_major.style2:before,
.academics_intro .list_major.style2:after{height:240px}
.academics_intro .list_major h4{
	margin-bottom:15px;
	font-family: 'Noto Sans KR';font-size:24px;font-weight:500;color:#fff
}
.academics_intro .list_major ul{width:102%;overflow:hidden;margin-left:-2%}
.academics_intro .list_major ul li{
	float:left;width:31%;
	margin:0 0 2% 2%;
	background:#000
}
.academics_intro .list_major ul li a{
	position:relative;
	display:block;
	font-size:0
}
.academics_intro .list_major ul li a img{display:block;margin:0 auto}
.academics_intro .list_major ul li a b{
	position:absolute;bottom:0;left:0;
	display:block;box-sizing:border-box;width:100%;
	padding:12px 10px;
	background:rgba(0,0,0,0.3);
	text-align:center;font-family: 'Noto Sans KR';font-size:18px;font-weight:500;color:#fff;word-break:break-all;line-height:1.2em
}
.academics_intro .box_certification{
	padding:15px;
	border:1px solid #dddfe5;
	text-align:center;
}
.academics_intro .box_certification dt,
.academics_intro .box_certification dd{
	display:inline-block;
	padding:5px 0;
	font-family: 'Noto Sans KR';font-size:16px;font-weight:500;color:#000
}
.academics_intro .box_certification dt{
	padding:5px 15px 5px 40px;
	background:url(../img/academics/university/medicine_icon2.png) no-repeat 0 center;
	color:#1e386f
}
.pLimage .ct_left>p:not(.img){padding-left:290px;}

.academics_university .info{padding-bottom:30px;border-bottom:1px solid #dddfe5}
.academics_university .info.no_line{padding-bottom:0;border-bottom:0}
.academics_university .info .btn_home{position:absolute;top:0;right:0}
.academics_university .info .btn_home.block{position:relative;}
.academics_university .list_major_main>li{
	position:relative;
	display:block;min-height:185px;
	padding-left:280px;
}
.academics_university .list_major_main>li{margin-top:50px}
.academics_university .list_major_main>li+li{margin-top:70px;}
.academics_university .list_major_main>li img{position:absolute;top:0;left:0}
.academics_university .list_major_main>li dt{
	display:inline-block;
	margin-bottom:15px;padding-right:25px;
	background:Url(../img/common/arrow_go.png) no-repeat right 11px;
	font-family: 'Noto Sans KR';font-size:24px;font-weight:500;
}
.academics_university .list_major_main>li dd{
	font-size:15px;color:#666;line-height:1.8em
}
.academics_university td .btn_home{display:block;margin:5px auto;}
/*연구/산학*/
.research_status ul{border-top:1px solid #62666f;font-size:0}
.research_status ul li{
	position:relative;
	display:inline-block;width:50%;
	padding:15px 20px;
	box-sizing:border-box;
	border-bottom:1px solid #dddfe5;
	letter-spacing:-1px;vertical-align:top;font-size:15px;
}
.research_status ul li:nth-child(even){border-left:1px solid #dddfe5;}
.research_status ul li a{position:absolute;top:50%;right:20px;margin-top:-15px}

.research_status2 ul li{
	position:relative;
	padding:24px 0;
	border:1px solid #dddfe5;
}
.research_status2 ul li+li{margin-top:20px}
.research_status2 ul li img{display:block;border-right:1px solid #dddfe5;font-size:0}
.research_status2 ul li b{
	position:absolute;top:50%;left:308px;
	display:inline-block;margin-top:-10px;
	font-family: 'Noto Sans KR';font-size:16px;color:#333;font-weight:500;
}

.researchstatus .img2 .img_m {display:none;}
.researchstatus .img2 .skip{position:absolute;opacity:0;font-size:0}
.researchstatus .img2 b{
	display:block;
	margin:40px 0 80px;
	font-family: 'Noto Sans KR';font-size:18px;color:#1f6bb4;text-align:center;font-weight:500
}
.researchstatus_grap .table_wrap table.table_normal{table-layout: auto;}

.researchstatus_grap td.point{
	text-align:left;font-family: 'Noto Sans KR';font-size:16px;color:#000;font-weight:500
}
.researchstatus_grap table{border-collapse:collapse;border-bottom:1px solid #dddfe5}
.researchstatus_grap td.point+td{border-top:1px solid #dddfe5}
.researchstatus_grap td.al{
	position:relative;
	padding:15px 400px 15px 15px;
	border-left:0;border-bottom:0;
	font-size:15px;color:#666;letter-spacing:-1px;line-height:1.4em;
}
.researchstatus_grap tr:first-child td+td{border-top:0}
.researchstatus_grap td.al p{
	position:absolute;right:0;top:50%;
	width:380px;height:8px;
	margin-top:-4px;
	background:#dfe1e6;
	font-size:0
}
.researchstatus_grap td p span{
	position:absolute;top:0;left:0;
	display:block;width:0;max-width:100%;height:100%;
	background:#db2931;
}
.researchstatus_grap td.color1 p span{background:#8a90a0}
.researchstatus_grap td.color2 p span{background:#a2d1ff}
.researchstatus_grap td.color3 p span{background:#1e71c0}
.researchstatus_grap td.color4 p span{background:#1e386f}
.researchstatus_grap td b{padding:0 3px;color:#db2931;font-size:16px;font-weight:600}
.researchstatus_grap td.color1 b{color:#8a90a0}
.researchstatus_grap td.color2 b{color:#a2d1ff}
.researchstatus_grap td.color3 b{color:#1e71c0}
.researchstatus_grap td.color4 b{color:#1e386f}

/* 연구산학 산업기술혁신지원단 201909 s */
.technology .chart_research{position:relative;height:920px;margin-top:50px;  background: url(../img/research/chart.png) no-repeat 50px 20px}
.technology .chart_research h3{
    position: relative;
    left: 0;
    box-sizing: border-box;
    width: 240px;
    padding: 12px 10px;
    background: #1e386f;
    text-align: center;
    font-family: 'Noto Sans KR';
    font-size: 18px;
    color: #fff;
    z-index: 1;}
.technology .chart_research h3+h4{
    position: relative;
    left: 0;
    width: 240px;
    box-sizing: border-box;
    padding: 12px 10px;
    margin: 0;
    background: #fff;
    border: 1px solid #1e386f;
    text-align: center;
    font-family: 'Noto Sans KR';
    font-size: 20px;
    color: #1e386f;
    z-index: 1;
	}
.technology .chart_research h3+h4 span{display:block;font-size:17px;padding-top:5px;font-weight:bold}
.technology .chart_research div>ul{
position: relative;
    box-sizing: border-box;
    display: inline-block;
    width: auto;
    margin-bottom: 20px;
    border: 1px solid #dddfe5;
    background: #f0f2f7;
    text-align: left;
    z-index: 1;
}
.technology .chart_research div>ul>li>span
{display: block;
    padding: 0 26px;
    margin: 12px 0;
    background: url(../img/common/bul_red.png) no-repeat 15px 45%;
    font-family: 'Noto Sans KR';
    font-size: 15px;
    font-weight: 400;
}
.technology .chart_research div>ul ul {
    padding: 6px 0 12px;
    background: #fff;
    border-top: 1px solid #dddfe5;
}
.technology .chart_research div>ul ul li{
	position: relative;
    display: block;
    padding: 0 20px 0 15px;
    margin-top: 10px;
    font-size: 15px;
    color: #666;
    letter-spacing: -1.5px;
	margin-top:7px
}
.technology .chart_research div>ul ul li span{
	font-weight:bold
}
.technology .chart_research .sub>ul{
	margin-bottom:8px
}
.technology .chart_research .sub>ul>li>span{
	width:175px;
	display:inline-block
}
.technology .chart_research .sub>ul ul{
	display:inline-block;
	width:100%;
	min-width:500px;
	margin-top: -1px;
}
.technology .chart_research .sub>ul ul li{
  letter-spacing: -1px;
}
.technology .chart_research .sub>ul ul li span{
padding-right:8px
}
/* 위치조정*/
.technology .chart_research .p0{position:absolute;left:130px;top:0}
.technology .chart_research .p1{position:absolute;top:40px;}
.technology .chart_research .p2{position:absolute;top:40px;left:390px}
.technology .chart_research .p3{position:absolute;top:40px;left:600px}
.technology .chart_research .p4{position:absolute;top:416px;left:270px;}

/*반응형*/
@media all and (max-width:850px){
.technology .chart_research{background:none;height:1400px}
.technology .chart_research .p0{left:0;top:0}
.technology .chart_research .p1{left:80px;top:170px}
.technology .chart_research .p2{left:80px;top:310px}
.technology .chart_research .p3{left:80px;top:680px}
.technology .chart_research .p4{left:80px;top:900px}
.technology .chart_research div>ul{width:289px}
.technology .chart_research .sub>ul{display:block}
.technology .chart_research .sub>ul ul{
	display:block;
	width:100%;
}
.technology .chart_research div>ul{
width:80%
}
.technology .chart_research h3{
	width:100%;
}
.technology .chart_research h3+h4{
	font-size:18px;
}
.technology .chart_research h3+h4 span{
	font-size:15px
}
.technology .chart_research .sub>ul{
	max-width:100%
}
.technology .chart_research .sub>ul>li>span{
	width:100%;
	display:block
}
.technology .chart_research .p4{
	position:relative
}
.technology .chart_research .p_al{
width: 1px;
    height: 1257px;
    float: left;
    margin-top: 27px;
    border-left: 1px dashed #dddfe5;
    margin-left: 30px;
}
.technology .chart_research div>ul:before{
content: '';
    position: absolute;
    top: 25px;
    right: 100%;
    display: block;
    width: 52px;
    height: 1px;
    border-top: 1px dashed #dddfe5;
}
}
@media all and (max-width:720px){
.technology .chart_research .sub>ul ul{width:auto;min-width:auto}
}
@media all and (max-width:410px){
.technology .chart_research .p1{left:40px;}
.technology .chart_research .p2{left:40px;}
.technology .chart_research .p3{left:40px;}
.technology .chart_research .p4{left:40px;}
.technology .chart_research div>ul{width:85%;font-size:14px}
.technology .chart_research div>ul:before{width:20px;}
.technology .chart_research .p_al{height:1257px}
.technology .chart_research .p_al{margin-left:20px}
}
@media all and (max-width:355px){
.technology .chart_research div>ul ul li{font-size:14px}
.technology .chart_research .p_al{height: 1252px;}
}

/* 연구산학 산업기술혁신지원단 201909 e */

/*대학생활*/
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
	background:url(../img/common/btn_prev.png) no-repeat center;
	font-size:0;vertical-align:top;
}
.calendar_head button.next{background-image:url(../img/common/btn_next.png)}
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

/*기숙사*/
.table_normal th.conTh{background:none;color:#000;}

.list_life_normal{width:101%;margin-left:-1%;overflow:hidden;}
.list_life_normal li{float:left;width:32.33%;margin:0 0 1% 1%}
.list_life3>li{
	position:relative;
	min-height:185px;
	padding-left:280px;
}
.list_life3>li>img{position:absolute;top:0;left:0}

.life_main time{
	position:absolute;right:0;
	display:block;
	padding:0 0 0 22px;margin-top:-40px;
	background:url(../img/common/ico_calendar_on.png) no-repeat 0 3px;
	font-size:15px;
}

.life_list ul{border-top:1px solid #333}
.life_list ul li{
	position:relative;
	min-height:158px;
	padding:30px 0 30px 245px;
	border-bottom:1px solid #dddfe5;
}
.life_list ul li img{position:absolute;top:30px;left:0;display:block;}
.life_list ul li dt{
	font-family: 'Noto Sans KR';font-size:21px;color:#000
}
.life_list ul li dd{
	position:relative;
	padding-left:100px;margin-top:10px;
	font-size:15px;color:#666;letter-spacing:-0.5px;
}
.life_list ul li dd b{
	position:absolute;left:0;
	display:block;
	padding-left:24px;
	background:url(../img/campusinfo/life5_icon1.png) no-repeat 0 1px;
	color:#000;letter-spacing:-0.5px;font-weight:600
}
.life_list ul li dd.tel b{background-image:url(../img/campusinfo/life5_icon2.png)}
.life_list ul li dd.time b{background-image:url(../img/campusinfo/life5_icon3.png)}
.life_list ul li dd.location b{background-image:url(../img/campusinfo/life5_icon4.png)}

.activities .ct1{width:100%;overflow:hidden;margin:20px 0;font-size:0}
.activities .ct1 li{float:left;width:32%}
.activities .ct1 li+li{margin-left:2%}

.activities_tab_area .list_tab_wrap+.activities_list{display:block}
.activities_tab_area .activities_list{display:none}
.activities_list p{
	background:#f8f8f8;
	text-align:center;
}
.activities_list ul{width:102%;margin-left:-2%;overflow:Hidden;}
.activities_list ul li{float:left;width:23%;margin:15px 0 25px 2%;font-size:15px;letter-spacing:-0.5px}
.activities_list ul li b{display:block;font-family: 'Noto Sans KR';font-size:17px;color:#000;font-weight:500}
#activities_2010 p,
#activities_2009 p,
#activities_2008 p{padding:30px}
#activities_2010 ul li,
#activities_2009 ul li,
#activities_2008 ul li{width:18%}

.activities.ct_area>div {margin:20px 0;font-size:15px;color:#333;line-height:1.9em;letter-spacing:-0.5px} /*200406수정*/

.activities5 h4 span{position:absolute;right:0;font-size:14px;color:#666}

.activities6 .ct1{width:102%;overflow:hidden;margin:20px 0 20px -2%;font-size:0}
.activities6 .ct1 li{float:left;width:31.33%;margin:0 0 2% 2%}
.activities6 .ct2 p{position:relative;display:inline-block;margin-top:0;font-size:0}
.activities6 .ct2 p span{
	position:absolute;bottom:0;left:0;
	display:block;box-sizing:border-box;width:100%;
	padding:10px;
	background:rgba(0,0,0,0.3);
	text-align:center;font-size:15px;color:#fff;letter-spacing:-0.5px
}
.activities6 .ct2 p span b{font-size:18px;color:#fff}
.activities6 .ct2_a ul,
.activities6 .ct2_b{width:102%;margin-left:-2%;overflow:hidden;}
.activities6 .ct2_a ul li,
.activities6 .ct2_b p{float:left;width:31.33%;margin-left:2%}

.smartID1 .ct1{
	position:relative;
	padding:50px 0;margin-top:50px;
	text-align:center;
}
.smartID1 .ct1 li{
	position:absolute;
	max-width:320px;
	font-family: 'Noto Sans KR';font-size:15px;color:#666;letter-spacing:-0.5px;word-break:keep-all
}
.smartID1 .ct1 li:nth-child(1){top:0;left:50%;margin-left:-160px;}
.smartID1 .ct1 li:nth-child(3){bottom:0;left:50%;margin-left:-160px;}
.smartID1 .ct1 li:nth-child(2){top:50%;right:0;max-width:150px;margin-top:-20px}
.smartID1 .ct1 li:nth-child(4){top:50%;left:0;max-width:150px;margin-top:-20px;}
.smartID1 .ct1 li b{display:none}
.smartID2 .ct1_wrap{width:100%;overflow:auto;margin-bottom:50px}
.smartID2 .ct1{position:relative;max-width:790px;margin:0 auto;text-align:center;}
.smartID2 .ct1 h6{
	padding:15px;
	background:#a0abc2;
	font-size:18px;font-family: 'Noto Sans KR';color:#fff;text-align:center;
}
.smartID2 .ct1 div{width:250px}
.smartID2 .ct1 div>ul>li{padding:10px;font-size:15px;}
.smartID2 .ct1 div>ul>li b{
	display:block;
	margin-bottom:10px;
	font-size:16px;font-family: 'Noto Sans KR';color:#1e386f
}
.smartID2 .ct1 div>ul ul{text-align:left}
.smartID2 div.ct1_a>ul>li{
	box-sizing:border-box;
	margin-top:20px;padding:20px 30px;
	background:#f0f2f7
}
.smartID2 div.ct1_a .li2{position:absolute;left:270px;width:250px;margin-top:-134px}
.smartID2 div.ct1_a .li2:before{
	content:'';
	position:absolute;left:-12px;top:50%;
	display:block;width:6px;height:10px;
	margin-top:-5px;
	background:url(../img/campusinfo/smartID2_b.png) no-repeat;
}
.smartID2 div.ct1_a .li2:after{
	content:'';
	position:absolute;left:100%;top:50%;
	display:block;width:148px;height:84px;
	margin-top:-5px;
	background:url(../img/campusinfo/smartID2_c.png) no-repeat;
}
.smartID2 div.ct1_a .li3{position:absolute;left:540px;width:250px;margin-top:-134px}
.smartID2 div.ct1_a .li3:after{
	content:'';
	position:absolute;right:100%;top:50%;
	display:block;width:283px;height:10px;
	margin:-5px 5px 0 0;
	background:url(../img/campusinfo/smartID2_d.png) no-repeat;
}
.smartID2 .ct1_b>ul,
.smartID2 .ct1_c>ul{border:1px solid #dadce3}
.smartID2 .ct1_b{position:absolute;top:0;left:270px}
.smartID2 .ct1_c{position:absolute;top:0;left:540px}

.smartID3 .ct1{
	position:relative;
	padding-left:300px
}
.smartID3 .ct1 p{
	position:absolute;top:0;left:0;
	width:250px;
	box-sizing:border-box;padding:20px;margin:0;
	border:1px solid #dadce3;
	background:#fafafa;
	text-align:center;font-family: 'Noto Sans KR';font-size:13px;color:#000
}
.smartID3 .ct1 p img{display:block;margin-bottom:10px}

.smartID4 .ct1{
	margin-top:-21px;padding:30px;
	background:#f0f2f7;
	border:1px solid #dadce3;border-top:0
}
.smartID5 .nfcUse {}
.smartID5 .nfcUse>span {display:inline-block;padding:20px 15px;color:#666;font-family:'Noto Sans KR';font-size:16px;font-weight:400;line-height:17px;text-align:center;}
.smartID5 .nfcUse>span>img {display:block;margin:0 auto 20px;}
.cyber .ct1{
	padding:30px 30px 30px 150px;
	background:#f0f2f7 url(../img/campusinfo/cyber1_b.png) no-repeat 50px center;
	font-size:16px;color:#666;word-break:keep-all
}

.cyber .certification {overflow:hidden;}
.cyber .certification li {float:left;width:calc(50% - 10px);min-height:390px;box-sizing:border-box;padding:40px 20px;border:1px solid #dadce3;}
.cyber .certification li+li {margin-left:20px;}
.cyber .certification li .tit {display:block;color:#1f3870;font-family:'Noto Sans KR';font-size:24px;font-weight:400;line-height:26px;text-align:center;}
.cyber .certification li>div>p {color:#333;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:25px;}
.cyber .certification li>div>.btn_login {display:inline-block;width:150px;height:40px;box-sizing:border-box;padding:0 25px 0 15px;color:#333;font-family:'Noto Sans KR';font-size:16px;font-weight:300;line-height:40px;}
.cyber .certification li .login_portal {padding-top:150px;background:url(../img/layout/ico_pwLock_cau.png) no-repeat 50% 50px;text-align:center;}
.cyber .certification li .login_portal .btn_login {color:#fff;background:#1e71c0 url(../img/layout/ico_dotArrR_white.png) no-repeat right 12px top 50%;}
.cyber .certification li .login_hp {padding-top:150px;background:url(../img/layout/ico_hp.png) no-repeat 50% 50px;text-align:center;}
.cyber .certification li .login_hp .btn_login {border:1px solid #1e71c0;color:#1e71c0;background:#fff url(../img/layout/ico_dotArrR_blue2.png) no-repeat right 12px top 50%;}

.admin_service .imgTit {display:table;width:100%;max-width:790px;height:160px;margin-bottom:40px;box-sizing:border-box;padding:20px 0 0 40px;background:url(../img/campusinfo/adminService_imgTit.png) no-repeat 50% top;}
.admin_service .imgTit>div {display:table-cell;font-size:0;text-align:left;vertical-align:middle;}
.admin_service .imgTit .tit {display:block;color:#1e386f;font-family:'Noto Sans KR';font-size:36px;font-weight:400;line-height:40px;}
.admin_service .imgTit p {display:block;margin-top:15px;color:#333;font-family:'Noto Sans KR';font-size:15px;font-weight:400;line-height:17px;}
.admin_service .service_list {overflow:hidden;}
.admin_service .service_list li {float:left;width:calc(50% - 10px);height:260px;margin-bottom:20px;box-sizing:border-box;padding:35px 115px 15px 35px;border:1px solid #dedfe4;}
.admin_service .service_list li:nth-child(2n) {margin-left:20px;}
.admin_service .service_list li>strong {display:block;margin-bottom:15px;color:#000;font-family:'Noto Sans KR';font-size:20px;font-weight:500;line-height:24px;}
.admin_service .service_list li>p {display:block;margin:0;color:#666;font-family:'Noto Sans KR';font-size:15px;font-weight:300;line-height:21px;}
.admin_service .service_list li:nth-child(1) {background:url(../img/campusinfo/adminService_ico01.png) no-repeat right 20px bottom 20px;}
.admin_service .service_list li:nth-child(2) {background:url(../img/campusinfo/adminService_ico02.png) no-repeat right 20px bottom 20px;}
.admin_service .service_list li:nth-child(3) {background:url(../img/campusinfo/adminService_ico03.png) no-repeat right 20px bottom 20px;}
.admin_service .service_list li:nth-child(4) {background:url(../img/campusinfo/adminService_ico04.png) no-repeat right 20px bottom 20px;}

.policy_email .ct1{
	padding:30px 30px 30px 150px;
	background:#f0f2f7 url(../img/siteinfo/email.png) no-repeat 40px center;
	font-size:16px;color:#666;word-break:keep-all
}

/*캠퍼스맵*/
#campusmap .campusmap_tab{z-index:1}
.campusmap_tab{position:absolute;font-size:0}
.campusmap_tab li{
	display:inline-block;
	margin-right:20px;vertical-align:top
}
.campusmap_tab li a{
	display:inline-block;
	padding-bottom:5px;
	border-bottom:2px solid #fff;
	font-family: 'Noto Sans KR';font-size:16px;font-weight:400;color:#666
}
.campusmap_tab li a.on{
	border-color:#1e71c0;
	color:#1e71c0;
}
#campusmap #map_area{text-align:center;font-size:0}
#campusmap #map_area div{display:None}
#campusmap #map_list{min-height:250px;z-index:105}
#campusmap #map_list,
#campusmap #map_list .facilities_main{position:relative;}
#campusmap #map_list .facilities_main button{
	position:relative;
	display:block;box-sizing:border-box;width:100%;height:45px;line-height:45px;
	padding:0 20px;
	background:#1f3870;
	font-family: 'Noto Sans KR';font-size:18px;color:#a2d1ff;text-align:left;
}
#campusmap #map_list .facilities_main button:after{
	content:'';
	position:absolute;top:0;right:15px;
	display:block;width:17px;height:100%;
	background:url(/cau/img/about/caupusmap/button.png) no-repeat center;background-size:100% auto;
	transition:.3s;
}
#campusmap #map_list .facilities_main button.on:after{transform:rotate(180deg)}
#campusmap #map_list .facilities_main ul{
	position:absolute;top:45px;left:0;
	width:100%;max-height:215px;overflow:auto;
	box-sizing:border-box;
	padding:0 0 20px 20px;
	background:#1f3870;
	font-size:0;z-index:1;
	display:none
}
#campusmap #map_list .facilities_main ul li{
	display:inline-block;
}
#campusmap #map_list .facilities_main ul li a{
	display:inline-block;height:38px;line-height:38px;
	padding:0 14px;margin:8px 8px 0 0;
	border:1px solid rgba(255,255,255,0.3);
	font-size:15px;color:#fff;letter-spacing:-1px;
}
#campusmap #map_list .facilities_main ul li a.on,
#campusmap #map_list .facilities_main ul li a:hover{background:#1e71c1;border-color:#1e71c1}
#campusmap #map_list .facilities_sub{
	max-height:200px;overflow:auto;
	padding:20px;
	background:#1e71c1;
}
#campusmap #map_list .facilities_sub ul{font-size:0}
#campusmap #map_list .facilities_sub ul li{
	position:relative;
	display:inline-block;box-sizing:border-box;width:33.33%;
	padding:0 14px 10px 24px;
	font-size:14px;color:#fff;vertical-align:top;
}
#campusmap #map_list .facilities_sub ul li i{
	position:absolute;top:1px;left:0;
	display:inline-block;width:24px;height:18px;
	background:url(/cau/img/about/caupusmap/ico_1.png) no-repeat 0 0;
	font-size:0;
}
/*#campusmap #map_list .facilities_sub ul li i em{
	position:absolute;top:-40px;left:5px;
	height:34px;line-height:34px;
	padding:0 10px;
	background:#1f3870;
	font-size:14px;color:#a2d1ff;font-style:normal;letter-spacing:-1px;
	display:None
}
#campusmap #map_list .facilities_sub ul li i em:after{
	content:'';
	position:absolute;left:0;bottom:-8px;
	display:block;width:8px;height:8px;
	background:url(/cau/img/about/caupusmap/pop_bg.png) no-repeat;
}메세지 위쪽*/
#campusmap #map_list .facilities_sub ul li i em{
	position:absolute;top:5px;left:28px;
	height:25px;line-height:25px;
	padding:2px 10px 0;
	background:#1f3870;
	font-size:14px;color:#a2d1ff;font-style:normal;letter-spacing:-1px;
	display:None
}/* 메세지 오른쪽 */
#campusmap #map_list .facilities_sub ul li i:hover em{display:block;}
#campusmap #map_list .facilities_sub ul li i em:after{
	content:'';
	position:absolute;left:-8px;top:0;
	display:block;width:8px;height:8px;
	background:url(/cau/img/about/caupusmap/pop_bg2.png) no-repeat;
}
#campusmap #map_list .facilities_sub ul li i.facilities2{background-image:url(/cau/img/about/caupusmap/ico_2.png)}
#campusmap #map_list .facilities_sub ul li i.facilities3{background-image:url(/cau/img/about/caupusmap/ico_3.png)}
#campusmap #map_list .facilities_sub ul li i.facilities4{background-image:url(/cau/img/about/caupusmap/ico_4.png)}
#campusmap #map_list .facilities_sub ul li i.facilities5{background-image:url(/cau/img/about/caupusmap/ico_5.png)}
#campusmap #map_list .facilities_sub ul li i.facilities6{background-image:url(/cau/img/about/caupusmap/ico_6.png)}
#campusmap #map_list .facilities_sub ul li i.facilities7{background-image:url(/cau/img/about/caupusmap/ico_7.png)}
#campusmap #map_list .facilities_sub ul li i.facilities8{background-image:url(/cau/img/about/caupusmap/ico_8.png)}
#campusmap #map_list .facilities_sub ul li.no_data{width:100%;padding:30px;text-align:center;}
#campusmap #map_list .facilities_sub ul li span{margin-right:10px}

#campusmap .facilities_detail{
	position:relative;
	min-height:160px;
	padding:30px 30px 30px 275px;
	background:#f1f2f7;
}
#campusmap .facilities_detail .slick-slider{
	position:absolute;top:30px;left:30px;
	width:226px;
}
#campusmap .facilities_detail .slick-slider .slick-slide{width:226px;}
#campusmap .facilities_detail .slick-slider img{width:100%}
#campusmap .facilities_detail .slick-slider>button{position:absolute;opacity:0}
#campusmap .facilities_detail .slick-dots{padding-top:15px;font-size:0;text-align:center;}
#campusmap .facilities_detail .slick-dots li{display:inline-block;}
#campusmap .facilities_detail .slick-dots li button{
	display:block;width:10px;height:10px;
	margin-right:8px;
	background:#c0c2ce;border-radius:50%;
	vertical-align:top;font-size:0
}
#campusmap .facilities_detail .slick-dots li.slick-active button{background:#da2931}
#campusmap .facilities_detail h3{
	font-family: 'Noto Sans KR';font-size:18px;color:#000;font-weight:500
}
#campusmap .facilities_detail h3 span{
	display:inline-block;height:22px;line-height:22px;
	padding:0 8px;margin:3px 9px 0 0;
	background:#da2931;
	font-size:13px;color:#fff;vertical-align:top
}
#campusmap .facilities_detail p{
	margin:10px 0 0;
	font-size:15px;letter-spacing:-1px;color:#666
}
#campusmap .facilities_detail .close{display:none}

/*사이트안내*/
.policy .policy_opt {overflow:hidden;text-align:right}
.policy .policy_opt>.sel_tit {display:inline-block;overflow:hidden;height:33px;padding:0 20px 0 5px;border:1px solid #d4d4d4;background:url(/cau/img/siteinfo/ico_arrR_s_gray.png) no-repeat right 5px top 50%;color:#888;font-size:13px;font-weight:bold;line-height:34px;letter-spacing:-1px;}
.policy .sel{display:inline-block;margin:0;text-align:right;vertical-align:top;}
.policy .sel select{width:200px;height:35px;}

/* 영예의전당 */
.glory_history .tit_black {margin:40px 0 20px;}
.glory_history .gloryList>ul {width:calc(100% + 18px); margin-left:-18px;font-size:0;}
.glory_history .gloryList>ul>li {position:relative;display:inline-block;width:calc(20% - 18px);margin-left:18px;vertical-align: top;}
.glory_history.glory1 .gloryList>ul>li>.imgArea {cursor:pointer;}
.glory_history.glory2 .gloryList>ul>li {cursor: default;}
.glory_history .gloryList>ul>li:nth-child(n+6) {margin-top:30px;}
.glory_history .gloryList>ul>li .txtArea {margin-top:15px;}
.glory_history .gloryList>ul>li p, .glory_history .gloryList>ul>li span {font-family: 'Noto Sans KR';}
.glory_history .gloryList>ul>li p.name {font-size:16px;font-weight: 500;word-break:break-all;}
.glory_history .gloryList>ul>li p.name > span {font-size:15px;margin-left:4px;font-weight:300}
.glory_history .gloryList>ul>li p.dep {font-size:15px;font-weight:500;margin:3px 0;}
.glory_history .gloryList>ul>li p.dep.long {letter-spacing:-2px;}
.glory_history .gloryList>ul>li p.work {font-size:14px;color:#666;letter-spacing:-1.6px;}
.glory_history .gloryList>ul>li p.work.long {letter-spacing:-2.1px;font-size:13px;}
.glory_history .gloryList>ul>li p.work.longSt2 {letter-spacing:-1.5px;font-size:12px;text-overflow:ellipsis;white-space:nowrap;overflow:hidden;}
.glory_history .imgArea.double {position:relative;width:144px;height:180px;}
.glory_history .imgArea.double > img {position:absolute;top:0;}
.glory_history .imgArea.double > img.active {z-index:1;}
.glory_history .gloryList>ul>li .slick-dots {position:absolute;top:185px;left:50%;margin-left:-9px;}
.glory_history .gloryList>ul>li .slick-dots li {width:6px;height:6px;box-sizing:border-box;border:1px solid #868788;background:#fff;font-size:1;text-indent:-9999px;border-radius:50%}
.glory_history .gloryList>ul>li .slick-dots li+li {margin-left:6px;}
.glory_history .gloryList>ul>li .slick-dots li {display:inline-block;width:6px;height:6px;box-sizing:border-box;border:1px solid #868788;background:#fff;vertical-align: top;}
.glory_history .gloryList>ul>li .slick-dots li.slick-active {width:6px;height:6px;box-sizing:border-box;border:1px solid #1e71c0;background:#1e71c0;}

/* .glory_history .popArea {display:none;position:fixed;top:50%;left:50%;max-width:580px;width:100%;max-height:690px;margin-top:-345px;margin-left:-290px;background:#fff;box-sizing:border-box;overflow-y:auto;cursor:default;z-index:1005} */
.glory_history .popArea {display:none;position:fixed;top:50%;left:50%;max-width:580px;width:100%;max-height:690px;height:100%;transform:translate(-50%, -50%);background:#fff;box-sizing:border-box;overflow-y:auto;cursor:default;z-index:1005}
.glory_history .popArea.on {display:block;}
.glory_history .popArea .popWrap {position:relative;padding:25px 35px 40px 35px;}
.glory_history .popWrap > ul > li {font-size:0;}
.glory_history .popWrap > ul > li:first-child {padding-bottom:20px;}
.glory_history .popWrap > ul > li:last-child {padding-bottom:0px;}
.glory_history .popWrap>ul>li+li {padding:18px 0 20px 0;border-top: 1px solid #e1e1e1;}
.glory_history .popWrap .leftArea {display:inline-block;width:165px;vertical-align: top;}
.glory_history .popWrap .leftArea p.tit {color:#1e3a6d;font-size:16px;font-weight:500;}
.glory_history .popWrap .rightArea {display:inline-block;width:calc(100% - 165px);vertical-align: top;box-sizing:border-box;font-size:15px;color:#666;}
.glory_history .popWrap .rightArea p.name {margin-bottom:12px;font-size:18px;color:#000;}
.glory_history .popWrap .rightArea ul > li {position:relative;font-size:13px;padding-left:50px;color:#666;letter-spacing:-0.5px;}
.glory_history .popWrap .rightArea ul > li+li {margin-top:6px;}
.glory_history .popWrap .rightArea ul > li .date {position:absolute;left:0;font-family: 'Roboto', sans-serif;color:#000;}
.glory_history .popWrap > ul > li:first-child .rightArea {margin-top:7px;}
.glory_history .popWrap > ul > li:first-child .rightArea ul > li {padding-left:49px}
.glory_history .popWrap > ul > li:first-child .rightArea ul > li.noDate {padding-left:0px}
.glory_history .popWrap > ul > li.long .rightArea ul > li {padding-left:85px}
.glory_history .popWrap > ul > li.long .rightArea ul > li.noDate {padding-left:0px}
.glory_history .popWrap > ul > li.long .rightArea ul > li.longDate {padding-left:85px}
.glory_history .popWrap > ul > li.noDate .rightArea ul > li {padding-left:0px}
.glory_history .popWrap > ul > li ul > li.noDate {padding-left:0px}
.glory_history .popWrap > ul > li ul > li.long {padding-left:85px}
.glory_history .popWrap > ul > li ul > li.longDate {padding-left:85px}
.glory_history button.close {display:block;position:absolute;top:28px;right:20px;width:21px;height:21px;background:url(../img/about/pop_close.png) no-repeat;font-size:0;}
.glory_history .list_tab {padding-bottom:1px; border-bottom: 1px solid #dddfe5}

.glory_history.message .message_tit {padding:26px 0 40px 28px;box-sizing:border-box;background: Url(../img/common/bg_message.png) no-repeat;border-bottom:1px solid #dddfe5;margin-bottom:40px;}
.glory_history.message .message_tit > p {font-size:20px;}
.glory_history.message .message_tit > p > b {display:block;margin:0px 0 10px 0px;font-size:46px;color:#1e386f;font-weight:400;letter-spacing:-1px;}
.glory_history.message .message_tit > p > span {font-size:26px;letter-spacing:-1px;font-family: 'Noto Sans KR';font-weight:300}
.glory_history.message .cont b.blue {display:block;font-size:17px;color:#1e386f;font-weight:600;letter-spacing:-1px;}
.glory_history.message .cont p {margin-top:25px;font-size:16px;color:#333;line-height:28px;}
.glory_history.message .cont .ar {margin:40px 0;}
.glory_history.message .cont .ar > span {font-size:14px;color:#666;}
.glory_history.message .cont .ar > p {font-size:22px;font-weight:600}
.glory_history.message .cont .ar > p em {font-size:15px;color:#333;margin-right:10px;font-style:normal;}
.glory_history.message .grayBox {margin-bottom:10px;padding:35px;box-sizing: border-box;background:#f5f6f8;}
.glory_history.message p.tit {position:relative;font-size:18px;font-weight:600;margin-bottom:20px;}
.glory_history.message .grayBox dl dt {position:absolute;font-size:18px;font-weight:600;color:#1e386f;letter-spacing:-1px;}
.glory_history.message .grayBox dl dd {padding-left:100px;color:#333;font-size:15px;line-height:25px;letter-spacing:-0.5px;}
.glory_history.message .grayBox dl dd b {font-weight:500}
.glory_history.message .grayBox dl dt:nth-child(n+2) {margin-top:20px;}

.glory_history.message .lineBox {padding:35px;box-sizing: border-box;border:1px solid #dddfe5}
.glory_history.message .lineBox p.tit {color:#1e386f}
.glory_history.message p.tit span {font-size:14px;color:#888;font-weight:400;margin-left:5px;}
.glory_history.message ul.list_dot {font-size:0}
.glory_history.message ul.list_dot li {display:inline-block;width:calc(50% - 5px);vertical-align:top;box-sizing:border-box;}
.glory_history.message ul.list_dot li:nth-child(2) {margin-top:0;}
.glory_history.message ul.list_dot li:nth-child(2n) {margin-left:10px;}
.glory_history .gloryList .list_dot>li {font-family: 'Noto Sans KR';font-size: 14px;color: #666;letter-spacing: -0.5px;}
.glory_history .popArea .list_tab_wrap {padding: 25px 35px 15px 35px;margin-bottom:0}
.glory_history .popArea .list_tab>li {min-width:130px;}
.glory_history .popArea .list_tab>li > a {height:35px;line-height:35px;}
.glory_history .popArea .tab_content {display:none;}
.glory_history .popArea .tab_content.on {display:block;}
.is-noscroll {overflow:hidden; -webkit-overflow-scrolling:initial;}
.glory_list_tab_wrap{padding:25px 65px 10px 35px}
.glory_list_tab_wrap{max-width:790px;}
.glory_list_tab_wrap button{display:none;}
.glory_list_tab{
	background:url(../img/common/bg_tab.png);
	font-size:0
}
.glory_list_tab>li{
	box-sizing:border-box;
	display:inline-block;min-width:98px;vertical-align:top
}
.glory_list_tab>li>a{
	position:relative;
	display:block;height:51px;line-height:51px;
	padding:0 12px;
	text-align:center;font-size:16px;color:#333;letter-spacing:-0.5px
}
.glory_list_tab a:hover,
.list_tab_wrap div a:hover,
.glory_list_tab>li>a.on{
	color:#1e71c0;
}
.glory_list_tab>li>a.on:after{
	content:'';
	position:absolute;bottom:-1px;left:0;
	display:block;width:100%;height:2px;
	background:#1e71c0;
}
.list_tab_wrap div ul{margin-left:-30px;font-size:0}
.list_tab_wrap div ul li{
	display:inline-block;
	margin:10px 0 0 30px;
}
.list_tab_wrap div ul li a{
	display:block;
	padding-left:9px;
	background:url(../img/common/bul_tab.png) no-repeat 0 7px;
	font-size:15px;color:#666;letter-spacing:-0.5px
}
.list_tab_wrap div ul li a.on{background-image:url(../img/common/bul_tab_on.png);color:#1e71c0}


/*  tablet  ***************************************************************************************************/

@media all and (max-width:1041px){

	.list_tab_wrap{max-width:100%;padding:30px 20px 0;margin-bottom:0;box-sizing:border-box;}
	.list_step li+li:before{width:50px;left:-25px}
	.list_step.style2 li:before{width:100px;left:-50px}

	/*대학소개*/
	.welcome_status4:before{top:25px;height:50%}
	.welcome_status4 .ct2>li{width:300px}
	.presidents_message{min-height:600px}
	.presidents_message div{top:40px}
	.presidents_message dl{padding:16px 400px 0 28px;}
	.presidents_message>p{margin:0 400px 20px 28px}
	.list_goals ul li+li{margin-left:40px}

	#presidents_message {max-width:none;padding-top:0;border-top:none;background-position:center 0;}

	/*대학/대학원*/
	.academics_university .info .btn_home{position:relative}

	/*연구/산학*/

	/*대학생활*/
	ul.exchange_student_step li,
	ul.exchange_student_step li:nth-child(even){display:block;width:100%;margin:10px 0;padding:25px 20px 25px 70px;text-align:left}
	ul.exchange_student_step li:after{top:-20px !important;left:-5px !important;width:50px;height:50px;background-size:100% auto;border:5px solid #fff}
	ul.exchange_student_step li span{display:inline}

	/*캠퍼스맵*/
	#campusmap #map_area>img{display:none}
	#campusmap #map_area div{display:block;position:relative;font-size:0}
	#campusmap #map_area div p{margin:0;font-size:0}
	#campusmap #map_area div button{display:None}



}





/*  mobile  ***************************************************************************************************/
@media all and (max-width:768px){
	.ct_tab li {display:table;width:calc(33.3% - 2px);}
	.ct_tab li>a {display:table-cell;overflow:hidden;padding:0 5px;line-height:17px;vertical-align:middle;word-break:break-all;word-wrap:break-word;}

	.organizationChart h2{width:180px;height:180px;padding-top:90px;background-size:auto 45px;font-size:18px;	}
	.organizationChart div.chart1{padding-bottom:50px;}
	.organizationChart div.chart1 ul{width:46%;}
	.organizationChart div.chart1 ul li{padding:10px;line-height:1.2em;font-size:14px;}
	.organizationChart div.chart2 div>ul:before{width:6%}
	/*.organizationChart div.chart2 div:after{display:none} */
	.organizationChart div.chart2 div>ul{max-width:96%}
	.organizationChart div.chart2 h3,
	.organizationChart div.chart2 h3+h4{max-width:40%}
	.organizationChart div.chart2 h4{margin:0 0 20px;width:100%}
	.organizationChart div.chart2 h3:after,.organizationChart div.chart2 h3.last:after{
		content:'';
		position:absolute;top:100%;left:50%;
		display:block;width:1px;height:20000%;
		background:#dddfe5
	}
	.organizationChart div.chart2 h3.last:after{background:#fff}
	.organizationChart div.chart2:after,
	.organizationChart div.chart2 h4:before{display:none}

	.pLimage .ct_left>p:not(.img){padding-left:0px;}
	
	.glory_history.message .message_tit {padding:14px 0 20px 22px;;margin-bottom:20px;background-size:35px auto;}
	.glory_history.message .message_tit>p>b {font-size:28px;}
	.glory_history.message .message_tit>p>span {font-size:20px;}
	.glory_history.message .cont p {margin-top:10px;font-size:15px;}
	.glory_history.message .grayBox {padding: 20px;}
	.glory_history.message .grayBox dl dt {position:relative;}
	.glory_history.message .grayBox dl dd {padding-left:0;margin-top:8px;}
	.glory_history.message .grayBox dl dd:nth-child(n+2) {margin-top:0;}
	.glory_history.message .grayBox br {display:none;}
	.glory_history.message .lineBox {padding:20px;}
	.glory_history.message p.tit {margin-bottom:10px;}
	.glory_history.message ul.list_dot li {width:100%}
	.glory_history.message ul.list_dot li:nth-child(2n) {margin-left:0;}
	.glory_history.message ul.list_dot li:nth-child(2) {margin-top:0;}
	.glory_history.message .cont .ar {margin:20px 0}
	.glory_history .popArea {max-width:80%;max-height:80%;}
	.glory_history .popWrap>ul>li:first-child .leftArea {width:100%}
	.glory_history .popWrap .rightArea {width:100%;}
	.glory_history .popWrap .leftArea {width:auto;margin-bottom:10px;}
	.glory_history .popArea .popWrap {padding:15px }
	.glory_history .gloryList>ul>li .slick-dots {top:0;left:35%;margin-left:-12px;margin-top:38px;}
	.glory_history .imgArea.double {width:auto;}
	.glory_list_tab_wrap {padding:15px;}
}
@media all and (max-width:700px){
	.glory_history .gloryList>ul>li .slick-dots {left:38%}
}
@media all and (max-width:600px){
	.glory_history .gloryList>ul>li .slick-dots {left:44%}
}
@media all and (max-width:500px){
	.glory_history .gloryList>ul>li .slick-dots {left:50%}
}
@media all and (max-width:760px){

	/*TITILE*/
	.ct_left .tit_sub,
	.ct_right .tit_sub,
	.ct_pd_left .tit_sub,
	.ct_pd_right .tit_sub {margin-top:0 !important;}
	.tit_sub{margin-bottom:20px;font-size:26px;line-height:1.3em}
	.tit_sub span{display:block;padding-left:0;font-size:18px;}
	.tit_sub.small{font-size:22px}
	.txt_sub{margin:-5px 0 20px;}
	.tit_black{font-size:22px;}
	.tit_blue{margin:20px 0 10px;}
	.tit_line{margin:30px 0 25px;font-size:20px;}
	.tit_line:after{width:30px;margin-top:10px;}
	.tit_visual{min-height:50px;padding:20px;background-position:center}
	.tit_visual p{line-height:1.5em}
	.tit_visual p .block{display:inline}

	/*TAB*/
	.list_tab_wrap{position:relative;padding:0;margin:0 20px;z-index:10;}
	.list_tab_wrap button{position:relative;display:block;box-sizing:border-box;width:100%;height:50px;line-height:50px;padding:0 50px 0 0px;margin-top:5px;background:#fff;border-bottom:1px solid #1e71c0;font-size:16px;color:#1e71c0;text-align:left;font-weight:600;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;}
	.list_tab_wrap button:after{content:'';position:absolute;right:15px;top:0;display:block;width:15px;height:100%;background:url(../img/common/btn_tab.png) no-repeat center;background-size:100% auto;transition:.3s;transform:rotate(0deg);}
	.list_tab_wrap button.on:after{transform:rotate(-180deg);}
	.list_tab{position:absolute;top:40px;left:0;display:none;width:100%;background:#1e71c0;}
	.list_tab>li{	width:100% !important;}
	.list_tab>li+li{border-top:1px solid #4086c9;}
	.list_tab>li>a{height:auto;line-height:1.2em;padding:10px 15px;font-size:15px;text-align:left;color:#88bef2}
	.list_tab>li>a.on{background:#fff;font-size:15px;color:#1e71c0}
	.list_tab_wrap div{width:100%;overflow:auto;overflow-y:hidden;}
	.list_tab_wrap div ul{white-space:nowrap;margin:0}
	.list_tab_wrap div ul li{margin:5px 5px 0 0;}
	.list_tab_wrap div ul li a{
		padding:5px;
		background:#1e71c0;border-radius:3px;
		color:#fff
	}
	.list_tab_wrap div ul li a.on{background:#1e386f;color:#fff}

	/*BTNS*/
	.btn_down,
	.btn_go{
		position:relative;
		height:auto;line-height:1.2em;
		box-sizing:border-box;min-width:100%;
		padding:14px 25px 14px 14px;
		font-size:14px;
	}
	.btn_down:after,.btn_go:after{
		position:absolute;right:10px;top:0;
		width:14px;height:100%;
		background-size:100% auto;
	}
	.btn_down{padding-right:35px;}
	.btn_go:after{width:6px}
	.btn_go_red{	margin-right:15px;padding-right:16px;background-size:7px auto;	letter-spacing:-1px;}
	.btn_down.acr:before{width:18px;height:18px;background-size:100% auto}
	.btn_c_m{text-align:center;}

	/*ct area*/
	.box_info{padding:10px 20px;}
	.box_info>ul>li{height:auto;min-height:auto;padding:5px 0 5px 30px;line-height:1.2em}
	.box_info>ul>li:before{width:20px;background-size:100% auto;}
	.box_info>a{position:relative;top:0;right:0;display:block;height:35px;line-height:35px;padding:0;background-image:none;font-size:16px;text-align:center;}
	/*.box_info>ul>li.email:before{background-size:auto 11px;}*/
	.box_info.style2>ul>li{width:100%;padding-left:40px;}
	.box_info.style2>ul>li b{position:relative;left:0}
	.box_info p>a, .box_info>a{display:block;margin:5px 0 0}
	.box_info>ul>li .block b{display:block;padding:5px 0 0}
	.box_info>ul>li b{display:block;margin-bottom:3px}

	.box_caution{
		padding:80px 20px 20px;margin:30px 0;
		background-position:center 20px;background-size:auto 45px;
	}

	.list_icon li b:before{background-size:auto 50%;}
	.list_icon li b.email:before{background-size:auto 11px;}

	ul.list_step{margin:-30px 0 50px !important}
	ul.list_step li,
	ul.list_step.style2 li{
		float:none;
		display:block;width:100%;
		margin:50px 0 0 !important;
	}
	ul.list_step li img{width:70px;margin-bottom:15px;}
	ul.list_step li:before,
	ul.list_step.style2 li:before,
	ul.list_step.style2 li:nth-child(4):before,
	ul.list_step.style2 li:nth-child(5):before{
		left:50%;top:-30px;
		width:30px;height:10px;
		margin:0 0 0 -13px;
		background:url(../img/campusinfo/step_arrow.png) no-repeat center right;background-size:300% auto;
		transform:rotate(90deg)
	}

	.ct_area .img img {width:100%;}
	.ct_area p{line-height:1.5em}
	.ct_area p .w,
	.ct_area div .w {display:none;}
	.ct_area p .m,
	.ct_area div .m {display:inline-block;}
	.ct_area p.img2 {margin:30px 0;}
	.ct_area p.img .m,
	.ct_area p.img2 .m{display:block;}
	.ct_area p.img .m img,
	.ct_area p.img2 .m img{max-width:100%}
	.ct_area p.img>img.w,
	.ct_area p.img2>img.w{display:none}
	.ct_left .img{margin:0 20px 15px 0}
	.ct_right .img{margin:0 0 15px 20px;}
	.ct_pd_left{padding-left:0}
	.ct_pd_left .img{position:relative;text-align:center}
	.ct_pd_left .img>img {width:100%;}
	.ct_area p.line,
	.ct_area p.div{padding:0 15px}

	.list_dot.inline>li{display:block;}

	/*대학소개*/
	.welcome_message .message_info2{padding:0}
	.welcome_message .message_info2 h3{font-size:35px}
	.welcome_message .message_info2 .img{position:relative;}
	.welcome_message .message_info2 .img span{text-align:center;}
	.welcome_message .message_info2 .img span>img {width:auto;}
	.welcome_message .history dl{padding:0}
	.welcome_message .history dl dt{
		position:relative;top:0;
		width:auto;height:auto;
		padding:10px;text-align:center;
	}
	.welcome_history ul li{width:31.33%;min-height:auto;margin-bottom:30px}
	.welcome_status4 h3{width:170px;height:170px;padding-top:80px;background-size:auto 30px;background-position:center 30px;}
	.welcome_status4 .ct1 li,
	.welcome_status4 .ct2>li{display:block;width:80%;margin:0 auto 10px}
	.welcome_status4 .ct1 li+li,
	.welcome_status4 .ct2>li+li{margin:0 auto}
	.welcome_status4 .ct1 li+li:before,
	.welcome_status4 .ct2>li:before,
	.welcome_status4 .ct2>li:after{display:none}
	.welcome_status4 .ct2{padding-top:0}
	.presidents_message div{position:relative;top:0;max-width:80%;margin:0 auto}
	.presidents_message div p img{height:35px}
	.presidents_message dl{padding:12px 0 0 17px;background-size:35px auto;}
	.presidents_message dl dt{font-size:28px}
	.presidents_message dl dd{font-size:20px}
	.presidents_message>p{margin:15px 0 0 17px}
	#presidents_message{height:auto;padding:30px;box-sizing:border-box;}
	#presidents_message dt{padding-top:0;font-size:16px}
	#presidents_message dt b{font-size:28px}
	#presidents_message dd a{max-width:45%;height:35px;line-height:35px;font-size:15px}
	#presidents_message dd a:before{width:20px;background-size:12px auto}

	.message_info dl{float:none;max-width:100%;padding:13px 0 20px 20px;margin-top:0;background-size:25px auto;}
	.message_info dl dt b{font-size:30px;letter-spacing:-2px}
	.message_info dl dd:before{margin:20px 0}
	.message_info>img{float:none;display:block;margin:0 auto}
	.presidents_message2 .img img{max-width:80%}
	.presidents_message2 .ct1{width:100%;padding:20px;margin-bottom:30px}
	.presidents_message2 .ct2,
	.presidents_message4 .ct2,
	.presidents_message5 .ct2,
	.status_test_effect .ct2{padding-left:0;min-height:auto}
	.presidents_message2 .ct2 h4,
	.presidents_message4 .ct2 h4,
	.presidents_message5 .ct2 h4,
	.status_test_effect .ct2 h4{position:relative;top:0;width:auto;height:auto;padding:10px;text-align:center;}
	.presidents_message2 .ct2 h4 em,
	.presidents_message2 .ct2 h4 span,
	.presidents_message4 .ct2 h4 span,
	.status_test_effect .ct2 h4 em,
	.status_test_effect .ct2 h4 span{display:inline;padding:0 3px;font-size:16px}
	.presidents_message5 .ct2 h4 em,
	.status_test_effect .ct2 h4 em{padding-right:5px;font-size:17px;}
	.status_test_effect .ct2+.ct2{margin:25px 0 0;padding-top:0}
	.status_test_effect .ct2+.ct2 h4{margin-bottom:20px}

	.presidents_message3 .message_info,
	.presidents_message5 .message_info {min-height:350px;padding:0;/*background-color:#f2f1ec;background-size:100% auto;background-position:0 bottom*/}
	.presidents_message3 .ct1{column-count:1;padding:0 10px;}
	/*.presidents_message5 .message_info{background-color:#fefefe}*/

	.presidents_message3 .message_info .photo,
	.presidents_message5 .message_info .photo {float:none;margin:0 auto 40px;}
	.presidents_message3 .message_info dl,
	.presidents_message5 .message_info dl {float:none;max-width:355px;margin:0 auto;}

	.presidents_message5 .img2 img{max-width:60% !important}

	.presidents_interview h3{padding-bottom:30px;font-size:15px}
	.presidents_interview h3 b{padding:10px 0 0 18px;background-size:25px auto;font-size:30px}
	.presidents_interview div{height:auto;padding:200px 0 0 !important}
	.presidents_interview div p{left:0;right:auto;width:100%;height:200px}
	.presidents_interview div dl{padding:30px 30px 50px}

	.presidents_profile .history li{padding:10px 0 !important}
	.presidents_profile .history li b{position:relative;display:block;margin-bottom:10px}

	.cau2030 .diagram01 {text-align:left;}
	.cau2030 .diagram01 dl {overflow:hidden;width:100%;max-width:none;}
	.cau2030 .diagram01 dl+dl {margin:20px 0 0;}
	.cau2030 .diagram01 dl dt {float:left;width:180px;height:180px;margin-top:15px;padding-top:20px;border-radius:90px;}
	.cau2030 .diagram01 dl dt>strong {font-size:17px;line-height:19px;letter-spacing:-1px;}
	.cau2030 .diagram01 dl dd {float:left;width:calc(100% - 210px);min-height:210px;margin:0 0 0 30px;}
	.cau2030 .diagram01 dl dd::before {left:-16px;top:85px;transform:rotate(90deg);}
	.cau2030 .diagram02 dl {overflow:hidden;width:100%;max-width:none;}
	.cau2030 .diagram02 dl+dl {margin:20px 0 0;}
	.cau2030 .diagram02 dl dt {padding-top:100px;background-position:50% 27px !important;}
	.cau2030 .diagram02 dl dd {width:100%;min-height:auto;padding-bottom:15px;text-align:center;}
	.cau2030 .diagram02 dl dd ul {display:inline-block;}
	.cau2030 .diagram03 dt>p {width:180px;height:180px;padding-top:25px;border-radius:90px;z-index:1;}
	.cau2030 .diagram03 .unit01 {display:block;}
	.cau2030 .diagram03 .unit01::before,
	.cau2030 .diagram03 .unit01::after {display:none;}
	.cau2030 .diagram03 .unit02 {margin-left:auto;}
	.cau2030 .diagram03 .unit02::before {display:none;}
	.cau2030 .diagram03 .unit03 {margin-left:40px;}
	.cau2030 .diagram03 .unit03::before {left:-40px;top:50%;bottom:auto;width:40px;height:1px;background:url(../img/about/line_h2px.png) repeat-x;}
	.cau2030 .diagram03 .unit03::after {display:none;}
	.cau2030 .diagram03 dd ul::before {left:50%;top:auto;bottom:0;width:1px;height:700px;margin:auto;background:url(../img/about/line_v2px.png) repeat-y;}
	.cau2030 .diagram03 dd li {width:100%;}
	.cau2030 .diagram03 dd li+li {margin:20px 0 0;}
	.cau2030 .diagram03 dd li br {display:none;}
	.cau2030 .diagram04 dl {overflow:hidden;width:100%;max-width:none;}
	.cau2030 .diagram04 dl+dl {margin:40px 0 0;}
	.cau2030 .diagram04 dl dt {float:left;width:180px;}
	.cau2030 .diagram04 dl dd {float:left;width:calc(100% - 180px);min-height:210px;}
	.cau2030 .diagram04 dl dd .list_process li {width:100%;min-height:auto;}
	.cau2030 .diagram04 dl dd .list_process li>p {padding:15px 20px;}

	.history_profile ul li{padding:0}
	.history_profile ul li img{position:relative;}
	.history_profile ul li dl{padding:10px 10px 0}
	.history_profile ul li dd{font-size:14px}

	.history_introduction .ct_pd_left{padding-left:0}
	.history_introduction .ct1{float:none;width:100%;max-width:330px;margin:0 auto 15px}
	.history_identity .tit_black{margin-top:0}
	.history_identity .ct1{padding-bottom:10px;margin-bottom:40px}
	.history_identity .ct3 dl{width:40%;padding:20px 10px}
	.history_identity .ct3 div.ct3_b p{padding-left:0px}

	.yearbook ul li{max-width:48%;margin-bottom:10px}
	.yearbook ul li a b{font-size:15px;}

	.introduction_symbols .ct_pd_left .img>img {width:100%;}
	.introduction_symbols .ct1{padding:20px 0 0}
	.introduction_symbols .ct1 .color{position:relative;margin:0 auto}
	.introduction_symbols .ct2 .btn a{width:100%;margin-top:5px}
	.introduction_ui.ui1 .ct1 .img.line {width:43%;}
	.introduction_ui.ui1 .ct4 dl,
	.introduction_ui.ui1 .ct2>div,
	.introduction_ui.ui1 .ct3>div{display:block;width:100%;margin:20px 0 0}
	.introduction_ui.ui1 .ct4 dl:nth-child(odd),
	.introduction_ui.ui1 .ct2>div:nth-child(odd),
	.introduction_ui.ui1 .ct3>div:nth-child(odd){margin:20px 0 0}
	.introduction_ui.ui3 .btn_c a{width:100%}
	.introduction_ui.ui3 .btn_c a+a{margin:10px 0 0}
	.introduction_ui.ui3 p.img.line{padding:0;font-size:0}
	.introduction_ui.ui5 .ct1,
	.introduction_ui.ui6 .ct1{padding:0}
	.introduction_ui.ui5 .ct1 .img,
	.introduction_ui.ui6 .ct1 .img{position:relative;}

	.campus_roadmap .info p{position:relative;}
	.campus_roadmap .info p span{display:block;}
	.campus_roadmap .info p span+span:before{display:none}
	.campus_roadmap .ct3>img{display:none}
	.campus_roadmap .ct3 span{display:block}
	.introduction_ui.ui5 .ct2 p, .introduction_ui.ui5 .ct3 div, .introduction_ui.ui5 .ct4 p, .introduction_ui.ui6 .ct2 div, .introduction_ui.ui6 .ct4 p{width:100%}
	.introduction_ui.ui5 .ct2 p:nth-child(odd), .introduction_ui.ui5 .ct3 div:nth-child(odd), .introduction_ui.ui5 .ct4 p:nth-child(even), .introduction_ui.ui6 .ct2 div:nth-child(even), .introduction_ui.ui6 .ct4 p:nth-child(even){margin-left:0}
	.introduction_ui.ui5 .btn_c a,
	.introduction_ui.ui6 .btn_c a{width:100%;margin-bottom:5px}

	.history_introduction .spirit_img02 {display:block;float:none;margin:0 auto 20px;}

	.history_list h3{padding-right:50px;}
	.history_list.on h3:after{width:20px;}
	.history_list.on h3{font-size:25px}
/*
	.organizationChart h2{width:180px;height:180px;padding-top:90px;background-size:auto 45px;font-size:18px;	}
	.organizationChart div.chart1{padding-bottom:50px;}
	.organizationChart div.chart1 ul{width:46%;}
	.organizationChart div.chart1 ul li{padding:10px;line-height:1.2em;font-size:14px;}
	.organizationChart div.chart2 div>ul:before{width:6%}
	.organizationChart div.chart2 div:after{display:none}
	.organizationChart div.chart2 div>ul{max-width:96%}
	.organizationChart div.chart2 h3,
	.organizationChart div.chart2 h3+h4{max-width:40%}
	.organizationChart div.chart2 h4{margin:0 0 20px;width:100%}
	.organizationChart div.chart2 h3:after,.organizationChart div.chart2 h3.last:after{
		content:'';
		position:absolute;top:100%;left:50%;
		display:block;width:1px;height:20000%;
		background:#dddfe5
	}
	.organizationChart div.chart2 h3.last:after{background:#fff}
	.organizationChart div.chart2:after,
	.organizationChart div.chart2 h4:before{display:none} */

	.welcome_status3 div p{padding-bottom:40px}
	.welcome_status3 div img{position:relative;top:0;display:block;width:50%;margin:0 auto}
	.welcome_status3 div:nth-child(odd),
	.welcome_status3 div:nth-child(even){padding:0}
	.welcome_status3 div dl:before{left:0px}
	.welcome_status3 div:nth-child(even){text-align:left}
	.welcome_status3 div:nth-child(even) dt{padding-left:35px}
	.welcome_status3 div:nth-child(even) dt:after{right:auto;left:-5px}
	.welcome_status3 div:nth-child(even) dd b{right:auto;left:35px;}
	.welcome_status3 div:nth-child(even) dd:before{right:auto;left:105px}
	.welcome_status3 div:nth-child(even) dd{padding:0 0 0 120px}

	.status_rule_wrap .menu li{width:50%}
	.status_rule_wrap .menu li a{height:40px;line-height:40px;}
	.status_rule_wrap .status_rule div ul li b,
	.status_rule_wrap .status_rule div ul li a{font-size:15px;letter-spacing:-1px}

	.status_rule_wrap .status_revision .revision_list li {width:100% !important;}
	.status_rule_wrap .status_revision .revision_list li:nth-child(2n) {border-left:none;}

	.status_test_effect .ct1{padding-bottom:10px;margin-bottom:40px;}

	.attached_tab1 .btn_home{position:relative;margin:0}
	.attached_tab1 .ct_right .btn_home{right:auto}
	.attached_tab3 .ct{padding-left:0}
	.attached_tab3 .ct .img{position:relative;text-align:center}
	.attached_tab3 .ct .img>img {width:100%;}

	.list_goals ul{width:180px;margin:-12px auto 0;}
	.list_goals h4{font-size:25px}
	.list_goals ul li{display:block;width:180px;margin:0 auto}
	.list_goals ul li+li{margin:20px auto 0}

	.administration_tab1_5 .ct{padding:15px 10px}
	.administration_tab1_5 .ct span{display:block;line-height:1.5em}
	.administration_tab1_5 .ct b{font-size:30px}

	.tuition2 .ct_right h5+ul.list_dot li:nth-child(1){padding-right: 0;}
	.tuition2 .ct_right h5+ul.list_dot li p.img{position: static;right: auto;top: auto;}

	/*대학/대학원*/
	.academics_main div{padding:0}
	.academics_main div .img{display:none}
	.academics_main div+div{margin-top:40px;padding-top:40px;border-top:1px solid #cdccd3}
	.academics_main div dt{font-size:23px}
	.academics_main div p{position:relative;margin-top:15px}

	.academics_intro .info{min-height:auto;padding:0 0 25px}
	.academics_intro .info .img{display:none}
	.academics_intro .list_goals_info{padding:25px 0}
	.academics_intro .list_goals_info li img,
	.academics_intro .list_goals_info2 li img{height:30px}
	.academics_intro .list_goals_info li b{font-size:15px;word-break:break-all}
	.academics_intro .list_goals_info2 li{padding:20px 0}
	.academics_intro .list_goals_info2 li>span{position:relative;width:100%;margin:0}
	.academics_intro .training_goal dd {width:100%;}
	.academics_intro .box_certification {margin-bottom:25px;}
	.academics_intro .list_major{padding:40px 20px 0;margin:0 -20px}
	.academics_intro .list_major h4{font-size:20px}
	.academics_intro .list_major ul li a b{font-size:15px}
	.academics_university .list_major_main>li{padding:0}
	.academics_university .list_major_main>li img{position:relative;display:block;width:100%;margin:0 auto 20px}


	/*연구/산학*/
	.research_status ul li{display:block;width:100%;padding:15px 60px 15px 15px}
	.research_status ul li:nth-child(even){border-left:0;background:#f7f7f7}

	.research_status2 ul li img{height:30px;border:0;margin:0 auto;}
	.research_status2 ul li b{
		position:relative;left:0;top:0;
		display:block;
		margin:0;
		text-align:center;
	}
	.research_status2 ul li b:before{
		content:'';
		display:block;width:25px;height:1px;
		margin:10px auto;
		background:#dddfe5
	}

	.researchstatus .img2>img {display:none;}
	.researchstatus .img2 .img_m {display:block;}

	/*대학생활*/
	.calendar_head h2{margin-bottom:20px;font-size:40px;}
	.calendar_head button{background-size:auto 60%;margin-top:5px;}
	.calendar_head p{position:relative;top:0;padding:10px 0 15px;}
	.calendar_head ul li{width:8.33%;padding:10px 0;}
	.calendar_head ul li a{width:100%;height:35px;line-height:35px;border-radius:0;font-size:18px;}
	.calendar_list{padding:30px 0 30px;}
	.calendar_list>div{position:relative;max-width:400px;width:100%;margin:0 auto 30px;}
	.calendar_list>div h3 b{font-size:50px;}
	.calendar_list>div h3:after{display:none}
	.calendar_list>ul li{padding:0;font-size:16px;}
	.calendar_list>ul li time{position:relative;top:0;display:block;}
	.calendar_summary{padding:0;}
	.calendar_summary h3{position:relative;top:0;width:100%;margin:0;padding:20px 0}
	.calendar_summary ul{border-top:1px solid #dddfe5;border-left:0;}
	.calendar_summary ul li{padding:0 0 15px;}
	.calendar_summary ul li time{position:relative;width:100%;display:block;padding-left:20px;border:0;background-position:0 18px;}
	.campusinfo_undergraduate ul{width:100%;margin:0}
	.campusinfo_undergraduate ul li{display:block;width:100%;min-height:50px !important;margin:0 0 15px;}
	.campusinfo_undergraduate ul li dt{font-size:20px;}

	.campusinfo_activities6 div.ct li{width:100%}
	.campusinfo_regulations div{margin:0 -20px 20px}
	.campusinfo_regulations div a{position:relative;left:0;bottom:0;margin-bottom:20px}

	.campus_roadmap .ct2 li{display:block;position:relative;padding-left:55px}
	.campus_roadmap .ct2 li>img{position:absolute;left:0}
	.list_life3>li{min-height:50px;padding-left:0;}
	.list_life3>li+li{margin-top:30px;padding-top:30px;border-top:1px solid #ddd}
	.list_life3>li>img{position:relative;display:block;margin:0 auto;}

	.life_main time{position:relative;margin:0 0 10px}

	.life_list ul li{padding:20px 0}
	.life_list ul li img{position:relative;top:0;margin:0 auto 15px;}

	.activities_tab_area .list_tab_wrap{margin:0}
	.activities_list ul li{width:31.33% !important}
	.activities5 h4 span{position:relative;display:block;margin-top:10px}

	.activities6 .ct2_a ul,
	.activities6 .ct2_b {width:100%;margin-left:0;}
	.activities6 .ct2_a ul li,
	.activities6 .ct2_b p {float:none;width:auto;margin:0 auto 5px;}

	.activities6 .ct2 p {display:block;}
	.activities6 .ct2 p img {width:100%;}

	.smartID1 iframe{height:300px}
	.smartID1 .ct1{padding:0 30px;margin-top:20px;text-align:left}
	.smartID1 .ct1 li{position:relative;max-width:100% !important;top:0 !important;left:0 !important;bottom:0 !important;right:0 !important;margin:0 !important}
	.smartID1 .ct1 li b{display:inline-block;padding-right:5px}

	.smartID3 .ct1{padding:0;margin-top:30px}
	.smartID3 .ct1 p{position:relative;width:100%;}
	.smartID3 .ct1 p img{margin:0 auto 10px}

	.cyber .ct1,
	.policy_email .ct1{
		padding:80px 20px 20px;
		background-position:center 25px;background-size:auto 30px;
	}
	.researchstatus_grap table{min-width:100%}
	.researchstatus_grap colgroup,
	.researchstatus_grap thead{display:none}
	.researchstatus_grap tr,
	.researchstatus_grap th,
	.researchstatus_grap td{display:block;width:100%}
	.researchstatus_grap td{box-sizing:border-box;padding:10px;}
	.researchstatus_grap td.al{padding:10px}
	.researchstatus_grap td.al p{position:relative;top:0;right:0;width:100%;margin-top:10px}

	.list_life_normal li,
	.activities6 .ct1 li{width:48%}

	.cyber .certification li {width:100%;min-height:auto;}
	.cyber .certification li+li {margin:10px 0 0;}
	.cyber .certification li>div {padding-top:100px !important;background-position:50% 25px !important;}

	.admin_service .service_list li {float:none;width:100%;height:auto;margin-left:0 !important;padding-bottom:35px;}

	/*캠퍼스맵*/
	#campusmap .list_option{height:auto}
	#campusmap .list_option .searchBox .search{width:calc(100% - 110px)}
	.campusmap_tab{position:relative;}
	.campusmap_tab li{margin:0 0 10px;width:48%}
	.campusmap_tab li+li{margin-left:4%}
	.campusmap_tab li a{display:block;border-color:#c0c2ce}
	#campusmap #map_area{clear:both}
	#campusmap #map_area div p{overflow:auto}
	#campusmap #map_area div p img{display:block;width:100%;max-width:1310px}
	#campusmap #map_area div button{position:absolute;top:0;right:0;display:block;width:50px;height:50px;background:rgba(255,255,255,0.8);}
	#campusmap #map_area div button:before,
	#campusmap #map_area div button:after{
		content:'';
		position:absolute;top:50%;left:30%;
		display:block;width:40%;height:2px;
		margin-top:-1px;
		background:#000;
		transition:.3s
	}
	#campusmap #map_area div button:after{transform:rotate(-90deg)}
	#campusmap #map_area div button.plus:after{transform:rotate(0deg)}
	#campusmap #map_list .facilities_sub{padding-bottom:10px}
	#campusmap #map_list .facilities_sub ul li{display:block;width:100%;padding-left:90px}
	#campusmap #map_list .facilities_sub ul li i{width:auto;margin-top:-4px}
	#campusmap #map_list .facilities_sub ul li i em{position:relative;top:0;left:0;display:inline-block;width:55px;height:25px;line-height:25px;text-align:center;font-size:12px}
	#campusmap #map_list .facilities_sub ul li i em:after{display:none}
	#campusmap .facilities_detail{padding:0 0 20px}
	#campusmap .facilities_detail .slick-slider{position:relative;top:0;left:0;width:100%}
	#campusmap .facilities_detail .slick-slider .slick-slide{width:auto;}
	#campusmap .facilities_detail .slick-dots{padding:15px 10px 10px 0;text-align:right}
	#campusmap .facilities_detail h3,
	#campusmap .facilities_detail p{padding:0 20px}
	#campusmap .facilities_detail .close{position:absolute;top:0;right:0;display:block;width:50px;height:50px;background:url(/cau/img/about/caupusmap/close.png) no-repeat center;background-size:40% auto;font-size:0}

	.list_tab a:hover,
	.list_tab_wrap div a:hover{color:#ffffff;}

	.organizationChart div.last:after{content: none;}

	/* 영예의 전당 */
	.glory_history .tit_black {margin: 40px 0 10px;}
	.glory_history .gloryList>ul {width:calc(100% + 10px); margin-left:-10px;}
	.glory_history .gloryList>ul>li {width:calc(33.333% - 10px);margin-left:10px;vertical-align: top;}
	.glory_history .gloryList>ul>li:nth-child(n+6) {margin-top:0px;}
	.glory_history .gloryList>ul>li:nth-child(n+4) {margin-top:10px;}
	.glory_history .gloryList>ul>li p.name>span {display:block;}


}

@media all and (max-width:660px){
	.introduction_ui.ui1 .ct1 .img.line {width:100%;box-sizing:border-box;}
	.introduction_ui.ui1 .ct1 .img.line+.img.line {margin-left:auto;}
}

@media all and (max-width:460px){
	.cau2030>.tit {margin-bottom:30px;}
	.cau2030>.tit>h3 {font-size:30px;line-height:34px;}
	.cau2030>.tit>p {font-size:18px;line-height:22px;}
	.cau2030>h4 {margin-bottom:30px;}
	.cau2030>.grpTit>strong {font-size:28px;line-height:30px;}
	.cau2030 .diagram01 {margin-bottom:30px;}
	.cau2030 .diagram01 dl dt {float:none;width:150px;height:150px;padding-top:15px;border-radius:75px;}
	.cau2030 .diagram01 dl dt>strong {padding-top:75px;}
	.cau2030 .diagram01 dl dd {float:none;width:100%;min-height:auto;margin:30px 0 0;}
	.cau2030 .diagram01 dl dd::before {left:50%;top:-30px;transform: none;}
	.cau2030 .diagram02 {margin-bottom:30px;}
	.cau2030 .diagram03 {margin-bottom:30px;}
	.cau2030 .diagram03 dt>p {width:130px;height:130px;}
	.cau2030 .diagram03 dt>p>strong {padding-top:40px !important;background-size:auto 30px !important;font-size:18px;line-height:20px;}
	.cau2030 .diagram03 dt>p>strong>span {font-size:18px;line-height:20px;}
	.cau2030 .diagram03 dt>p>span {margin-top:5px;}
	.cau2030 .diagram03 dd ul::before {height:520px;}
	.cau2030 .diagram03 .unit03 {margin-left:15px;}
	.cau2030 .diagram03 .unit03::before {left:-15px;width:15px;}
	.cau2030 .diagram04 {margin-bottom:30px;}
	.cau2030 .diagram04 dl dd {width:calc(100% - 150px);}
	.cau2030 .diagram04 dl dt {float:none;width:150px;height:auto;margin:0 auto 20px;padding:5px 10px 0 55px;font-size:21px;line-height:23px;}
	.cau2030 .diagram04 dl>dt>span {margin-bottom:0;font-size:13px;line-height:17px;}
	.cau2030 .diagram04 dl dt img {width:55px;}
	.cau2030 .diagram04 dl dd {float:none;width:100%;}
	.cau2030 .diagram04 .wayEnd {font-size:17px;}

	.welcome_history ul li{width:48%}
	.welcome_history ul li dd{font-size:14px}
	.academics_intro .list_major ul li{width:48%}
	.activities_list ul li{width:48% !important}
	.smartID1 iframe{height:200px}
	.policy .sel select{width:100%}

}

@media all and (max-width:420px){
	.ct_tab li {display:table;width:calc(50% - 2px);}

	.admin_service .imgTit {height:auto;margin-bottom:15px;padding:10px 0 0;background:none;}
	.admin_service .imgTit .tit {font-size:29px;line-height:31px;letter-spacing:-1px;}
}

@media all and (max-width:360px){
	.policy .policy_opt>.sel_tit {padding:0 20px 0 5px;background-position:right 5px top 50%;letter-spacing:-2px;}
	.policy .sel select {padding:0 22px 0 6px;background-position:right 7px top 50%;letter-spacing:-2px;}
}


/*영예중앙인 추가 20191212*/

.glory_cau ul{width:104%;margin-left:-2%;overflow:hidden;}
.glory_cau ul li{
	float:left;width:18%;min-height:350px;
	margin-left:2%
}
.glory_cau ul li img{display:block;border:1px solid #dadce3;font-size:0}
.glory_cau ul li dl{
	padding:10px 0 5px 18px;margin-top:20px;
	background:url(../img/about/presidents.png) no-repeat;
}
.glory_cau ul li dl dt{
	padding-bottom:5px;
	font-family: 'Noto Sans KR';font-size:17px;font-weight:500;color:#000
}
.glory_cau ul li dl dd{font-size:15px;line-height:1.7em;letter-spacing:-1px}
.glory_cau ul li dl dd:last-child{letter-spacing:-1.2px}
.glory_cau ul li dl .add{line-height:1.3em}
.glory_cau2 ul li{min-height:320px;}
.glory_cau3 ul li img{width:100%}
.glory_cau3 .last{max-height: 201px; object-fit: cover;}


@media all and (max-width:1045px){
	.glory_cau ul li{min-height:390px;}
	.glory_cau2 ul li{min-height:360px;}
	.glory_cau4 ul li {min-height:350px}
}

@media all and (max-width:900px){
	.glory_cau2 ul li {min-height:340px}
}

@media all and (max-width:840px){
		.glory_cau4 ul li {min-height:320px}
}

@media all and (max-width:760px){
	.glory_cau ul li{width:23%;min-height:375px;;margin-bottom:10px;}
	.glory_cau2 ul li {min-height:330px}
	.glory_cau3 ul li img{width:85%}
	.glory_cau4 ul li {min-height:300px}
}

@media all and (max-width:680px){

	.glory_cau2 ul li {min-height:315px}
	.glory_cau4 ul li {min-height:280px}
}

@media all and (max-width:580px){
	.glory_cau3 ul li {min-height:280px}
}

@media all and (max-width:550px){
	.glory_cau ul li{width:31%;}
	.glory_cau2 ul li {min-height:330px}
	.glory_cau3 ul li {min-height:320px}
	.glory_cau4 ul li {min-height:290px}
}

@media all and (max-width:460px){
	.glory_cau ul li{width:48%;min-height:380px}
	.glory_cau ul li dd{font-size:14px}
	.glory_cau2 ul li{min-height:350px}
	.glory_cau3 ul li {min-height:350px}
}

@media all and (max-width:400px){
	.glory_cau3 ul li {min-height:330px}
	.glory_cau4 ul li {min-height:310px}

}


</style>
</head>
<body>
<div class="list_tab_wrap">
			<button>증명서 발급안내</button>
			<ul class="list_tab tab3 parentTab" style="display: block;">
				
					
					
					
						
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="on" title="증명서 발급안내:선택됨" data-contno="2" data-subcnt="0" data-pageviewyn="N">증명서 발급안내</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="인터넷 발급" data-contno="3" data-subcnt="0" data-pageviewyn="N">인터넷 발급</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="우편신청" data-contno="4" data-subcnt="0" data-pageviewyn="N">우편신청</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="무인증명발급기" data-contno="5" data-subcnt="0" data-pageviewyn="N">무인증명발급기</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="행정기관 FAX민원" data-contno="6" data-subcnt="0" data-pageviewyn="N">행정기관 FAX민원</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="방문 신청" data-contno="7" data-subcnt="0" data-pageviewyn="N">방문 신청</a>							
						
						
					</li>
				
					
					
					
					<li>
						
							<a href="#" onclick="fn_contentInfo(this,1)" class="" title="원본진위확인" data-contno="8" data-subcnt="0" data-pageviewyn="N">원본진위확인</a>							
						
						
					</li>
				
			</ul>
			<div id="sub_tab" style="display:none;">
				<ul id="sub_tab_list">
				</ul>
			</div>
		</div>

<article class="ct_area">
   <h3 class="tit_line mt0">증명서 발급안내</h3>
   <h4 class="tit_blue">발급 증명서 현황</h4>
   <div class="table_wrap">
      <table class="table_normal">
         <caption>유형, 증명서, 발급대상, 발급언어, 발급료, 발급방법 항목에 따른 발급 증명서 현황</caption><colgroup><col width="20%"><col width="30%"><col width="12%"><col width="12%"><col width="12%"><col width="24%"></colgroup>
         <thead>
            <tr>
               <th scope="col" class="no_line_b">유형</th>
               <th scope="col" class="no_line_b">증명서</th>
               <th scope="col">발급대상<br>(학부/<br>대학원)</th>
               <th scope="col">발급언어</th>
               <th scope="col">발급료</th>
               <th scope="col">발급방법</th>
               </tr>
            </thead>
         <tbody>
            <tr>
               <th rowspan="14">학적 및 성적 관련</th>
               <th class="al">졸업증명서</th>
               <td rowspan="3">학부</td>
               <td rowspan="2">국/영문</td>
               <td rowspan="13">유료</td>
               <td rowspan="17">
                  <a href="https://mportal.cau.ac.kr/" target="_blank">mportal.cau.ac.kr</a><br><br>인터넷증명발급<br><br>무인증명발급기
               </td>
               </tr>
            <tr>
               <th class="al">졸업예정증명서 *</th>
               </tr>
            <tr>
               <th class="al">복학예정증명서* </th>
               <td>국문</td>
               </tr>
            <tr>
               <th class="al">재적증명서* </th>
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
               <th class="al">법학과목학점취득확인서 </th>
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
               <th class="al" rowspan="2">공학교육인증프로그램 <br>이수예정확인서</th>
               <td rowspan="5">학부</td>
               </tr>
            <tr>
               <td rowspan="10">
                  <a href="https://mportal.cau.ac.kr/" target="_blank">mportal.cau.ac.kr</a>
               </td>
               </tr>
            <tr>
               <th class="al">공학교육인증프로그램 <br>이수확인서</th>
               </tr>
            <tr>
               <th rowspan="2">교과목 이수 관련</th>
               <th class="al">수강신청확인서 (본인 포탈)</th>
               <td>국문</td>
               </tr>
            <tr>
               <th class="al">교과목개요확인서* <br>(학사팀 문의)</th>
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
               <th class="al">장학추천서 <br>(학생지원팀 내방)</th>
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
               <td rowspan="3">
                  <a href="https://rainbow.cau.ac.kr" target="_blank">rainbow.cau.ac.kr</a>
               </td>
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
         <caption>증명서 종류에 따른 증명서 정보 표</caption><colgroup><col width="30%"><col width="*"></colgroup>
         <thead></thead>
         <tbody>
            <tr class="line_d">
               <th scope="row">졸업예정증명서</th>
               <td class="al">마지막 학차 재학생으로 취득학점이 당해 학기로 졸업을 할 수 있는 자. <br>(수료생은 학사팀 문의)</td>
               </tr>
            <tr>
               <th scope="col">복학예정증명서 </th>
               <td class="al">복학 직전학기 발급.</td>
               </tr>
            <tr>
               <th scope="col">재적증명서 </th>
               <td class="al">본교에 재적한 사실이 있는 자로, 제적자는 제적 사유 기재</td>
               </tr>
            <tr>
               <th scope="col">성적증명서</th>
               <td class="al">석차 요청 시 학사팀 내방(학부 및 일반대학원만 석차기재 가능)</td>
               </tr>
            <tr>
               <th scope="col">수료증명서(학부)</th>
               <td class="al">취득학점이 학직 59조에 해당하는 자.<br>(단, 4학년 수료증명서는 학적상태 수료일 경우만 발급)<br>2004학번 이전 제적자의 학년 수료증명서는 학사팀 문의</td>
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
            <li>변경 전후가 기재된 주민등록초본 원본 1부 및본인 신분증(우편신청 시 사본), 학적부기재사항정정신청서를 교무처 &nbsp;&nbsp;학사팀으로제출(우편신청 가능)</li>
            </ul>
         </li>
      </ul>
   <p class="mT5 mL10">
      <a class="btn_down" onclick="fileDown(this);" href="#;" data-filenm="학적부기재사항정정신청서.hwp" data-filesaved="upload/CMS/학적부기재사항정정신청서.hwp">학적부기재사항정정 신청서</a>
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
         <caption>구분, 관련 부서, 위치, 연락처 항목에 따른 증명서 관련 부서 연락처</caption><colgroup><col width="35%"><col width="20%"><col width="*"><col width="18%"></colgroup>
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
               <td class="al" rowspan="2">
                  <b>학생 관련 증명서/학생증 및 학번 문의</b>
               </td>
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
               <td class="al">
                  <b>교직원 관련 증명서 및 신분증</b>
               </td>
               <td class="al">인사팀</td>
               <td class="al">본관(201관) 1층</td>
               <td class="al">02)820-6067</td>
               </tr>
            <tr>
               <td class="al">
                  <b>등록금 관련 증명서</b>
               </td>
               <td class="al">재무회계팀</td>
               <td class="al">본관(201관) 1층</td>
               <td class="al">02)820-6072</td>
               </tr>
            <tr>
               <td class="al">
                  <b>장학 관련 증명서</b>
               </td>
               <td class="al">학생지원팀</td>
               <td class="al">학생회관(107관) 2층</td>
               <td class="al">02)820-6047</td>
               </tr>
            <tr>
               <td class="al">
                  <b>교직 관련 증명서</b>
               </td>
               <td class="al">교직팀</td>
               <td class="al">서라벌홀(203관) 5층</td>
               <td class="al">02)820-5080</td>
               </tr>
            <tr>
               <td class="al">
                  <b>레인보우시스템 관련</b>
               </td>
               <td class="al">다빈치인재개발원</td>
               <td class="al">100주년기념관(310관)2층</td>
               <td class="al">02)820-6054</td>
               </tr>
            <tr>
               <td class="al">
                  <b>공학인증관련 증명서</b>
               </td>
               <td class="al">공학교육혁신센터</td>
               <td class="al">100주년기념관(310관)3층</td>
               <td class="al">02)820-6536</td>
               </tr>
            <tr>
               <td class="al" rowspan="2">
                  <b>증명서 발급제한(도서미납) 관련</b>
               </td>
               <td class="al">학술정보원(서울)</td>
               <td class="al">중앙도서관(204관) 2층</td>
               <td class="al">02)820-6195~7</td>
               </tr>
            <tr>
               <td class="al">학술정보원(안성)</td>
               <td class="al">중앙도서관(901관) 3층</td>
               <td class="al">031)670-3450~2 </td>
               </tr>
            </tbody>
      </table>
      </div>
   </article>



</body>
</html>