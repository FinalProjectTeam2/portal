<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/mainSidebar.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/reset.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/write.css'/>" />
<style type="text/css">
.col-25{
	padding-left: 2%;
}
</style>
<main role="main" class="flex-shrink-0">
	<div class="container">
		<form action="/action_page.php" class="writeFrm">
			<div class="row">
				<div class="col-25">
					<label for="l_title">제목</label>
				</div>
				<div class="col-75">
					<input type="text" id="title" name="title">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="l_no">번호</label>
				</div>
				<div class="col-75">
					<input type="text" id="no" name="no">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="l_category">분류</label>
				</div>
				<div class="col-75">
					<select id="category" name="category">
						<option value="">공통</option>
						<option value="">죽전</option>
						<option value="">천안</option>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="l_name">작성자</label>
				</div>
				<div class="col-75">
					<input type="text" id="name" name="name">
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="l_date">작성일</label>
				</div>
				<div class="col-75">
					<input type="text" id="date" name="date">
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="l_subject">내용</label>
				</div>
				<div class="col-75">
					<textarea id="subject" name="subject" placeholder="내용을 입력하세요."
						style="height: 200px"></textarea>
				</div>
				<script type="text/javascript">
				//CKEDITOR.replace("description"); //태그의 id
				//이미지 업로드를 할 경우
					
						
						CKEDITOR.replace("subject",{
						
						//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
						 
						    filebrowserUploadUrl : "${pageContext.request.contextPath}/fileUpload"
						
						//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
						
						});

				</script>
			</div>
			<div class="row">
				<input type="submit" value="등록">
			</div>
		</form>
	<%@ include file="../inc/bottom.jsp"%>