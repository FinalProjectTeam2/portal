<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");
    if (fileFormat.indexOf("xls") > -1) {
        return true;
    } else if(fileFormat.indexOf("xlsx") > -1){
    	return true;
    }else{
    	return false;
    }

}


function check() {
    var file = $("#excelFile").val();
    if (file == "" || file == null) {
        alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
        alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }
	var form = $('#excelUploadForm')[0];
	
	var data = new FormData(form);
	
	if (confirm("업로드 하시겠습니까?")) {
	
	    $.ajax({
	    	type: "POST",
	        enctype: 'multipart/form-data',
	        url: "<c:url value='/excelTest/excelUploadAjax'/>",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        success:function(res){
	        	alert('성공');
	        },
	        error:function(xhr, status, error){
	        	alert(error);
	        }
	    	
	    });
    
	}
    
}

$(function(){
	$('#addExcelImpoartBtn').click(function(){
		check();
	});
});


</script>
</head>
<body>
<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" 
                                action= "<c:url value='/excelUploadAjax'/>">
    <div class="contents">
        <div>첨부파일은 한개만 등록 가능합니다.</div>
 
        <dl class="vm_name">
                <dt class="down w90">첨부 파일</dt>
                <dd><input id="excelFile" type="file" name="excelFile" /></dd>
        </dl>        
    </div>
            
    <div class="bottom">
        <button type="button" id="addExcelImpoartBtn" class="btn" ><span>추가</span></button> 
    </div>
</form> 


</body>
</html>