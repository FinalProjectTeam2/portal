<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/mainSidebar.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/write.css'/>" />
<style type="text/css">
argin: 5px 0;
}
.title_box { 
    border: #3c5a86 1px dotted; 
}

.title_box #title { 
    position: relative;
    top: -1.3em;
    margin-left: 0.2em;
    display: inline;
    font-size: 1.1em;
    font-weight: bold;
    text-shadow: 0px 0px 4px #f2f2f2;
}

#boardFrm .col-75 {
    float: left;
    width: 80%;
}
#boardFrm .col-25 {
    width: 20%;
}
#chDup{
	height: 50px;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
	var pattern_eng = /[a-zA-Z]/;
	var pattern_num = /[0-9]/;
	$(function () {
		if("${type}"=='in'){
			$("#btSubmit").val("등록");
		}else{
			$("#chDup").attr("disabled","disabled");
			$("#bdCode").attr("readonly","readonly");
			$("#isDup").val('Y');
			$("#isReply").val('${vo.isReply}');
			$("#isComment").val('${vo.isComment}');
			$("#isPrivate").val('${vo.isPrivate}');
			$("#isUpload").val('${vo.isUpload}');
			$("#maxFilesize").val('${vo.maxFilesize}');
			$("#maxUpfile").val('${vo.maxUpfile}');
			$("#cateCode").val('${vo.categoryCode}');
			$("#authCode").val('${vo.authCode}');
			$("#usage").val('${vo.usage}');
		}
		$("#list").click(function() {
			location.href = "<c:url value='/admin/board/manager'/>";
		});
		$("#isUpload").change(function() {
			if($(this).val() == 'Y'){
				$("#maxUpfile").attr("disabled", false);
				$("#maxFilesize").attr("disabled", false);
			}else{
				$("#maxUpfile").attr("disabled", true);
				$("#maxFilesize").attr("disabled", true);
			}
		});
		$("#boardFrm").submit(function() {
			if($("#isDup").val() != 'Y'){
				alert("중복확인을 해야 합니다.");
				return false;
			}
			var formData = $("#boardFrm").serialize();
			if('${type}' == 'in'){
				$.ajax({
					url : "<c:url value='/admin/board/insertBd'/>",
					data : formData,
					type : "get",
					success : function(res) {
						if(res == 'Y'){
							alert("등록 성공!");
							location.href = "<c:url value='/admin/board/manager'/>";
						}else{
							alert("등록 실패!");
						}
					}
				});
			}else{
				$.ajax({
					url : "<c:url value='/admin/board/editBd'/>",
					data : formData,
					type : "get",
					success : function(res) {
						if(res == 'Y'){
							alert("수정 성공!");
							location.href = "<c:url value='/admin/board/manager'/>";
						}else{
							alert("수정 실패!");
						}
					}
				});
			}
			return false;
		});
		
		$("#chDup").click(function() {
			var code = $("#bdCode").val();
			if(code.length <1){
				alert("게시판 코드를 입력해주세요");
				$("#bdCode").focus();
				return false;
			}
			if(!pattern_eng.test(code)){
				alert("영문만 가능합니다.");
				$("#bdCode").focus();
				$("#bdCode").val('');
				return false;
			}
			$.ajax({
				url : "<c:url value='/admin/board/checkBdCode'/>",
				data : {
					code : code
				},
				type : "get",
				success : function(res) {
					if(res == 'Y'){
						alert("사용 가능한 코드입니다.");
						$("#isDup").val('Y');
						$("#bdCode").attr("readonly","readonly");
						$("#chDup").attr("disabled","disabled");
					}else{
						alert("이미 사용 중인 코드입니다.");
					}
				}
			});
		});
	});
	
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="margin: 10px 20px;">
			<form action="" id="boardFrm" method="post">
			<input type="hidden" value="${principal.officialNo }" name="officialNo">
			<input type="hidden" value="N" id="isDup">
			<div class="row1">
				<div class="col-25">
					<label for="l_title" class="formTitle">게시판 코드</label>
				</div>
				<div class="col-75">
					<input type="text" style="width: 80%;" id="bdCode" name="bdCode" 
						value="${vo.bdCode }" required="required">
					<button type="button" class="btn btn-primary" id="chDup">중복확인</button>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">카테고리 코드</label>
				</div>
				<div class="col-75">
					<input type="text" readonly="readonly" id="cateCode" name="categoryCode" 
						value="${cateCode }" required="required">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">게시판 명</label>
				</div>
				<div class="col-75">
					<input type="text" value="${vo.bdName }" id="bdName" name="bdName" required="required">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">정렬 순서</label>
				</div>
				<div class="col-75">
					<input type="text" placeholder="숫자만 입력하세요" id="bdOrder"
						 name="bdOrder" value="${vo.bdOrder }" required="required">
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
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">댓글 여부</label>
				</div>
				<div class="col-75">
					<select id="isReply" name="isReply">
						<option value="Y">YES</option>
						<option value="N">NO</option>
					</select>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">답글 여부</label>
				</div>
				<div class="col-75">
					<select id="isComment" name="isComment">
						<option value="Y">YES</option>
						<option value="N">NO</option>
					</select>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">비밀글 여부</label>
				</div>
				<div class="col-75">
					<select id="isPrivate" name="isPrivate">
						<option value="Y">YES</option>
						<option value="N">NO</option>
					</select>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">업로드 여부</label>
				</div>
				<div class="col-75">
					<select id="isUpload" name="isUpload">
						<option value="Y">YES</option>
						<option value="N">NO</option>
					</select>
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">최대 업로드 수</label>
				</div>
				<div class="col-75">
					<input type="text" placeholder="숫자만 입력하세요" id="maxUpfile"
						 name="maxUpfile" value="0" >
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">최대 파일 크기</label>
				</div>
				<div class="col-75">
					<input type="text" placeholder="숫자만 입력하세요(MB)" id="maxFilesize"
						 name="maxFilesize" value="0">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">관리자 등급</label>
				</div>
				<div class="col-75">
					<select id="authCode" name="authCode">
						<c:forEach items="${list }" var="auth">
							<option value="${auth.authCode }">${auth.authName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
				<div class="bts">
					<input type="submit" id="btSubmit" value="수정" > <input type="button"
						value="목록" id="list">
				</div>
			</form>
		</div>

		<%@ include file="../../inc/bottom.jsp"%>