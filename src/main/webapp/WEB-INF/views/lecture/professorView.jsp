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
		url:"<c:url value='/lecture/evaluation'/>",
		type:"post",
		data:{"subCode":"$('#subjCode').val()"},
		dataType:"json",
		success:function(res){
			$('#listTitle').text($("#subjCode option:selected").text()+" 수강생 목록");
			var table = "<table border='1'>"+
							"<tr>"+
								"<th>수강신청 코드</th>"+
								"<th>학번</th>"+
								"<th>이름</th>"+
								"<th>수강구분</th>"+
								"<th>중간고사</th>"+
								"<th>기말고사</th>"+
								"<th>과제</th>"+
								"<th>출석</th>"+
								"<th>기타</th>"+
								"<th>총점</th>"+
							"</tr>";
				$.each(res, function(index, item){
					table += "<tr>"+
								"<td>"+ item.subCode +"</td>"+
								"<td>"+ item.stuNo +"</td>"+
								"<td>"+ item.name +"</td>"+
								"<td>"+ item.classification +"</td>"+
								"<td>"+ item.midterm +"</td>"+
								"<td>"+ item.finals +"</td>"+
								"<td>"+ item.assignment +"</td>"+
								"<td>"+ item.attendance +"</td>"+
								"<td>"+ item.etc +"</td>"+
								"<td>"+ item.totalGrade +"</td>"+
							"</tr>";
				});
				table+="</table>";
				
				$('#tableDiv').html(table);
				
		}, 
		error:function(xhr, status, error){
			alert(error)
		}
	});
	
	
}

</script>
<main role="main" class="flex-shrink-0">
<div class="container">
	<h2>과목을 선택하세요</h2>
	<select class="form-control" id="subjCode" style="width: 72%;">
		<c:if test="${!empty sList }">
			<c:forEach var="map" items="${sList }">
				<option value="${map['OPEN_SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select>
	<hr style="border: solid 2px lightgreen">
	<h4 id="listTitle"></h4>
	
	<div id="tableDiv">
	
	</div>
	
<%@ include file="../inc/bottom.jsp"%>