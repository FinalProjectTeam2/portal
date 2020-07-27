<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/board/write.css'/>" />
<style type="text/css">
.col-25 {
	padding-left: 2%;
}
</style>
<script type="text/javascript">
	
	var count = 1;
	var maxCount = 4;
	$(function() {
		$("#write").click(function() {
			location.href = "<c:url value='/portal/board/edit'/>";
		});
		$("#list").click(function() {
			location.href = "<c:url value='/portal/board/list'/>";
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
				+ '<input type="file" class="custom-file-input" name="files" id="inputGroupFile0'+count+'" '
				+' aria-describedby="inputGroupFileAddon01"> <label '
				+'class="custom-file-label" for="inputGroupFile0'+count+'">파일을 선택하세요</label>'
				+'</div>'
				+ '<button type="button" name="delFile">파일 삭제</button>'
				+'</div>';
			$("#fileList").append(fileTag);
			
			$("button[name=delFile]").click(function() {
				$(this).parent().hide();
				return false;
			});
			
			return false;
		});
		
		
	});
</script>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<form action="/action_page.php" class="writeFrm" id="boardFrm"
			enctype="multipart/data">
			<input type="text" value="${sessionScope.officialNo }" name="officialNo">
			<input type="text" value="${param.categoryCode }" name="categoryCode">
			<input type="text" value="${param.bdCode }" name="bdCode">
			<div class="row1">
				<div class="col-25">
					<label for="l_title" class="formTitle">제목</label>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title">
				</div>
			</div>
			<div class="row1">
				<div class="col-25">
					<label for="l_category"  class="formTitle">분류</label>
				</div>
				<div class="col-75">
					<select id="category" name="category">
						<option value="">공통</option>
						<option value="">죽전</option>
						<option value="">천안</option>
					</select>
				</div>
			</div>
			<div class="row1" id="fileList">
				<div class="col-25">
					<label for="l_date"  class="formTitle">파일</label>
					<button type="button" id="addFile">파일 추가</button>
				</div>
				<div class="input-group mb-3 col-75">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
					</div>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="files" id="inputGroupFile01"
							aria-describedby="inputGroupFileAddon01"> <label
							class="custom-file-label" for="inputGroupFile01">파일을 선택하세요</label>
					</div>
				</div>
			</div>

			<div class="row1">
				<div class="col-25">
					<label for="l_subject"  class="formTitle">내용</label>
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
				<input type="button" id="write" value="등록"> <input
					type="button" value="목록" id="list">
			</div>
		</form>
		<%@ include file="../../inc/bottom.jsp"%>