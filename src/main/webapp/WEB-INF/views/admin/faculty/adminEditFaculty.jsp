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
#adminBd{
	width: 560px;
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
#chDup{
	height: 50px;
}
.bts {
    margin-bottom: 0;
}
</style>
<script>
$(function() {
	var pattern_eng = /[a-zA-Z]/;
	$("#boardFrm").submit(function() {
		if($("#isDup").val() != 'Y'){
			alert("중복확인을 해야 합니다.");
			return false;
		}
		var formData = $("#boardFrm").serialize();
		if('${type}' == 'in'){
			$.ajax({
				url : "<c:url value='/admin/board/insertCate'/>",
				data : formData,
				type : "get",
				success : function(res) {
					if(res == 'Y'){
						alert("등록 성공!");
						self.close();
						opener.location.reload();
					}else{
						alert("등록 실패!");
					}
				}
			});
		}else{
			$.ajax({
				url : "<c:url value='/admin/board/editCate'/>",
				data : formData,
				type : "get",
				success : function(res) {
					if(res == 'Y'){
						alert("수정 성공!");
						self.close();
						opener.location.reload();
					}else{
						alert("수정 실패!");
					}
				}
			});
		}
		return false;
	});
	
	$("#list").click(function() {
		self.close();
	});
	$("#chDup").click(function() {
		var code = $("#title").val();
		if(code.length <1){
			alert("카테고리 코드를 입력해주세요");
			return false;
		}
		if(!pattern_eng.test(code)){
			alert("영문만 가능합니다.");
			return false;
		}
		$.ajax({
			url : "<c:url value='/admin/board/checkCateCode'/>",
			data : {
				code : code
			},
			type : "get",
			success : function(res) {
				if(res == 'Y'){
					alert("사용 가능한 코드입니다.");
					$("#isDup").val('Y');
					$("#title").attr("readonly","readonly");
					$("#chDup").attr("disabled","disabled");
				}else{
					alert("이미 사용 중인 코드입니다.");
				}
			}
		});
	});
	
	if('${type}' == 'edit'){
		$("#title").attr("readonly","readonly").val('${vo.categoryCode}');
		$("#chDup").attr("disabled","disabled");
		$("#categoryName").val('${vo.categoryName}');
		$("#isDup").val('Y');
		$("#usage").val('${vo.usage}');
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
					<label for="title" class="formTitle">카테고리 코드</label>
					<label style="color: red; font-size: 0.9em; padding-top: 7px; font-weight: bold">(대소문자 구분X)</label>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<input type="text" id="title" name="categoryCode" required="required">
				</div>
				<div class="col-25">
					<button type="button" class="btn btn-primary" id="chDup">중복확인</button>
				</div>
			</div>
			<div class="row1">
				<div class="col-75">
					<label for="title" class="formTitle">카테고리 명</label>
				</div>
			</div>
			<div class="row1">
				<div class="">
					<input type="text" id="categoryName" name="categoryName" required="required">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">사용 여부</label>
				</div>
				<div class="col-75">
					<select id="usage" name="usage">
						<option value="Y">YES</option>
						<option value="N">NO</option>
					</select>
				</div>
			</div>
			<div class="bts">
				<button type="submit" class="btn btn-primary" id="write">
					<c:if test="${type == 'in' }">
					등록
					</c:if>
					<c:if test="${type == 'edit' }">
					수정
					</c:if>
				</button>
				<button type="button" class="btn btn-primary" id="list">닫기</button>
			</div>
		</form>
	</div>
</body>	
</html>