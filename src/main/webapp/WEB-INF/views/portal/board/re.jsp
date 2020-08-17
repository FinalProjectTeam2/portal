<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="<c:url value='/resources/css/board/re.css'/>" rel="stylesheet" type="text/css">
<style type="text/css">

</style>
<script type="text/javascript">
$(function() {
	openReply();
	
	$('#replyText').keyup(function(key) {
		if($(this).val() == ''){
			$('#replyNo').val(0);
		}else{
			if (key.keyCode == 13) {
				$('#replySend').trigger('click');
			}
		}
	});
	
	$('#replySend').click(function() {
		$.ajax({
			url : "<c:url value='/portal/board/ajax/reply'/>",
			data : {
				officialNo : "${principal.officialNo}",
				officialName : "${principal.name}",
				contents : $('#replyText').val(),
				postNo : "${vo.postsVo.postNo }",
				replyNo : $("#replyNo").val()
			},
			type : "get",
			success : function(res) {
				alert(res);
				$('#replyText').val('');
				$('#replyNo').val(0);
				openReply();
			}
		});
	});
});
function openReply() {
	$.ajax({
		url : "<c:url value='/portal/board/ajax/replyList'/>",
		data : {
			postNo : "${vo.postsVo.postNo }"
		},
		type : "get",
		success : function(res) {
			$('#replyText').val('');
			$('#replyNo').val(0);
			addReplyList(res);
		}
	});
}

function makeTime(time) {
	var data = '';
	if(time > 365*24){
		data= Math.floor(time/365)+'년';
	}else if(time > 30*24){
		data= Math.floor(time/30)+'달';
	}else if(time > 7*24){
		data= Math.floor(time/7)+'주';
	}else if(time > 24){
		data= Math.floor(time/7)+'일';
	}else if(time > 1){
		data= Math.floor(time)+'시간';
	}else{
		data= Math.floor(time * 60)+'분';
	}
	return data;
}

function addReplyList(res) {
	var data = '';
	if(res.length > 0){
		$.each(res, function(idx, item) {
			data += '<div class="divData">'
				+'<div class="divIcon">'
				+ "<img class='studentImg' alt='사진' src='${ pageContext.request.contextPath }/common/image?img=" +item.replyVo.imageUrl+ "'/>"
				+'</div>'
				+'<div class="divContents">'
				+'<div class="divRe">'
				+'<span class="spName">'+ item.replyVo.officialName + '(' + item.replyVo.officialNo +')</span>'
				+'<p class="pContent">'+item.replyVo.contents+'</p>'
				+'<span class="spTime">' + makeTime(item.replyVo.now)
				+ '</span>'
				+'<a class="reWrite">답글달기'
				+'	<input type="hidden" value="'+item.replyVo.replyNo+'">'
				+'</a>'
				+'</div>';
			if(item.rereplyList.length > 0){
				data+='<div class="divReList">'
					+'<div class="_7mCbS"></div>'
					+'<a class="more" ><span class="moreText">답글 보기</span><span class="spCount">('+item.rereplyList.length+'개)</span></a>'
					+'<div class="divReContent">';
				
				$.each(item.rereplyList, function(idx, item) {
					data+='<div class="divData">'
						+'<div class="divIcon">'
						+"<img class='studentImg' alt='사진' src='${ pageContext.request.contextPath }/common/image?img=" +item.imageUrl+ "'/>"
						+'</div>'
						+'<div class="divContents">'
						+'<div class="divRe">'
						+'<span class="spName">'+ item.officialName + '(' + item.officialNo + ')</span>'
						+'<p class="pContent">'+ item.contents +'</p>'
						+'<span class="spTime">'+ makeTime(item.now) + '</span><a class="reWrite">답글'
						+'달기<input type="hidden" value="'+ item.replyNo +'"></a>'
						+'</div>'
						+'</div>'
						+'</div>';
				});
			}
			
			
			data+='</div>'
			+'</div>'
			+'</div>'
			+'</div>';
			
		});
	}else{
		data += '댓글이 없습니다.';
	}
	
	$("#divList").html(data);
	
	$(".more").click(function() {
		$(this).parent().find(".divReContent").toggleClass( "show", 100 );
		if($(this).parent().find(".divReContent").is(".show") === true) {
			$(this).find('.moreText').html("답글 숨기기");
			$(this).find('.spCount').hide();
		}else{
			$(this).find('.moreText').html("답글 보기");
			$(this).find('.spCount').show();
		}
	});
	
	$(".reWrite").click(function() {
		$('#replyText').val('@'+$(this).parent().find('.spName').text() + ' ');
		$('#replyNo').val($(this).find("input").val());
		$('#replyText').focus();
	});
}

</script>
<div id="divReply">
	<div id="divList"></div>
	<div class="divText">
		<input type="hidden" id="replyNo" value="0">
		<input class="textbox" type="text" id="replyText"
			placeholder="다른 사람의 권리를 침해하거나 명예를 훼손하는 댓글은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다." />
		<input type="button" value="게시" id="replySend"/>
	</div>
</div>
