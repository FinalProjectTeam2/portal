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
</style>

<!-- 하단 의견 또는 오류 신고 - 아코디언메뉴 -->
<button class="accordion">
	<p>홈페이지에 대한 개선/건의사항이 있으면 아래에 남겨주세요. 해당 페이지의 관리자에게 전달됩니다.<br> 
	- <strong>공지사항 등 게시판의 게시 내용에 대한 문의</strong>는 해당 게시물에 표기된 연락처나 담당부서(VOC)로 문의해 주시기 바랍니다. </p>
</button>
	
<div class="panel">
	<span>의견 또는 오류신고 </span>
	<textarea rows="10" cols="15" id="ir1" name="content" style="width:400px; height:40px; "> 로그인 후 작성이 가능합니다. </textarea>
	<button>접수</button>
</div>

<script type="text/javascript">
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>