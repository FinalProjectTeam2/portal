<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/write.css'/>" />
<style>
#fileDetail{
	float: right;
    width: 85%;
    background: white;
    border: 1px solid #cccccc;
    padding: 12px;
    border-radius: 4px;
}
.files{
    background: #cccccc54;
    padding: 4px 10px;
    border-radius: 4px;
    margin: 5px 0;
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
</style>
<script type="text/javascript">
	var count = 1+${fn:length(postVo.fileList) };
	console.log(count);
	var maxCount = ${vo.maxUpfile};
	$(function () {
		if(count > maxCount){
			$("#fileList .firstFile").hide();
		}else{
			$("#fileList .firstFile").show();
		}
		$("#delFile").click(function() {
			var fileName = $(this).find(".fileName").val();
			var no = $(this).find(".no").val();
			var parent = $(this).parent();
			$.ajax({
				url : "<c:url value='/portal/board/ajax/delFile'/>",
				data : {fileName : fileName, no : no },
				success : function(res) {
					if(res == 'true'){
						parent.remove();
						count = count - 1;
						if(count > maxCount){
							$("#fileList .firstFile").hide();
						}else{
							$("#fileList .firstFile").show();
						}
					}
				}
			});
			//$(this).parent().remove();
		});
		
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list?bdCode="+$("#bdCode").val()+"'/>";
		});
		if(${vo.isUpload == 'N'}){
			$("#fileList").hide();
		}
		
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
		
		$("input[type=file]").change(function(){
			var fileName = $(this).val().substr( $(this).val().lastIndexOf( "\\" ) + 1);
			$(this).next().html(fileName);
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
			$("#fileList .input-group").last().after(fileTag);
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
		<div style="margin: 10px 20px;">
			<form action="<c:url value='/portal/board/edit'/>" id="boardFrm" method="post"
				enctype="multipart/form-data">
			<input type="hidden" value="${principal.officialNo }" name="officialNo">
			<input type="hidden" value="${postVo.postsVo.postNo }" name="postNo">
			<input type="hidden" id="contents" name="contents">
			<div class="row1">
				<div class="col-25">
					<label for="l_title" class="formTitle">제목</label>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title" value="${postVo.postsVo.title }">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">분류</label>
				</div>
				<div class="col-75">
					<select id="bdCode" name="bdCode">
						<option value="">선택하세요</option>
						<c:forEach var="voc" items="${list }">
							<c:if test="${voc.usage == 'Y' }">
								<option value="${voc.bdCode }" 
								<c:if test="${postVo.postsVo.bdCode == voc.bdCode }">
									selected="selected"
								</c:if>
								>${voc.bdName }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row1" id="fileList">
				<div class="col-25 firstFile">
					<label for="l_date"  class="formTitle">파일</label>
					<button type="button" id="addFile" class="btn btn-info">파일 추가</button>
				</div>
				<div class="input-group mb-3 col-75 firstFile">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="files" id="inputGroupFile01"
							aria-describedby="inputGroupFileAddon01"> <label
							class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
					</div>
				</div>
				<c:if test="${!empty postVo.fileList}">
					<div id="fileDetail" class="title_box">
						<div id="title">첨부파일 목록</div>
						<div id="content">
						<c:forEach var="file" items="${postVo.fileList}">
							<div class="files">
								<a style="cursor: pointer;" id="delFile">
								<input type="hidden" class="fileName" value="${file.fileName }">
								<input type="hidden" class="no" value="${file.no }">
								${file.originalFileName }
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-backspace-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2V3zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8 5.829 5.854z"/>
								</svg>
								</a>
							</div>
						</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
			<div class="row1" style="padding-left: 2%;">
				<textarea id="subject" name="subject" placeholder="내용을 입력하세요."
					style="height: 600px">${postVo.postsVo.contents }</textarea>
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
					<input type="submit" value="수정" > <input type="button"
						value="목록" id="list">
				</div>
			</form>
		</div>

		<%@ include file="../../inc/bottom.jsp"%>