<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
#uploadForm{
  position: relative;
  top: 50%;
  left: 50%;
  margin-left: -265px;
  width: 445px;
  height: 200px;
  border: 4px dashed gray;
}
form p{
  width: 100%;
  height: 100%;
  text-align: center;
  line-height: 170px;
  color: black;
  font-family: Arial;
}
form input{
  position: absolute;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  outline: none;
  opacity: 0;
}
#btUpload{
  position: relative;
  margin: 0;
  color: #fff;
  background: #16a085;
  border: none;
  width: 445px;
  height: 35px;
  margin-left: -4px;
  border-radius: 4px;
  border-bottom: 4px solid #117A60;
  transition: all .2s ease;
  outline: none;
}
#btUpload:hover{
  background: #149174;
	color: #0C5645;
}
#btUpload:active{
  border:0;
}

#info{
	position: relative;
	top: 26%;
	left: 28%;
	width: 500px;
	padding-right: 20%;
}
div#assign {
    border-bottom: 1px solid gray;
    padding-bottom: 1%;
    margin-bottom: 10px;
}

</style>

<script type="text/javascript">
	$(function(){
		$('#assign').hide();
		$('#subjCode').change(function(){
			if($('#subjCode option:selected').val()!='all'){
				$('#assign').show();
			}else{
				$('#assign').hide();
			}
		});
		
	});


    // 파일 리스트 번호
    var fileIndex = 0;
    // 등록할 전체 파일 사이즈
    var totalFileSize = 0;
    // 파일 리스트
    var fileList = new Array();
    // 파일 사이즈 리스트
    var fileSizeList = new Array();
    // 등록 가능한 파일 사이즈 MB
    var uploadSize = 50;
    // 등록 가능한 총 파일 사이즈 MB
    var maxUploadSize = 500;
 
    $(function(){
        // 파일 드롭 다운
        fileDropDown();
        
        
    });
 
    // 파일 드롭 다운
    function fileDropDown(){
        var dropZone = $("#dropZone");
        //Drag기능 
        dropZone.on('dragenter',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('dragleave',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
        });
        dropZone.on('dragover',function(e){
            e.stopPropagation();
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#E3F2FC');
        });
        dropZone.on('drop',function(e){
            e.preventDefault();
            // 드롭다운 영역 css
            dropZone.css('background-color','#FFFFFF');
            
            var files = e.originalEvent.dataTransfer.files;
            if(files != null){
                if(files.length < 1){
                    alert("폴더 업로드 불가");
                    return;
                }
                selectFile(files)
            }else{
                alert("ERROR");
            }
        });
    }
 
    // 파일 선택시
    function selectFile(files){
        // 다중파일 등록
        if(files != null){
            for(var i = 0; i < files.length; i++){
                // 파일 이름
                var fileName = files[i].name;
                var fileNameArr = fileName.split("\.");
                // 확장자
                var ext = fileNameArr[fileNameArr.length - 1];
                // 파일 사이즈(단위 :MB)
                var fileSize = files[i].size/1024/1024;
                
                if($.inArray(ext, ['pdf']) != 0){
                    // 확장자 체크
                    alert("pdf만 등록 가능합니다.");
                    break;
                }else if(fileSize > uploadSize){
                    // 파일 사이즈 체크
                    alert("용량 초과\n업로드 가능 용량 : " + uploadSize + " MB");
                    break;
                }else{
                    // 전체 파일 사이즈
                    totalFileSize += fileSize;
                    
                    // 파일 배열에 넣기
                    fileList[fileIndex] = files[i];
                    
                    // 파일 사이즈 배열에 넣기
                    fileSizeList[fileIndex] = fileSize;
 
                    // 업로드 파일 목록 생성
                    addFileList(fileIndex, fileName, fileSize);
 
                    // 파일 번호 증가
                    fileIndex++;
                }
            }
        }else{
            alert("ERROR");
        }
    }
 
    // 업로드 파일 목록 생성
    function addFileList(fIndex, fileName, fileSize){
        var html = "";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "    <td class='left' >";
        html +=         fileName + " / " + fileSize + "KB "  + "<a href='#' onclick='deleteFile(" + fIndex + "); return false;' class='btn small bg_02'><img style='width:17px; height:auto;' src='<c:url value='/resources/images/deleteIcon.png'/>'></a>"
        html += "    </td>"
        html += "</tr>"
 
        $('#fileTableTbody').append(html);
    }
 
    // 업로드 파일 삭제
    function deleteFile(fIndex){
        // 전체 파일 사이즈 수정
        totalFileSize -= fileSizeList[fIndex];
        
        // 파일 배열에서 삭제
        delete fileList[fIndex];
        
        // 파일 사이즈 배열 삭제
        delete fileSizeList[fIndex];
        
        // 업로드 파일 테이블 목록에서 삭제
        $("#fileTr_" + fIndex).remove();
    }
 
    // 파일 등록
    function uploadFile(){
        // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);
		
        // 이론시간 등록되었는지 체크
		if($('#theoryTime').val().length < 1){
        	alert('이론시간을 입력해야 합니다.');
        	return;
        }

        // 실기시간 등록되었는지 체크
		if($('#trainingTime').val().length < 1){
        	alert('실기시간을 입력해야 합니다.');
        	return;
        }
        
        // 파일이 있는지 체크
        if(uploadFileList.length == 0){
            // 파일등록 경고창
            alert("파일이 없습니다.");
            return;
        }
        
        // 용량을 500MB를 넘을 경우 업로드 불가
        if(totalFileSize > maxUploadSize){
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }
        
        
        if(confirm("등록 하시겠습니까?")){
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form =document.getElementById("uploadForm");
            var formData = new FormData(form);
            for(var i = 0; i < uploadFileList.length; i++){
                formData.append('files', fileList[uploadFileList[i]]);
            }
            formData.append('openSubCode', $('#openSubj').val());
            formData.append('theoryTime', $('#theoryTime').val());
            formData.append('trainingTime', $('#trainingTime').val());
            
            $.ajax({
                url:"<c:url value='/syllabus/upload'/>",
                data:formData,
                type:'POST',
                enctype:'multipart/form-data',
                processData:false,
                contentType:false,
                cache:false,
                success:function(res){
                    	alert(res);
                        location.reload();
                        
                
                },error(xhr, status, error){
                	alert(error);
                }
            });
        }
    }
	
	
	
	
	
	
	
	
</script>
<main role="main" class="flex-shrink-0">
<div class="container">
<h2>과제 등록 페이지</h2><hr>
<div id="subj">
	<h4>수강중인 과목을 선택하세요</h4>
	<select class="form-control" id="subjCode" style="width: 72%;">
		<c:if test="${empty list }">
			<option value="all">수강신청 된 과목이 없습니다.</option>
		</c:if>
		<c:if test="${!empty list }">
			<option value="all">과목을 선택해 주세요</option>
			<c:forEach var="map" items="${list }">
				<option value="${map['SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select><br>	
</div>
<div id="assign">
	<h4>과제를 선택하세요</h4>
	<select class="form-control" id="assignment" style="width: 72%;">
		<c:if test="${!empty list }">
			<c:forEach var="map" items="${list }">
				<option value="${map['SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select>
</div>

<div id="info">
	<form name="uploadForm" id="uploadForm" enctype="multipart/form-data" method="post">
    	<input type="file" id="dropZone" multiple="multiple" name="file">
  			<p>파일을 여기에 넣어주세요.</p>
  			
    	
    	
        <table class="table" width="100%" border="1px">
            <tbody id="fileTableTbody">
               
            </tbody>
        </table>
        <button onclick="uploadFile(); return false;" class="btn bg_01" id="btUpload">파일 업로드</button>
    </form>
</div>




<%@ include file="../inc/bottom.jsp"%>