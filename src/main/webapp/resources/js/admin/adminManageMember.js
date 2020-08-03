$(function() {
	// ajax 학과 검색
	$('#faculty').change(
			function() {
				$('#department').find('option').each(function() {
					$(this).remove();
				});

				var faculty = $(this).val();
				if (faculty != "") {
					$('#department').append("<option value=''>선택</option>");
					$.ajax({
						type : 'get',
						url : "/portal/common/departmentList",
						data : "facultyNo=" + $('#faculty').val(),
						dataType : "json",
						success : function(res) {
							$(res).each(
									function(i) {
										$('#department').append(
												"<option value=\""
														+ res[i].depNo + "\">"
														+ res[i].depName
														+ "</option>");
									});
						},
						error : function(xhr) {
							console.log(xhr.responseTest);
							alert("오류");
							return;
						}

					})
				}else{
					$('#department').append("<option value=''>학부를 선택하세요</option>");
				}
			});


	$('#btMultiDel').click(
			function() {
				var len = $('tbody input[type=checkbox]:checked').length;
				if (len == 0) {
					alert('삭제하려는 회원을 먼저 체크하세요');
					return;
				}

				$('form[name=frmList]').prop("action",
						"<c:url value='/admin/product/deleteMulti.do'/>");
				$('form[name=frmList]').submit();
			});

	$("input[name=chkAll]").click(function() {
		$('tbody input[type=checkbox]').prop('checked', this.checked);
	});
	$("input[name=stateAll]").click(function() {
		$('.ckState input[type=checkbox]').prop('checked', this.checked);
	});


});// document.ready

function boardList(curPage) {
	$("input[name=currentPage]").val(curPage);
	$('form[name=frmPage]').submit();
}