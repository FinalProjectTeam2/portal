<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$(".bullets")
				.html(
						'<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
								+ '<path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
								+ '</svg>');
		$("#writeMsg").click(function() {
			var win = window.open("<c:url value='/message/sendMessage?type=send'/>", "_blank",
			"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=500,height=390");

		});
		$("#selfMsg").click(function() {
			var win = window.open("<c:url value='/message/sendMessage?type=self'/>", "_blank",
			"toolbar=yes,scrollbars=yes,resizable=yes,top=250,left=500,width=500,height=390");

		});
	})
</script>
<style>
.sidebar-sticky button{
	margin: 0 5px;
}
</style>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	<div>
	</div>
	<div class="sidebar-sticky pt-3"
		style="background: #626d80; height: 100%;">
		<div style="text-align: center; margin-bottom: 10px;">
			<button class="btn btn-success" type="button" id="writeMsg">쪽지쓰기</button>
			<button class="btn btn-success" type="button" id="selfMsg">내게쓰기</button>
		</div>
		<div class="category">쪽지함</div>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 받은쪽지함
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 보낸쪽지함
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 쪽지보관함
			</a></li>
			<li class="nav-item"><a class="nav-link" href="#"> <span
					class="bullets"></span> 내게쓴쪽지함
			</a></li>
		</ul>
	</div>
</nav>
<!-- sidebar 끝 -->