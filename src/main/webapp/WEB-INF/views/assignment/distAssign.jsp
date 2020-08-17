<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.theme.css'/>">
<style>
.forTable th{
	color: black;
	text-align: center;
}
.forTable td{
	color: black;
	text-align: center;
}
.assignTable{
	width: 100%
}
.assignstuList th{
	color: black;
	text-align: center;
}
.assignstuList td{
	color: black;
	text-align: center;
}
.assignTable{
	width: 100%
}
table.assignstuList {
    font-size: 0.65em;
}
</style>
<script type="text/javascript">
$(function(){
	$('#distAssign').hide();
	$('#rightDiv').hide();
	$('#subjCode').change(function(){
		if($('#subjCode option:selected').val()=='none'){
			$('#distAssign').hide();
			$('#rightDiv').hide();
		}else{
			$('#distAssign').show();
			$('#rightDiv').hide();
			$.ajax({
				url:"<c:url value='/assignment/getAssigned'/>",
				type:"post",
				data:{
					"openSubCode":$('#subjCode option:selected').val()
				},
				dataType:"json",
				success:function(res){
					var str = "<span style='color: red;font-size=0.7em'>※과제등록취소, 확인 마친과제 삭제를 원하시면 완료버튼을 누르세요</span>" +
						"<table class='assignTable' border='1'>"+
								"<colgroup>"+
									"<col width='10%'>"+
									"<col width='50%'>"+
									"<col width='20%'>"+
									"<col width='20%'>"+
								"<colgroup>"+
								"<tr>"+
									"<th>번호</th>"+
									"<th>과제명</th>"+
									"<th>등록일</th>"+
									"<th>확인완료</th>"+
								"</tr>";
					var len = res.length;
					if(len>0){
						$.each(res, function(idx, item){
							str+="<tr class='assignLine'>"+
								"<td>"+item.assignNo+"</td>"+
								"<td>"+item.assignName+"</td>"+
								"<td>"+moment(item.regDate).format('YYYY/MM/DD')+"</td>"+
								"<td><button class='btn btn-warning btDel' onclick='event.stopPropagation()'>확인완료</button></td>"+
								"</tr>";
						});
					}else{
						str+="<tr>"+
								"<td colspan='3'>등록한 과제가 없습니다.</td></tr>";
					}
					str+="</table>";
					
					$('.forTable').html(str);
					$('#btUpload').click(function(){
						btnClick();
					});
					
					$('.btDel').click(function(){
						var tr=$(this).parent().parent();
						var td=tr.children();
						var assignNo=tr.children().eq(0).html();
						var assignName=tr.children().eq(1).html();
						
						if(confirm('과제를 정말 삭제하시겠습니까?')){
							btDelClick(assignNo, assignName);
						}
						
					});
					
					
					
					$('.assignLine').click(function(){
						var assignNo=$(this).children().eq(0).html();
						var assignName=$(this).children().eq(1).html();
						var regDate=$(this).children().eq(2).html();
						var openSubCode=$('#subjCode option:selected').val();
						
						$.ajax({
							url:"<c:url value='/assignment/assignStuList'/>",
							type:"post",
							data:{
								"assignNo":assignNo,
								"openSubCode":openSubCode
							},
							dataType:"json",
							success:function(res){
								var str="<h4>과제 제출 현황<h4>"+
								"<table class='assignstuList' border='1'>"+
								"<colgroup>"+
									"<col width='18%'>"+
									"<col width='14%'>"+
									"<col width='20%'>"+
									"<col width='20%'>"+
									"<col width='28%'>"+
								"<colgroup>"+
								"<tr>"+
									"<th>학번</th>"+
									"<th>이름</th>"+
									"<th>제출여부</th>"+
									"<th>제출일</th>"+
									"<th>과제파일</th>"+
								"</tr>";
								var len = res.length;
								if(len>0){
									$.each(res, function(idx, item){
										str+="<tr class='assignLine'>"+
											"<td>"+item.STU_NO+"</td>"+
											"<td>"+item.NAME+"</td>";
											if(item.COUNT<1){
												str+="<td>미제출</td>";
											}else if(item.COUNT>0){
												str+="<td>제출완료</td>";
											}
											if(item.COUNT<1){
												str+="<td></td>";
											}else if(item.COUNT>0){
												str+="<td>"+moment(item.APPLY_DATE).format('YYYY/MM/DD')+"</td>";
											}
											if(item.COUNT<1){
												str+="<td></td></tr>";
											}else if(item.COUNT>0){
												str+="<td>"+
												"<a href='<c:url value='/assignment/download?fileName="+item.FILE_NAME+"&assignNo="+item.ASSIGN_NO+"&originalFileName="+item.ORIGINAL_FILE_NAME+"'/>'>"+item.ORIGINAL_FILE_NAME+"</a></td></tr>";
											}
											
									});
								}else{
									str+="<tr>"+
											"<td colspan='4'>수강신청 인원이 없습니다.</td></tr>";
								}
								str+="</table>";
								
								
								$('#rightDiv').html(str);
							}
							
						});
						
						
					});
					
					
				}
			});
		}
	});
	
	
	
	
});


function btDelClick(no, name){
	$.ajax({
		url:"<c:url value='/assignment/delAssign'/>",
		type:"post",
		dataType:"json",
		data:{
			"assignName":name,
			"assignNo":no,
			"openSubCode":$('#subjCode option:selected').val()
		},
		success:function(res){
			$('#rightDiv').hide();
			if(res.length > 0){
				var str =  "<span style='color: red;font-size=0.7em'>※과제등록취소, 확인 마친과제 삭제를 원하시면 완료버튼을 누르세요</span>" +
					"<table class='assignTable' border='1'>"+
				"<colgroup>"+
					"<col width='10%'>"+
					"<col width='50%'>"+
					"<col width='20%'>"+
					"<col width='20%'>"+
				"<colgroup>"+
				"<tr>"+
					"<th>번호</th>"+
					"<th>과제명</th>"+
					"<th>등록일</th>"+
					"<th>확인완료</th>"+
				"</tr>";
				var len = res.length;
				if(len>0){
					$.each(res, function(idx, item){
						str+="<tr class='assignLine'>"+
							"<td>"+item.assignNo+"</td>"+
							"<td>"+item.assignName+"</td>"+
							"<td>"+moment(item.regDate).format('YYYY/MM/DD')+"</td>"+
							"<td><button class='btn btn-warning btDel' onclick='event.stopPropagation()'>확인완료</button></td>"+
							"</tr>";
					});
				}else{
					str+="<tr>"+
							"<td colspan='4'>등록한 과제가 없습니다.</td></tr>";
				}
				str+="</table>";
				
				$('.forTable').html(str);
				$('#exampleFormControlTextarea3').val('');
				alert('삭제 완료');
				
				$('.btDel').click(function(){
					var tr=$(this).parent().parent();
					var td=tr.children();
					var assignNo=tr.children().eq(0).html();
					var assignName=tr.children().eq(1).html();
					
					if(confirm('과제를 정말 삭제하시겠습니까?')){
						btDelClick(assignNo, assignName);
					}
					
				});
				
				
				$('.assignLine').click(function(){
					var assignNo=$(this).children().eq(0).html();
					var assignName=$(this).children().eq(1).html();
					var regDate=$(this).children().eq(2).html();
					var openSubCode=$('#subjCode option:selected').val();
					
					$.ajax({
						url:"<c:url value='/assignment/assignStuList'/>",
						type:"post",
						data:{
							"assignNo":assignNo,
							"openSubCode":openSubCode
						},
						dataType:"json",
						success:function(res){
							var str="<h4>과제 제출 현황<h4>"+
							"<table class='assignstuList' border='1'>"+
							"<colgroup>"+
								"<col width='18%'>"+
								"<col width='14%'>"+
								"<col width='20%'>"+
								"<col width='20%'>"+
								"<col width='28%'>"+
							"<colgroup>"+
							"<tr>"+
								"<th>학번</th>"+
								"<th>이름</th>"+
								"<th>제출여부</th>"+
								"<th>제출일</th>"+
								"<th>과제파일</th>"+
							"</tr>";
							var len = res.length;
							if(len>0){
								$.each(res, function(idx, item){
									str+="<tr class='assignLine'>"+
										"<td>"+item.STU_NO+"</td>"+
										"<td>"+item.NAME+"</td>";
										if(item.COUNT<1){
											str+="<td>미제출</td>";
										}else if(item.COUNT>0){
											str+="<td>제출완료</td>";
										}
										if(item.COUNT<1){
											str+="<td></td>";
										}else if(item.COUNT>0){
											str+="<td>"+moment(item.APPLY_DATE).format('YYYY/MM/DD')+"</td>";
										}
										if(item.COUNT<1){
											str+="<td></td></tr>";
										}else if(item.COUNT>0){
											str+="<td>"+
											"<a href='<c:url value='/assignment/download?fileName="+item.FILE_NAME+"&assignNo="+item.ASSIGN_NO+"&originalFileName="+item.ORIGINAL_FILE_NAME+"'/>'>"+item.ORIGINAL_FILE_NAME+"</a></td></tr>";
										}
										
								});
							}else{
								str+="<tr>"+
										"<td colspan='4'>수강신청 인원이 없습니다.</td></tr>";
							}
							str+="</table>";
							
							
							$('#rightDiv').html(str);
						}
						
					});
					
					
				});
			}else{
				alert('삭제 실패');
			}	
		}
		
		
	});
}








function btnClick(){
	if($('#exampleFormControlTextarea3').val()==''){
		alert('과제 내용을 입력하세요.');
		return;
	}
	
	var openSubCode=$('#subjCode option:selected').val();
	$.ajax({
		url:"<c:url value='/assignment/inputDistAssign'/>",
		type:"post",
		dataType:"json",
		data:{
			"assignName":$('#exampleFormControlTextarea3').val(),
			"openSubCode":$('#subjCode option:selected').val()
		},
		success:function(res){
			if(res.length > 0){
				var str =  "<span style='color: red;font-size=0.7em'>※과제등록취소, 확인 마친과제 삭제를 원하시면 완료버튼을 누르세요</span>" +
					"<table class='assignTable' border='1'>"+
				"<colgroup>"+
					"<col width='10%'>"+
					"<col width='50%'>"+
					"<col width='20%'>"+
					"<col width='20%'>"+
				"<colgroup>"+
				"<tr>"+
					"<th>번호</th>"+
					"<th>과제명</th>"+
					"<th>등록일</th>"+
					"<th>확인완료</th>"+
				"</tr>";
				var len = res.length;
				if(len>0){
					$.each(res, function(idx, item){
						str+="<tr class='assignLine'>"+
							"<td>"+item.assignNo+"</td>"+
							"<td>"+item.assignName+"</td>"+
							"<td>"+moment(item.regDate).format('YYYY/MM/DD')+"</td>"+
							"<td><button class='btn btn-warning btDel' onclick='event.stopPropagation()'>확인완료</button></td>"+
							"</tr>";
					});
				}else{
					str+="<tr>"+
							"<td colspan='4'>등록한 과제가 없습니다.</td></tr>";
				}
				str+="</table>";
				
				$('.forTable').html(str);
				$('#exampleFormControlTextarea3').val('');
				alert('등록 완료');
				
				$('.btDel').click(function(){
					var tr=$(this).parent().parent();
					var td=tr.children();
					var assignNo=tr.children().eq(0).html();
					var assignName=tr.children().eq(1).html();
					
					if(confirm('과제를 정말 삭제하시겠습니까?')){
						btDelClick(assignNo, assignName);
					}
					
				});
				
				$('.assignLine').click(function(){
					var assignNo=$(this).children().eq(0).html();
					var assignName=$(this).children().eq(1).html();
					var regDate=$(this).children().eq(2).html();
					var openSubCode=$('#subjCode option:selected').val();
					
					$.ajax({
						url:"<c:url value='/assignment/assignStuList'/>",
						type:"post",
						data:{
							"assignNo":assignNo,
							"openSubCode":openSubCode
						},
						dataType:"json",
						success:function(res){
							var str="<h4>과제 제출 현황<h4>"+
							"<table class='assignstuList' border='1'>"+
							"<colgroup>"+
								"<col width='18%'>"+
								"<col width='14%'>"+
								"<col width='20%'>"+
								"<col width='20%'>"+
								"<col width='28%'>"+
							"<colgroup>"+
							"<tr>"+
								"<th>학번</th>"+
								"<th>이름</th>"+
								"<th>제출여부</th>"+
								"<th>제출일</th>"+
								"<th>과제파일</th>"+
							"</tr>";
							var len = res.length;
							if(len>0){
								$.each(res, function(idx, item){
									str+="<tr class='assignLine'>"+
										"<td>"+item.STU_NO+"</td>"+
										"<td>"+item.NAME+"</td>";
										if(item.COUNT<1){
											str+="<td>미제출</td>";
										}else if(item.COUNT>0){
											str+="<td>제출완료</td>";
										}
										if(item.COUNT<1){
											str+="<td></td>";
										}else if(item.COUNT>0){
											str+="<td>"+moment(item.APPLY_DATE).format('YYYY/MM/DD')+"</td>";
										}
										if(item.COUNT<1){
											str+="<td></td></tr>";
										}else if(item.COUNT>0){
											str+="<td>"+
											"<a href='<c:url value='/assignment/download?fileName="+item.FILE_NAME+"&assignNo="+item.ASSIGN_NO+"&originalFileName="+item.ORIGINAL_FILE_NAME+"'/>'>"+item.ORIGINAL_FILE_NAME+"</a></td></tr>";
										}
										
								});
							}else{
								str+="<tr>"+
										"<td colspan='4'>수강신청 인원이 없습니다.</td></tr>";
							}
							str+="</table>";
							
							
							$('#rightDiv').html(str);
						}
						
					});
					
					
				});
			}else{
				alert('등록 실패');
			}	
		}
		
		
	});
}



</script>
<main role="main" class="flex-shrink-0">
<div class="container">
<h2>과목을 선택하세요</h2>
<div id="selcetSubj">
<select class="form-control" id="subjCode" style="width: 72%;">
	<c:if test="${empty list }">
		<option value='none'>개설된 과목이 없습니다.</option>
	</c:if>
	<c:if test="${!empty list }">
		<option value='none'>과제 등록할 과목 선택</option>
		<c:forEach var="map" items="${list }">
			<option value="${map['OPEN_SUB_CODE']}">${map['SUBJ_NAME']}</option>
		</c:forEach>
	</c:if>
</select>
</div>
	<hr style="border: solid 2px lightgray">
<div class='form-group' id='distAssign' style='margin-top: 20px;float: left;width: 45%'>
	<label for="exampleFormControlTextarea3">과제를 입력하세요</label>
  <textarea class='form-control' id='exampleFormControlTextarea3' rows='7' cols="20"></textarea>
  <button class='btn btn-primary' id='btUpload' style='margin-top: 5px;float: right;margin-right: 2%'>과제 등록</button>
  <div class='forTable' style="margin-top: 30px;">
  	<span style="color: red">※과제등록취소, 확인 마친과제 삭제를 원하시면 완료버튼을 누르세요</span>
  </div>
</div>
<div id="rightDiv" style="margin-top: 20px;float: left;width: 45%; margin-left: 80px">
</div>

<%@ include file="../inc/bottom.jsp"%>