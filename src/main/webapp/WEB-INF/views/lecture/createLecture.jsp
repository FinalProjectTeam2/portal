<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<script type="text/javascript">
	$(function(){
		
	
		$('#btnSubmit').click(function(){
			if($('#subjName').val().length < 1){
				alert('과목명을 입력하세요.');
				$('#subjName').focus();
				event.preventDefault();
			}else if($('#credit').val().length < 1){
				alert('학점을 입력하세요.');
				$('#credit').focus();
				event.preventDefault();
			}else if($('#personnel').val().length < 1){
				alert('정원을 입력하세요.');
				$('#personnel').focus();
				event.preventDefault();
			}else if($('#explanation').val().length < 1){
				alert('과목 세부설명을 입력하세요.');
				$('#explanation').focus();
				event.preventDefault();
			}else{
				$.ajax({
					url:"<c:url value='/lecture/insertSubject'/>",
					type:"post",
					data:$('#frmSubject').serialize(),
					success:function(res){
						alert(res);
						location.reload();
					},
					error:function(xhr, status, error){
						alert(error);
					}
				});
			}
		});
	});
</script>

<main role="main" class="flex-shrink-0">
<div class="container">
<h3>수업 등록 페이지</h3>
<hr style="border: solid 2px lightgreen; width: 70%; float: left"><br><br>
<div>
<form id="frmSubject">
	<span class="input-group-text" style="float: left;width: 10%;border: none;">이수구분 : </span>
    	<select class="form-control" id="typeCode" name="typeCode" class="selectpicker" style="float:left;width:60%;">
    		<c:if test="${!empty list }">
    			<c:forEach var="vo" items="${list}">
    				<option value="${vo.typeCode }">${vo.type }</option>
    			</c:forEach>
    		</c:if>
    	</select><br><br>
   	<span class="input-group-text" style="float: left;width: 10%; border: none;">과목명 : </span> <input type="text" class="form-control"  id="subjName" name="subjName" style="float: left;width: 60%;"><br><br>
   	<span class="input-group-text" style="float: left;width: 10%;border: none;">이수 학점 :</span><input type="text" class="form-control"  id="credit" name="credit" style="float: left;width: 60%;"><br><br>
   	<span class="input-group-text" style="float: left;width: 10%;border: none;">정원:</span><input type="text" class="form-control"  id="personnel" name="personnel" style="float: left;width: 60%;"><br><br>
   	<span class="input-group-text" style="float: left;width: 10%;border: none;">과목 세부 설명 :</span><textarea type="text" class="form-control" rows="6" id="explanation" name="explanation" style="float: left;width: 60%;"></textarea><br><br>
	<br><br><br><br><br><br><br>
</form>
</div>
<div>
	<input type="button" id="btnSubmit" class="btn btn-info" value="등록" style="margin-left: 66%;">
</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>