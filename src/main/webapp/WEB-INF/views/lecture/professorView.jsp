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
			url:"<c:url value='/lecture/evaluation'/>",
			type:"post",
			data:{"subCode":$('#subjCode').val()},
			dataType:"json",
			success:function(res){
				$('#listTitle').text($("#subjCode option:selected").text()+" 수강생 목록");
				var table = "<table border='1'>"+
								"<colgroup>"+
									"<col width='12%'>"+
									"<col width='10%'>"+
									"<col width='10%'>"+
									"<col width='10%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='10%'>"+
								"</colgroup>"+
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
									"<th></th>"
								"</tr>";
					$.each(res, function(index, item){
						$('tr:odd').find('input').css('background', '#efefef');
						table += "<tr>"+
									"<td>"+ item.subCode +"</td>"+
									"<td>"+ item.stuNo +"</td>"+
									"<td>"+ item.name +"</td>"+
									"<td>"+ item.classification +"</td>"+
									"<td><input type='text' size='3' value='"+ item.midterm +"'></td>"+
									"<td><input type='text' size='3' value='"+ item.finals +"'></td>"+
									"<td><input type='text' size='3' value='"+ item.assignment +"'></td>"+
									"<td><input type='text' size='3' value='"+ item.attendance +"'></td>"+
									"<td><input type='text' size='3' value='"+ item.etc +"'></td>"+
									"<td><input type='text' size='3' value='"+ item.totalGrade +"'></td>"+
									"<td><button type='button' class='btn btn-primary btOk'>입력</button></td>"+
								"</tr>";
					});
					table+="</table>";
					
					$('#tableDiv').html(table);
					
					$('.btOk').click(function(){
						var srt = "";
						var tdArr= new Array();
						var checkBtn= $(this);
						
						var tr = checkBtn.parent().parent();
						var td = tr.children();
						
						var subCode=td.eq(0).text();
						var stuNo=td.eq(1).text();
						var name=td.eq(2).text();
						var classification=td.eq(3).text();
						var midTerm=td.eq(4).children().val();
						var finals=td.eq(5).children().val();
						var assignment=td.eq(6).children().val();
						var attendance=td.eq(7).children().val();
						var etc=td.eq(8).children().val();
						var totalGrade=td.eq(9).children().val();
						
						alert('subCode='+subCode+', stuNo='+stuNo+', name='+name+', classification'+classification+', midTerm='+midTerm
								+', finals='+finals+', assignment='+assignment+', attendance='+attendance+', etc='+etc+', totalGrade='+totalGrade);
					});
					
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