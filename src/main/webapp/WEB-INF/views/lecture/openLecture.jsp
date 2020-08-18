<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.theme.css'/>">
<style>
 
    label, input { display:block; }
    input.text { margin-bottom:12px; width:95%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.3em; }
    
    #syllabus:hover{
    	text-decoration: none;
    	color: black;
    
    	
    }
    #syllabus{
    	text-decoration: none;
    	color: black;
    
    	
    }
    
    .tab{
    	float: left;
    }
    
    #timetableDiv{
    	clear:none;
    	width: 380px;
    	float: left;
    	margin-left: 50px;
    	
    }
    #timetableDiv table{
    	all:unset;
    	font-size: 0.8em;
    }

 


  
</style>
<script type="text/javascript">
	var time = '';

$(function(){
	timeTable();
	var dialog, form,
	subject = $( "#subject" ),
	time = $( "#time" ),
	credit = $( "#credit" ),
	allFields = $( [] ).add( subject ).add( time ).add( credit ),
	tips = $( ".validateTips" );
	
	$('#subject').change(function(){
		var openSubCode = $('#subject option:selected').val();
		var str="";
		$.ajax({
			url:"<c:url value='/lecture/changeSubj'/>",
			type:"post",
			dataType:"json",
			data:{
				"openSubCode":openSubCode
			},
			success:function(res){
				var len=res.length;
				if(len<1){
					str+="<option value='none'>등록된 강의실이 없습니다.</option>";
				}else if(len==1){
					str+="<option value='"+res[0].CLASSROOM_CODE+"'>"+res[0].CLASSROOM_NAME+"</option>";
				}else{
					str+="<option value='none'>---강의실을 선택하세요---</option>";
					$.each(res, function(idx, item){
						str+="<option value='"+item.CLASSROOM_CODE+"'>"+item.CLASSROOM_NAME+"</option>";
						console.log(item.CLASSROOM_CODE+","+item.CLASSROOM_NAME);
					});
				}
				$('#classroom').html(str);
					
			}
			
		});
		$('#classroom').html();
	});
	
	
	
	
	
	//강의 계획서 업로드 
	$('#syllabus').click(function(){
		window.open("<c:url value='/syllabus/upload'/>", "syllabusUpload", 
				"width=600, height=600, left=200, top=100")
	});
	
	
	
	function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    }
	 	
	 	
		/* 	$.each(res, function(idx, item){
			var id = item.컬럼명
			$('#'+id).html('<p>'+item.name+'</p>');
		})	 */
	 
	    function addSubject() {
			
			$('.lectureList').each(function(){
				//화면 우측 테이블에 현재 입력하려는 과목의 학점과 입력한 개수가 같으면 더이상 입력이 되지않도록 처리
				if($(this).children().eq(0).text()==$('#subject option:selected').text()){
					if($(this).children().eq(1).text()==$(this).children().eq(2).text()){
						alert('더이상 등록할 수 없습니다.');
						return;
					}else{
						 var subject=$('#subject option:selected').val();
			    		 var time=$('#time').val();
			    		 var classroom =$('#classroom option:selected').val();
			    		 console.log(subject+","+time+","+classroom+","+$('#classroom option:selected').text());
					     $.ajax({
					    	 url:"<c:url value='/lecture/addSubject'/>",
					    	 type:"post",
					    	 data:{
					    		 "subject":$('#subject option:selected').val(),
					    		 "time":$('#time').val(),
					    		 "classroom":$('#classroom option:selected').val()
					    	 },	    	
					    	 success:function(res){
					    		 alert(res);
					    		 dialog.dialog( "close" );
					    		 timeTable();
					    		 updateTable();
					    		location.reload();
					    	 },
					    	 error:function(xhr, status, error){
					    		 alert(error);
					    	 }
					    	 
					    	 
					     });
					}
						
				}
				
				
			});
			
	    }
			 
	    dialog = $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 500,
	      width: 350,
	      modal: true,
	      buttons: {
	        "등록하기":addSubject,
	        "취소": function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
	    	  form[ 0 ].reset();
	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	 	
	    
	    form = dialog.find( "form" ).on( "submit", function( event ) {
	      
	      addSubjet();
	      return false;
	    });
	 
	    $( ".input" ).on( "click", function() {
	        dialog.dialog( "open" );
	        time = $(this).attr("id");
	        $("#time").val(time);
	        $("#time").attr("readonly", true);
	      });
});

function updateTable(){
	
	$.ajax({
		url:"<c:url value='/lecture/updateTable'/>",
		dataType:"json",
		success:function(res){
			var table="<p>${principal.name} 교수님의 전체 강의 계획</p>"+
				"<table border='1'>"+
					"<tr>"+
						"<th>과목명</th>"+
						"<th>학점</th>"+
						"<th>입력 학점</th>"+
					"</tr>";
				$.each(res, function(index, item){
					table+="<tr>";
					table+="<td class='subName'>"+item.subjName+"</td>";
					table+="<td class='cred'>"+item.credit+"</td>";
					table+="<td class='cnt'>"+item.count+"</td>";
					table+="</tr>";
				});	
				table+="</table>";
				$('#timetableDiv').html(table);
		},
		error:function(xhr, status, error){
			alert(error);
		}
	});
}





function timeTable(){
	$.ajax({
		url:"<c:url value='/lecture/timeByProfNo'/>",
		data:{
			"profNo":"${principal.officialNo}"	
		},
		dataType:"json",
		success:function(res){
			$.each(res, function(idx, item){
				var tdId=item.timetableCode;
				tdId = '#'+tdId;
				console.log(tdId);
				var bColor = '#A'+ item.classroomCode.substring(5, 8);
				var color = '#5'+ item.classroomCode.substring(5, 8);
				console.log(bColor);
				$(tdId).html(item.subjName);
				$(tdId).css('background', bColor);
				$(tdId).css('color', color);
			});
		},
		error:function(xhr, status, error){
			alert(error);
		}
	});
}
</script>




<main role="main" class="flex-shrink-0">
<div class="container">
	<h2>강의시간 설정</h2><a id="syllabus" href="#" style="float: right; margin-right: 38%;">강의 계획서 업로드<img style="width: 20px; height: auto;" src="<c:url value='/resources/images/uploadIcon.png'/>"></a></label>
	<h4>${principal.name} 교수님의 시간표 </h4>
	<div class='tab' id="timetableMain">
	  <table border='0' cellpadding='0' cellspacing='0'>
	    <tr class='days'>
	      <th></th>
	      <th>월</th>
	      <th>화</th>
	      <th>수</th>
	      <th>목</th>
	      <th>금</th>
	    </tr>
	    <tr>
	      <td class='time'>1교시<br>09:00~09:50</td>
	      <td class="input" id="MO1"></td>
	      <td class="input" id="TU1"></td>
	      <td class="input" id="WE1"></td>
	      <td class="input" id="TH1"></td>
	      <td class="input" id="FR1"></td>
	    </tr>
	    <tr>
	      <td class='time'>2교시<br>10:00~10:50</td>
	      <td class="input" id="MO2"></td>
	      <td class="input" id="TU2"></td>
	      <td class="input" id="WE2"></td>
	      <td class="input" id="TH2"></td>
	      <td class="input" id="FR2"></td>
	    </tr>
	    <tr>
	      <td class='time'>3교시<br>11:00~12:00</td>
	      <td class="input" id="MO3"></td>
	      <td class="input" id="TU3"></td>
	      <td class="input" id="WE3"></td>
	      <td class="input" id="TH3"></td>
	      <td class="input" id="FR3"></td>
	    </tr>
	    <tr>
	      <td class='time'>4교시<br>12:00~13:00</td>
	      <td class="input" id="MO4"></td>
	      <td class="input" id="TU4"></td>
	      <td class="input" id="WE4"></td>
	      <td class="input" id="TH4"></td>
	      <td class="input" id="FR4"></td>
	    </tr>
		  <tr>
	      <td class='time'>5교시<br>14:00~15:00</td>
	      <td class="input" id="MO5"></td>
	      <td class="input" id="TU5"></td>
	      <td class="input" id="WE5"></td>
	      <td class="input" id="TH5"></td>
	      <td class="input" id="FR5"></td>
	    </tr>
	    <tr>
	      <td class='time'>6교시<br>15:00~16:00</td>
	      <td class="input" id="MO6"></td>
	      <td class="input" id="TU6"></td>
	      <td class="input" id="WE6"></td>
	      <td class="input" id="TH6"></td>
	      <td class="input" id="FR6"></td>
	    </tr>
	    <tr>
	      <td class='time'>7교시<br>16:00~17:00</td>
	      <td class="input" id="MO7"></td>
	      <td class="input" id="TU7"></td>
	      <td class="input" id="WE7"></td>
	      <td class="input" id="TH7"></td>
	      <td class="input" id="FR7"></td>
	    </tr>
	    <tr>
	      <td class='time'>8교시<br>17:00~18:00</td>
	      <td class="input" id="MO8"></td>
	      <td class="input" id="TU8"></td>
	      <td class="input" id="WE8"></td>
	      <td class="input" id="TH8"></td>
	      <td class="input" id="FR8"></td>
	    </tr>
	  </table>
	</div>
	<c:if test="${!empty list}">
		<div id="timetableDiv">
			<p>${principal.name} 교수님의 전체 강의 계획</p>
			<table border='1'>
						<tr>
							<th>과목명</th>
							<th>학점</th>
							<th>입력 학점</th>
						</tr>
						<c:forEach var="vo" items="${list }">
							<tr class="lectureList">
								<td class="subName">${vo.subjName }</td>
								<td class="cred">${vo.credit }</td>
								<td class="cnt">${vo.count }</td>
							</tr>
						</c:forEach>
					</table>
		</div>
 	</c:if>
<div id="dialog-form" title="수업 등록">
  <form name="frmSubject" action="" method="post">
  <p class="validateTips">모든칸을 채워야 합니다.</p>
    <fieldset>
      <label for="subject">과목명</label>
      <select id="subject">
      		<c:if test="${empty list }">
      			<option value="none">개설하신 과목이 없습니다.</option>
      		</c:if>
      		<c:if test="${!empty list }">
      			<option value="none">---과목을 선택하세요---</option>
	      		<c:forEach var="vo" items="${list }">
	      			<option value="${vo.subjCode }">${vo.subjName }</option>
	      		</c:forEach>
      		</c:if>
      </select>
      <input type="hidden" name="typeCode" id="typeCode" value="${vo.typeCode }">
      <label for="time">시간</label>
      <input type="text" name="time" id="time" class="text ui-widget-content ui-corner-all">
      <input type="hidden" name="credit" id="credit" value="${vo.credit }">
      <label for="classroom">강의실</label>
     	 <select id="classroom">
      		<c:forEach var="map" items="${cList }">
      			<option value="${map['CLASSROOM_CODE']}">${map['CLASSROOM_NAME'] }</option>
      		</c:forEach>
     	 </select>
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
    </fieldset>
  </form>
</div>


<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>