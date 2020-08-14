<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src = "http://code.jquery.com/jquery-latest.min.js"></script>
<script type = "text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type = "text/javascript" src = "https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<!-- 재학 증명서 -->
</head>
<script type="text/javascript">
$(function() {
	$.ajax( {
		url : "<c:url value='/certificate/certificate1'/>",
		data : {no: '${no}'},
		type :"get",
		async : true,
		dataType : "html",
		cache : false,
		success : function(res) {
			//pdf_wrap을 canvas객체로 변환
			$('#data').html(res);
			html2canvas($('#data').find(".certificate")[0]).then(function(canvas) {
				  var doc = new jsPDF('p', 'mm', 'a4'); //jspdf객체 생성
				  var imgData = canvas.toDataURL('image/png'); //캔버스를 이미지로 변환
				  doc.addImage(imgData, 'PNG', 0, 0); //이미지를 기반으로 pdf생성
				  doc.save('${vo.certName }.pdf'); //pdf저장
					
				});
			self.close();
		}
	});
});
</script>
</head>
<body>
<div id="data" style="overflow: hidden; height: 0px;">
</div>
</body>
</html>