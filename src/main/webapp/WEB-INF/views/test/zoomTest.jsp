<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/js/cloud-zoom.css' />">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/cloud-zoom.1.0.2.min.js' />"></script>
<meta charset="UTF-8">
<style type="text/css">
*{margin:0px;padding:0;list-style-type:none;}
body{background:#E9F0F5;font-family:Arial, Helvetica, sans-serif;font-size:13px;margin:0px;padding:0px;}
html{background-color:#E9F0F5;}
img{border:none;}
h3{font-family:Tahoma, Geneva, sans-serif;font-size:14px;color:#333;letter-spacing:1px;margin-top:10px;margin-bottom:10px;}
p{margin-bottom:10px;margin-top:10px;line-height:22px;}
.demo{margin:0 auto;width:600px;}
.tickul li{line-height:24px;}
/* zoom-section */
.zoom-section{clear:both;margin-top:20px;}
*html .zoom-section{display:inline;clear:both;}
.zoom-desc{float:left;margin-left:10px;width:310px;margin-bottom:20px;}
.zoom-small-image{border:4px solid #CCC;float:left;margin-bottom:20px;}
.zoom-tiny-image{border:1px solid #CCC;margin:0px;}
.zoom-tiny-image:hover{border:1px solid #C00;}
</style>

<title>Insert title here</title>
</head>
<body>
<div class="zoom-section">    	  
		<div class="zoom-small-image">
			<a href='<c:url value='/resources/images/campusMap2.jpg' />' class = 'cloud-zoom' id='zoom1' rel="adjustX:10, adjustY:-4">
			<img src="<c:url value='/resources/images/campusMap2.jpg' />" alt='' title="Optional title display" />
		</a></div>
		<div class="zoom-desc">
			<h3></h3>       
			<p><a href='<c:url value='/resources/images/campusMap2.jpg' />' class='cloud-zoom-gallery' title='Red'
	rel="useZoom: 'zoom1', smallImage: '/SRC2/imgzoom/images/smallimage.jpg' "><img class="zoom-tiny-image" src="/SRC2/imgzoom/images/tinyimage.jpg" alt = "Thumbnail 1"/></a>
			
			
			<a href='/SRC2/imgzoom/images/bigimage01.jpg' class='cloud-zoom-gallery' title='Blue' rel="useZoom: 'zoom1', smallImage: ' /SRC2/imgzoom/images/smallimage-1.jpg'"><img class="zoom-tiny-image" src="/SRC2/imgzoom/images/tinyimage-1.jpg" alt = "Thumbnail 2"/></a>                  
			<a href='/SRC2/imgzoom/images/bigimage02.jpg' class='cloud-zoom-gallery' title='Blue' rel="useZoom: 'zoom1', smallImage: '/SRC2/imgzoom/images/smallimage-2.jpg' "><img class="zoom-tiny-image" src="/SRC2/imgzoom/images/tinyimage-2.jpg" alt = "Thumbnail 3"/></a></p>

		</div>
	</div><!--zoom-section end-->
		
	<div class="zoom-section">
		<div class="zoom-small-image">
			<a href='/SRC2/imgzoom/images/bigimage03.jpg' class='cloud-zoom' rel="tint:'#ff0000',tintOpacity:0.5,smoothMove:5,zoomWidth:480,adjustY:-4,adjustX:10"><img src="/SRC2/imgzoom/images/smallimage-3.jpg" title="Optional Title Text" alt='' /></a>
		</div>
		<div class="zoom-desc">

		</div>
	</div><!--zoom-section end-->
  
	<div class="zoom-section">
		<div class="zoom-small-image">
			<a href='/SRC2/imgzoom/images/bigimage04.jpg' class='cloud-zoom' rel="position:'inside',showTitle:false,adjustX:-4,adjustY:-4"><img src="/SRC2/imgzoom/images/smallimage-4.jpg" title="Your caption here" alt=''/></a>
		</div>
		<div class="zoom-desc">

		</div>
	</div><!--zoom-section end-->
 
	<div class="zoom-section">
		<div class="zoom-small-image">
			<a href='/SRC2/imgzoom/images/bigimage01.jpg' class='cloud-zoom' title="Your caption here" rel="softFocus: true, position:'anypos', smoothMove:2"><img src="/SRC2/imgzoom/images/smallimage-1.jpg" alt='' /></a>
		</div>
		<div class="zoom-desc" style="position:relative">
			<div id="anypos" style="position:absolute;top:-128px; left: 128px;width:356px;height:256px;"></div>

		</div>
	</div>
</div>
</body>
</html>