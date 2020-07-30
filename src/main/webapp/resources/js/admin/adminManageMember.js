$(function() {
	// ajax 학과 검색
	$('#faculty').change(
			function() {
				$('#department').find('option').each(function() {
					$(this).remove();
				});
				$('#department').append("<option value=''>선택</option>");

				var faculty = $(this).val();
				if (faculty != "") {

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
				}
			});

	// 등록 구분 시 입력창
	$('select[name=sort]').change(function() {
		if ($('select[name=sort]').val() == 1) {
			$('.emp').css('visibility', 'visible');
			$('.emp select').val("");
			$('.stud').css('visibility', 'hidden');
		} else {
			$('.emp').css('visibility', 'hidden');
			$('.stud').css('visibility', 'visible');
			$('.stud').val("");
		}
		if ($('select[name=sort]').val() == 2) {
			$('.prof').css('display', 'block');
			$('.prof select').val("");
		} else {
			$('.prof').css('display', 'none');
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


});// document.ready

function boardList(curPage) {
	$("input[name=currentPage]").val(curPage);
	$('form[name=frmPage]').submit();
}