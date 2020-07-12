<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>


<div style = "width:800px;">
내용
<textarea id = "description" name = "description" rows = "5" cols = "80"></textarea> 
<script>
//CKEDITOR.replace("description"); //태그의 id
//이미지 업로드를 할 경우
	
		
		CKEDITOR.replace("description",{
		
		//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
		 
		    filebrowserUploadUrl : "${path}/imageUpload"
		
		//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
		
		});

</script>
</div>  




<%@ include file="inc/bottom.jsp"%>
