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
	.wrap {
    position: relative;
    width: 500px;
    margin: 0 auto;
}
/* 확대될 타겟이미지*/
.target {
    display: block;
    width: 100%;
}
/* 돋보기 */
.magnifier {
    width: 150px;
    height: 150px;
    position: absolute;
    border-radius: 100%;
    box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.85), 0 0 3px 3px rgba(0, 0, 0, 0.25);
    display: none;
}
</style>

<title>Insert title here</title>
</head>
<body>
<img src="<c:url value='/resources/images/campusMap2.jpg' />" id = "zoom1" class = "cloud-zoom"
     data-cloudzoom = "zoomImage: '<c:url value='/resources/images/campusMap2.jpg' />'" />

<!-- Identify elements as gallery elements using the 'cloudzoom-gallery' class. -->
<!-- Use the 'useZoom' option to associate the element to specific Cloud Zoom instance. -->
<a  href="#" class="cloud-zoom-gallery"
    data-cloudzoom =
         "useZoom: '#zoom1', image: '<c:url value='/resources/images/campusMap2.jpg' />', zoomImage: '<c:url value='/resources/images/campusMap2.jpg' />'"
    >Image 1</a>

<a  href="#" class="cloudzoom-gallery"
    data-cloudzoom =
         "useZoom: '#zoom1', image: 'image2.jpg', zoomImage: 'bigimage2.jpg'"
    >Image 2</a>

<a  href="#" class="cloudzoom-gallery"
    data-cloudzoom =
         "useZoom: '#zoom1', image: 'image3.jpg', zoomImage: 'bigimage3.jpg'"
    >Image 3</a>
</body>
</html>