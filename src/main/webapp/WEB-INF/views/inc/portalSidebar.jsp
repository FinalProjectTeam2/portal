<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url: "<c:url value='/portal/board/ajax/cateList'/>",
			dataType:"json",
			type:"get",
			success: function(res) {
				var str = "";
				str = '<div class="sidebar-sticky pt-3"'
					+'style="background: #626d80; height: 100%;">'
				$.each(res, function(idx, item) {
					if(item.categoryVo.usage == 'Y'){
						str += '<div class="category"'
							+ "onclick=\"move('/portal/board/main?categoryCode="
							+ item.categoryVo.categoryCode + "')\">"
							+ item.categoryVo.categoryName + '</div>';
						str += '<ul class="nav flex-column">';
						
						var bdList = item.boardList;
						$.each(bdList, function(idx, list) {
							if(list.usage == 'Y'){
								str += '<li class="nav-item">'
									+ '<a class="nav-link" href="#" '
									+ "onclick=\"move('/portal/board/list?"
									+ 'bdCode=' + list.bdCode
									+ "')\">"
									+ '<span class="bullets"></span>' + list.bdName
									+'</a></li>';
							}
						});
						str += '</ul>';
					}
				});
					
				str += '<div class="category" style="cursor: default;">서비스</div>'
					+ '<ul class="nav flex-column">'
					+'<li class="nav-item"><a class="nav-link" href="<c:url value='/board_calender/calendarDetail' />"><span'
					+'class="bullets"></span>학사일정 </a></li>'
					+'<li class="nav-item"><a class="nav-link" href="#"'
					+ "onclick=\"move('/portal/board/list?"
					+ 'bdCode=QNA'
					+ "')\">"
					+ '<span'
					+'class="bullets"></span>질문/답변'
					+'</a></li>'
					+'<li class="nav-item"><a class="nav-link" href="<c:url value='/search/searchTel' />"><span'
					+'class="bullets"></span>전화번호 검색 </a></li>'
					+'<li class="nav-item"><a class="nav-link" href="<c:url value='/campusMap' />"><span'
					+'class="bullets"></span>캠퍼스 맵</a></li>'
					+'</ul>';
					
				str += '</div>';
				
				$("#sidebarMenu").append(str);
				
			}
		});
		
		$(".category").click(function() {
			var url = $(this).attr("title");
			var path = '${pageContext.request.contextPath}';
			location.href = path + url;
		});
		
		$(".bullets")
				.html(
						'<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-caret-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
								+ '<path fill-rule="evenodd" d="M6 12.796L11.481 8 6 3.204v9.592zm.659.753l5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>'
								+ '</svg>');
		
	});
	
	function move(url) {
		var path = '${pageContext.request.contextPath}';
		location.href = path + url;
	}
</script>
<!-- sidebar 시작 -->
<nav id="sidebarMenu"
	class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
	style="padding: 0;">
	
</nav>
<!-- sidebar 끝 -->