<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/regi_lec.css'/>">
<script type="text/javascript">
	$(function(){
		getDate();
		subjList();
		getRegistList()
		//학부 선택시 해당되는 학과만 나오도록 함
		$('#p_daehak').change(function(){
			var facultyNo=$('#p_daehak option:selected').val();
			$.ajax({
				url:"<c:url value='/registration/main'/>",
				type:"post",
				data:{"facultyNo":facultyNo},
				success:function(res){
					var str="<select name='p_major' id='p_major' style='width: 100%'>";
					str+="<option value='All'>---All---</option>";
					
					$.each(res, function(index, item){
						str+="<option value='"+item.depNo+"'>"+item.depName+"</option>";
					});
						str+="</select>";
						$('#major').html(str);
				}
				
			});
		});
		
		
		
		//검색 버튼 눌렀을때 
		$('#selectBt').click(function(){
			subjList();
		});
	});
	
	//수강신청 모든 리스트(검색기능 사용시 검색할 내용만 sort)
	function subjList(){
		var faculty=$('#p_daehak').val();
		var department=$('#p_major').val();
		var subjName=$('#p_subjt').val();
		var time1=$('#p_day').val();
		var time2=$('#p_time').val();
		var profName=$('#p_teach').val();
		var openSubCode=$('#p_code').val();
		
		$.ajax({
			url:"<c:url value='/registration/openSubjList'/>",
			data:{
				"facultyNo":faculty,
				"depNo":department,
				"subjName":subjName,
				"time1":time1,
				"time2":time2,
				"profName":profName,
				"openSubCode":openSubCode
			},
			dataType:"json",
			type:"post",
			success:function(res){
				var str = "";
				var count=res.count;
				var checkNull=res.checkNull;
				console.log(checkNull);
				$('#meta_1 em').text(count);
					if(checkNull=='Y'){
						str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
						str+="<td colspan='10'>검색된 학과가 없습니다.</td></tr>";
						
					}else if(checkNull=='N'){
							$.each(res.list, function(idx, item){
						
							str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
							str+="<td role='gridcell' style='height: 0px; width: 7%;'><button class='applyBt'>신청</button></td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.openSubCode+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 18%; text-align: center'>"+item.subjName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 7%;'>"+item.count/item.credit + "/" +item.personnel+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.profName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.credit+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 14%;'>"+item.shortNames+"/"+item.classroomName+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.type+"</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>";
							str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.syllabus+"</td>";
							str+="</tr>";
						});
					}
				
				$('#gridLecture1 tbody').html(str);
				
				$('#meta_1').find('em').text(res.count);
				
				
				$('.applyBt').click(function(){
					var tdArr= new Array();
					var checkBtn= $(this);
					
					var tr = $(this).parent().parent();
					var td = tr.children();
					
					var openSubCode=td.eq(1).text();
					var subjName=td.eq(2).text();
					var col1=td.eq(3).text().split("/");
					var count=col1[0];
					var personnel=col1[1];
					var profName=td.eq(4).text();
					var credit=td.eq(5).text();
					var col2=td.eq(6).text().split("/");
					var shortName = col2[0];
					var classroomName = col2[1];
					var type = td.eq(7).text();
					var syllabus=td.eq(9).text();
					if(count>=personnel){
						
					 	alert('정원초과 다른 강의를 선택하세요.');
					 	return;
					}else{
						$.ajax({
							url:"<c:url value='/registration/insertReg'/>",
							data:{
								"type":type,
								"openSubCode":openSubCode
							},
							type:"post",
							success:function(res){
								alert(res);
								getRegistList();
							},
							error:function(xhr, status, error){
								alert(error);
							}
						});
					}
					
				});
				
				
				
				
			}
			
			
			
		});
	}
	
	
	//해당학생이 수강신청 한 리스트만 검색 후 출력
	function getRegistList(){
		$.ajax({
			url:"<c:url value='/registration/registList'/>",
			type:"post",
			dataType:"json",
			success:function(res){
				var str = "";
				var sum = 0;
				if(res.checkNull=="N"){
					$.each(res.subList, function(idx, item){
						sum+=item.credit;
						str+="<tr class='jqgfirstrow' role='row' id='appliedList'>";
						str+="<td role='gridcell' style='height: 0px; width: 7%;'><button class='cancelBt'>취소</button></td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.openSubCode+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 18%; text-align: center'>"+item.subjName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 7%;'>"+item.personnel+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.profName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 5%;'>"+item.credit+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 14%;'>"+item.shortNames+"/"+item.classroomName+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 6%;'>"+item.type+"</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>한국어</td>";
						str+="<td role='gridcell' style='height: 0px; width: 9%;'>"+item.syllabus+"</td>";
						str+="</tr>";
					});
				}else if(res.checkNull=="Y"){
					str+="<tr class='jqgfirstrow' role='row' id='subjects'>";
					str+="<td colspan='10'>수강신청 내역이 없습니다.</td></tr>"
				}
				$('#gridLecture2 tbody').html(str);
				$('#numOfSubj').val(res.appliedCount);
				$('#sumCredit').val(sum);
				
				$('.cancelBt').click(function(){
					var tdArr= new Array();
					var tr = $(this).parent().parent();
					var td = tr.children();
					var openSubCode=td.eq(1).text();
					
					$.ajax({
						url:"<c:url value='/registration/deleteReg'/>",
						data:{
							"openSubCode":openSubCode
						},
						type:"post",
						success:function(res){
							alert(res);
							getRegistList();
						},
						error:function(xhr, status, error){
							alert(error);
						}
					});
				});
				
			}
		});
	}
	
	
	
	
	
	function getDate(){
		//년도 띄우기
		var today = new Date();
		var year = today.getFullYear();
		$('#p_year option').val(year+3).prop("selected", true);
		//임의로 분기별로 수강신청 해당학기 정함
		var month = today.getMonth()+1;
		if(month >= 1 && month <=3){
			$('#p_term option').val('25').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 4 && month <=6){
			$('#p_term option').val('10').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 7 && month <=9){
			$('#p_term option').val('15').prop("selected", true);
			$('#p_term').prop("disable");
		}else if(month >= 10 && month <=12){
			$('#p_term option').val('20').prop("selected", true);
			$('#p_term').prop(disable);
		}
	}
</script>
<main role="main" class="flex-shrink-0">
<div class="container">

<div id="regi">
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
                 	 <td><select name="p_year" id="p_year" style="width: 100%">

                        <option value="2020">2020</option>

                        <option value="2019">2019</option>

                        <option value="2018">2018</option>

                        <option value="2017">2017</option>

                  </select></td>
						<th id="hide2">학기</th>
						<td id="hide3">
							<select name="p_term" id="p_term" style="width: 100%">
									<option value="10">1학기</option>
									<option value="20">2학기</option>
									<option value="15">&gt;여름계절</option>
									<option value="25">&gt;겨울계절</option>
							</select>
						</td>
						<th id="hide4">학부</th>
						<td>
							<select name="p_daehak" id="p_daehak" style="width: 100%">
								<option value="0">---All---</option>
									<c:if test="${!empty fList }">
										<c:forEach var="fVo" items="${fList }">
											<option value="${fVo.facultyNo }">${fVo.facultyName }</option>
										</c:forEach>
									</c:if>
							</select>
						</td>
						<th id="hide5">학과</th>
						<td id="major">
							<select name="p_major" id="p_major" style="width: 100%">
								<option value="0">---All---</option>
									<c:if test="${!empty dList }">
										<c:forEach var="dVo" items="${dList }">
											<option value="${dVo.depNo }">${dVo.depName }</option>
										</c:forEach>
									</c:if>
							</select>
						</td>
						<th id="hide6">강좌명</th>
						<td><input type="text" name="p_subjt" id="p_subjt" size="15"
							placeholder="검색어 (Search Word)"></td>
					</tr>
					<tr>
						<th id="hide7">요일</th>
						<td><select name="p_day" id="p_day" style="width: 100%">
								<option value="all">- All -</option>
								<option value="월">월요일</option>
								<option value="화">화요일</option>
								<option value="수">수요일</option>
								<option value="목">목요일</option>
								<option value="금">금요일</option>
						</select></td>
						<th id="hide8">수업시간</th>
						<td><select name="p_time" id="p_time" style="width: 100%">
								<option value="all">- All -</option>
								<option value="1">1교시</option>
								<option value="2">2교시</option>
								<option value="3">3교시</option>
								<option value="4">4교시</option>
								<option value="5">5교시</option>
								<option value="6">6교시</option>
								<option value="7">7교시</option>
								<option value="8">8교시</option>
						</select></td>
						<th id="hide9">교수명</th>
						<td><input type="text" name="p_teach" id="p_teach" placeholder="검색어 (Search Word)"></td>
						<th id="hide10">언어구분</th>
						<td><select name="p_lang" id="p_lang" style="width: 100%">
								<option value="">---- All ----</option>
								<option value="1">영어</option>
								<option value="2">영어(부분)</option>
								<option value="3">제2외국어</option>
						</select></td>
						<th id="hide11">학수번호<br>분반
						</th>
						<td><input type="text" name="p_code" id="p_code" placeholder="검색어 (Search Word)"></td>
					</tr>

				</tbody>
			</table>
			<div class="buttonset">
				<button class="btn-search"  id="selectBt" style="width: 40px;">조회</button>
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
											style="width: 7%;">
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
											style="width: 9%;"><span
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
											style="width: 18%;"><span
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
											style="width: 7%;"><span
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
											style="width: 9%;"><span
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
											style="width: 5%;"><span
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
											style="width: 14%;"><span
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
											style="width: 6%;"><span
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
											style="width: 9%;"><span
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
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										
										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
												강의계획서<span class="s-ico" style="display: none"><span
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
							<table id="gridLecture1" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>
									
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
					<div class="ui-state-default ui-jqgrid-hdiv ui-corner-top"
						style="width: 100%;">
						<div class="ui-jqgrid-hbox">
							<table class="ui-jqgrid-htable ui-common-table" role="presentation"
								aria-labelledby="gbox_gridLecture">
								<thead>
									<tr class="ui-jqgrid-labels" role="row">
										<th id="gridLecture_rn" role="columnheader"
											class="ui-state-default ui-th-column ui-th-ltr"
											style="width: 7%;">
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
											style="width: 9%;"><span
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
											style="width: 18%;"><span
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
											style="width: 7%;"><span
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
											style="width: 9%;"><span
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
											style="width: 5%;"><span
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
											style="width: 14%;"><span
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
											style="width: 6%;"><span
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
											style="width: 9%;"><span
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
											style="width: 9%;"><span
											class="ui-jqgrid-resize ui-jqgrid-resize-ltr"
											style="cursor: col-resize;">&nbsp;</span>
										
										<div id="jqgh_gridLecture_lectPlan" class="ui-jqgrid-sortable">
												강의계획서<span class="s-ico" style="display: none"><span
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
							<table id="gridLecture2" tabindex="0" cellspacing="0"
								cellpadding="0" border="0" role="presentation"
								aria-multiselectable="false" aria-labelledby="gbox_gridLecture"
								class="ui-jqgrid-btable" style="text-align: center; font-size: 15px;">
								<tbody>
									<tr class="jqgfirstrow" role="row" id="applyContent">
										<td role="gridcell" style="height: 0px; width: 7%;"><button id="cancelBt">삭제</button></td>
										<td role="gridcell" style="height: 0px; width: 9%;">dsad</td>
										<td role="gridcell" style="height: 0px; width: 18%; text-align: center">sd</td>
										<td role="gridcell" style="height: 0px; width: 7%;">sd</td>
										<td role="gridcell" style="height: 0px; width: 9%;">s</td>
										<td role="gridcell" style="height: 0px; width: 5%;">s</td>
										<td role="gridcell" style="height: 0px; width: 14%;">s</td>
										<td role="gridcell" style="height: 0px; width: 6%;">s</td>
										<td role="gridcell" style="height: 0px; width: 9%;">s</td>
										<td role="gridcell" style="height: 0px; width: 9%;">s</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="ui-jqgrid-resize-mark" id="rs_mgridLecture">&nbsp;</div>
			</div>

			<div style="margin-bottom: 20px; margin-top: 10px;">
				<form action="" style="float: right;">
					<label>신청과목수 : </label>
					<input type="text" id="numOfSubj" style="width: 80px;">
					<label>신청학점 : </label>
					<input type="text" id="sumCredit" style="width: 80px;">
					<label>최대한도학점 : </label>
					<input type="text" style="width: 80px;">
				</form>
			</div>
		</div>
	</div>
		
<%@ include file="../inc/bottom.jsp"%>