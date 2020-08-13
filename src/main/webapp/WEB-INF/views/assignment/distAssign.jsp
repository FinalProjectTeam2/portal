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

</style>
<script type="text/javascript">
$(function(){
	$('#distAssign').hide();
	$('#subjCode').change(function(){
		if($('#subjCode option:selected').val()=='none'){
			$('#distAssign').hide();
			$('#rightDiv').hide();
		}else{
			$('#distAssign').show();
			$.ajax({
				url:"<c:url value='/assignment/getAssigned'/>",
				type:"post",
				data:{
					"openSubCode":$('#subjCode option:selected').val()
				},
				dataType:"json",
				success:function(res){
					
					var str = "<table class='assignTable' border='1'>"+
								"<colgroup>"+
									"<col width='25%'>"+
									"<col width='50%'>"+
									"<col width='20%'>"+
								"<colgroup>"+
								"<tr>"+
									"<th>번호</th>"+
									"<th>과제명</th>"+
									"<th>등록일</th>"+
								"</tr>";
					var len = res.length;
					if(len>0){
						$.each(res, function(idx, item){
							str+="<tr class='assignLine'>"+
								"<td>"+item.assignNo+"</td>"+
								"<td>"+item.assignName+"</td>"+
								"<td>"+item.regDate+"</td>"+
								"</tr>";
						});
					}else{
						str+="<tr>"+
								"<td colspan='3'>등록한 과제가 없습니다.</td></tr>";
					}
					str+="</table>";
					
					$('.forTable').html(str);
					
					$('.assignLine').click(function(){
						var assignNo=$(this).children().eq(0).html();
						var assignName=$(this).children().eq(1).html();
						var regDate=$(this).children().eq(2).html();
						var openSubCode=$('#subjCode option:selected').val();
						alert(assignNo+","+assignName+","+regDate+","+openSubCode);
						
					});
					
					
					
					
					
				}
			});
		}
	});
});

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
	<hr style="border: solid 2px lightgreen">
<div class='form-group' id='distAssign' style='margin-top: 20px;float: left;width: 45%'>
	<label for="exampleFormControlTextarea3">과제를 입력하세요</label>
  <textarea class='form-control' id='exampleFormControlTextarea3' rows='7' cols="20"></textarea>
  <button class='btn btn-primary' id='btUpload' style='margin-top: 5px;float: right;'>과제 등록</button>
  <div class='forTable' style="margin-top: 30px;">
  
  </div>
</div>
<div id="rightDiv" style="margin-top: 20px;float: left;width: 45%; margin-left: 50px">
</div>

<%@ include file="../inc/bottom.jsp"%>