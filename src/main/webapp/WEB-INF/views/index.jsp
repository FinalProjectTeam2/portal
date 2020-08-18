<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<%@ include file="inc/mainSidebar.jsp"%>
<link href="<c:url value='/resources/css/index.css' />" rel="stylesheet">
<style>
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

.title {
	margin: 10px 5px;
	font-weight: bold;
	font-size: 1.2em;
}

.list-group-item {
	font-size: 0.9em;
}
#map{
	width: 130px;
}
a#goMap {
    width: 100%;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 8px;
    background: wheat;
    box-shadow: 1px 1px 1px #7d6436;
    color: #000000;
    font-weight: bold;
}
a#goMap:hover {
	text-decoration: none;
}
#box li a{
	color: black;
}
#box li a:hover{
	color: #007bff;
}
</style>
<script type="text/javascript">
var img = '<svg width="1.7em" height="1.7em" viewBox="0 0 16 16"'+
'class="bi bi-file-plus" fill="currentColor"'+
	'xmlns="http://www.w3.org/2000/svg">'
	+ '<path fill-rule="evenodd"'+
			'd="M4 1h8a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H4z" />'
	+ '<path fill-rule="evenodd"'+
		'd="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z" />'
	+ '</svg>';
function detail(no) {
	var win = window.open("<c:url value='/message/messageDetail?no='/>"+no, "_blank",
	"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=500,height=390");
	return false;
}
$(function() {
	
	$.ajax({
		url : "<c:url value = '/portal/board/ajax/main'/>",
		type : "get",
		data : "categoryCode=N",
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
					var postIsPrivate = PostsVO.isPrivate;
				 		if(postIsPrivate=='Y'){
						continue;
					}  
					boxByBdcode += '<li class="list-group-item"><a href=\'<c:url value=""/>/portal/portal/board/detail?postNo='+PostsVO.postNo+'\'>';
					if(title.length > 30){
						boxByBdcode += title.substr( 0, 30 ) + '...';
					}else{
						boxByBdcode += title;
					}	
					boxByBdcode += '</a><span style="float: right;">'+moment(PostsVO.regDate).format('YYYY-MM-DD')+'</span></li>';
				}
				
				boxByBdcode+='</ul><a href=\'<c:url value=""/>/portal/portal/board/list?ctCode=N&bdCode='+ bdCode +'\' class="more"></a></div>';
				$('#box').append(boxByBdcode);
				$('.more').html(img);
			}
		}
	});
});
</script>
<sec:authorize access="isAuthenticated()">
<script type="text/javascript">
$(function() {
	$.ajax({
		url : "<c:url value = '/message/selectMainList'/>",
		type : "get",
		dataType:"json",	
		success:function(res){
				
			var boxByBdcode = '<div class="indexDOM_small"><p class="title">쪽지함</p>'
							+ '<ul class="list-group list-group-flush" id="writingsList">';
			if(res.length > 0){
				$.each(res, function(idx, item) {
					boxByBdcode += '<li class="list-group-item"><a href="" onclick="detail('+item.no+')">';
					if(item.contents.length > 10){
						boxByBdcode += item.contents.substr( 0, 10 ) + '...';
					}else{
						boxByBdcode += item.contents;
					}	
					boxByBdcode += '</a><span style="float: right;">('+item.officialName+')</span></li>';
				});
			}else{
				boxByBdcode += '<li class="list-group-item">';
				boxByBdcode += '최근 쪽지가 없습니다.';
				boxByBdcode += '</li>';
			
			}
			
			boxByBdcode+='</ul><a href=\'<c:url value=""/>/message/messageBox\' class="more"></a></div>';
			
			$('#campMap').after(boxByBdcode);
			$('.more').html(img);
		}
	});
});
</script>
</sec:authorize>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">

	<div class="container">

		<div style="overflow: hidden;" id="box">
			<div class="indexDOM_large">
				<%@include file="chat/chatRooms.jsp" %>
			</div>
			
			<div class="indexDOM_small" id="campMap">
				<p class="title">캠퍼스 맵</p>
				<div style="text-align: center; margin: 50px 0;">
					<img id="map" alt="mapIcon" src="<c:url value='/resources/images/mapIcon.png'/>">
				</div>
				<div>
					<a id="goMap" href="<c:url value='/campusMap'/>">캠퍼스 지도</a>
				</div>
			</div>
		</div>
			
		<%@ include file="inc/bottom.jsp"%>
