<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#btE label{
		width: 22%;
		float: left;
	}
	#btE input, textarea{
		width: 60%;
	}
	
	#btE div{
		margin: 10px;
	}
	
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#frm').submit(function() {
			$.ajax({
				url:"<c:url value='/admin/bottomEdit' />",
				type:"post",
				data: $(this).serialize(),
				success:function(res){
					if(res){
						alert('수정에 성공하였습니다');
						self.close();
						opener.location.reload();
						
					}else{
						$('#msg').html('수정에 실패하였습니다');
					}
				},
				error:function(xhr,status,error){
					alert(status + ", " + error);
				}
				
			});
			
			return false;
			
		});
		
	});
</script>
<meta charset="UTF-8">
<title>bottomEdit</title>
</head>
<body>
	<div id="btE">
	<fieldset>
		<legend style="font-size: 1.5em; text-align: center;">회사 정보 수정</legend>
		<form id="frm">
			<div>
				<label>회사명</label>
				<input type="text" name="companyName" id="comapnyName" value="${vo.companyName }">
			</div>	
			<div>
				<label>전화번호</label>
				<input type="text" name="tel" id="tel" value="${vo.tel }">
			</div>	
			<div>
				<label>우편번호</label>
				<input type="text" name="zipcode" id="zipcode" value="${vo.zipcode }">
			</div>	
			<div>
				<label>주소</label>
				<input type="text" name="address1" id="address1" value="${vo.address1 }">
			</div>	
			<div>
				<label>상세주소</label>
				<input type="text" name="address2" id="address2" value="${vo.address2 }">
			</div>	
			<div>
				<label>POLICY</label>
				<textarea rows="" cols="" name="policy">${vo.policy }</textarea>
			</div>	
			<div>
				<label>설립연도</label>
				<jsp:useBean id="now" class="java.util.Date" />
				<select name="startYear">
	                  <fmt:formatDate value="${now }" var="year" pattern="yyyy" />
					<c:set var="idx" value="${year }"> </c:set>
					<c:forEach begin="1" end="50" step="1">
						<option value="${idx }">${idx }</option>
						<c:set var="idx" value="${idx-1 }"></c:set>
					</c:forEach>
					</select>
			</div>
			<div style="text-align: center;">
				<button id="editBt"> 수정 </button>
			</div>
		</form>
			<div id="msg" style="color: yellow; background-color: purple; text-align: center;"></div>
	</fieldset>
	</div>
</body>
</html>