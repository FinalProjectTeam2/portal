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


div.send_wrap {
    position: relative;
    z-index: 15;
}



div {
    display: block;
}

div.idpw_wrap, div.billing_wrap, div.result_wrap, div.address_wrap, div.sms_wrap, div.socket_wrap, div.fax_wrap, div.mail_wrap, div.my_wrap, div.user_wrap, div.customerCenter_wrap, div.post_wrap, div.dormant_wrap {
    text-align: left;
}


h5, h6, form, fieldset, p, button, input, figure, strong {
    margin: 0;
    padding: 0;
}
div.send_wrap p.time1, div.excel_wrap p.time1 {
    height: 30px;
    line-height: 30px;
    text-align: center;
    color: #ddd;
    font-size: 14px;
}




div.smshp_area, div.lmshp_area {
    float: left;
    position: relative;
    padding: 0 10px;
    width: 280px;
    height: 400px;
    text-align: left;
    background: #616671;
    border-radius: 3px;
}

div.send_wrap .smshp_area h4 {
    background: #7395b8;
}


div.send_wrap h4 {
    padding-left: 7px;
    height: 28px;
    line-height: 26px;
    color: #fff;
    font-weight: bold;
}

h4 {
    font-size: 13px;
}

h4 {
    display: block;
    margin-block-start: 1.33em;
    margin-block-end: 1.33em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

div.send_wrap a.btn_preview {
    width: 74px;
    height: 21px;
    position: absolute;
    top: 38px;
    right: 15px;
}

dl, font, p, ol, a {
    line-height: 1.3;
}

a, a:link, a:visited, a:hover {
    text-decoration: none;
    color: #333;
}

a, button {
    cursor: pointer;
}



.send_wrap .smshp_area input{
	font: 400 13.3333px Arial;
	-webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: textfield;
    background-color: -internal-light-dark(rgb(255, 255, 255), rgb(59, 59, 59));
    -webkit-rtl-ordering: logical;
    cursor: text;
}

div.smshp_area div.textarea, div.smshp_area div.textarea_ad, div.smshp_area div.textarea_ele {
    background: #deeaf5;
}

div.smshp_area div.textarea, div.lmshp_area div.textarea {
    padding: 7px 0 7px 7px;
    height: 255px;
}

div.smshp_area div.byte_area, div.ex_sms_preview_area div.byte_area {
    background: #cbdae8;
}

div.byte_area {
    height: 28px;
    margin: 0 0 1px 0;
}

div.sender {
    height: 28px;
    color: #616671;
    background: #fff;
}

div.sender p.num {
    float: left;
    line-height: 27px;
    padding-left: 10px;
}


#body1{
    background-attachment: fixed;
    border: 0 solid #000000;
    overflow: auto;
    font: 400 13.3333px Arial;
    width: 255px;
    height: 203px;
    background-color: transparent;
    line-height: 25px;
    font-size: 22px;
}








</style>

<script type="text/javascript">
	var code=$('#subjCode').val();
	showList();
	$(function(){
		$('#subjCode').change(function(){
			showList();	
		});
		
		
		$('#body1').keyup(function(){
			var len = $("#body1").val().length;
			if(len > 80){
				alert('80글자까지 입력 가능합니다.');
				event.preventDefault();
			}
			$("#charLen").html(len);
		});
		
		
		$('.btn_refresh').click(function(){
			if(confirm('메세지를 삭제하시겠습니까?')){
				alert('메세지가 삭제되었습니다.');
				$('#body1').val('');
				$("#charLen").html("0");
			}
		});
		
		$('#sendSms').click(function(){
			if($('.inputChk:checked').length < 1){
				alert('수신인을 1명 이상 선택해야 합니다.');
				event.preventDefault();
			}else{
				
				var pbArr = [];
				$('.inputChk:checked').each(function(idx, item){
					var tr=$(this).parent().parent();
					var td=tr.children();
					var name=td.eq(2).text();
					var phoneNo=td.eq(5).text();
					
					
					pbArr.push(phoneNo);
					
				});
				
				var content = $('#body1').val();
				$.ajax({
					url:"<c:url value='/lecture/sendSms'/>",
					type:"post",
					data:{
						"pbArr":pbArr,
						"content":content
					},
					success:function(res){
						alert(res);
					}
					
				});
			}
		});
		

		
	});

		
		
		
		
		
		function showList(){
			$.ajax({
				url:"<c:url value='/lecture/selectPhoneBook'/>",
				data:{"subCode":$('#subjCode').val()},
				dataType:"json",
				type:"post",
				success:function(res){
					$('#listTitle').text($("#subjCode option:selected").text()+" 수강생 목록");
					var table = "<table border='1'>"+
									"<colgroup>"+
									"<col width='5%'>"+
									"<col width='8%'>"+
									"<col width='6%'>"+
									"<col width='6%'>"+
									"<col width='8%'>"+
									"<col width='8%'>"+
									"</colgroup>"+
									"<tr>"+
										"<th><input type='checkbox' class='chkAll'></th>"+
										"<th>학번</th>"+
										"<th>이름</th>"+
										"<th>학년</th>"+
										"<th>학과</th>"+
										"<th>연락처</th>"+
									"</tr>";
						$.each(res, function(index, item){
							table+="<tr>"+
							"<td><input type='checkbox' class='inputChk'></td>"+
							"<td>"+ item.stuNo +"</td>"+
							"<td>"+ item.name +"</td>"+
							"<td>"+ item.semester +"</td>"+
							"<td>"+ item.depName +"</td>"+
							"<td>"+ item.phoneNo +"</td>"+
						"</tr>"
						});
						
						table+="</table>";
						$('#tableDiv').html(table);
						
						
						 $(".chkAll").click(function(){
							 if($(".chkAll").prop("checked")){
					            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					            $(".inputChk").prop("checked",true);
					            //클릭이 안되있으면
					        }else{
					            //input태그의 class가 inputChk인 태그들을 찾아서 checked옵션을 false로 정의
					            $(".inputChk").prop("checked",false);
					        }
						 });
						
				}, 
				
			});
			
			
			
			
		
	}		
		
		
		
		
</script>
<main role="main" class="flex-shrink-0">
<div class="container">
	<div><h2>과목을 선택하세요</h2></div>
	<select class="form-control" id="subjCode" style="width: 72%;">
		<c:if test="${!empty sList }">
			<c:forEach var="map" items="${sList }">
				<option value="${map['OPEN_SUB_CODE']}">${map['SUBJ_NAME']}</option>
			</c:forEach>
		</c:if>
	</select>
	<hr style="border: solid 2px lightgreen">
	<h3 id="listTitle"></h3>
	
	<div id="tableDiv" style="width: 50%; float: left">
	
	</div>
	<div class="send_wrap" style="float: left;margin-left: 10%; margin-top: 5%">
		 <h3 style="text-align: center;margin-bottom: 20px;color: #ccc">문자메세지 전송</h3>
         <!-- 단문뿌리기 -->
         <div class="smshp_area">
             <p class="time1" style="clear: both;">현재시각 <span id="locTime"></span></p>
             <div class="textarea" style="margin-top: 15px;">
                 <textarea id="body1" placeholder="80글자까지 보낼 수 있습니다." maxlength="80" name="body1" rows="5" cols="16" style="background-attachment:fixed; border:0 solid #000000; resize: none; " class="sms_form01 blu_scroll has_advice"></textarea>
             </div>
             <div class="byte_area"> <a class="btn_refresh" style="float: left"><img style="width: 20px;height: auto;" src="<c:url value='/resources/images/refresh.png'/>"> 다시쓰기</a>
                 <p class="byte" style="float: right"><strong><span id="charLen">0</span></strong> / <span id="sms_mms_bytes">80</span>글자</p>
             </div>
             
             <div class="sender">
                 <p class="num">발신번호: </p>
                 <input type="text" maxlength="20" name="callback" value="010-3822-5882" title="발신번호입력창" style="cursor: pointer;">
                 <!-- [D]레이어팝업 05_munja_layer.html/ 발신번호 스크롤  -->
             </div>
             <div>
             	<button id="sendSms" style="width: 100%">전송</button>
             </div>
         </div>
    </div>
	
<%@ include file="../inc/bottom.jsp"%>