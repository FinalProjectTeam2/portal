<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/top.jsp"%>
<%@ include file="../inc/portalSidebar.jsp"%>

<sec:authentication var="principal" property="principal" />
<style type="text/css">
.divTable { 
	display: table; 
	width: 800px;
	
}
	
.divTableRow { 
	display: table-row; 
}

.divTableHeading { 
 	background-color: #EEE; 
 	display: table-header-group; 
} 

.divTableCell, .divTableHead, .cellColor{ 
 	border: 1px solid #999999; 
 	display: table-cell; 
 	padding: 3px 10px; 
} 

.cellColor {
	color:white;
	background-color: gray;
}

.divTableHeading { 
	background-color: #EEE; 
	display: table-header-group; 
	font-weight: bold; 
} 
 
.divTableFoot {
	background-color: #EEE; 
	display: table-footer-group; 
	font-weight: bold; 
} 

.divTableBody { 
	display: table-row-group; 
}

<!-- 테이블 -->	
.box {
	width: 1000px;
	margin:10px 0;
	padding:10px 5px 10px 0;
	border:solid silver 1px;
}

.box tr, td {
	font-family: 'nanum gothic',맑은 고딕, 한컴돋움, 돋움;
	font-size: 0.9em;
	padding: 4px;
	
}
</style>
<div id="tuition">
	<div class="title">
		<h1>등록금 관리 글쓰기</h1>
	</div>

<form name="frmEdit" method="post" action="<c:url value='/tuition/tuitionEdit'/>">
<input type="hidden" name="no" value="${param.no}">
        <div class="firstDiv">
            <label for="title">입학금</label>
            <input type="text" id="title" name="title"  />
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
            <input type = "submit" value="수정"/>
            <input type = "Button" value="목록" onclick="location.href='<c:url value='/tuition/tuitionList'/>'" />   
  
        </div>
</form>
</div>   

<br><br><br>

</div>
<%@ include file="../inc/bottom.jsp"%>
