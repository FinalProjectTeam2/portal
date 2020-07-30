<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- sidebar -->
<%@ include file="../inc/mainSidebar.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/lecture/weekcalendar.css'/>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
</style>
<script type="text/javascript">
	var time = '';

$(function(){
	$('#btLoad').click(function(){
		location.href="<c:url value='/lecture/loadByProfNo?profNo=${sessionScope.officialNo}'/>";
	});
	
	
	var dialog, form,
	subject = $( "#subject" ),
	time = $( "#time" ),
	credit = $( "#credit" ),
	allFields = $( [] ).add( subject ).add( time ).add( credit ),
	tips = $( ".validateTips" );
	
	function updateTips( t ) {
	      tips
	        .text( t )
	        .addClass( "ui-state-highlight" );
	      setTimeout(function() {
	        tips.removeClass( "ui-state-highlight", 1500 );
	      }, 500 );
	    }
	 
	 
	 
	    function addSubject() {
	     $.ajax({
	    	 url:"<c:url value='/lecture/addSubject'/>",
	    	 type:"post",
	    	 data:{
	    		 "subject":"$('#subject').val()",
	    		 "time":"$('#time').val()",
	    	 },
	    	 dataType:"json",
	    	 success:function(res){
	    		 
	    	 },
	    	 error:function(xhr, status, error){
	    		 alert(error);
	    	 }
	    	 
	    	 
	     });
	    }
	 
	    dialog = $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 500,
	      width: 350,
	      modal: true,
	      buttons: {
	        "등록하기": addSubject,
	        Cancel: function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
	        form[ 0 ].reset();
	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	 
	    form = dialog.find( "form" ).on( "submit", function( event ) {
	      event.preventDefault();
	      addSubjet();
	    });
	 
	    $( ".input" ).on( "click", function() {
	        dialog.dialog( "open" );
	        time = $(this).attr("id");
	        $("#time").val(time);
	        $("#time").attr("readonly", true);
	      });
});
</script>











<main role="main" class="flex-shrink-0">
<div class="container">
	<h2>강의시간 설정</h2>
	<h4>${sessionScope.name} 교수님의 시간표 </h4><input type="button" id="btLoad" value="불러오기" style="float: right; margin-top: -50px; margin-right: 350px;"/>
	<div class='tab'>
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
	      <td class="input" id="mo1"></td>
	      <td class="input" id="tu1"></td>
	      <td class="input" id="we1"></td>
	      <td class="input" id="th1"></td>
	      <td class="input" id="fr1"></td>
	    </tr>
	    <tr>
	      <td class='time'>2교시<br>10:00~10:50</td>
	      <td class="input" id="mo2"></td>
	      <td class="input" id="tu2"></td>
	      <td class="input" id="we2"></td>
	      <td class="input" id="th2"></td>
	      <td class="input" id="fr2"></td>
	    </tr>
	    <tr>
	      <td class='time'>3교시<br>11:00~12:00</td>
	      <td class="input" id="mo3"></td>
	      <td class="input" id="tu3"></td>
	      <td class="input" id="we3"></td>
	      <td class="input" id="th3"></td>
	      <td class="input" id="fr3"></td>
	    </tr>
	    <tr>
	      <td class='time'>4교시<br>12:00~13:00</td>
	      <td class="input" id="mo4"></td>
	      <td class="input" id="tu4"></td>
	      <td class="input" id="we4"></td>
	      <td class="input" id="th4"></td>
	      <td class="input" id="fr4"></td>
	    </tr>
		  <tr>
	      <td class='time'>5교시<br>14:00~15:00</td>
	      <td class="input" id="mo5"></td>
	      <td class="input" id="tu5"></td>
	      <td class="input" id="we5"></td>
	      <td class="input" id="th5"></td>
	      <td class="input" id="fr5"></td>
	    </tr>
	    <tr>
	      <td class='time'>6교시<br>15:00~16:00</td>
	      <td class="input" id="mo6"></td>
	      <td class="input" id="tu6"></td>
	      <td class="input" id="we6"></td>
	      <td class="input" id="th6"></td>
	      <td class="input" id="fr6"></td>
	    </tr>
	    <tr>
	      <td class='time'>7교시<br>16:00~17:00</td>
	      <td class="input" id="mo7"></td>
	      <td class="input" id="tu7"></td>
	      <td class="input" id="we7"></td>
	      <td class="input" id="th7"></td>
	      <td class="input" id="fr7"></td>
	    </tr>
	    <tr>
	      <td class='time'>8교시<br>17:00~18:00</td>
	      <td class="input" id="mo8"></td>
	      <td class="input" id="tu8"></td>
	      <td class="input" id="we8"></td>
	      <td class="input" id="th8"></td>
	      <td class="input" id="fr8"></td>
	    </tr>
	  </table>
	</div>

 
<div id="dialog-form" title="수업 등록">
  <form name="frmSubject" action="" method="post">
  <p class="validateTips">모든칸을 채워야 합니다.</p>
    <fieldset>
      <label for="subject">과목명</label>
      <select id="subject">
      		<c:forEach var="vo" items="${list }">
      			<option value="${vo.subjCode }">${vo.subjName }</option>
      		</c:forEach>
      </select>
      <input type="hidden" name="typeCode" id="typeCode" value="${vo.typeCode }">
      <label for="time">시간</label>
      <input type="text" name="time" id="time" class="text ui-widget-content ui-corner-all">
      <input type="hidden" name="credit" id="credit" value="${vo.credit }">
  
      <!-- Allow form submission with keyboard without duplicating the dialog button -->
    </fieldset>
  </form>
</div>


<!-- bottom -->		
<%@ include file="../inc/bottom.jsp"%>