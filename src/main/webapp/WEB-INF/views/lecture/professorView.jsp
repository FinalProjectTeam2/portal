<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
#tableDiv th{
	color: black;
	text-align: center;
}
#tableDiv td{
	color: black;
	text-align: center;
}
#btUpdate{
  position: relative;
  margin: 0;
  color: #fff;
  background: #16a085;
  border: none;
  width:15%;
  height: 35px;
  margin-left: -4px;
  border-radius: 4px;
  border-bottom: 4px solid #117A60;
  transition: all .2s ease;
  outline: none;
  margin-top:5%;
  margin-left: 82%;
}



#btUpdate:hover{
  background: #149174;
	color: #0C5645;
}
#btUpdate:active{
  border:0;
}

input.upload-name {
    float: left;
    border-top: 1px solid;
    border-bottom: 1px solid;
    padding: 4px 0;
    margin: 2px 0;
    border-color: #aeaeae;
}

.filebox > * {
    /* margin: 0 0; */
}

.filebox label {
  float:left;
  display: inline-block;
  padding: .46em .75em;
  color: #fff;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #5cb85c;
  cursor: pointer;
  border: 1px solid #4cae4c;
  border-radius: .25em;
  -webkit-transition: background-color 0.2s;
  transition: background-color 0.2s;
}

.filebox label:hover {
  background-color: #6ed36e;
}

.filebox label:active {
  background-color: #367c36;
}

.filebox input[type="file"] {
float:left;
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
</style>

<script type="text/javascript">
	var code=${openSubCode};
	$('#subjCode').val(code);
	showList();
	
	$(function(){
		
		var fileTarget = $('#excelFile'); 
		  fileTarget.on('change', function(){ // 값이 변경되면
			  var fName = $(".filebox input[type='file']").val();
		  	  var index = fName.lastIndexOf('\\')+1;
		      var cur= fName.substr(index);
		    $(".upload-name").val(cur);
		  }); 
		
		
		
		$('#addExcelImportBtn').click(function(){
			inputScoreByExcel();
			return false;
		});
		$('#subjCode').change(function(){
			showList();	
		});
		
		$('#btXls').click(function(){
			/* $.ajax({
				url:"<c:url value='/lecture/downloadScore'/>",
				type:"post",
				data:{
					"subjCode":$('#subjCode option:selected').val(),
					"subjName":$('#subjCode option:selected').text()
				},
				success:function(res){
					alert('다운로드폴더에 저장 되었습니다.');
				}
				
			}); */
			location.href = "<c:url value='/lecture/downloadScore?subjCode='/>"+$('#subjCode option:selected').val()
					+"&subjName="+$('#subjCode option:selected').text();
		});
		
		
		
		
		$('.score').on("change keyup paste", function() {
		    var currentVal = $(this).val();
		    if(currentVal == oldVal) {
		        return;
		    }
		 
		    oldVal = currentVal;
		    alert("changed!");
		});
		
		
		$('#btUpdate').click(function(){
			
			if($('.firsttd').length < 2){
				alert('수강생 1명인 경우에는 테이블의 입력버튼을 이용하세요.');
				return;
			}
		
			
			var srt = "";
			var tdArr= [];
			$.each($('.firsttd'), function(idx, item){
				var tr = $(this).parent();
				var td = tr.children();
				
				var subCode=td.eq(0).text();
				var stuNo=td.eq(1).text();
				var name=td.eq(2).text();
				var classification=td.eq(3).text();
				var midterm=td.eq(4).children().val();
				var finals=td.eq(5).children().val();
				var assignment=td.eq(6).children().val();
				var attendance=td.eq(7).children().val();
				var etc=td.eq(8).children().val();
				var totalGrade=td.eq(9).children().val();
				
				var str=subCode+","+stuNo+","+classification+","+midterm+","+finals+","+assignment
				+","+attendance+","+etc+","+totalGrade;
				tdArr.push(str);
				
			});
			
			var allData = {"tdArr":tdArr};
			
			$.ajax({
				url:"<c:url value='/lecture/updateAllScore'/>",
				data:allData,
				type:"post",
				success:function(res){
					alert(res);
				}
			});
			
			
		});
		
		
		
	});
	
	
	function showList(){
		$.ajax({
			url:"<c:url value='/lecture/evaluation'/>",
			data:{"subCode":$('#subjCode').val()},
			dataType:"json",
			type:"post",
			success:function(res){
				if($('#subjCode option:selected').val()!='none'){
					$('#listTitle').text($("#subjCode option:selected").text()+" 수강생 목록");
				}else{
					$('#listTitle').text("수강생 목록");
				}
				var table = "<table border='1'>"+
								"<colgroup>"+
									"<col width='12%'>"+
									"<col width='10%'>"+
									"<col width='10%'>"+
									"<col width='10%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"<col width='10%'>"+
								"</colgroup>"+
								"<tr>"+
									"<th>수강신청 코드</th>"+
									"<th>학번</th>"+
									"<th>이름</th>"+
									"<th>수강구분</th>"+
									"<th>중간고사</th>"+
									"<th>기말고사</th>"+
									"<th>과제</th>"+
									"<th>출석</th>"+
									"<th>기타</th>"+
									"<th>총점</th>"+
									"<th></th>"
								"</tr>";
					if($('#subjCode option:selected').val()!='none'){			
						$.each(res, function(index, item){
							$('tr:odd').find('input').css('background', '#efefef');
							table += "<tr class='trScore'>"+
										"<td class='firsttd'>"+ item.subCode +"</td>"+
										"<td>"+ item.stuNo +"</td>"+
										"<td>"+ item.name +"</td>"+
										"<td>"+ item.classification +"</td>"+
										"<td class='score'><input type='text' size='3' value='"+ item.midterm +"'></td>"+
										"<td class='score'><input type='text' size='3' value='"+ item.finals +"'></td>"+
										"<td class='score'><input type='text' size='3' value='"+ item.assignment +"'></td>"+
										"<td class='score'><input type='text' size='3' value='"+ item.attendance +"'></td>"+
										"<td class='score'><input type='text' size='3' value='"+ item.etc +"'></td>"+
										"<td class='total'><input type='text' size='3' value='"+ item.totalGrade +"'></td>"+
										"<td><button type='button' class='btn btn-primary btOk'>입력</button></td>"+
									"</tr>";
						});
					}else{
						table+="<tr><td colspan='11'>개설하신 과목을 선택해주세요.</td></tr>";
					}
					table+="</table>";
					
					$('#tableDiv').html(table);
					
					$('.btOk').click(function(){
						var srt = "";
						var tdArr= new Array();
						var checkBtn= $(this);
						
						var tr = checkBtn.parent().parent();
						var td = tr.children();
						
						var subCode=td.eq(0).text();
						var stuNo=td.eq(1).text();
						var name=td.eq(2).text();
						var classification=td.eq(3).text();
						var midterm=td.eq(4).children().val();
						var finals=td.eq(5).children().val();
						var assignment=td.eq(6).children().val();
						var attendance=td.eq(7).children().val();
						var etc=td.eq(8).children().val();
						var totalGrade=td.eq(9).children().val();
						
						$.ajax({
							url:"<c:url value='/lecture/inputScore'/>",
							data:{
								"subCode":subCode,
								"stuNo":stuNo,
								"midterm":midterm,
								"finals":finals,
								"assignment":assignment,
								"attendance":attendance,
								"etc":etc
							},
							type:"post",
							success:function(res){
								alert(res);
								showList();
							}
							
						});
						
					});
					
					
					
					
			}, 
			error:function(xhr, status, error){
				alert(error)
			}
		});
		
}
	
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




function inputScoreByExcel(){
	var file = $("#excelFile").val();
    if (file == "" || file == null) {
        alert("파일을 선택해주세요.");
        return false;
    } else if (!checkFileType(file)) {
        alert("엑셀 파일만 업로드 가능합니다.");
        return false;
    }
    if($('#subjCode').val()=='none'){
		alert('성적을 입력할 강의를 선택해야합니다.');
		return;
	}
    
	var form = $('#excelUploadForm')[0];
	
	var data = new FormData(form);
	
	if (confirm("성적 입력 하시겠습니까?")) {
	
	    $.ajax({
	    	type: "POST",
	        enctype: 'multipart/form-data',
	        url: "<c:url value='/lecture/inputScoreByExcel'/>",
	        data: data,
	        processData: false,
	        contentType: false,
	        cache: false,
	        dataType:"json",
	        success:function(res){
	        	
	        	$.each(res, function(idx, item){
	        		$('.trScore:eq('+idx+') td:eq(4)').children().val(item['E']);
	        		$('.trScore:eq('+idx+') td:eq(5)').children().val(item['F']);
	        		$('.trScore:eq('+idx+') td:eq(6)').children().val(item['G']);
	        		$('.trScore:eq('+idx+') td:eq(7)').children().val(item['H']);
	        		$('.trScore:eq('+idx+') td:eq(8)').children().val(item['I']);
	        		$('.trScore:eq('+idx+') td:eq(9)').children().val(item['J']);
	        		
	        	});
	        	alert('성적입력 완료');
	        	$('.upload-name').val('');
	        },
	        error:function(xhr, status, error){
	        	alert(error);
	        }
	    	
	    });
    
	}	
}

</script>
<main role="main" class="flex-shrink-0">
<div class="container">
	<div><h2>과목을 선택하세요</h2></div>
	
	<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" 
                                action= "">
        <div class="filebox">
         <label for="excelFile">파일선택</label>
            <input id="excelFile" type="file" name="excelFile" />
     	  	<input class="upload-name" value="" disabled="disabled">
     	  <button type="button" id="addExcelImportBtn" class="btn btn-primary" style="margin-bottom: 7px" ><span>추가</span></button>      
  		  </div>
	<input type="button" id="btXls" value="excel로 다운받기" class="btn btn-primary" style="float: right; margin-right: 100px;">
	</form>
	<select class="form-control" id="subjCode" style="width: 72%;clear: both">
		<c:if test="${empty sList }">
			<option value="none">교수님께서 개설하신 과목이 없습니다.</option>
		</c:if>
		<c:if test="${!empty sList }">
			<option value="none">개설하신 과목을 선택해주세요.</option>
			<c:forEach var="map" items="${sList }">
				<option value="${map['OPEN_SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select>
	<hr style="border: solid 2px lightgray">
	<h4 id="listTitle"></h4>
	
	<div id="tableDiv">
	
	</div>
	<div>
		<button class="btn bg_01" id="btUpdate">성적 일괄 등록</button>
	</div>
<%@ include file="../inc/bottom.jsp"%>