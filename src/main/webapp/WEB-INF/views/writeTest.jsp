<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="inc/top.jsp"%>


<form name="frm" method="post" action="/portal/upload">

 <div class="editor_wrap" style="width: 800px;">
	<textarea name="content" id="editor"></textarea>
</div>

<input type="submit" name="sub" value="등록">
</form>


<!-- CKEditor -->
<script>
    // 3. CKEditor5를 생성할 textarea 지정
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
    </script>



<%@ include file="inc/bottom.jsp"%>
