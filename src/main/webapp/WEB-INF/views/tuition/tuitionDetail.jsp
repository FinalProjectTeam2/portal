<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>
<style type="text/css">
</style>
<script type="text/javascript">
$(function(){
	$('.tuitionList').click(function(){
		location.href = "<c:url value='/tuition/tuitionList'/>";	
	});
});
</script>
<div id="tuition">
	<div class="title">
		<h1>등록금 관리 글쓰기</h1>
	</div>

	<div class="firstDiv">
		<form name="frmWrite" method="post" action="<c:url value='tuition/tuitionDetail'/>" >
            <label for="title">입학금</label>
            <input type="text" id="title" name="title"  />
    	 <div>
            <label for="name">학부</label>
            <input type="text" id="name" name="name" />
        </div>
         <div>
            <label for="name">학과</label>
            <input type="text" id="name" name="name" />
        </div>
         <div>
            <label for="name">학번</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="name">이름</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="name">등록금</label>
            <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="name2">실습비</label>
              <input type="text" id="name" name="name" />
        </div>
        <div>
            <label for="email">학생회비</label>
             <input type="text" id="name" name="name" />       
        </div>
        <div>  
        	<label for="content">장학금</label>        
 			  <input type="text" id="name" name="name" /> 
        </div>
        
 		<div class="center">
			<a href="<c:url value='/tuition/tuitionEdit.do?no=${param.no }'/>">
				수정</a> |
        	<a href="<c:url value='/tuition/tuitionDelete.do?no=${param.no}'/>" >
        		삭제</a> |
        	<a href="<c:url value='/tuition/tuitionList'/>">
        		목록</a>			
		</div>
	</div>
	</form>
	</div>
</div>   

<%@ include file="../inc/bottom.jsp"%>
