<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>

<!-- main 시작 -->
<script>

$(function() {
	var result = $(".result");
	var slider = $(".custom-range")
	slider.on('input', function() {
	    result.html( $(this).val() );
	});
	
});

</script>

<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
	<div id="subjEval">
	   	<ul>
	   		<li>Q1</li>
	   	</ul>
	    <input type="range" class="custom-range">
	    <p class="result" style="text-align: center;">0</p>
	</div>
<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>