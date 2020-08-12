<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- top -->
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
	background-color: #01539d;
	padding-top: 7px;
    padding-bottom: 7px;
    padding-left: 17px;
    padding-right: 17px;
    border-radius: 5px;
    margin-top: 10px;
    font-size: 16px;
    color: white;
}

#timeTableDiv .profName{
    margin-top: 10px;
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
	background-color : #fff6e6;
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
	width: 35%;
	float: left;
}
#timeTableDiv .hidden{
	display: none;
}

</style>
<script>
	//$('html').click(function(e) { if(!$(e.target).hasClass("area")) { alert('영역 밖입니다.'); } });
	$(function() {
		$('#pop').addClass("hidden");
		$('.lectureInLink').click(function() {
			$('#pop').toggleClass("hidden");
		});
		
		$('#evalBt').click(function() {
			location.href = "<c:url value=''/>";/* 강의평가 페이지로 이동 */
		});
		
	});
</script>
<!-- main 시작 -->
<main role="main" class="flex-shrink-0">
   <div class="container">
      <div id="timeTableDiv">
	      	<div style="margin: 30px; font-size: 25px;">
	      		<div style="text-align: center; margin: 0 auto;">
	      			<img src="<c:url value='/resources/images/timetableIcon.png'/>" id="tticon"><span id="userName"> 홍길동</span>님의 강의시간표
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
                                	<a href="#" class="lectureInLink">
	                                	<div class="lectureIn">
		                                    <span class="lectureName">생산관리</span><br>
		                                    <span class="profName">김교수</span>
	                                	</div>
	                                </a>
                                </td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">2교시<br><span style="font-size: 0.85rem;">10:00 - 10:50</span></td>
                                <td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">3교시<br><span style="font-size: 0.85rem;">11:00 - 12:50</span></td>
                                <td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">4교시<br><span style="font-size: 0.85rem;">13:00 - 13:50</span></td>
                                <td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">5교시<br><span style="font-size: 0.85rem;">14:00 - 14:50</span></td>
                                <td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">6교시<br><span style="font-size: 0.85rem;">15:00 - 15:50</span></td>
                                <td class="input" id="MO1"></td>
                                <td class="input"></td>
                                <td class="input">
                                	<a href="#" class="lectureInLink">
	                                	<div class="lectureIn">
		                                    <span class="lectureName">생산관리</span><br>
		                                    <span class="profName">김교수</span>
	                                	</div>
	                                </a>
                                </td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">7교시<br><span style="font-size: 0.85rem;">16:00 - 16:50</span></td>
								<td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>
                            <tr>
                                <td class="time">8교시<br><span style="font-size: 0.85rem;">17:00 - 17:50</span></td>
                                <td class="input"></td>
                                <td class="input"></td>
                                <td class="input"></td>
                        		<td class="input"></td>
                                <td class="input"></td>
                            </tr>

                        </tbody>
                    </table>
            </div>
			<div id="pop">
					<fieldset style="border: 2px solid #01539d; padding: 15px;">
					<legend style="width: 32%; font-weight: bold;">강의 정보</legend>
					<div>
						<label class="lab">강의명 : </label>
						<span>생산관리</span>
					</div>
					<br>
					<div>
						<label class="lab">학점 : </label>
						<span>3학점</span>
					</div>
					<br>
					<div>
						<label class="lab">담당교수명 : </label>
						<span>김교수</span>
					</div>
					<br>
					<div>
						<label class="lab">강의실 : </label>
						<span>A012</span>
					</div>
					<br>
					<div>
						<label class="lab">시간 : </label>
						<span>09:00 ~ 09:50</span>
					</div>
					<br>
					<div>
						<label class="lab">강의설명 : </label>
						<span>경영학과를 위한 생산관리를 통해 어쩌고</span>
					</div>
					</fieldset>
					<div style="text-align: center; margin-top: 13px;">
						<button type="button" id="evalBt" class="btn btn-success">강의평가</button>
					</div>
				
			</div>



      </div>
   
<%@ include file="../inc/bottom.jsp"%>