<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication var="principal" property="principal" />
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- date formating -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<title>척척학사</title>

<link href="<c:url value='/resources/css/offcanvas.css' />"
	rel="stylesheet">
<link href="<c:url value='/resources/css/layout.css' />"
	rel="stylesheet">
<link rel="shortcut icon"
	href="<c:url value='/resources/images/logoIcon.ico' />">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/write2.css'/>" />
<style type="text/css">
body {
	padding-top: 20px;
}

#adminBd {
	width: 500px;
}

#boardFrm .col-75 {
	float: left;
	width: 80%;
}

#boardFrm .row1 {
	margin: 0;
	padding: 0;
}

#boardFrm .col-25 {
	width: 20%;
}

.bts {
	margin-bottom: 25px;
}

button#cancel {
	float: right;
	margin: 0 2% 0 0;
}

button#write {
	margin: 0 0 0 2%;
}

.telInp {
	width: 25% !important;
}

span.telSlash {
	font-size: 2em;
	margin: 10px;
	vertical-align: top;
}
</style>
<script>
	$(function() {
		$("#boardFrm").submit(function() {
			if(check()){
				var formData = $("#boardFrm").serialize();
				$.ajax({
					url : "/portal/admin/faculty/adminCreateFacultyAjax",
					data : formData,
					type : "get",
					success : function(res) {
						if (res) {
							alert("수정 성공!");
							window.close();
							opener.parent.location.reload();
						} else {
							alert("수정 실패!");
						}
					}
				});
			}
			return false;
		});
		$("#cancel").click(function() {
			self.close();
		});
		function check() {
			if ($('#facultyName').val() == "") {
				alert('학부 이름을 입력해주세요');
				$('#facultyName').focus();
				event.preventDefault();
				return false;
			} else{
				return true;
			}
		}
	});
</script>
</head>
<body>
	<div id="adminBd">
		<form action="" class="writeFrm" id="boardFrm" method="post">
			<input type="hidden" id="isDup" value="N">
			<div class="row1">
				<div class="col-75">
					<label for="faculty" class="formTitle" style="color: #01539d">
						학부생성</label>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="faculty" class="formTitle">학부 이름</label>
				</div>
			</div>
			<div class="row1">
				<div class="">
					<input type="text" id="facultyName" name="facultyName"
						value="">
				</div>
			</div>
			<div class="bts">
				<button type="submit" class="btn btn-primary" id="write">
					저장</button>
				<button type="button" class="btn btn-primary" id="cancel">닫기</button>
			</div>
		</form>
	</div>
</body>
</html>