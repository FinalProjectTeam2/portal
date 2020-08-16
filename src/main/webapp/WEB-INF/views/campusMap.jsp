<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<c:url value='/resources/js/cloud-zoom.css' />">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- main 시작 -->
<script type="text/javascript">
$(document).ready(function() {
$('#tabs').tabs(); // 탭
});
</script>

<script type="text/javascript" src="<c:url value='/resources/js/cloud-zoom.1.0.2.min.js' />"></script>
<style>

	#tabs table, th, td{
		text-align: center;
	}
	
	#tabs td, th{
		padding: 10px;
	}
	
	#tabs table{
		margin: 0 auto;
		width: 100%;
		font-size: 1.1em;
	}
	/* 확대될 타겟이미지*/
.target {
    display: block;
    width: 100%;
}
/* 돋보기 */
.magnifier {
    width: 200px;
    height: 200px;
    position: absolute;
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
    display: none;
}

	.wrap {
    position: relative;
    margin: 0 auto;
}

</style>
<script type="text/javascript">
window.onload = function(){
	  var target = $('.target');
	  var zoom = target.data('zoom');

	  $(".wrap")
	    .on('mousemove', magnify)
	    .prepend("<div class='magnifier'></div>")
	    .children('.magnifier').css({
	    "background": "url('" + target.attr("src") + "') no-repeat",
	    "background-size": target.width() * zoom + "px " + target.height() * zoom+ "px"
	  });

	  var magnifier = $('.magnifier');

	  function magnify(e) {

	    // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
	    var mouseX = e.pageX - $(this).offset().left;
	    var mouseY = e.pageY - $(this).offset().top;

	    // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
	    if (mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0) {
	      magnifier.fadeIn(100);
	    } else {
	      magnifier.fadeOut(100);
	    }

	    //돋보기가 존재할 때
	    if (magnifier.is(":visible")) {

	      // 마우스 좌표 확대될 이미지 좌표를 일치시킨다.
	      var rx = -(mouseX * zoom - magnifier.width() /2 );
	      var ry = -(mouseY * zoom - magnifier.height() /2 );

	      //돋보기를 마우스 위치에 따라 움직인다.
	      //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
	      var px = mouseX - magnifier.width() / 2;
	      var py = mouseY - magnifier.height() / 2;

	      //적용
	      magnifier.css({
	        left: px,
	        top: py,
	        backgroundPosition: rx + "px " + ry + "px"
	      });
	    }
	  }
	};
</script>
<main role="main" class="flex-shrink-0" id="mainmain">
<div class="container">
<div id="cmap">
	<div style="margin-bottom: 2%">
		<img alt="" src="<c:url value='/resources/images/mapLogo.png' />" width="60px;">
		<span style="font-size: 2em; font-weight: bold">CAMPUS MAP</span>
	</div>
 	<div class="wrap" id="wrap">
		<img alt="캠퍼스맵" src="<c:url value='/resources/images/campusMap2.jpg' />" width="100%" height="650px;" id="big" class="target" data-zoom="2" > 
	</div> 

<div id="tabs">
	<ul>
		<c:set var="idx" value="1"></c:set>
		<c:forEach var="name" items="${buildingName }">
			<li><a id="tab${idx }" href="#tabContent_${idx }">${name.buildingName }</a></li>	
			<c:set var="idx" value="${idx+1 }"></c:set>
		</c:forEach>
	</ul>
		<div id="tabContent_1" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${mainList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>				
		</div>
		
		<div id="tabContent_2" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${gongList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>			
		</div>
		
		<div id="tabContent_3" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${scienceList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		
		<div id="tabContent_4" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${mediList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		<div id="tabContent_5" class="tabs"> 
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${artList }">
				<tr class="table-light">  
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
		<div id="tabContent_6" class="tabs">
			<table border="1">
				<colgroup>
					<col width="15%">
					<col width="60%">
					<col width="25%">
				</colgroup>
				<tr class="table-info">
					<th>학과실</th>
					<th>상세위치</th>
					<th>전화번호</th>
				</tr>
			<c:forEach var="vo" items="${inmoonList }">
				<tr class="table-light">
					<td>${vo.buildingCode }</td>				
					<td style="text-align: left;">${vo.detail }</td>				
					<td>${vo.tel }</td>				
				</tr>	
			</c:forEach>
			</table>
		</div>
</div>
</div>

<!-- bottom -->		
<%@ include file="inc/bottom.jsp"%>