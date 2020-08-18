<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<style>
   #timeTableDiv {
    margin-top:20px;
}
#timeTableDiv .days, #timeTableDiv .input {
    background-color: #f7f7f7;
}
#timeTableDiv .table-bordered thead td, #timeTableDiv .table-bordered thead th {
    border-bottom-width: 2px;
}
#timeTableDiv .table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #dee2e6;
    color: white;
    font-weight: bold;
}
#timeTableDiv .table-bordered td, #timeTableDiv .table-bordered th {
    border: 1px solid #dee2e6;
}

#timeTableDiv .table-bordered td, #timeTableDiv .table-bordered th {
    border: 1px solid #dee2e6;
}
#timeTableDiv .time, #timeTableDiv .table th {
    padding: .75rem;
    vertical-align: top;
    border-top: 1px solid #dee2e6;
}

#timeTableDiv .time{
    background: #007bff2b;
    font-weight: 600;
}

#timeTableDiv .lectureIn{
	background-color: white;
	height: 72px;
	text-align: center;
	padding: 12px;
}
#timeTableDiv .lectureName{
    margin-top: 10px;
    font-size: 15px;
    font-weight: 600;
    color: #004c90;
}

#timeTableDiv .profName{
    margin-top: 5px;
    font-size: 14px;
    display: inline-block;	
}

#timeTableDiv .input{
	padding: 0;
}

#timeTableDiv #tticon{
	width: 35px;
}

#timeTableDiv #userName{
	 font-weight: bold;
	font-size: 30px;
}

#timeTableDiv .input a{
	text-decoration: none;
	color: black;
}

#timeTableDiv .lectureInLink:hover > .lectureIn {
	background-color: #a900ff2b;/* #ffbf00c7 */
}
#timeTableDiv #pop{
	background-color : #fdfcf9;
	position:absolute; 
	left:100px; 
	top:100px; 
	width: 400px;
	height: 450px;
	z-index:1;
	text-align: left;
	border: 1px solid #ccc;
	padding: 20px;
	margin: 10px;
	border-radius: 5px;
	/* display:none; */
/* 	
	background: #ccc;
	color: black;
	top: 10px;
	left: 100px;
	text-align: center;
	border: 2px solid #000; */
}

#pop .lab{

}
#timeTableDiv .hidden{
	display: none;
}

</style>
<script>
	
	function getTimetable(){
		$.ajax({
			url:"<c:url value='/lecture/studentTT'/>",
			type:"post",
			dataType:"json",
			success:function(res){
				$.each(res, function(idx, item){
					var subjName=item.subjName;
					var shortsbjName;
					if(subjName.length > 10){
						shortsbjName=subjName.substr(0,9) + "...";
					}else{
						shortsbjName=item.subjName;
					}
					var subjCode=item.subjCode;
					var profName=item.profName;
					var explanation=item.explanation;
					var classroomName=item.classroomName;
					var credit=item.credit;
					var tdId=item.timetableCode;
					tdId = '#'+tdId;
					var lectureEvalFlag=item.lectureEvalFlag;
					console.log(item.timetableCode);
					console.log(tdId);
					var content= "<a class='lectureInLink'>"+
                				"<div class='lectureIn'>"+"<input type='hidden' id='idSubjName' value='"+subjName +"'>"+
                        		"<span class='lectureName'>"+shortsbjName+"</span><br>"+
                        		"<span class='profName'>"+profName+" 교수님</span>"+
                        		"<input type='hidden' class='credit' value='"+credit+"'/>"+
                        		"<input type='hidden' class='classroom' value='"+classroomName +"'/>"+
                        		"<input type='hidden' class='explanation' value='"+explanation +"'/>"+
                        		"<input type='hidden' class='subjCode' value='"+subjCode +"'/>"+
                				"</div>"+
                				"</a>";
					$(tdId).html(content);
				});
				/* <td class="input" id="WE3"></td> */
				$('.lectureInLink').click(function() {
					$('#pop div:eq(0) .popSubjName').html($(this).find('#idSubjName').val());
					$('#pop div:eq(1) .popCredit').html($(this).children().children('input:eq(0)').val()+'학점');
					$('#pop div:eq(2) .popProfName').html($(this).children().children('span:eq(1)').html());
					$('#pop div:eq(3) .popClassroom').html($(this).children().children('input:eq(1)').val());
					$('#pop div:eq(4) .popTime').html($(this).parent().parent().children('.time').children('span').html());
					$('#pop div:eq(5) .popExplanation').html($(this).children().children('input:eq(3)').val());
					$('#pop div:eq(6) .subjectCode').val($(this).children().children('input:eq(4)').val());
					$('#pop').toggleClass("hidden");
				});
				
				$('#evalBt').click(function() {
					var sendSubCode = $(this).parent().children('input').val();
					$.ajax({
						url : "<c:url value='/lecture/ajax/evalCheck'/>",
						type : "post",
						data : "subjCode=" + sendSubCode,
						success : function(res) {
							console.log(res);
							if (res) {//Y이면
								alert('해당 강의평가를 이미 완료하였습니다.');
								event.preventDefault();
							}else{
								location.href = "<c:url value='/student/subjEval?subjCode="+sendSubCode+"'/>";/* 강의평가 페이지로 이동 */
							}
						},error : function(xhr,status,error){
							alert(status + ", "+ error);
						}
						
					});
					
				});
				
				/* $('html').click(function(e) {
					if(!$(e.target).hasClass("pop")) { 
						if($('#pop').hasClass("hidden")){
							$('#pop').toggleClass("hidden");
						}						
						
					} 
				}); */
			}
		});
	}
	
	$(function() {
		getTimetable();
		$('#pop').addClass("hidden");
		
		
		/* $('.lectureInLink').click(function() {
			$('#pop').toggleClass("hidden");
		}); */
		
		
	});
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
   <div class="container">
      <div id="timeTableDiv">
	      	<div style="margin: 30px; font-size: 25px;">
	      		<div style="text-align: center; margin: 0 auto;">
	      			<img src="<c:url value='/resources/images/timetableIcon.png'/>" id="tticon"><span id="userName"> ${principal.name }</span>님의 강의시간표
	      		</div>
	      	</div>
                <div class="table-responsive">
                    <table class="table table-bordered text-center" >
                       <colgroup>
                          <col width="10%">
                          <col width="18%">
                          <col width="18%">
                          <col width="18%">
                          <col width="18%">
                          <col width="18%">
                       </colgroup>
                        <thead>
                            <tr class="days" style="background: #343a40;">
                                <th>시간</th>
                                <th>월요일</th>
                                <th>화요일</th>
                                <th>수요일</th>
                                <th>목요일</th>
                                <th>금요일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="time">1교시<br><span style="font-size: 0.85rem;">09:00 - 09:50</span></td>
                                <td class="input" id="MO1">
                                	<!-- <a class="lectureInLink">
	                                	<div class="lectureIn">
		                                    <span class="lectureName">생산관리</span><br>
		                                    <span class="profName">김교수</span>
	                                	</div>
	                                </a> -->
                                </td>
                                <td class="input" id="TU1"></td>
                                <td class="input" id="WE1"></td>
                        		<td class="input" id="TH1"></td>
                                <td class="input" id="FR1"></td>
                            </tr>
                            <tr>
                                <td class="time">2교시<br><span style="font-size: 0.85rem;">10:00 - 10:50</span></td>
                                <td class="input" id="MO2"></td>
                                <td class="input" id="TU2"></td>
                                <td class="input" id="WE2"></td>
                        		<td class="input" id="TH2"></td>
                                <td class="input" id="FR2"></td>
                            </tr>
                            <tr>
                                <td class="time">3교시<br><span style="font-size: 0.85rem;">11:00 - 12:50</span></td>
                                <td class="input" id="MO3"></td>
                                <td class="input" id="TU3"></td>
                                <td class="input" id="WE3"></td>
                        		<td class="input" id="TH3"></td>
                                <td class="input" id="FR3"></td>
                            </tr>
                            <tr>
                                <td class="time">4교시<br><span style="font-size: 0.85rem;">13:00 - 13:50</span></td>
                                <td class="input" id="MO4"></td>
                                <td class="input" id="TU4"></td>
                                <td class="input" id="WE4"></td>
                        		<td class="input" id="TH4"></td>
                                <td class="input" id="FR4"></td>
                            </tr>
                            <tr>
                                <td class="time">5교시<br><span style="font-size: 0.85rem;">14:00 - 14:50</span></td>
                                <td class="input" id="MO5"></td>
                                <td class="input" id="TU5"></td>
                                <td class="input" id="WE5"></td>
                        		<td class="input" id="TH5"></td>
                                <td class="input" id="FR5"></td>
                            </tr>
                            <tr>
                                <td class="time">6교시<br><span style="font-size: 0.85rem;">15:00 - 15:50</span></td>
                                <td class="input" id="MO6"></td>
                                <td class="input" id="TU6"></td>
                                <td class="input" id="WE6">
                                	<!-- <a class="lectureInLink">
	                                	<div class="lectureIn">
		                                    <span class="lectureName">생산관리</span><br>
		                                    <span class="profName">김교수</span>
	                                	</div>
	                                </a> -->
                                </td>
                        		<td class="input" id="TH6"></td>
                                <td class="input" id="FR6"></td>
                            </tr>
                            <tr>
                                <td class="time">7교시<br><span style="font-size: 0.85rem;">16:00 - 16:50</span></td>
								<td class="input" id="MO7"></td>
                                <td class="input" id="TU7"></td>
                                <td class="input" id="WE7"></td>
                        		<td class="input" id="TH7"></td>
                                <td class="input" id="FR7"></td>
                            </tr>
                            <tr>
                                <td class="time">8교시<br><span style="font-size: 0.85rem;">17:00 - 17:50</span></td>
                                <td class="input" id="MO8"></td>
                                <td class="input" id="TU8"></td>
                                <td class="input" id="WE8"></td>
                        		<td class="input" id="TH8"></td>
                                <td class="input" id="FR8"></td>
                            </tr>

                        </tbody>
                    </table>
            </div>
			<div id="pop" class="pop">
					<fieldset style="border: 2px solid #01539d; padding: 15px; color: #212121;">
					<legend style="width: 32%; font-weight: bold;">강의 정보</legend>
					<div>
						<label class="lab">강의명 : </label>
						<span class="popSubjName"></span>
					</div>
					<br>
					<div>
						<label class="lab">학점 : </label>
						<span class="popCredit"></span>
					</div>
					<br>
					<div>
						<label class="lab">담당교수명 : </label>
						<span class="popProfName"></span>
					</div>
					<br>
					<div>
						<label class="lab">강의실 : </label>
						<span class="popClassroom"></span>
					</div>
					<br>
					<div>
						<label class="lab">시간 : </label>
						<span class="popTime"></span>
					</div>
					<br>
					<div>
						<label class="lab">강의설명 : </label>
						<span class="popExplanation"></span>
					</div>
					</fieldset>
					<div style="text-align: center; margin-top: 5px;">
						<button type="button" id="evalBt" class="btn btn-outline-primary" style="padding: 3px;">강의평가</button>
						<input type="hidden" class="subjectCode" value="">
					</div>
				
			</div>



      </div>
   
<%@ include file="../inc/bottom.jsp"%>