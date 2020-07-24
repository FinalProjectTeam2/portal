<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<main role="main" class="flex-shrink-0">
<div class="container">

<title>식단메뉴</title>
<style type="text/css">
.food-portlet *{font-size:13px}
.food-portlet .food_section .food_tit{position:relative;z-index:0;height:32px;margin:20px 0}
.food-portlet .food_section .food_tit:after{display:block;clear:both;content:''}
.food-portlet .food_section .food_tit .date{position:relative;z-index:0;width:300px;height:32px;margin:0 auto;padding:0 32px;font-size:27px;line-height:32px;font-weight:600;letter-spacing:-2px;text-align:center}
.food-portlet .food_section .food_tit a span{visibility:hidden;position:absolute;z-index:-1}
.food-portlet .food_section .food_tit .btn_prev{display:block;overflow:hidden;position:absolute;top:0;left:0;z-index:10;width:32px;height:32px;background:url(../../images/Food/arw_food_prev.png) no-repeat 50% 50%}
.food-portlet .food_section .food_tit .btn_next{display:block;overflow:hidden;position:absolute;top:0;right:0;z-index:10;width:32px;height:32px;background:url(../../images/Food/arw_food_next.png) no-repeat 50% 50%}
.food-portlet .food_section .bg_gory_01{position:absolute;top:20px;left:0;z-index:0;width:30px;height:50px;background:url(../../images/Food/bg_food_gory.png) no-repeat 0 0}
.food-portlet .food_section .bg_gory_02{position:absolute;top:20px;right:0;z-index:0;width:30px;height:50px;background:url(../../images/Food/bg_food_gory.png) no-repeat 0 0}
.food-portlet .food_section .btn_this_week{position:absolute;top:10px;right:0;z-index:10}
.food-portlet .food_section .btn_this_week a{display:block;overflow:hidden;position:relative;z-index:0;width:80px;height:22px;background:url(../../images/Food/btn_this_week.png) no-repeat 50% 50%}
.food-portlet .food_section .food_write{width:100%;box-sizing:border-box}
.food-portlet .food_section .btn{float:right;margin-top:10px}
.food-portlet .food_list .tit_area{position:relative;z-index:0;margin:0 0 10px;background:#f1f6f9}
.food-portlet .food_list .tit_area:after{display:block;clear:both;content:''}
.food-portlet .food_list .tit_week{float:left;width:20%;height:40px;line-height:40px;font-weight:600;font-size:14px;text-align:center}
.food-portlet .food_section .tit_menu{float:left;width:80%;height:40px;line-height:40px;font-weight:600;font-size:14px;text-align:center}
.food-portlet .food_list textarea{resize:none}
.food-portlet .type_food{width:100%;margin:0 auto;border-collapse:inherit;border:1px solid #dfdfdf;box-sizing:border-box}
.food-portlet .type_food thead tr{display:none;position:absolute;top:-9999px;left:-9999px}
.food-portlet .type_food td{border-bottom:1px solid #dfdfdf}
.food-portlet .type_food th:nth-of-type(1){width:20%;padding:13px 0;background:#f1f6f9}
.food-portlet .type_food th:nth-of-type(2){width:80%;padding:13px 0;background:#f1f6f9}
.food-portlet .type_food td:nth-of-type(1){width:20%;padding:25px 10px 25px 25px;background:#f9f9f9}
.food-portlet .type_food td:nth-of-type(2){width:80%;padding:25px 15px 25px 30px}
.food-portlet .type_food .name_week{font-size:24px;line-height:20px;font-weight:600;color:#4485d5;word-wrap:break-word}
.food-portlet .type_food .name_date{margin-left:10px;font-size:16px;line-height:20px;color:#333;word-break:break-all}
@media only screen and (max-width:979px){.food-portlet .food_section .food_tit{height:auto}
.food-portlet .food_section .food_tit .date{width:200px;font-size:16px;letter-spacing:0}
.food-portlet .food_section .btn_this_week{float:right;position:relative}}
@media only screen and (max-width:760px),(min-device-width:768px) and (max-device-width:1024px){
.food-portlet .food_section table,.food_section thead,.food_section tbody,.food_section tr,.food_section th,.food_section td{display:block}
.food-portlet .food_section thead tr{position:absolute;top:-9999px;left:-9999px}
.food-portlet .food_section td{position:relative;padding-left:20%;border:0;border-bottom:1px solid #eee}
.food-portlet .food_section td:before{position:absolute;top:5px;left:5px;width:75%;padding-right:10px;white-space:nowrap}
.food-portlet .food_section td:nth-of-type(1):before{content:'요일'}
.food-portlet .food_section td:nth-of-type(2):before{content:'식단'}
.food-portlet .type_food td:nth-of-type(1){width:100%;padding:25px 10px 25px 25px;background:#f9f9f9;box-sizing:border-box}
.food-portlet .type_food td:nth-of-type(2){width:100%;padding:25px 15px 25px 30px;box-sizing:border-box}}

</style>

<div id="tuition1">

<div class="portlet-boundary portlet-boundary_Food_WAR_foodportlet_  portlet-static portlet-static-end portlet-borderless food-portlet " id="p_p_id_Food_WAR_foodportlet_">
<span id="p_Food_WAR_foodportlet"></span>
<div class="portlet-borderless-container" style="">
<div class="portlet-body">

<script type="text/javascript">

	function _Food_WAR_foodportlet_MovWeek(sYear, sWeekOfYear) {
		
		var f = document._Food_WAR_foodportlet_fm;
		f._Food_WAR_foodportlet_sYear.value = sYear;
		f._Food_WAR_foodportlet_sWeekOfYear.value = sWeekOfYear;
		f.submit();
	}

	function _Food_WAR_foodportlet_saveMessage() {
		var f = document._Food_WAR_foodportlet_fm;
		var url = "";
	
		url += "http://www.dankook.ac.kr/web/kor/-555?p_p_id=Food_WAR_foodportlet&p_p_lifecycle=1&p_p_state=normal&p_p_mode=view&p_p_col_id=column-2&p_p_col_pos=2&p_p_col_count=3&_Food_WAR_foodportlet_cmd=update&_Food_WAR_foodportlet_fooId=1538&_Food_WAR_foodportlet_action=view";
		submitForm(f, url);
	}

</script>

<div class="food_section"> 
	<form name="_Food_WAR_foodportlet_fm" action="http://www.dankook.ac.kr/web/kor/-555?p_p_id=Food_WAR_foodportlet&amp;p_p_lifecycle=0&amp;p_p_state=normal&amp;p_p_mode=view&amp;p_p_col_id=column-2&amp;p_p_col_pos=2&amp;p_p_col_count=3&amp;_Food_WAR_foodportlet_action=view" method="POST">
		<input type="hidden" id="_Food_WAR_foodportlet_sYear" name="_Food_WAR_foodportlet_sYear" value="2020"> 
		<input type="hidden" id="_Food_WAR_foodportlet_sWeekOfYear" name="_Food_WAR_foodportlet_sWeekOfYear" value="30"> 
		<div class="food_tit"> 
		
			<div class="date"> 2020.07.20 ~ 2020.07.25 
				<a href="#none" onclick="_Food_WAR_foodportlet_MovWeek(2020, 29)" class="btn_prev">
					<span>이전주로 이동</span>
				</a>
 				<a href="#none" onclick="_Food_WAR_foodportlet_MovWeek(2020, 31)" class="btn_next">
 					<span>다음주로 이동</span>
 				</a> 
			</div>

			<div class="btn_this_week"> 
				<a href="http://www.dankook.ac.kr/web/kor/-555?p_p_id=Food_WAR_foodportlet&amp;p_p_lifecycle=0&amp;p_p_state=normal&amp;p_p_mode=view&amp;p_p_col_id=column-2&amp;p_p_col_pos=2&amp;p_p_col_count=3&amp;_Food_WAR_foodportlet_action=view">
					<span>이번주</span>
				</a> 
			</div> 
		</div> 
		
		<div class="food_list"> 
			<div class="tit_area"> 
				<div class="tit_week">요일</div> 
				<div class="tit_menu">식단메뉴</div> 
				<div class="bg_gory_01"></div> 
				<div class="bg_gory_02"></div> 
			</div> 
		
			<table class="type_food" summary="요일, 식단메뉴"> 
				<thead> 
					<tr> 
						<th>요일</th> 
						<th>식단</th> 
					</tr> 
				</thead> 
				<tbody> 
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_mon">
								<span class="name_week">月</span>
								<span class="name_date">07월20일</span>
							</label>
						</td>
						 <td> ◎ 정식(중식/Lunch/ 11:00 ~ 13:30)<br>부대찌개,쌀밥,부추잡채,실치볶음,해초무침,김치<br><br>
						 * 상기 메뉴는 식자재 수불 상황에 따라 변경 될 수 있으며 조기 품절 될 수 있습니다.<br><br>
						 ※ 교직원식당 7/31(금) 운영 종료로 미사용 식권 환불 받고 있습니다.<br> 
						 환불기간: 7/20~31, 식권과 본인 통장 계좌 사본 지참 필요, 식당 사무실로 방문 부탁드립니다.<br> 
						 Tel) 031) 889-4350, E-mail: SF00381@shinsegae.com 
						 </td> 
 					</tr> 
 					<tr> 
						 <td>
							 <label for="_Food_WAR_foodportlet_tue">
								 <span class="name_week">火</span>
								 <span class="name_date">07월21일</span>
							 </label>
						 </td>
						<td> ◎ 정식(중식/Lunch/ 11:00 ~ 13:30)<br>
						모듬장조림,쌀밥,콩나물김치국,카레춘권튀김,실곤약초무침,깍두기<br><br>
						* 상기 메뉴는 식자재 수불 상황에 따라 변경 될 수 있으며 조기 품절 될 수 있습니다.<br><br>
						※ 교직원식당 7/31(금) 운영 종료로 미사용 식권 환불 받고 있습니다.<br> 
						환불기간: 7/20~31, 식권과 본인 통장 계좌 사본 지참 필요, 식당 사무실로 방문 부탁드립니다.<br> 
						Tel) 031) 889-4350, E-mail: SF00381@shinsegae.com 
						</td> 
					</tr>
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_wed">
								<span class="name_week">水</span>
								<span class="name_date">07월22일</span>
							</label>
						</td> 
						<td> ◎ 정식(중식/Lunch/ 11:00 ~ 13:30)<br>
						순대볶음, 쌀밥,다시마무국,연두부찜,콩나물겨자무침,김치<br><br>
						* 상기 메뉴는 식자재 수불 상황에 따라 변경 될 수 있으며 조기 품절 될 수 있습니다.<br><br>
						※ 교직원식당 7/31(금) 운영 종료로 미사용 식권 환불 받고 있습니다.<br> 
						환불기간: 7/20~31, 식권과 본인 통장 계좌 사본 지참 필요, 식당 사무실로 방문 부탁드립니다.<br> 
						Tel) 031) 889-4350, E-mail: SF00381@shinsegae.com 
						</td> 
					</tr> 
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_thu">
								<span class="name_week">木</span>
								<span class="name_date">07월23일</span>
							</label>
						</td> 
						<td> ◎ 정식(중식/Lunch/ 11:00 ~ 13:30)<br>
						닭갈비,쌀밥,팽이계란국,열무된장나물,상추무침,깍두기<br><br>
						* 상기 메뉴는 식자재 수불 상황에 따라 변경 될 수 있으며 조기 품절 될 수 있습니다.<br><br>
						※ 교직원식당 7/31(금) 운영 종료로 미사용 식권 환불 받고 있습니다.<br> 
						환불기간: 7/20~31, 식권과 본인 통장 계좌 사본 지참 필요, 식당 사무실로 방문 부탁드립니다.<br> 
						Tel) 031) 889-4350, E-mail: SF00381@shinsegae.com 
						</td> 
					</tr> 
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_fri">
								<span class="name_week">金</span>
								<span class="name_date">07월24일</span>
							</label>
						</td> 
						<td> ◎ 정식(중식/Lunch/ 11:00 ~ 13:30)<br>
						하이라이스,유부장국,단호박고로케,푸실리토마토샐러드,김치<br><br>
						* 상기 메뉴는 식자재 수불 상황에 따라 변경 될 수 있으며 조기 품절 될 수 있습니다.<br><br>
						※ 교직원식당 7/31(금) 운영 종료로 미사용 식권 환불 받고 있습니다.<br> 
						환불기간: 7/20~31, 식권과 본인 통장 계좌 사본 지참 필요, 식당 사무실로 방문 부탁드립니다.<br> 
						Tel) 031) 889-4350, E-mail: SF00381@shinsegae.com 
						</td> 
					</tr> 
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_sat">
								<span class="name_week">土</span>
								<span class="name_date">07월25일</span>
							</label>
						</td> 
						<td> 운영 없음 </td> 
					</tr> 
					<tr> 
						<td>
							<label for="_Food_WAR_foodportlet_remarks">
								<span class="name_date">비고</span>
							</label>
						</td>
						<td>
						</td> 
					</tr> 
				</tbody> 
			</table> 
		 </div> 
 	</form> 
 </div> 
 </div> 
 </div> 
 </div>
</div>
<%@ include file="../inc/bottom.jsp"%>