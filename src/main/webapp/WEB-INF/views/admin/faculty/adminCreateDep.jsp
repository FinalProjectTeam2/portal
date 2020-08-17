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
					url : "/portal/admin/faculty/adminCreateDepAjax",
					data : formData,
					type : "get",
					success : function(res) {
						if (res) {
							alert("학과입력 성공!");
							self.close();
							opener.location.reload();
						} else {
							alert("입력 실패!");
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
			if ($('#faculty').val() == "") {
				alert('학부를 선택해주세요');
				$('#faculty').focus();
				event.preventDefault();
				return false;
			} else if ($('#depName').val() == "") {
				alert('학과명을 입력해주세요');
				$('#depName').focus();
				event.preventDefault();
				return false;
			} else if ($('#totalCredit').val() == "") {
				alert('총 학점을 입력해주세요');
				$('#depName').focus();
				event.preventDefault();
				return false;
			}else if ($('#tel1').val() == "") {
				alert('전화번호를 입력해주세요');
				$('#tel1').focus();
				event.preventDefault();
				return false;
			} else if ($('#tel2').val() == "") {
				alert('전화번호를 모두 입력해주세요');
				$('#tel2').focus();
				event.preventDefault();
				return false;
			} else if ($('#tel3').val() == "") {
				alert('전화번호를 모두 입력해주세요');
				$('#tel3').focus();
				event.preventDefault();
				return false;
			} else if ($('#buildingCode').val() == "") {
				alert('학과 건물을 입력해주세요');
				$('#buildingCode').focus();
				event.preventDefault();
				return false;
			}else if(!validate_number($('#totalCredit').val())){
				alert('총 학점은 숫자만 입력 가능합니다.');
				$('#totalCredit').focus();
				event.preventDefault();
				return false;
			}else if (!validate_number($('#tel1').val())
					|| !validate_number($('#tel2').val())
					|| !validate_number($('#tel3').val())) {
				alert('전화번호는 숫자만 가능합니다.');
				$('#tel1').focus();
				event.preventDefault();
				return false;
			} else{
				return true;
			}
		}
		// 숫자만 입력가능
		function validate_number(number) {
			var pattern = new RegExp(/^[0-9]*$/);
			return pattern.test(number);
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
						학과생성</label>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="faculty" class="formTitle">소속 학부</label>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<select name="facultyNo" id="faculty">
						<option value="">선택</option>
						<c:forEach var="facVo" items="${facultyList }">
							<option value="${facVo.facultyNo }">
							${facVo.facultyName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="depName" class="formTitle">학과 이름</label>
				</div>
			</div>
			<div class="row1">
				<div class="">
					<input type="text" id="depName" name="depName"
						value="">
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="totalCredit" class="formTitle">총 학점</label>
				</div>
			</div>
			<div class="row1">
				<div class="">
					<input type="text" id="totalCredit" name="totalCredit"
						value="" placeholder="숫자만 입력해주세요">
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="tel1" class="formTitle">전화번호</label>
				</div>
			</div>
			<div class="row1">
				<div class="">
					<input type="text" id="tel1" name="tel1" class="telInp"
						value="" placeholder="숫자만 입력">
					<span class="telSlash">-</span><input type="text" id="tel2"
						name="tel2" class="telInp" value=""
						placeholder="숫자만 입력"> <span class="telSlash">-</span><input
						type="text" id="tel3" name="tel3" class="telInp"
						value="" placeholder="숫자만 입력">
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="buildingCode" class="formTitle">건물</label>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<select name="buildingCode" id="buildingCode">
						<option value="">선택</option>
						<c:forEach var="vo" items="${blist }">
							<option value="${vo.buildingCode }">
							${vo.buildingCode}(${vo.buildingName})</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="bts">
				<button type="submit" class="btn btn-primary" id="write">
					입력</button>
				<button type="button" class="btn btn-primary" id="cancel">닫기</button>
			</div>
		</form>
	</div>
</body>
</html>