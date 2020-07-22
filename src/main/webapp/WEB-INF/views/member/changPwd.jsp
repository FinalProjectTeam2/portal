<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('#btIdent').click(function(){
			window.open("<c:url value='/member/identify?officialNo=${param.officialNo}'/>",
					"bigImg", "width=400, height=500, left=0, top=0, location=yes, resizable=yes");
		});
	});
</script>
</head>
<body>
<p>학번 : ${param.officialNo }</p>


<p>최초 로그인 후 반드시 본인인증을 하고 비밀번호를 변경해야 합니다.</p>
<hr>
<input type="button" id="btIdent" value="본인인증하기"/>


</body>
</html>