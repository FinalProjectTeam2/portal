<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/write.css'/>" />
<style type="text/css">
div#isPrivate {
    margin: 8px 12px;
    display: inline-block;
}
</style>
<script type="text/javascript">
	
	var count = 1;
	var maxCount = ${vo.maxUpfile};
	$(function() {
		
		if(${vo.isUpload == 'N'}){
			$("#fileList").hide();
		}
		
		$("input[type=file]").change(function(){
			var fileName = $(this).val().substr( $(this).val().lastIndexOf( "\\" ) + 1);
			$(this).next().html(fileName);
		});
		
		$("#boardFrm").submit(function() {
			if($("#title").val().length < 1){
				alert("제목을 작성하셔야 합니다.");
				return false;
			}
			if($("#bdCode").val().length < 1){
				alert("분류를 선택하셔야 합니다.");
				return false;
			}
			
			$("#contents").val(CKEDITOR.instances.subject.getData());
			$("#subject").remove();
		});
		
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list?bdCode="+$("#bdCode").val()+"'/>";
		});
		
		$("#addFile").click(function() {
			if(count >= maxCount){
				alert("파일 업로드는 " + maxCount + "개 까지만 가능합니다.");
				return false;
			}
			count = count + 1;
			var fileTag = '<div class="input-group mb-3 col-75">'
				+'<div class="input-group-prepend">'
				+ '<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>'
				+'</div>'
				+'<div class="custom-file">'
				+ '<input type="file" class="custom-file-input" name="files'+count+'" id="inputGroupFile0'+count+'" '
				+' aria-describedby="inputGroupFileAddon01"> <label '
				+'class="custom-file-label" for="inputGroupFile0'+count+'">파일을 선택하세요</label>'
				+'</div>'
				+ '<button type="button" onclick="$.delFile(this)" name="delFile">'
				+ '<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-dash-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
				+ '<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
				+ '<path fill-rule="evenodd" d="M3.5 8a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.5-.5z"/>'
				+ '</svg>' + '</button>'
				+'</div>';
			$("#fileList").append(fileTag);
			$("input[type=file]").change(function(){
				var fileName = $(this).val().substr( $(this).val().lastIndexOf( "\\" ) + 1);
				$(this).next().html(fileName);
			});
			return false;
		});
		
		$("#bdCode").change(function() {
			if($(this).val() != ''){
				$.ajax({
					url: "<c:url value='/portal/board/ajax/findBoard'/>",
					data: {bdCode: $(this).val()},
					dataType: "json",
					type: "get",
					success: function(res) {
						maxCount = res.maxUpfile;
						$("button[name=delFile]").each(function() {
							$(this).parent().remove();
						});
						if(res.isUpload == 'N'){
							$("#fileList").hide();
						}else{
							$("#fileList").show();
						}
						count = 1;
					}
				});
			}
			
			return false;
		});
	});
	
	$.delFile = function(self) {
		$(self).parent().remove();
		count = count - 1;
		return false;
	}
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<form action="<c:url value='/portal/board/write'/>" class="writeFrm"
			id="boardFrm" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${principal.officialNo }"
				name="officialNo"> <input type="hidden" id="contents"
				name="contents">
			<div class="row1">
				<div class="col-25">
					<label for="l_title" class="formTitle">제목</label>
					<c:if test="${vo.isPrivate == 'Y' }">
						<div id="isPrivate"><input type="checkbox" id="private" name="isPrivate"><label for="private">비밀글</label></div>
					</c:if>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title">
					
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category" class="formTitle">분류</label>
				</div>
				<div class="col-75">
					<select id="bdCode" name="bdCode">
						<option value="">선택하세요</option>
						<c:forEach var="vo" items="${list }">
							<c:if test="${vo.usage == 'Y' }">
								<option value="${vo.bdCode }"
									<c:if test="${param.bdCode == vo.bdCode }">
									selected="selected"
								</c:if>>${vo.bdName }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row1" id="fileList">
				<div class="col-25">
					<label for="l_date" class="formTitle">파일</label>
					<button type="button" id="addFile" class="btn btn-info">파일
						추가</button>
				</div>
				<div class="input-group mb-3 col-75">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="files"
							id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						<label class="custom-file-label" for="inputGroupFile01">파일을
							선택하세요</label>
					</div>
				</div>
			</div>
			<div class="row1" style="padding-left: 2%;">
				<textarea id="subject" name="subject" placeholder="내용을 입력하세요."
					style="height: 600px"></textarea>
			</div>
			<script type="text/javascript">
				//CKEDITOR.replace("description"); //태그의 id
				//이미지 업로드를 할 경우
				CKEDITOR
						.replace(
								"subject",
								{
									//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
									filebrowserUploadUrl : "${pageContext.request.contextPath}/imageUpload",
									//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
									height : "500px"
								});
			</script>
			<div class="bts">
				<input type="submit" id="write" value="등록"> <input
					type="button" value="목록" id="list">
			</div>
		</form>
		<%@ include file="../../inc/bottom.jsp"%>