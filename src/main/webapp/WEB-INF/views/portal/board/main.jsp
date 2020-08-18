<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp"%>
<%@ include file="../../inc/portalSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style type="text/css">
.container {
	width: 1000px;
}

.indexDOM_large {
	position: relative;
	padding: 5px 10px;
}

a.more {
	display: inline-block;
	overflow: hidden;
	position: absolute;
	top: 11px;
	right: 7px;
}

.list-group-item {
	background: #ffffff00;
}

.container .indexDOM_large .title {
	margin: 10px 5px;
	font-weight: bold;
	font-size: 1.2em;
}

.list-group-item {
	font-size: 0.9em;
}
</style>
<script type="text/javascript">
	$(function() {
		var img = '<svg width="1.7em" height="1.7em" viewBox="0 0 16 16"'+
		'class="bi bi-file-plus" fill="currentColor"'+
			'xmlns="http://www.w3.org/2000/svg">'
			+ '<path fill-rule="evenodd"'+
					'd="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />'
			+ '<path fill-rule="evenodd"'+
				'd="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z" />'
			+ '</svg>';
			
		var categoryCode = $('#categoryCode').val();
		
		$.ajax({
			url : "<c:url value = '/portal/board/ajax/main'/>",
			trype : "get",
			data : "categoryCode=" + categoryCode,
			dataType:"json",	
			success:function(res){
				for(var i  =0; i < res.length ; i++){
					var bdCode = res[i].bdCode; 
					var bdName = res[i].bdName;
					var usage = res[i].usage;
					var isPrivate = res[i].isPrivate;
					
		 			if(usage=='N' || isPrivate =='Y'){
						continue;
					}
					
					 var postsList = res[i].postsList; 
					var boxByBdcode = '<div class="indexDOM_large"><p class="title">'+bdName +'</p>'
									+ '<ul class="list-group list-group-flush" id="writingsList">';
									
					for(var j  =0; j < postsList.length ; j++){
						var PostsVO = postsList[j];
						var title= PostsVO.title;
						if(title.length > 30){
							title = title.substring(0,30) + '...';
						}
						var postIsPrivate = PostsVO.isPrivate;
 				 		if(postIsPrivate=='Y'){
							continue;
						}  
						boxByBdcode += '<li class="list-group-item"><a href=\'<c:url value=""/>/portal/portal/board/detail?postNo='+PostsVO.postNo+'\'>'+ title +'</a></li>';
					}
					
					boxByBdcode+='</ul><a href=\'<c:url value=""/>/portal/portal/board/list?ctCode='+categoryCode +'&bdCode='+ bdCode +'\' class="more"></a></div>';
					$('#box').append(boxByBdcode);
					$('.more').html(img);
				}
			}
		});
		
	});
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
	<div class="container">
		<div style="overflow: hidden;" id="box">
			<input type="hidden" id="categoryCode" value="${param.categoryCode }">

		</div>
		<%@ include file="search.jsp"%>
		<%@ include file="../../inc/bottom.jsp"%>