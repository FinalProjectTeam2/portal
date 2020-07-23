<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<style type="text/css">
.container {
	margin-top	: 100px;
}
.firDiv{
	float: left;
	margin-left: 180px;
}
.secDiv{
	float: left;
	margin-left: 130px;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#btIdent').click(
			function() {
				window.open(
					"<c:url value='/member/identify?officialNo=${param.officialNo}'/>",
					"bigImg",
					"width=400, height=400, left=200px, top=150px, location=yes, resizable=yes");
			});
	});
</script>
<main role="main">
	<div class="container">
		<div class="firDiv">
			<img alt="주의 이미지" src="<c:url value='/resources/images/attention.png'/>" style="width: 200px; height: auto" >
		</div>
		<div class="secDiv">
			<p>학번 : ${param.officialNo }</p>


			<p>최초 로그인 후 반드시 본인인증을 하고 비밀번호를 변경해야 합니다.</p>
			<hr>

			<input type="button" id="btIdent" value="본인인증하기" />
		</div>
<%@include file="../inc/bottom.jsp"%>