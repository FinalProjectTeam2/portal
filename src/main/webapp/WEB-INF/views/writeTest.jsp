<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>


<script>
	$(function(){
		CKEDITOR.replace('editor');
		
	});
	
</script>
 <textarea id="editor" name="editor"></textarea>


<input type="submit" name="sub" value="등록">






<%@ include file="inc/bottom.jsp"%>
