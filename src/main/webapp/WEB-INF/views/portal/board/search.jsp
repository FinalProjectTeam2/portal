<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.container .accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
  position: relative;
  height: 160px;
}

.container .active, .container .accordion:hover {
  background-color: #ccc;
}

.container .accordion:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.container .active:after {
  content: "\2212";
}

.container .panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
}
textarea#ir1 {
    float: left;
    margin: 0 5px;
}
.container .panel span {
    float: left;
    padding: 10px 5px 0 0;
}
.container .panel button {
    float: left;
    margin: 5px 0 0 5px;
}
.accordion p{
	margin-bottom: 0;
}
</style>

<!-- 하단 의견 또는 오류 신고 - 아코디언메뉴 -->
<button class="accordion">
	<p style="position: absolute; top: 30px;">홈페이지에 대한 개선/건의사항이 있으면 아래에 남겨주세요. 해당 페이지의 관리자에게 전달됩니다.<br> 
	- <strong>공지사항 등 게시판의 게시 내용에 대한 문의</strong>는 해당 게시물에 표기된 연락처나 담당부서(VOC)로 문의해 주시기 바랍니다.<br>
	</p>
	<p style="position: absolute;  bottom: 10px; color: dodgerblue">
	<span id="btIcon">
		<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
		  <path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>
		  <path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/>
		</svg>
	</span>
	</p>
	
</button>
	
<div class="panel">
	<span>의견 또는 오류신고 </span>
	<textarea rows="10" cols="15" id="ir1" name="content" style="width:400px; height:40px; " placeholder="내용을 입력하세요"></textarea>
	<button type="button" id="btInsert">접수</button>
</div>

<script type="text/javascript">
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var data = '';
	if($(this).hasClass('active')){
		data = '<svg width="3em" height="3em" viewBox="0 0 16 16" '
			+ 'class="bi bi-arrow-up-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
		  	+ '<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
			+ '<path fill-rule="evenodd" d="M4.646 8.354a.5.5 0 0 0 .708 0L8 5.707l2.646 2.647a.5.5 0 0 0 .708-.708l-3-3a.5.5 0 0 0-.708 0l-3 3a.5.5 0 0 0 0 .708z"/>'
			+ '<path fill-rule="evenodd" d="M8 11.5a.5.5 0 0 0 .5-.5V6a.5.5 0 0 0-1 0v5a.5.5 0 0 0 .5.5z"/>'
			+ '</svg>';
	}else{
		data = '<svg width="3em" height="3em" viewBox="0 0 16 16" '
				+ 'class="bi bi-arrow-down-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
			  	+ '<path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>'
				+ '<path fill-rule="evenodd" d="M4.646 7.646a.5.5 0 0 1 .708 0L8 10.293l2.646-2.647a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 0 1 0-.708z"/>'
				+ '<path fill-rule="evenodd" d="M8 4.5a.5.5 0 0 1 .5.5v5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5z"/>'
				+ '</svg>';
	}
	$("#btIcon").html(data);
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
$(function() {
	$("#btInsert").click(function() {
		$.ajax({
			url : "<c:url value='/portal/board/ajax/write'/>",
			data : {
				officialNo : '${principal.officialNo}',
				contents : $("#ir1").val(),
				bdCode : 'QNA'
			},
			type : "get",
			success : function(res) {
				$("#ir1").val('');
				alert(res);
				var cur = $("#currentPage").val();
				if(cur == 0){
					cur = 1;
				}
				$.send($("#currentPage").val());
				$(".accordion").trigger("click");
			}
		});
	});
});
</script>