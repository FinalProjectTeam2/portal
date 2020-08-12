<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
.nonList{
	letter-spacing: -0.5px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		sideBookmark()
	});
	
	function sideBookmark() {
		$.ajax({
			url : "<c:url value='/bookmark/ajax/list'/>",
			type : "get",
			dataType : "json",
			success : function(res) {
				var data = '';
				if(res.length != 0){
					$.each(res, function(idx, item) {
						data += '<li onclick="event.cancelBubble=true" class="nav-item">'
							+ '<a class="nav-link" href="'+item.url+'">'
							+ '<span class="bullets"></span> '+item.name+' </a></li>';
					});
				}else{
					data = '<li onclick="event.cancelBubble=true" class="nav-item">'
						+ '<a class="nav-link nonList" data-toggle="modal"'
						+ ' data-target="#exampleModal" data-whatever="@getbootstrap">'
						+ '<span class="bullets"></span> 등록된 즐겨찾기가 없습니다.</a></li>';
				}
				$("#bookmarkList").html(data);
				$(".bullets")
				.html(
						'<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
								+ '<path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
								+ '</svg>');
				$(".nonList").click(function() {
					$("#bookmarkUrl").val('');
				});
			}
		});
	}
</script>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	<div class="sidebar-sticky pt-3"
		style="background: #626d80; height: 100%;">
		
		<div class="category" style="cursor: default; overflow: hidden;">즐겨찾기
			<span style="float: right; font-weight: 100; font-size: 0.7em; margin-right: 10px; margin-top: 10px;">
				<a href="<c:url value='/bookmark/manager'/>">관리</a>
			</span>
		</div>
		<ul class="nav flex-column" id="bookmarkList"></ul>
	</div>
</nav>
<!-- sidebar 끝 -->