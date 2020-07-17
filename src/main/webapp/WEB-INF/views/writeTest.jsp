<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>



<article>
<script type="text/javascript">
	$(function(){
		$('.btList').click(function(){
			location.href="<c:url value='/board/list.do'/>";	
		});
		
		$('form[name=frmWrite]').submit(function(){
			if($('#title').val()==''){
				alert('제목을 입력하세요');
				$('#title').focus();
				event.preventDefault();
			}else if($('#name').val().length<1){
				alert('이름을 입력하세요');
				$('#name').focus();
				event.preventDefault();
			}else if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}
		
		
			
	});
	
</script>

<div class="divForm" style="width: 800px">
<form name="frmWrite" method="post" action="<c:url value='/fileUpload'/>" enctype="multipart/form-data">
 <fieldset>
	<legend>글쓰기</legend>
        <div class="firstDiv">
            <label for="title">제목</label>
            <input type="text" id="title" name="title"  />
        </div>
        <div>
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="pwd">비밀번호</label>
            <input type="password" id="pwd" name="pwd" />
        </div>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" />
        </div>
        <div>  
        	<label for="description">내용</label>        
 			<textarea id="description" name="description" rows="12" cols="40"></textarea>
        </div>
        <script>
//CKEDITOR.replace("description"); //태그의 id
//이미지 업로드를 할 경우
	
		
		CKEDITOR.replace("description",{
		
		//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
		 
		    filebrowserUploadUrl : "${pageContext.request.contextPath}/fileUpload"
		
		//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
		
		});

</script>
        <div class="center">
            <input type = "submit" value="등록"/>
            <input type = "Button" class="btList" value="글목록"  />         
        </div>
    </fieldset>
</form>
</div>   

        </article>      











<%@ include file="inc/bottom.jsp"%>
