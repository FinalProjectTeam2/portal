<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#tableDiv th{
	color: black;
	text-align: center;
}
#tableDiv td{
	color: black;
	text-align: center;
}








</style>

<script type="text/javascript">
	var code=$('#subjCode').val();
	showList();
	$(function(){
		$('#subjCode').change(function(){
			showList();	
		});
		
		
		

		
	});

		
		
		
		
		
		function showList(){
			$.ajax({
				url:"<c:url value='/lecture/selectPhoneBook'/>",
				data:{"subCode":$('#subjCode').val()},
				dataType:"json",
				type:"post",
				success:function(res){
					$('#listTitle').text($("#subjCode option:selected").text()+" 수강생 목록");
					var table = "<table border='1'>"+
									"<colgroup>"+
									"<col width='5%'>"+
									"<col width='8%'>"+
									"<col width='6%'>"+
									"<col width='6%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"</colgroup>"+
									"<tr>"+
										"<th><input type='checkbox' class='chkAll'></th>"+
										"<th>학번</th>"+
										"<th>이름</th>"+
										"<th>학년</th>"+
										"<th>학과</th>"+
										"<th>연락처</th>"+
									"</tr>";
						$.each(res, function(index, item){
							table+="<tr>"+
							"<td><input type='checkbox' class='inputChk'></td>"+
							"<td>"+ item.stuNo +"</td>"+
							"<td>"+ item.name +"</td>"+
							"<td>"+ item.semester +"</td>"+
							"<td>"+ item.depName +"</td>"+
							"<td>"+ item.phoneNo +"</td>"+
						"</tr>"
						});
						
						table+="</table>";
						$('#tableDiv').html(table);
						
						
						 $(".chkAll").click(function(){
							 if($(".chkAll").prop("checked")){
					            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					            $(".inputChk").prop("checked",true);
					            //클릭이 안되있으면
					        }else{
					            //input태그의 class가 inputChk인 태그들을 찾아서 checked옵션을 false로 정의
					            $(".inputChk").prop("checked",false);
					        }
						 });
						
				}, 
				
			});
			
			
			
			
		
	}		
		
		
		
		
</script>
<main role="main" class="flex-shrink-0">
<div class="container">
	<div><h2>과목을 선택하세요</h2><input type="button" id="btXls" value="excel로 다운받기" style="float: right; margin-right: 100px;"></div>
	<select class="form-control" id="subjCode" style="width: 72%;">
		<c:if test="${!empty sList }">
			<c:forEach var="map" items="${sList }">
				<option value="${map['OPEN_SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select>
	<hr style="border: solid 2px lightgreen">
	<h4 id="listTitle"></h4>
	
	<div id="tableDiv" style="width: 50%">
	
	</div>
	
	
<%@ include file="../inc/bottom.jsp"%>