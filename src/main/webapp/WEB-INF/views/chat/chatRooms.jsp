<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<meta http-equiv="Content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/resources/css/chat/custom.css'/>">
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<style type="text/css">
#bodyContents{
	height: 100%;
	overflow: auto;
}
</style>
<sec:authorize access="isAuthenticated()">
	<script type="text/javascript">
	
		$(function() {
			acyncMovePage('<c:url value="/chat/"/>', 'get');
		});
		
		function acyncMovePage(url, type) {
			// ajax option
			var ajaxOption = {
				url : url,
				async : true,
				type : type,
				dataType : "html",
				cache : false
			};

			$.ajax(ajaxOption).done(function(data) {
				// Contents 영역 삭제
				$('#bodyContents').children().remove();
				// Contents 영역 교체
				$('#bodyContents').html(data);
			});
		}
	</script>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<script type="text/javascript">
		$(function() {
			$("#bodyContents").html("로그인 후 사용 가능한 서비스입니다.");
		});
	</script>
</sec:authorize>
<div id="gnb"></div>

<div id="lnb"></div>

<div id="bodyContents"></div>
