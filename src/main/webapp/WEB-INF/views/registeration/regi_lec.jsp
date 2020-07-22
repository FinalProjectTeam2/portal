<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/regi_lec.css'/>">
<script type="text/javascript">
	
</script>

	<div class="content-panel">
		<div class="pnl-search">
			<table>
				<colgroup>
					<col width="60px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 년도 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 학기 -->
					<col width="80px;">
					<!-- 대학 -->
					<col width="150px;">
					<!-- 대학 -->
					<col width="80px;">
					<!-- 학과 -->
					<col width="150px;">
					<!-- 학과 -->
					<col width="80px;">
					<!-- 강좌명 -->
					<col width="150px;">
					<!-- 강좌명 -->
					<col width="70px;">
					<!-- 조회 -->
				</colgroup>
				<!--  H : 학부 ,  D : 대학원 -->

				<tbody>
					<tr>
						<th id="hide1">년도</th>
						<td><select name="p_year" id="p_year"
							onchange="initDaehakCombo();initMajorCombo();this.blur();"
							style="width: 100%">

								<option value="2020" selected="">2020</option>

								<option value="2019">2019</option>

								<option value="2018">2018</option>

								<option value="2017">2017</option>

						</select></td>
						<th id="hide2">학기</th>
						<td id="hide3"><select name="p_term" id="p_term"
							onchange="initDaehakCombo();initMajorCombo();this.blur();"
							style="width: 100%">
								<option value="10" selected="">1학기</option>
								<option value="20">2학기</option>
								<option value="15">&gt;여름계절</option>
								<option value="25">&gt;겨울계절</option>
						</select></td>
						<th id="hide4">대학</th>
						<td><select name="p_daehak" id="p_daehak"
							onchange="initMajorCombo();this.blur();" style="width: 100%"><option
									value="A01008">문과대학</option>
								<option value="A00400">법과대학</option>
								<option value="A06895">아트퓨전디자인대학원</option></select></td>
						<th id="hide5">학과</th>
						<td><select name="p_major" id="p_major"
							onchange="initSbjtTeach();this.blur();" style="width: 100%"><option
									value="A01010">문과대학 국어국문학과 국어국문학</option>
								<option value="A01012">문과대학 사학과 사학</option>
								<option value="A01015">문과대학 철학과 철학</option>
								<option value="A07302">문과대학 응용영어통번역학과 응용영어통번역학</option>
								<option value="A07315">문과대학 영어영문학과 영어영문학</option></select></td>
						<th id="hide6">강좌명</th>
						<td><input type="text" name="p_subjt" id="p_subjt" size="15"
							onfocus="chgSubjt();"
							onkeydown="if(event.keyCode == 13) return false;"
							placeholder="검색어 (Search Word)"></td>
					</tr>
					<tr>
						<th id="hide7">요일</th>
						<td><select name="p_day" id="p_day" onchange="chgDayTime();"
							style="width: 100%">
								<option value="">- All -</option>
								<option value="2">월요일</option>
								<option value="3">화요일</option>
								<option value="4">수요일</option>
								<option value="5">목요일</option>
								<option value="6">금요일</option>
								<option value="7">토요일</option>
						</select></td>
						<th id="hide8">수업시간</th>
						<td><select name="p_time" id="p_time"
							onchange="chgDayTime();" style="width: 100%">
								<option value="">- All -</option>
								<option value="0900">09:00</option>
								<option value="0930">09:30</option>
								<option value="1000">10:00</option>
								<option value="1030">10:30</option>
								<option value="1100">11:00</option>
								<option value="1130">11:30</option>
								<option value="1200">12:00</option>
								<option value="1230">12:30</option>
								<option value="1300">13:00</option>
								<option value="1330">13:30</option>
								<option value="1400">14:00</option>
								<option value="1430">14:30</option>
								<option value="1500">15:00</option>
								<option value="1530">15:30</option>
								<option value="1600">16:00</option>
								<option value="1630">16:30</option>
								<option value="1700">17:00</option>
								<option value="1730">17:30</option>
								<option value="1800">18:00</option>
								<option value="1825">18:25</option>
								<option value="1850">18:50</option>
								<option value="1900">19:00</option>
								<option value="1915">19:15</option>
								<option value="1930">19:30</option>
								<option value="1940">19:40</option>
								<option value="2005">20:05</option>
								<option value="2030">20:30</option>
								<option value="2035">20:35</option>
								<option value="2055">20:55</option>
								<option value="2100">21:00</option>
								<option value="2120">21:20</option>
								<option value="2125">21:25</option>
								<option value="2145">21:45</option>
								<option value="2150">21:50</option>
						</select></td>
						<th id="hide9">교수명</th>
						<td><input type="text" name="p_teach" id="p_teach"
							onfocus="chgTeach();" size="15"
							onkeydown="if(event.keyCode == 13) return false;"
							placeholder="검색어 (Search Word)"></td>
						<th id="hide10">언어구분</th>
						<td><select name="p_lang" id="p_lang" style="width: 100%">
								<option value="">---- All ----</option>
								<option value="1">영어</option>
								<option value="2">영어(부분)</option>
								<option value="3">제2외국어</option>
						</select></td>
						<th id="hide11">학수번호<br>분반
						</th>
						<td><input type="text" name="p_code" id="p_code"
							onfocus="chgCode();" size="15"
							onkeydown="if(event.keyCode == 13) return false;"
							placeholder="검색어 (Search Word)"></td>
					</tr>

				</tbody>
			</table>
			<div class="buttonset">
				<button class="btn-search" onclick="javascript:gridLecture('Y');">조회</button>
			</div>
		</div>

		<!-- S: 조회 그리드 -->
		<div class="sw-header">
			<span style="font-weight: bold; font-size: 15px;">개설과목</span>
			<!-- <h2>종합시간표 조회</h2>-->
			<div class="buttonset">
				<span class="item" id="meta_1">총 조회건수<em>0</em>건
				</span>
				<!-- <button type="button" class="btn-icon">
				<i class="icon-refresh"></i>
				<span>새로고침</span>
			</button> -->
			</div>
		</div>
		<!-- E: 조회 그리드 -->
		<!-- S: 안내문구 -->
		<div class="wrap-grid">
			<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
				id="gbox_gridLecture" dir="ltr" style="width: 100%;">
					<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
						style="width: 100%;">
						<div class="ui-jqgrid-hbox">
							<table class="ui-jqgrid-htable ui-common-table" role="presentation"
								aria-labelledby="gbox_gridLecture">
								<thead>
									<tr class="ui-jqgrid-labels" role="row">
										<th id="gridLecture_rn" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 40px;">
											<div id="jqgh_gridLecture_rn">
												<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
												</span>
											</div>
										</th>
										<th id="gridLecture_lecture_cd_disp" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lecture_cd_disp"
												class="ui-jqgrid-sortable">
												학수번호-분반<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_subjt_name" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 250px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_subjt_name"
												class="ui-jqgrid-sortable">
												강좌명<span class="s-ico" style="display: none"> <span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
													<span sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_lect_grade" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 80px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_lect_grade"
												class="ui-jqgrid-sortable">
												대상학년<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_asign_pcnt" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 80px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_asign_pcnt"
												class="ui-jqgrid-sortable">
												정원<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_teach_na" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_teach_na" class="ui-jqgrid-sortable">
												교수명<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_unit_num" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 80px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_unit_num" class="ui-jqgrid-sortable">
												학점<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_timetable" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 250px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_timetable"
												class="ui-jqgrid-sortable">
												강의시간/강의실<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_field_gb" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 80px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_field_gb" class="ui-jqgrid-sortable">
												이수구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_eng_yn_nm" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_eng_yn_nm"
												class="ui-jqgrid-sortable">
												언어구분<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_bigo" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_bigo" class="ui-jqgrid-sortable">
												특이사항<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_lectPlan" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 100px;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
												강의계획서<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_params" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px; display: none;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_params" class="ui-jqgrid-sortable">
												params<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_teach_cd" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px; display: none;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_teach_cd" class="ui-jqgrid-sortable">
												teach_cd<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_lecture_cd" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px; display: none;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_lecture_cd"
												class="ui-jqgrid-sortable">
												lecture_cd<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_subjt_cd" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px; display: none;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_subjt_cd" class="ui-jqgrid-sortable">
												subjt_cd<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
										<th id="gridLecture_haksu_code" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 150px; display: none;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										<div id="jqgh_gridLecture_haksu_code"
												class="ui-jqgrid-sortable">
												haksu_code<span class="s-ico" style="display: none"><span
													sort="asc"
													class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
													sort="desc"
													class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
											</div></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="ui-jqgrid-bdiv" >
						<div style="position: relative;">
							<table id="gridLecture" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>
									<tr class="jqgfirstrow" role="row" id="applyContent">
										<td role="gridcell" style="height: 0px; width: 40px;"><button id="applyBt">신청</button></td>
										<td role="gridcell" style="height: 0px; width: 150px;">dsad</td>
										<td role="gridcell" style="height: 0px; width: 250px;">sd</td>
										<td role="gridcell" style="height: 0px; width: 80px;">sd</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 250px;">s</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 100px;">s</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="ui-jqgrid-resize-mark" id="rs_mgridLecture">&nbsp;</div>
			</div>

			<div style="margin: 20px; margin-left: 0;">
				<span style="font-weight: bold; font-size: 15px;">신청과목</span>
			</div>
			<!-- 수강신청 -->
			<div class="wrap-grid">
				<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all"
					id="gbox_gridLecture" dir="ltr" style="width: 100%;">
					<div class="ui-widget-overlay jqgrid-overlay" id="lui_gridLecture"></div>
					<div class="loading ui-state-default ui-state-active"
						id="load_gridLecture" style="display: none;">Loading ...</div>
					<div class="ui-jqgrid-view" role="grid" id="gview_gridLecture"
						style="width: 100%;">
						<div
							class="ui-jqgrid-titlebar ui-jqgrid-caption ui-widget-header ui-corner-top ui-helper-clearfix"
							style="display: none;">
							<a role="link"
								class="ui-jqgrid-titlebar-close ui-corner-all HeaderButton"
								style="right: 0px;"> <span
								class="ui-icon ui-icon-circle-triangle-n"></span></a><span
								class="ui-jqgrid-title"></span>
						</div>
						<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
							style="width: 100%;">
							<div class="ui-jqgrid-hbox">
								<table class="ui-jqgrid-htable ui-common-table" role="presentation"
									aria-labelledby="gbox_gridLecture">
									<thead>
										<tr class="ui-jqgrid-labels" role="row">
											<th id="gridLecture_rn" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 40px;">
												<div id="jqgh_gridLecture_rn">
													<span class="s-ico" style="display: none"> <span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
														<span sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span>
													</span>
												</div>
											</th>
											<th id="gridLecture_lecture_cd_disp" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
												<div id="jqgh_gridLecture_lecture_cd_disp"
													class="ui-jqgrid-sortable">
													학수번호-분반<span class="s-ico" style="display: none">
												</div></th>
											<th id="gridLecture_subjt_name" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 250px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
												<div id="jqgh_gridLecture_subjt_name"
													class="ui-jqgrid-sortable">
													강좌명<span class="s-ico" style="display: none"> <span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span>
														<span sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_lect_grade" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 80px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lect_grade"
													class="ui-jqgrid-sortable">
													대상학년<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_asign_pcnt" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 80px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_asign_pcnt"
													class="ui-jqgrid-sortable">
													정원<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_teach_na" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_teach_na"
													class="ui-jqgrid-sortable">
													교수명<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_unit_num" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 80px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_unit_num"
													class="ui-jqgrid-sortable">
													학점<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_timetable" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 250px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_timetable"
													class="ui-jqgrid-sortable">
													강의시간/강의실<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_field_gb" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 80px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_field_gb"
													class="ui-jqgrid-sortable">
													이수구분<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_eng_yn_nm" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_eng_yn_nm"
													class="ui-jqgrid-sortable">
													언어구분<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_bigo" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_bigo" class="ui-jqgrid-sortable">
													특이사항<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_lectPlan" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 100px;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lectPlan"
													class="ui-jqgrid-sortable">
													강의계획서<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_params" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px; display: none;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_params" class="ui-jqgrid-sortable">
													params<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_teach_cd" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px; display: none;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_teach_cd"
													class="ui-jqgrid-sortable">
													teach_cd<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_lecture_cd" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px; display: none;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_lecture_cd"
													class="ui-jqgrid-sortable">
													lecture_cd<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_subjt_cd" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px; display: none;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_subjt_cd"
													class="ui-jqgrid-sortable">
													subjt_cd<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
											<th id="gridLecture_haksu_code" role="columnheader"
												class="ui-state-default ui-th-column ui-th-ltr"
												style="width: 150px; display: none;"><span
												class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
												style="cursor: col-resize;">&nbsp;</span>
											<div id="jqgh_gridLecture_haksu_code"
													class="ui-jqgrid-sortable">
													haksu_code<span class="s-ico" style="display: none"><span
														sort="asc"
														class="ui-grid-ico-sort ui-icon-asc ui-state-disabled ui-icon ui-icon-triangle-1-n ui-sort-ltr"></span><span
														sort="desc"
														class="ui-grid-ico-sort ui-icon-desc ui-state-disabled ui-icon ui-icon-triangle-1-s ui-sort-ltr"></span></span>
												</div></th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="ui-jqgrid-bdiv" >
						<div style="position: relative;">
							<table id="gridLecture" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>
									<tr class="jqgfirstrow" role="row">
										<td role="gridcell" style="height: 0px; width: 40px;"><button id="cancelBt">삭제</button></td>
										<td role="gridcell" style="height: 0px; width: 150px;">dsad</td>
										<td role="gridcell" style="height: 0px; width: 250px;">sd</td>
										<td role="gridcell" style="height: 0px; width: 80px;">sd</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 250px;">s</td>
										<td role="gridcell" style="height: 0px; width: 80px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 150px;">s</td>
										<td role="gridcell" style="height: 0px; width: 100px;">s</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					</div>
				</div>
			</div>
			<div style="margin-bottom: 20px; margin-top: 10px;">
				<form action="" style="float: right;">
					<label>신청과목수 : </label>
					<input type="text" style="width: 80px;">
					<label>신청학점 : </label>
					<input type="text" style="width: 80px;">
					<label>최대한도학점 : </label>
					<input type="text" style="width: 80px;">
				</form>
			</div>
		</div>
<%@ include file="../inc/bottom.jsp"%>